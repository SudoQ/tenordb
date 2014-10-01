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
	if len(chords) != 20 {
		t.Fatal("The query did not return enough rows")
	}
}

func TestAssembleScales(t *testing.T) {
	log.Println("TestAssembleScales")
	note := "C"
	scales, err := AssembleScales(note)
	if err != nil {
		t.Fatal(err)
	}
	if len(scales) != 20 {
		t.Fatal("The query did not return enough rows")
	}
}

func TestDisassembleChord(t *testing.T) {
	log.Println("TestDisassembleChord")
	note := "Bb"
	pattern := "7"
	notes, err := DisassembleChord(note, pattern)
	if err != nil {
		t.Fatal(err)
	}
	if len(notes) != 4 {
		t.Fatal("The query did not return enough rows")
	}
}

func TestDisassembleScale(t *testing.T) {
	log.Println("TestDisassembleChord")
	note := "G"
	pattern := "minor_pentatonic"
	notes, err := DisassembleScale(note, pattern)
	if err != nil {
		t.Fatal(err)
	}
	if len(notes) != 5 {
		t.Fatal("The query did not return enough rows")
	}
}
