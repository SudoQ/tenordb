package tenordb

import (
	"fmt"
	"github.com/zephyyrr/goda"
	"io/ioutil"
	"log"
)

var dba *goda.DatabaseAdministrator
var storerMap map[string]goda.Storer

var debugging = true

func init() {
	if debugging {
		log.Println("Connecting to Database...")
	}
	//Setup Database Connection
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
	storerMap["RelNote"], _ = dba.Storer("relnote", RelNote{})
	if err != nil {
		panic(err)
	}
	storerMap["Chord"], _ = dba.Storer("chord", Chord{})
	if err != nil {
		panic(err)
	}
	storerMap["Scale"], _ = dba.Storer("scale", Scale{})
	if err != nil {
		panic(err)
	}
	storerMap["ChordPattern"], _ = dba.Storer("chordpattern", ChordPattern{})
	if err != nil {
		panic(err)
	}
	storerMap["ScalePattern"], _ = dba.Storer("scalepattern", ScalePattern{})
	if err != nil {
		panic(err)
	}
	storerMap["ChordNote"], _ = dba.Storer("chordnote", ChordNote{})
	if err != nil {
		panic(err)
	}
	storerMap["ScaleNote"], _ = dba.Storer("scalenote", ScaleNote{})
	if err != nil {
		panic(err)
	}
	storerMap["ChordPatternNote"], _ = dba.Storer("chordpatternnote", ChordPatternNote{})
	if err != nil {
		panic(err)
	}
	storerMap["ScalePatternNote"], _ = dba.Storer("scalepatternnote", ScalePatternNote{})
	if err != nil {
		panic(err)
	}

	if debugging {
		log.Println("Initialize Finished!")
	}
}

func deleteTables() {
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
			log.Println(err)
		}
	}
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
			log.Println(err)
			return err
		}
	}
	return nil
}

func insertChordPatterns() error {
	var err error

	// Fake JSON data
	cp_id := 0
	notes := []int{0, 4, 7}

	// Create patterns
	chordPatterns := []*ChordPattern{
		NewChordPattern(cp_id, "Major"),
	}

	err = storerMap["ChordPattern"].Store(chordPatterns[0])
	if err != nil {
		log.Println(err)
		return err
	}

	patternNotes := make([]*ChordPatternNote, 0)

	for _, note := range notes {
		patternNotes = append(patternNotes, &ChordPatternNote{
			Cp_id: cp_id,
			Rn_id: note,
		})
	}

	for _, note := range patternNotes {
		err = storerMap["ChordPatternNote"].Store(note)
		if err != nil {
			log.Println(err)
			return err
		}
	}
	return nil
}

func insertChords() error {
	// Fetch ChordPattern, ChordPatternNotes and AbsNotes from DB
	var err error

	data, err := ioutil.ReadFile("insertChords.sql")
	if err != nil {
		return err
	}
	query := string(data)
	rows, err := dba.Query(query)
	if err != nil {
		return err
	}
	patternMap := make(map[int][]int)
	patternNameMap := make(map[int]string)
	for rows.Next() {
		var cp_id, rn_id int
		var cp_name string
		rows.Scan(&cp_id, &cp_name, &rn_id)
		if _, ok := patternMap[cp_id]; !ok {
			patternMap[cp_id] = make([]int, 0)
		}
		patternMap[cp_id] = append(patternMap[cp_id], rn_id)
		patternNameMap[cp_id] = cp_name
	}

	log.Println(patternMap)
	log.Println(patternNameMap)

	// Construct Chord and ChordNotes
	chordId := 0
	for cp_id, rn_ids := range patternMap {
		// Find the root
		for rootIndex := 0; rootIndex < 12; rootIndex++ {
			chordNotes := make([]ChordNote, 0)
			for _, rn_id := range rn_ids {
				// Construct ChordNotes
				cn := ChordNote{
					An_id: (rn_id + rootIndex) % 12,
					Rn_id: rn_id,
					C_id:  chordId,
				}
				chordNotes = append(chordNotes, cn)

			}
			chord := Chord{
				Id:         chordId,
				Cp_id:      cp_id,
				Root_an_id: rootIndex,
			}
			log.Println(chord)
			log.Println(chordNotes)
			chordId++

			// Save to database

			err = storerMap["Chord"].Store(chord)
			if err != nil {
				return err
			}
			for _, note := range chordNotes {
				err = storerMap["ChordNote"].Store(note)
				if err != nil {
					return err
				}
			}

		}
	}

	return nil
}

func Setup() error {
	var err error

	deleteTables()

	err = insertNotes()
	if err != nil {
		log.Println(err)
		return err
	}

	err = insertChordPatterns()
	if err != nil {
		log.Println(err)
		return err
	}

	err = insertChords()
	if err != nil {
		log.Println(err)
		return err
	}

	return nil
}
