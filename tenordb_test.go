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

func TestAssembleChord(t *testing.T) {
	log.Println("TestAssembleChord")
	notes := []string{"C", "E", "G"}
	chords, err := AssembleChord(notes)
	if err != nil {
		t.Fatal(err)
	}
	for _, chord := range chords {
		log.Println(chord)
	}
}
