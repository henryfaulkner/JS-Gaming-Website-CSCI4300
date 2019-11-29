use world;

SELECT language
FROM (SELECT language, countrylanguage.Percentage as per
FROM country, countrylanguage
WHERE country.code = countrylanguage.CountryCode 
and country.name = "United States"
OR (country.continent OR country.continent OR country.continent OR country.continent OR country.continent OR country.continent)
ORDER BY per desc
Limit 5) as inner_table
ORDER BY per
limit 1;

SELECT language FROM (SELECT DISTINCT language, countrylanguage.Percentage as per FROM country, countrylanguage WHERE country.code = countrylanguage.CountryCode and (country.name = '%') OR (country.continent = 'North America' OR country.continent = 'Europe' '' '' '' '') ORDER BY per desc Limit 5) as inner_table ORDER BY per limit 1;

SELECT DISTINCT language, countrylanguage.Percentage as per FROM country, countrylanguage WHERE country.code = countrylanguage.CountryCode and (country.name = '%') OR (country.continent = 'North America' OR country.continent = 'Europe' '' '' '' '') ORDER BY per desc Limit 5;

                
