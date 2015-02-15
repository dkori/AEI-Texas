# AEI-Texas
This repo contains the code I used to calculate the statistics and create the map in the blog post found here: http://devrajkori.com/playing-with-numbers/

First, the .php file retrieves labor data from the Bureau of Labor Statistics API. 

The .sql files read the JSON format data outputted from BLS into postgreSQL, organize the data, generate the stats found in the blog post, and create the spatial database that I read into QGIS to create the map in the blog post.  
