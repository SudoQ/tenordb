package tenordb

func insertScalePatterns() error {
	var err error

	patternMap, err := loadPatternMap("scales.json")
	if err != nil {
		return err
	}

	sp_id := 0

	for patternName, notes := range patternMap {
		cp := ScalePattern{
			Id:   sp_id,
			Name: patternName,
		}

		err = storerMap["ScalePattern"].Store(cp)
		if err != nil {
			return err
		}

		patternNotes := make([]ScalePatternNote, 0)

		for _, note := range notes {
			patternNotes = append(patternNotes, ScalePatternNote{
				Sp_id: sp_id,
				Rn_id: note,
			})
		}

		for _, note := range patternNotes {
			err = storerMap["ScalePatternNote"].Store(note)
			if err != nil {
				return err
			}
		}
		sp_id++
	}
	return nil
}

func insertScales() error {
	// Fetch ScalePattern  and ScalePatternNotes from DB
	var err error

	patternMap, err := fetchPatternMapFromDB("insertScales.sql")

	// Construct Scale and ScaleNotes
	scaleId := 0
	for sp_id, rn_ids := range patternMap {
		for rootIndex := 0; rootIndex < 12; rootIndex++ {
			scaleNotes := make([]ScaleNote, 0)
			for _, rn_id := range rn_ids {
				// Construct ScaleNotes
				cn := ScaleNote{
					An_id: (rn_id + rootIndex) % 12,
					Rn_id: rn_id,
					S_id:  scaleId,
				}
				scaleNotes = append(scaleNotes, cn)

			}
			scale := Scale{
				Id:         scaleId,
				Sp_id:      sp_id,
				Root_an_id: rootIndex,
			}
			scaleId++

			// Save to database

			err = storerMap["Scale"].Store(scale)
			if err != nil {
				return err
			}
			for _, note := range scaleNotes {
				err = storerMap["ScaleNote"].Store(note)
				if err != nil {
					return err
				}
			}

		}
	}
	return nil
}
