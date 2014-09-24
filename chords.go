package tenordb

func insertChordPatterns() error {
	var err error

	patternMap, err := loadPatternMap("config/chords.json")
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

	patternMap, err := fetchPatternMapFromDB("sql/insertChords.sql")

	// Construct Chord and ChordNotes
	chordId := 0
	for cp_id, rn_ids := range patternMap {
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
