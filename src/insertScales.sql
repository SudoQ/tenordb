SELECT
sp.id as sp_id,
sp.name as sp_name,
spn.rn_id as rn_id
FROM
scalepattern as sp
JOIN
scalepatternnote as spn
ON sp.id = spn.sp_id;
--JOIN absnote
--ON absnote.id = spn.rn_id;
