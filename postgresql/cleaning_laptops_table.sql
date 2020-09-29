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