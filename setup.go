package tenordb

import (
	"log"
	"github.com/zephyyrr/goda"
	"fmt"
)

var dba *goda.DatabaseAdministrator
var storerMap map[string] goda.Storer

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
		storerMap = make(map[string] goda.Storer)
		storerMap["AbsNote"], err = dba.Storer("absnote", AbsNote{})
		if err != nil {
			panic(err)
		}
		storerMap["RelNote"],_ = dba.Storer("relnote", RelNote{})
		if err != nil {
			panic(err)
		}
		storerMap["Chord"],_ = dba.Storer("chord", Chord{})
		if err != nil {
			panic(err)
		}
		storerMap["Scale"],_ = dba.Storer("scale", Scale{})
		if err != nil {
			panic(err)
		}
		storerMap["ChordPattern"],_ = dba.Storer("chordpattern", ChordPattern{})
		if err != nil {
			panic(err)
		}
		storerMap["ScalePattern"],_ = dba.Storer("scalepattern", ScalePattern{})
		if err != nil {
			panic(err)
		}
		storerMap["ChordNote"],_ = dba.Storer("chordnote", ChordNote{})
		if err != nil {
			panic(err)
		}
		storerMap["ScaleNote"],_ = dba.Storer("scalenote", ScaleNote{})
		if err != nil {
			panic(err)
		}
		storerMap["ChordPatternNote"],_ = dba.Storer("chordpatternnote", ChordPatternNote{})
		if err != nil {
			panic(err)
		}
		storerMap["ScalePatternNote"],_ = dba.Storer("scalepatternnote", ScalePatternNote{})
        if err != nil {
                panic(err)
        }

        if debugging {
                log.Println("Initialize Finished!")
        }
}


func deleteTables() {
	var err error
	tables := []string {
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

	for _, table := range(tables) {
		_, err = dba.Query(fmt.Sprintf("DELETE FROM %s;",table))
		if err != nil {
			log.Println(err)
		}
	}
}

func insertNotes() error {
	// Gen Notes
	var err error
	chrom := []string {"C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"}
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
	notes := []int {0,4,7}

	// Create patterns
	chordPatterns := []*ChordPattern {
		NewChordPattern(cp_id, "Major"),
	}

	err = storerMap["ChordPattern"].Store(chordPatterns[0])
	if err != nil {
		log.Println(err)
		return err
	}

	patternNotes := make([]*ChordPatternNote, 0)

	for _, note := range(notes){
		patternNotes = append(patternNotes, &ChordPatternNote{
			Cp_id: cp_id,
			Rn_id: note,
		})
	}

	for _, note := range(patternNotes){
		err = storerMap["ChordPatternNote"].Store(note)
		if err != nil {
			log.Println(err)
			return err
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

	rows, err := dba.Query("SELECT id, name FROM absnote;")
	if err != nil {
		log.Println(err)
		return nil
	}

	absnotes := make([]*AbsNote, 0)
	for rows.Next() {
		var an AbsNote
		rows.Scan(&an.Id, &an.Name)
		absnotes = append(absnotes, &an)
	}
	return nil
}
