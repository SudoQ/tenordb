package tenordb

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"github.com/zephyyrr/goda"
	"io/ioutil"
	"log"
)

var dba *goda.DatabaseAdministrator
var storerMap map[string]goda.Storer

const (
	// Queries
	assembleChordsQuery   = "sql/assembleChords.sql"
	//assembleScalesQuery   = "sql/assembleScales.sql"
	disassembleChordQuery = "sql/disassembleChord.sql"
	disassembleScaleQuery = "sql/disassembleScale.sql"
)

var (
	assembleChordsStmt   *sql.Stmt
	//assembleScalesStmt   *sql.Stmt
	disassembleChordStmt *sql.Stmt
	disassembleScaleStmt *sql.Stmt
)

func init() {
	var err error
	dba, err = goda.NewDatabaseAdministrator(goda.LoadPGEnv())
	if err != nil {
		log.Fatalln("TenorDB: Database Connection Error: ", err)
	}
	storerMap = make(map[string]goda.Storer)
	storerMap["AbsNote"], err = dba.Storer("absnote", AbsNote{})
	if err != nil {
		panic(err)
	}
	storerMap["RelNote"], err = dba.Storer("relnote", RelNote{})
	if err != nil {
		panic(err)
	}
	storerMap["Chord"], err = dba.Storer("chord", Chord{})
	if err != nil {
		panic(err)
	}
	storerMap["Scale"], err = dba.Storer("scale", Scale{})
	if err != nil {
		panic(err)
	}
	storerMap["ChordPattern"], err = dba.Storer("chordpattern", ChordPattern{})
	if err != nil {
		panic(err)
	}
	storerMap["ScalePattern"], err = dba.Storer("scalepattern", ScalePattern{})
	if err != nil {
		panic(err)
	}
	storerMap["ChordNote"], err = dba.Storer("chordnote", ChordNote{})
	if err != nil {
		panic(err)
	}
	storerMap["ScaleNote"], err = dba.Storer("scalenote", ScaleNote{})
	if err != nil {
		panic(err)
	}
	storerMap["ChordPatternNote"], err = dba.Storer("chordpatternnote", ChordPatternNote{})
	if err != nil {
		panic(err)
	}
	storerMap["ScalePatternNote"], err = dba.Storer("scalepatternnote", ScalePatternNote{})
	if err != nil {
		panic(err)
	}

	files := map[string]**sql.Stmt{
		assembleChordsQuery:   &assembleChordsStmt,
		//assembleScalesQuery:   &assembleScalesStmt,
		disassembleChordQuery: &disassembleChordStmt,
		disassembleScaleQuery: &disassembleScaleStmt,
	}

	for file, stmt := range files {
		query, err := ioutil.ReadFile(file)
		if err != nil {
			log.Fatalf("Failed to load %s: %s", file, err)
		}
		*stmt, err = dba.Prepare(string(query))
		if err != nil {
			log.Fatalf("Failed to prepare statement from %s: %s", file, err)
		}
	}
}

func deleteTables() error {
	var err error
	tables := []string{
		"chordnote",
		"scalenote",
		"chord",
		"scale",
		"chordpatternnote",
		"scalepatternnote",
		"chordpattern",
		"scalepattern",
		"absnote",
		"relnote",
	}

	for _, table := range tables {
		_, err = dba.Query(fmt.Sprintf("DELETE FROM %s;", table))
		if err != nil {
			return err
		}
	}
	return nil
}

func insertNotes() error {
	// Gen Notes
	var err error
	chrom := []string{"C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"}
	for i, name := range chrom {
		err = storerMap["AbsNote"].Store(AbsNote{Id: i, Name: name})
		if err != nil {
			log.Println(err)
			return err
		}
		// TODO Find some relevant name for relative notes, like "major third"...
		err = storerMap["RelNote"].Store(RelNote{Id: i, Name: ""})
		if err != nil {
			return err
		}
	}
	return nil
}

func fetchPatternMapFromDB(filename string) (map[int][]int, error) {
	data, err := ioutil.ReadFile(filename)
	if err != nil {
		return nil, err
	}
	query := string(data)
	rows, err := dba.Query(query)
	if err != nil {
		return nil, err
	}
	patternMap := make(map[int][]int)
	for rows.Next() {
		var cp_id, rn_id int
		var cp_name string
		rows.Scan(&cp_id, &cp_name, &rn_id)
		if _, ok := patternMap[cp_id]; !ok {
			patternMap[cp_id] = make([]int, 0)
		}
		patternMap[cp_id] = append(patternMap[cp_id], rn_id)
	}

	return patternMap, nil
}

func loadJSON(filename string) (map[string]interface{}, error) {
	data, err := ioutil.ReadFile(filename)
	if err != nil {
		return nil, err
	}

	jsonMap := make(map[string]interface{})
	err = json.Unmarshal(data, &jsonMap)
	if err != nil {
		return nil, err
	}

	return jsonMap, nil
}

func extractMap(jsonMap map[string]interface{}) (map[string][]int, error) {
	resultMap := make(map[string][]int)
	for _, jmValue := range jsonMap {
		valueSlice := jmValue.([]interface{})
		for _, patternMap := range valueSlice {

			mapv := patternMap.(map[string]interface{})

			patternName := mapv["name"].(string)
			notes := make([]int, 0)
			for _, mv := range mapv["notes"].([]interface{}) {
				notes = append(notes, int(mv.(float64)))
			}
			resultMap[patternName] = notes
		}
	}

	return resultMap, nil
}

func loadPatternMap(filename string) (map[string][]int, error) {
	var err error

	jsonMap, err := loadJSON(filename)

	if err != nil {
		return nil, err
	}

	chordPatternMap, err := extractMap(jsonMap)

	if err != nil {
		return nil, err
	}
	return chordPatternMap, nil
}

func Setup() error {
	var err error
	return nil

	// Delete old data
	err = deleteTables()
	if err != nil {
		log.Println(err)
		return err
	}

	// Insert absolute and relative notes
	err = insertNotes()
	if err != nil {
		log.Println(err)
		return err
	}

	// Insert chord patterns into the database
	err = insertChordPatterns()
	if err != nil {
		log.Println(err)
		return err
	}

	// Insert chords into the database
	err = insertChords()
	if err != nil {
		log.Println(err)
		return err
	}

	// Insert scale patterns into the database

	err = insertScalePatterns()
	if err != nil {
		log.Println(err)
		return err
	}
	// Insert scales into the database
	err = insertScales()
	if err != nil {
		log.Println(err)
		return err
	}

	return nil
}

func AssembleChords(note string) ([]string, error) {
	result := make([]string, 0)

	rows, err := assembleChordsStmt.Query(note)
	if err != nil {
		return result, err
	}

	for rows.Next() {
		var root, pattern string
		var size int
		var precision float64
		rows.Scan(&root, &pattern, &size, &precision)
		result = append(result, fmt.Sprintf("%s %s", root, pattern))
	}

	return result, nil
}
