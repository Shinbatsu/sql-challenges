WITH dsG AS(SELECT name, SUBSTRING(name, 2, PATINDEX('%[0-9]%', name)-2) g, SUBSTRING(SUBSTRING(name, PATINDEX('%[0-9]%', name), 255), 1, iif(PATINDEX('%[^0-9]%', SUBSTRING(name, PATINDEX('%[0-9]%', name), 255))=0, 255, PATINDEX('%[^0-9]%', SUBSTRING(name, PATINDEX('%[0-9]%', name), 255))-1)) n1, SUBSTRING(SUBSTRING(name, PATINDEX('%[0-9]%', name), 255), iif(PATINDEX('%[^0-9]%', SUBSTRING(name, PATINDEX('%[0-9]%', name), 255))=0, 255, PATINDEX('%[^0-9]%', SUBSTRING(name, PATINDEX('%[0-9]%', name), 255))), 255) n2 FROM (SELECT name FROM Battles UNION ALL SELECT '#Cuba62a1' UNION ALL SELECT '#Cuba62ii') d WHERE SUBSTRING(name, 1, 1) = '#') SELECT name, *, row_number() over( ORDER BY g, n1, SUBSTRING(n2, PATINDEX('%[0-9]%', n2), 255)), SUBSTRING(n2, PATINDEX('%[0-9]%', n2), 255) FROM dsG