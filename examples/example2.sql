-- Select all scales that contain exaclty all the notes in a D7 chord
SELECT
absnote.name as root,
sp.name as pattern,
COUNT(sn.an_id) as count
FROM
scale
JOIN
scalenote as sn
ON scale.id = sn.s_id
JOIN
scalepattern as sp
ON scale.sp_id=sp.id
JOIN
absnote
ON
absnote.id = scale.root_an_id
WHERE sn.an_id IN (
	SELECT
	cn.an_id
	FROM
	chord
	JOIN
	chordnote as cn
	ON chord.id = cn.c_id
	JOIN
	chordpattern as cp
	ON chord.cp_id = cp.id
	JOIN
	absnote
	ON
	absnote.id = chord.root_an_id
	WHERE absnote.name = 'D' AND cp.name = '7'
)
GROUP BY scale.id, sp.name, absnote.name
HAVING COUNT(sn.an_id) = (
	SELECT
	COUNT(chord.id)
	FROM
	chord
	JOIN
	chordnote as cn
	ON chord.id = cn.c_id
	JOIN
	chordpattern as cp
	ON chord.cp_id = cp.id
	JOIN
	absnote
	ON
	absnote.id = chord.root_an_id
	WHERE absnote.name = 'D' AND cp.name = '7'
	GROUP BY chord.id
);
