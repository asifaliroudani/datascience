SELECT *
FROM googleapps

SELECT app, category, rating
FROM googleapps

SELECT max(reviews)
FROM googleapps

SELECT *
FROM googleapps
LIMIT 5

SELECT *
FROM googleapps
ORDER BY rating

SELECT app, ROW_NUMBER() OVER(ORDER BY app) AS RowNuM
FROM googleapps
LIMIT 5

SELECT app, ROW_NUMBER() OVER(ORDER BY app) AS RowNuM
FROM googleapps
ORDER BY 2
LIMIT 5

SELECT app, ROW_NUMBER() OVER(ORDER BY app) AS RowNuM
FROM googleapps
ORDER BY 2
LIMIT 5

SELECT app, ROW_NUMBER() OVER(ORDER BY app) AS RowNuM
FROM googleapps
ORDER BY 2 DESC
LIMIT 5

SELECT app, ROW_NUMBER() OVER(ORDER BY app) AS RowNuM
FROM googleapps
ORDER BY 2 ASC
LIMIT 5

SELECT DISTINCT category
FROM googleapps

SELECT DISTINCT category, type
FROM googleapps
ORDER BY 1 ASC

SELECT DISTINCT category, type
FROM googleapps
ORDER BY 1 ASC

SELECT DISTINCT category, type
FROM googleapps
WHERE type = 'Free'
ORDER BY 1 ASC


SELECT DISTINCT category, COUNT(*)
FROM googleapps
GROUP BY category
ORDER BY 1 ASC

SELECT DISTINCT category, type, COUNT(*)
FROM googleapps
GROUP BY category, type
ORDER BY 1 ASC

SELECT DISTINCT rating
FROM googleapps

SELECT DISTINCT reviews
FROM googleapps

SELECT DISTINCT replace(reviews,'3.0M','3.0')::numeric 
FROM googleapps

SELECT DISTINCT replace(reviews,'3.0M','3.0')::numeric 	AS reviews
FROM googleapps

SELECT DISTINCT replace(reviews,'3.0M','3')::integer 
FROM googleapps

SELECT DISTINCT size
FROM googleapps

SELECT DISTINCT size, right(size, 1), length(size)
FROM googleapps

SELECT DISTINCT size, right(size, 1), length(size)
FROM googleapps
WHERE length(size) > 4

SELECT DISTINCT installs
FROM googleapps

SELECT DISTINCT installs, right(installs, 1)
FROM googleapps

SELECT DISTINCT price
FROM googleapps

SELECT DISTINCT left(price, 1)
FROM googleapps

SELECT DISTINCT price
FROM googleapps
WHERE left(price, 1) = 'E'

SELECT DISTINCT content_rating
FROM googleapps

SELECT DISTINCT content_rating
FROM googleapps
WHERE content_rating is null

SELECT DISTINCT content_rating
FROM googleapps
WHERE content_rating is not null

SELECT  content_rating, app
FROM googleapps
WHERE content_rating is null


SELECT DISTINCT last_updated
FROM googleapps

SELECT DISTINCT last_updated::date
FROM googleapps

SELECT DISTINCT last_updated
FROM googleapps
WHERE last_updated = '1.0.19'

SELECT	app, COUNT(*)
FROM googleapps
GROUP BY app
HAVING COUNT(*) > 1

