SELECT
rootnote.name as root,
cp.name as pattern,
total.count as chordsize,
CAST(match.count AS FLOAT)/CAST(total.count AS FLOAT) as precision
FROM (
	SELECT
	chord.id as c_id,
	chord.root_an_id,
	chord.cp_id,
	COUNT(cn.an_id)
	FROM
	chord
	JOIN
	chordnote as cn
	ON cn.c_id = chord.id
	JOIN
	chordpattern as cp
	ON cp.id = chord.cp_id
	JOIN absnote as rootnote
	ON rootnote.id = chord.root_an_id
	JOIN absnote
	ON absnote.id = cn.an_id
	WHERE
	absnote.name = $1 -- Prepared statement
	GROUP BY chord.id
	HAVING COUNT(cn.an_id) = 1
) AS match
JOIN (
	SELECT
	chord.id as c_id,
	COUNT(cn.an_id)
	FROM
	chord
	JOIN
	chordnote as cn
	ON cn.c_id = chord.id
	GROUP BY chord.id
) as total
ON total.c_id = match.c_id
JOIN
absnote as rootnote
ON match.root_an_id = rootnote.id
JOIN
chordpattern as cp
ON cp.id = match.cp_id
ORDER BY CAST(match.count AS FLOAT)/CAST(total.count AS FLOAT) DESC
--ORDER BY match.count DESC, total.count ASC
LIMIT 20;
