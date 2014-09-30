SELECT
rootnote.name as root,
sp.name as pattern,
total.count as scalesize,
CAST(match.count AS FLOAT)/CAST(total.count AS FLOAT) as precision
FROM (
	SELECT
	scale.id as s_id,
	scale.root_an_id,
	scale.sp_id,
	COUNT(sn.an_id)
	FROM
	scale
	JOIN
	scalenote as sn
	ON sn.s_id = scale.id
	JOIN
	scalepattern as sp
	ON sp.id = scale.sp_id
	JOIN absnote as rootnote
	ON rootnote.id = scale.root_an_id
	JOIN absnote
	ON absnote.id = sn.an_id
	WHERE
	absnote.name = 'C' -- Prepared statement
	GROUP BY scale.id
	HAVING COUNT(sn.an_id) = 1
) AS match
JOIN (
	SELECT
	scale.id as s_id,
	COUNT(sn.an_id)
	FROM
	scale
	JOIN
	scalenote as sn
	ON sn.s_id = scale.id
	GROUP BY scale.id
) as total
ON total.s_id = match.s_id
JOIN
absnote as rootnote
ON match.root_an_id = rootnote.id
JOIN
scalepattern as sp
ON sp.id = match.sp_id
ORDER BY CAST(match.count AS FLOAT)/CAST(total.count AS FLOAT) DESC
--ORDER BY match.count DESC, total.count ASC
LIMIT 20;
