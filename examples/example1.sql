-- Select all chords which has atleast 3 notes in the C major scale
SELECT
absnote.name,
cp.name,
COUNT(cn.an_id) as count
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
WHERE cn.an_id IN (
	SELECT
	sn.an_id
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
	WHERE absnote.name = 'C' AND sp.name = 'major'
)
GROUP BY chord.id, cp.name, absnote.name
HAVING COUNT(cn.an_id) >= 3;
