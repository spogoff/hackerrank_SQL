SET @rn1=0,@rn2=0,@rn3=0,@rn4=0;
SELECT MIN(DOCTOR), MIN(PROFESSOR), MIN(ACTOR),MIN(SINGER) FROM(
    SELECT CASE 
    WHEN OCCUPATION='Doctor' THEN (@rn1:=@rn1+1)
    WHEN OCCUPATION='Professor' THEN (@rn2:=@rn2+1)
    WHEN OCCUPATION='Singer' THEN (@rn3:=@rn3+1)
    WHEN OCCUPATION='Actor' THEN (@rn4:=@rn4+1)
    END AS ROWNUMBER,
    CASE WHEN OCCUPATION='Doctor' THEN NAME END AS DOCTOR ,
    CASE WHEN OCCUPATION='Professor' THEN NAME END AS PROFESSOR,
    CASE WHEN OCCUPATION='Singer' THEN NAME END AS ACTOR,
    CASE WHEN OCCUPATION='Actor' THEN NAME END AS SINGER
    FROM OCCUPATIONS
    ORDER BY NAME) AS TEMP
GROUP BY ROWNUMBER;