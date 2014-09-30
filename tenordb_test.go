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

func TestAssembleChords(t *testing.T) {
	log.Println("TestAssembleChords")
	note := "C"
	chords, err := AssembleChords(note)
	if err != nil {
		t.Fatal(err)
	}
	for _, chord := range chords {
		log.Println(chord)
	}
}

func TestAssembleScales(t *testing.T) {
	log.Println("TestAssembleScales")
	note := "C"
	scales, err := AssembleScales(note)
	if err != nil {
		t.Fatal(err)
	}
	for _, scale := range scales {
		log.Println(scale)
	}
}
