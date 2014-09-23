SELECT
absnote.name as rootName,
sp.name as pattern,
sn.rn_id as rn_id,
an_names.name as an_name
FROM
scale
JOIN absnote
ON scale.root_an_id = absnote.id
JOIN scalepattern as sp
ON scale.sp_id = sp.id
JOIN scalenote as sn
ON sn.s_id = scale.id
JOIN absnote as an_names
ON an_names.id = sn.an_id;
