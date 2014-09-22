package tenordb

import (
	"io/ioutil"
)

func insertChordPatterns() error {
	var err error

	patternMap, err := loadChordPatterns()
	if err != nil {
		return err
	}

	cp_id := 0

	for patternName, notes := range patternMap {
		cp := ChordPattern{
			Id:   cp_id,
			Name: patternName,
		}

		err = storerMap["ChordPattern"].Store(cp)
		if err != nil {
			return err
		}

		patternNotes := make([]ChordPatternNote, 0)

		for _, note := range notes {
			patternNotes = append(patternNotes, ChordPatternNote{
				Cp_id: cp_id,
				Rn_id: note,
			})
		}

		for _, note := range patternNotes {
			err = storerMap["ChordPatternNote"].Store(note)
			if err != nil {
				return err
			}
		}
		cp_id++
	}
	return nil
}

func insertChords() error {
	// Fetch ChordPattern  and ChordPatternNotes from DB
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

func loadChordPatterns() (map[string][]int, error) {
	var err error

	jsonMap, err := loadJSON("chords.json")

	if err != nil {
		return nil, err
	}

	chordPatternMap, err := extractMap(jsonMap)

	if err != nil {
		return nil, err
	}
	return chordPatternMap, nil
}
