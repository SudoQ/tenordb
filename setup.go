package tenordb

import (
	"log"
	"github.com/zephyyrr/goda"
	"fmt"
	tdb "github.com/SudoQ/tenordb"
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
                log.Fatalln("Cleaner: Database Connection Error: ", err)
        }
		storerMap = make(map[string] goda.Storer)
		storerMap["AbsNote"], err = dba.Storer("absnote", tdb.AbsNote{})
		if err != nil {
			panic(err)
		}
		storerMap["RelNote"],_ = dba.Storer("relnote", tdb.RelNote{})
		storerMap["Chord"],_ = dba.Storer("chord", tdb.Chord{})
		storerMap["Scale"],_ = dba.Storer("scale", tdb.Scale{})
		storerMap["ChordPattern"],_ = dba.Storer("chordpattern", tdb.ChordPattern{})
		storerMap["ScalePattern"],_ = dba.Storer("scalepattern", tdb.ScalePattern{})
		storerMap["ChordNote"],_ = dba.Storer("chordnote", tdb.ChordNote{})
		storerMap["ScaleNote"],_ = dba.Storer("scalenote", tdb.ScaleNote{})
		storerMap["ChordPatternNote"],_ = dba.Storer("chordpatternnote", tdb.ChordPatternNote{})
		storerMap["ScalePatternNote"],_ = dba.Storer("scalepatternnote", tdb.ScalePatternNote{})
        if err != nil {
                panic(err)
        }

        if debugging {
                log.Println("Initialize Finished!")
        }
}

func Setup() {
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

	// Gen Notes
	chrom := []string {"C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"}
	for i, name := range chrom {
		err = storerMap["AbsNote"].Store(tdb.AbsNote{Id: i, Name: name})
		if err != nil {
			log.Println(err)
		}
		// TODO Find some relevant name for relative notes, like "major third"...
		err = storerMap["RelNote"].Store(tdb.RelNote{Id: i, Name: ""})
		if err != nil {
			log.Println(err)
		}
	}

	// GEN CHORDS

	// Gen chord pattern notes, TODO Load from JSON config
	cMajorNotes := [] * tdb.ChordPatternNote {
		&tdb.ChordPatternNote{
			Cp_id: 0,
			Rn_id: 0,
		},
		&tdb.ChordPatternNote{
			Cp_id: 0,
			Rn_id: 4,
		},
		&tdb.ChordPatternNote{
			Cp_id: 0,
			Rn_id: 7,
		},
	}

	// Create patterns
	chordPatterns := []*tdb.ChordPattern {
		tdb.NewChordPattern(0, "Major"),
	}

	// Create patternNotes

	// Gen chord patterns, TODO Load from JSON config
	err = storerMap["ChordPattern"].Store(chordPatterns[0])
	if err != nil {
		log.Println(err)
		return
	}

	for _, note := range(cMajorNotes){
		err = storerMap["ChordPatternNote"].Store(note)
		if err != nil {
			log.Println(err)
			return
		}
	}

	rows, err := dba.Query("SELECT id, name FROM absnote;")
	if err != nil {
		log.Println(err)
		return
	}

	absnotes := make([]*tdb.AbsNote, 0)
	for rows.Next() {
		var an tdb.AbsNote
		rows.Scan(&an.Id, &an.Name)
		absnotes = append(absnotes, &an)
	}
}
