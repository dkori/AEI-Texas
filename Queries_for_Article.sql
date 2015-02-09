/* calculate change and percentage change for Texas and for the rest of the nation between 2007 and 2014.*/

SELECT sum(CASE WHEN State_FIPS!='48'THEN change ELSE 0 END) AS RestOfNation, SUM(CASE WHEN (State_FIPS='48') THEN change ELSE 0 END) AS TexasChange,
(SUM(CASE WHEN (State_FIPS!='48') THEN change ELSE 0 END)/SUM(CASE WHEN (State_FIPS!='48') THEN val2007 ELSE 0 END)) AS RestofNationPercent,
(SUM(CASE WHEN (State_FIPS='48') THEN change ELSE 0 END)/SUM(CASE WHEN (State_FIPS='48') THEN val2007 ELSE 0 END)) AS TexasPercent
FROM Dec2007toDec2014;

/*calculate change and percentage change in employment for Texas and for the rest of the nation between 2008 and 2014*/

SELECT sum(CASE WHEN State_FIPS!='48'THEN change ELSE 0 END) AS RestOfNation, SUM(CASE WHEN (State_FIPS='48') THEN change ELSE 0 END) AS TexasChange,
(SUM(CASE WHEN (State_FIPS!='48') THEN change ELSE 0 END)/SUM(CASE WHEN (State_FIPS!='48') THEN val2008 ELSE 0 END)) AS RestofNationPercent,
(SUM(CASE WHEN (State_FIPS='48') THEN change ELSE 0 END)/SUM(CASE WHEN (State_FIPS='48') THEN val2008 ELSE 0 END)) AS TexasPercent
FROM Dec2008toDec2014;

/*same as above for 2007-2008*/


SELECT sum(CASE WHEN State_FIPS!='48'THEN change ELSE 0 END) AS RestOfNation, SUM(CASE WHEN (State_FIPS='48') THEN change ELSE 0 END) AS TexasChange,
(SUM(CASE WHEN (State_FIPS!='48') THEN change ELSE 0 END)/SUM(CASE WHEN (State_FIPS!='48') THEN val2007 ELSE 0 END)) AS RestofNationPercent,
(SUM(CASE WHEN (State_FIPS='48') THEN change ELSE 0 END)/SUM(CASE WHEN (State_FIPS='48') THEN val2007 ELSE 0 END)) AS TexasPercent
FROM Dec2007toDec2008;
