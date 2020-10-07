CREATE TABLE public.laptops
(
    manufacturer character varying(250) COLLATE pg_catalog."default",
    model_name character varying(250) COLLATE pg_catalog."default",
    category character varying(250) COLLATE pg_catalog."default",
    screen_size character varying(250) COLLATE pg_catalog."default",
    screen character varying(250) COLLATE pg_catalog."default",
    cpu character varying(250) COLLATE pg_catalog."default",
    ram character varying(250) COLLATE pg_catalog."default",
    storage character varying(250) COLLATE pg_catalog."default",
    gpu character varying(250) COLLATE pg_catalog."default",
    operating_system character varying(250) COLLATE pg_catalog."default",
    operating_system_version character varying(250) COLLATE pg_catalog."default",
    weight character varying(250) COLLATE pg_catalog."default",
    price_euros character varying(250) COLLATE pg_catalog."default"
)

COPY laptops from '/home/asif/Documents/datascience/laptops.csv' HEADER CSV;

SELECT *
FROM laptops

SELECT category
FROM laptops

SELECT DISTINCT category
FROM laptops

SELECT manufacturer
FROM laptops

SELECT DISTINCT manufacturer
FROM laptops

SELECT DISTINCT manufacturer
FROM laptops
ORDER BY manufacturer

SELECT DISTINCT lower(manufacturer) as manufacturer 
FROM laptops
ORDER BY manufacturer

SELECT DISTINCT lower(trim(manufacturer)) as manufacturer 
FROM laptops
ORDER BY manufacturer

SELECT DISTINCT model_name
FROM laptops
ORDER BY model_name

SELECT DISTINCT lower(model_name) as model_name
FROM laptops
ORDER BY model_name

SELECT DISTINCT upper(model_name) as model_name
FROM laptops
ORDER BY model_name

SELECT DISTINCT initcap(model_name) as model_name
FROM laptops
ORDER BY model_name

SELECT DISTINCT screen_size
FROM laptops
ORDER BY screen_size

SELECT DISTINCT replace(screen_size,'"','')::numeric as screen_size
FROM laptops
ORDER BY screen_size

SELECT DISTINCT cpu
FROM laptops
ORDER BY cpu

SELECT DISTINCT lower(cpu) as cpu 
FROM laptops
ORDER BY cpu

SELECT DISTINCT initcap(cpu) as cpu, left(cpu,position(' ' IN cpu)-1) as cpu_maker
FROM laptops
ORDER BY cpu

SELECT DISTINCT initcap(cpu) as cpu, 
				left(cpu,position(' ' IN cpu)-1) as cpu_maker, 
				length(cpu) as length, 
				length(cpu) - length(replace(cpu,' ','')) as total_space_occurence
FROM laptops
ORDER BY cpu

SELECT DISTINCT initcap(cpu) as cpu, 
				left(cpu,position(' ' IN cpu)-1) as cpu_maker, 
				length(cpu) as length, 
				length(cpu) - length(replace(cpu,' ','')) as total_space_occurence,
				POSITION(SPLIT_PART(cpu, ' ', 3) IN CPU)
FROM laptops
ORDER BY cpu

SELECT DISTINCT initcap(cpu) as cpu, 
				left(cpu,position(' ' IN cpu)-1) as cpu_maker, 
				length(cpu) as length, 
				length(cpu) - length(replace(cpu,' ','')) as total_space_occurence,
				POSITION(SPLIT_PART(cpu, ' ', 3) IN CPU),
				SPLIT_PART(cpu, ' ', 1),
				SPLIT_PART(cpu, ' ', 2),
				SPLIT_PART(cpu, ' ', 3),
				SPLIT_PART(cpu, ' ', 4),
				substring(cpu, length(cpu) - length(replace(cpu,' ','')),length(cpu))
				
FROM laptops
ORDER BY cpu

SELECT max(length(manufacturer)) FROM laptops

CREATE TABLE manufacturer(
							manufacturer_id integer primary key GENERATED ALWAYS AS IDENTITY,
							manufacturer_name varchar(12),
							manufacturer_status boolean
)

INSERT INTO manufacturer(manufacturer_name,manufacturer_status) values('A','T')

SELECT *
FROM manufacturer

truncate table manufacturer

SELECT DISTINCT initcap(manufacturer) as manufacturer, 'T'::boolean as manufacturer_status
FROM laptops

SELECT *
FROM laptops

INSERT INTO manufacturer(manufacturer_name,manufacturer_status)
SELECT DISTINCT initcap(manufacturer) as manufacturer, 'T'::boolean as manufacturer_status
FROM laptops

TRUNCATE TABLE manufacturer

DROP TABLE model_name

CREATE TABLE model_name(
							model_name_id integer primary key GENERATED ALWAYS AS IDENTITY,
							model_name varchar(60),
							model_name_status boolean
)

SELECT max(length(model_name)) 
FROM laptops

INSERT INTO model_name(model_name, model_name_status)
SELECT DISTINCT INITCAP(model_name) AS model_name, 'T'::boolean as model_name_status 
FROM laptops

SELECT * FROM model_name

CREATE TABLE fact_laptops(
	
							fact_id integer primary key GENERATED ALWAYS AS IDENTITY ,
							manufacturer_id integer,
							model_name_id integer
)	

SELECT 		l.manufacturer as laptop_manufacturer, l.model_name as laptop_model_name, 
			manufacturer.manufacturer_id, manufacturer_name, 
			modelname.model_name_id, modelname.model_name

FROM laptops as l
INNER JOIN manufacturer manufacturer on manufacturer.manufacturer_name = l.manufacturer
INNER JOIN model_name modelname on modelname.model_name = l.model_name


SELECT 		manufacturer.manufacturer_id,
			modelname.model_name_id

FROM laptops as l
INNER JOIN manufacturer manufacturer on manufacturer.manufacturer_name = l.manufacturer
INNER JOIN model_name modelname on modelname.model_name = l.model_name

INSERT INTO fact_laptops(manufacturer_id, model_name_id)
SELECT 		manufacturer.manufacturer_id,
			modelname.model_name_id

FROM laptops as l
INNER JOIN manufacturer manufacturer on manufacturer.manufacturer_name = l.manufacturer
INNER JOIN model_name modelname on modelname.model_name = l.model_name

SELECT *
FROM fact_laptops

SELECT 		l.manufacturer as laptop_manufacturer, l.model_name as laptop_model_name, 
			manufacturer.manufacturer_id, manufacturer_name, 
			modelname.model_name_id, modelname.model_name

FROM laptops as l
LEFT JOIN manufacturer manufacturer on manufacturer.manufacturer_name = l.manufacturer
LEFT JOIN model_name modelname on modelname.model_name = l.model_name

SELECT 		l.manufacturer as laptop_manufacturer, l.model_name as laptop_model_name, 
			manufacturer.manufacturer_id, manufacturer_name, 
			modelname.model_name_id, modelname.model_name

FROM laptops as l
INNER JOIN manufacturer manufacturer on manufacturer.manufacturer_name = initcap(l.manufacturer)
INNER JOIN model_name modelname on modelname.model_name = initcap(l.model_name)

DROP TABLE fact_laptops

CREATE TABLE fact_laptops(
	
							fact_id integer primary key GENERATED ALWAYS AS IDENTITY ,
							manufacturer_id integer,
							model_name_id integer
)	

INSERT INTO fact_laptops(manufacturer_id, model_name_id)
SELECT 		manufacturer.manufacturer_id,
			modelname.model_name_id
FROM laptops as l
INNER JOIN manufacturer manufacturer on manufacturer.manufacturer_name = initcap(l.manufacturer)
INNER JOIN model_name modelname on modelname.model_name = initcap(l.model_name)



