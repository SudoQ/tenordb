SELECT
cp.id as cp_id,
cp.name as cp_name,
cpn.rn_id as rn_id
FROM
chordpattern as cp
JOIN
chordpatternnote as cpn
ON cp.id = cpn.cp_id;
--JOIN absnote
--ON absnote.id = cpn.rn_id;
