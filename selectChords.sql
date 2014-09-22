SELECT
absnote.name as rootName,
cp.name as pattern,
cn.rn_id as rn_id,
an_names.name as an_name
FROM
chord
JOIN absnote
ON chord.root_an_id = absnote.id
JOIN chordpattern as cp
ON chord.cp_id = cp.id
JOIN chordnote as cn
ON cn.c_id = chord.id
JOIN absnote as an_names
ON an_names.id = cn.an_id;
