package main

import (
	"log"
	"github.com/zephyyrr/goda"
)

var dba *goda.DatabaseAdministrator
var storer goda.Storer

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

        //storer, err = dba.Storer("measurements", Measurements{})
        if err != nil {
                panic(err)
        }

        if debugging {
                log.Println("Initialize Finished!")
        }
}
