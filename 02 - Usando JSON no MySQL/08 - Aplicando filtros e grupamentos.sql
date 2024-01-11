SELECT JSON_EXTRACT(doc, "$.GNP") as GNP
  , JSON_EXTRACT(doc, "$.Code") as Code
  , JSON_EXTRACT(doc, "$.Name") as Name
  , JSON_EXTRACT(doc, "$.IndepYear") as IndepYear
  , JSON_EXTRACT(doc, "$.geography.Region") as Region
  , JSON_EXTRACT(doc, "$.geography.Continent") as Continent
  , JSON_EXTRACT(doc, "$.geography.SurfaceArea") as SurfaceArea
  , JSON_EXTRACT(doc, "$.government.HeadOfState") as HeadOfState
  , JSON_EXTRACT(doc, "$.government.GovernmentForm") as GovernmentForm
  , JSON_EXTRACT(doc, "$.demographics.Population") as Population
  , JSON_EXTRACT(doc, "$.demographics.LifeExpectancy") as LifeExpectancy
  FROM countryinfo;


USE world_x;
SELECT JSON_EXTRACT(doc, "$.Code") as Code, REPLACE(JSON_EXTRACT(doc, "$.Code"),'"','') as Code2 
FROM countryinfo;


-- Selecionando colunas somando a população e média de expectativa de vida de cada continente
SELECT
	JSON_EXTRACT(doc, "$.geography.Continent") as Continent,
	SUM(JSON_EXTRACT(doc, "$.demographics.Population")) as Population,
	AVG(JSON_EXTRACT(doc, "$.demographics.LifeExpectancy")) as LifeExpectancy
FROM 
	countryinfo
GROUP BY
	JSON_EXTRACT(doc, "$.geography.Continent")
ORDER BY 
	Population;



SELECT JSON_EXTRACT(doc, "$.geography.Continent") as Continent,
SUM(JSON_EXTRACT(doc, "$.demographics.Population")) as Population,
AVG(JSON_EXTRACT(doc, "$.demographics.LifeExpectancy")) FROM countryinfo
WHERE JSON_EXTRACT(doc, "$.government.GovernmentForm") LIKE ('%Monarchy%')
AND JSON_EXTRACT(doc, "$.demographics.Population") >= 10000000
GROUP BY JSON_EXTRACT(doc, "$.geography.Continent")
ORDER BY 2;
