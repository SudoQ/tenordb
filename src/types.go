package tenordb

type AbsNote struct {
	Id   int    `db:id`
	Name string `db:name`
}

type RelNote struct {
	Id   int    `db:id`
	Name string `db:name`
}

type Chord struct {
	Id         int `db:id`
	Cp_id      int `db:cp_id`
	Root_an_id int `db:root_an_id`
}

func NewChord(id, cp_id, root_an_id int) *Chord {
	return &Chord{
		Id:         id,
		Cp_id:      cp_id,
		Root_an_id: root_an_id,
	}
}

type Scale struct {
	Id         int `db:id`
	Sp_id      int `db:sp_id`
	Root_an_id int `db:root_an_id`
}

func NewScale(id, sp_id, root_an_id int) *Scale {
	return &Scale{
		Id:         id,
		Sp_id:      sp_id,
		Root_an_id: root_an_id,
	}
}

type ChordPattern struct {
	Id   int    `db:id`
	Name string `db:name`
}

func NewChordPattern(id int, name string) *ChordPattern {
	return &ChordPattern{
		Id:   id,
		Name: name,
	}
}

type ScalePattern struct {
	Id   int    `db:id`
	Name string `db:name`
}

func NewScalePattern(id int, name string) *ScalePattern {
	return &ScalePattern{
		Id:   id,
		Name: name,
	}
}

type ChordNote struct {
	An_id int `db:an_id`
	Rn_id int `db:rn_id`
	C_id  int `db:c_id`
}

type ScaleNote struct {
	An_id int `db:an_id`
	Rn_id int `db:rn_id`
	S_id  int `db:s_id`
}

type ChordPatternNote struct {
	Cp_id int `db:cp_id`
	Rn_id int `db:rn_id`
}

type ScalePatternNote struct {
	Sp_id int `db:sp_id`
	Rn_id int `db:rn_id`
}
