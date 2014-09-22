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
	Notes []*ChordNote
}

func NewChord(id, cp_id, root_an_id int) * Chord {
	return &Chord {
		Id: id,
		Cp_id: cp_id,
		Root_an_id: root_an_id,
		Notes: make([]*ChordNote, 0),
	}
}

type Scale struct {
	Id         int `db:id`
	Sp_id      int `db:sp_id`
	Root_an_id int `db:root_an_id`
	Notes []*ScaleNote
}

func NewScale(id, sp_id, root_an_id int) * Scale {
	return &Scale {
		Id: id,
		Sp_id: sp_id,
		Root_an_id: root_an_id,
		Notes: make([]*ScaleNote, 0),
	}
}

type ChordPattern struct {
	Id   int    `db:id`
	Name string `db:name`
	Notes []*ChordPatternNote
}

func NewChordPattern(id int, name string) * ChordPattern {
	return &ChordPattern {
		Id: id,
		Name: name,
		Notes: make([]*ChordPatternNote, 0),
	}
}

type ScalePattern struct {
	Id   int    `db:id`
	Name string `db:name`
	Notes []*ScalePatternNote
}

func NewScalePattern(id int, name string) * ScalePattern {
	return &ScalePattern {
		Id: id,
		Name: name,
		Notes: make([]*ScalePatternNote, 0),
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
