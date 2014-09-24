SELECT
absnote.id as note_id,
absnote.name as note_name
FROM
chord
JOIN
chordnote as cn
ON cn.c_id = chord.id
JOIN
absnote
ON absnote.id = cn.an_id
-- root
JOIN
absnote as rootnote
ON rootnote.id = chord.root_an_id
JOIN
chordpattern as cp
ON cp.id = chord.cp_id
WHERE rootnote.name = 'Bb' AND cp.name = '7';
