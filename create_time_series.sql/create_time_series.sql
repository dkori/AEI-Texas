/*this code pulls specific data from the Data Clean table to create easy to work with Time Series data.*/
/*While I initially pulled the data for every month, I am only really focusing on December, both for simplicity, and to avoid
confounding my results by picking up seasonal effects.*/

/* first, I create tables for december of each individual year 2007, 2008, and 2014.*/


Drop table IF EXISTS dec2007;

SELECT *
INTO Dec2007
FROM DataClean
WHERE year=2007 and period='M12';

Drop Table IF EXISTS dec2008;

SELECT *
INTO Dec2008
FROM DataClean
WHERE year=2008 and period='M12';

Drop table IF EXISTS dec2014;
SELECT *
INTO Dec2014
FROM DataClean
WHERE year=2014 and period='M12';

/*Next, I merge these tables on seriesID to create DEC2007toDEC2014, DEC2008toDEC2014, and DEC2007toDEC2008 tables.  I add
columns for "change" and "percent change."*/


DROP TABLE IF EXISTS dec2007todec2014;


SELECT dec2007."seriesID", dec2007.value AS val2007, dec2014.value AS val2014, (dec2014.value-dec2007.value) AS Change,
substring(dec2007."seriesID" from 4 for 2) AS State_FIPS
INTO Dec2007toDec2014
FROM dec2007 INNER JOIN dec2014
ON dec2007."seriesID"=dec2014."seriesID";

DROP TABLE IF EXISTS dec2008todec2014;

SELECT dec2008."seriesID", dec2008.value AS val2008, dec2014.value AS val2014, (dec2014.value-dec2008.value) AS Change,
substring(dec2008."seriesID" from 4 for 2) AS State_FIPS, (((dec2014.value-dec2008.value)/dec2008.value)*100) AS percentChange
INTO Dec2008toDec2014
FROM dec2008 INNER JOIN dec2014
ON dec2008."seriesID"=dec2014."seriesID";

DROP TABLE IF EXISTS dec2007todec2008;


SELECT dec2007."seriesID", dec2007.value AS val2007, dec2008.value AS val2008, (dec2008.value-dec2007.value) AS Change,
substring(dec2007."seriesID" from 4 for 2) AS State_FIPS
INTO Dec2007toDec2008
FROM dec2007 INNER JOIN dec2008
ON dec2007."seriesID"=dec2008."seriesID";

