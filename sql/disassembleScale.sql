SELECT
absnote.id as note_id,
absnote.name as note_name
FROM
scale
JOIN
scalenote as sn
ON sn.s_id = scale.id
JOIN
absnote
ON absnote.id = sn.an_id
-- root
JOIN
absnote as rootnote
ON rootnote.id = scale.root_an_id
JOIN
scalepattern as sp
ON sp.id = scale.sp_id
WHERE rootnote.name = $1 AND sp.name = $2; -- perpared statement
