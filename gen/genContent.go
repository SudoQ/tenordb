package main

import (
	"log"
	"github.com/zephyyrr/goda"
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
        //log.Println(goda.LoadPGEnv())
        var err error
        dba, err = goda.NewDatabaseAdministrator(goda.LoadPGEnv())
        if err != nil {
                log.Fatalln("Cleaner: Database Connection Error: ", err)
        }
		storerMap = make(map[string] goda.Storer)
		storerMap["AbsNote"], err = dba.Storer("AbsNote", tdb.AbsNote{})
		if err != nil {
			panic(err)
		}
		storerMap["RelNote"],_ = dba.Storer("RelNote", tdb.RelNote{})
		storerMap["Chord"],_ = dba.Storer("Chord", tdb.Chord{})
		storerMap["Scale"],_ = dba.Storer("Scale", tdb.Scale{})
		storerMap["ChordPattern"],_ = dba.Storer("ChordPattern", tdb.ChordPattern{})
		storerMap["ScalePattern"],_ = dba.Storer("ScalePattern", tdb.ScalePattern{})
		storerMap["ChordNote"],_ = dba.Storer("ChordNote", tdb.ChordNote{})
		storerMap["ScaleNote"],_ = dba.Storer("ScaleNote", tdb.ScaleNote{})
		storerMap["ChordPatternNote"],_ = dba.Storer("ChordPatternNote", tdb.ChordPatternNote{})
		storerMap["ScalePatternNote"],_ = dba.Storer("ScalePatternNote", tdb.ScalePatternNote{})
        //storer, err = dba.Storer("measurements", Measurements{})
        if err != nil {
                panic(err)
        }

        if debugging {
                log.Println("Initialize Finished!")
        }
}

func main() {
	// Gen AbsNotes
	log.Println(storerMap)
	/*
	err := storerMap["AbsNote"].Store(tdb.AbsNote{Id: 0, Name: "C"})
	if err != nil {
		log.Println(err)
	}
	*/
}
