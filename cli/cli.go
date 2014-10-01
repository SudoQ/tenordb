// A basic CLI for simple uses for the tenordb package
package main

import (
	"github.com/SudoQ/tenordb"
	"fmt"
)

var (
	QUIT = "exit"
)

var cmdMap = map[string]func(){
	"help": help,
	"dc": disassembleChord,
	"ds": disassembleScale,
	"ac": assembleChords,
	"as": assembleScales,
}

var helpMap = map[string]string{
	"help": "Find out more about a given command",
	"dc": "Disassemble a chord given a root note and a pattern",
	"ds": "Disassemble a scale given a root note and a pattern",
	"ac": "Assemble all chords containing a given note",
	"as": "Assemble all scales containing a given note",
}

func menu(){
	fmt.Println("TenorDB CLI version 0.1")
	fmt.Println("Enter \"exit\" to exit")
	fmt.Println("Enter \"help\" to know more about the commands")
}

func help(){
	fmt.Println("Available commands:")
	for cmd := range(helpMap) {
		fmt.Printf("\t%s\n", cmd)
	}
	cmd := prompt("Enter command to know more: ")
	if helpString, ok := helpMap[cmd]; ok {
		fmt.Printf("%s: %s\n", cmd, helpString)
	} else {
		fmt.Printf("%s has no help section\n", cmd)
	}
}

func prompt(text string)(string){
	fmt.Print(text)
	input := ""
	fmt.Scanln(&input)
	return input
}

func main() {
	menu()
	cmd := ""
	for cmd != QUIT {
		cmd = prompt("tdb> ")
		if cmdFunc, ok := cmdMap[cmd]; ok {
			cmdFunc()
		}
	}
}

func disassembleChord(){
	fmt.Println("Disassemble Chord")
	root := prompt("Root note: ")
	pattern := prompt("Pattern: " )
	notes, err := tenordb.DisassembleChord(root, pattern)
	if err != nil {
		fmt.Println(err)
		return
	}
	for _, note := range(notes){
		fmt.Println(note)
	}
}

func disassembleScale(){
	fmt.Println("Disassemble Scale")
	root := prompt("Root note: ")
	pattern := prompt("Pattern: ")
	notes, err := tenordb.DisassembleScale(root, pattern)
	if err != nil {
		fmt.Println(err)
		return
	}
	for _, note := range(notes){
		fmt.Println(note)
	}
}

func assembleChords(){
	fmt.Println("Assemble Chords")
	note := prompt("Note: ")
	chords, err := tenordb.AssembleChords(note)
	if err != nil {
		fmt.Println(err)
		return
	}

	for _, chord := range(chords) {
		fmt.Println(chord)
	}
}

func assembleScales(){
	fmt.Println("Assemble Scales")
	note := prompt("Note: ")
	scales, err := tenordb.AssembleScales(note)
	if err != nil {
		fmt.Println(err)
		return
	}

	for _, scale := range(scales) {
		fmt.Println(scale)
	}
}
