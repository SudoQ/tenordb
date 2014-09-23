package tenordb

import (
	"log"
	"testing"
)

func TestSetup(t *testing.T) {
	log.Println("Testing Setup...")
	err := Setup()
	if err != nil {
		log.Println(err)
		t.Fatal(err)
	}
	log.Println("Done!")
}
