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

/*to create the map, I first had to import a TIGER state-level shapefile from the census website into postgreSQL using pgshapeloader.
I then merged the table created from the imported shapefile with dec2008todec2014.*/

DROP TABLE IF EXISTS Change2008to2014map;

SELECT *
INTO Change2008to2014map
FROM dec2008todec2014
LEFT JOIN tl_2014_us_state
ON (dec2008todec2014.state_fips=tl_2014_us_state.statefp);

/*Next, I linked QGIS to do this postgres database, and set up a filter referencing the "percentchange" column to create the color
gradient*/
