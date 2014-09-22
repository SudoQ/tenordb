SELECT *
FROM
chordpattern as cp
JOIN
chordpatternnote as cpn
ON cp.id = cpn.cp_id
JOIN absnote
ON absnote.id = cpn.rn_id;
