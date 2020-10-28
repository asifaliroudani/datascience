SELECT sod.salesorderid, sod.unitprice, sod.productid, sod.modifieddate,
		pcs.startdate, pcs.enddate, pcs.standardcost
FROM sales.salesorderdetail sod
INNER JOIN production.productcosthistory pcs on sod.modifieddate between pcs.startdate and pcs.enddate and sod.productid = pcs.productid

SELECT prd.name, sum(sod.orderqty * sod.unitprice) as total_amount
INTO TEMPORARY TABLE prd_total_amount
FROM sales.salesorderdetail sod
INNER JOIN production.product prd on prd.productid = sod.productid
GROUP BY prd.name
ORDER BY total_amount DESC

SELECT *
FROM prd_total_amount

SELECT *
FROM prd_total_amount
ORDER BY total_amount

SELECT *
FROM prd_total_amount
ORDER BY total_amount DESC

SELECT prd.name, sum(sod.orderqty) as total_quantity
INTO TEMPORARY TABLE prd_total_quantity
FROM sales.salesorderdetail sod
INNER JOIN production.product prd on prd.productid = sod.productid
GROUP BY prd.name
ORDER BY total_quantity DESC

SELECT *
FROM prd_total_quantity

SELECT sod.productid, prd.name, 
		count(sod.orderqty) as total_quantity,
		prda.total_amount AS product_amount, prdq.total_quantity AS product_quantity
FROM sales.salesorderheader soh
INNER JOIN sales.salesorderdetail sod on soh.salesorderid = sod.salesorderid
INNER JOIN production.product prd on prd.productid = sod.productid
INNER JOIN prd_total_amount   prda on prda.name = prd.name
INNER JOIN prd_total_quantity prdq on prdq.name = prd.name
GROUP BY sod.productid, prd.name, total_quantity, product_amount, product_quantity
ORDER BY total_quantity DESC

SELECT sod.productid, prd.name, 
		count(sod.orderqty) as total_quantity,
		sum(prda.total_amount) AS product_amount, prdq.total_quantity AS product_quantity
FROM sales.salesorderheader soh
INNER JOIN sales.salesorderdetail sod on soh.salesorderid = sod.salesorderid
INNER JOIN production.product prd on prd.productid = sod.productid
INNER JOIN prd_total_amount   prda on prda.name = prd.name
INNER JOIN prd_total_quantity prdq on prdq.name = prd.name
GROUP BY sod.productid, prd.name, total_quantity, product_quantity
ORDER BY total_quantity DESC

SELECT sod.productid, prd.name, 
		count(sod.orderqty) as total_quantity,
		max(prda.total_amount) AS product_amount, prdq.total_quantity AS product_quantity
FROM sales.salesorderheader soh
INNER JOIN sales.salesorderdetail sod on soh.salesorderid = sod.salesorderid
INNER JOIN production.product prd on prd.productid = sod.productid
INNER JOIN prd_total_amount   prda on prda.name = prd.name
INNER JOIN prd_total_quantity prdq on prdq.name = prd.name
GROUP BY sod.productid, prd.name, total_quantity, product_quantity
ORDER BY total_quantity DESC

SELECT prd.name, sum(sod.orderqty) as total_quantity
FROM sales.salesorderdetail sod
INNER JOIN production.product prd on prd.productid = sod.productid
WHERE prd.name = 'AWC Logo Cap'
GROUP BY prd.name
ORDER BY total_quantity DESC

SELECT sod.productid, prd.name, 
		count(sod.orderqty) as total_quantity,
		max(prda.total_amount) AS product_amount, prdq.total_quantity AS product_quantity
FROM sales.salesorderheader soh
INNER JOIN sales.salesorderdetail sod on soh.salesorderid = sod.salesorderid
INNER JOIN production.product prd on prd.productid = sod.productid
INNER JOIN prd_total_amount   prda on prda.name = prd.name
INNER JOIN prd_total_quantity prdq on prdq.name = prd.name
GROUP BY sod.productid, prd.name, total_quantity, product_quantity
ORDER BY product_amount DESC

SELECT soh.customerid, sum(sod.unitprice) AS Amount, sum(sod.orderqty) AS qty
FROM sales.salesorderheader soh
INNER JOIN sales.salesorderdetail sod on sod.salesorderid = soh.salesorderid
GROUP BY soh.customerid
ORDER BY Amount DESC

SELECT *
FROM sales.salesorderdetail

SELECT *
FROM sales.salesorderheader soh
WHERE soh.customerid = 29715

SELECT *
FROM production.productcategory

SELECT *
FROM production.productsubcategory

SELECT prdc.name, sum(sod.unitprice * sod.orderqty) AS total_amount
FROM production.product prd
INNER JOIN production.productsubcategory prdsc on prd.productsubcategoryid = prdsc.productsubcategoryid
INNER JOIN production.productsubcategory prdc on prdsc.productcategoryid = prdc.productcategoryid
INNER JOIN sales.salesorderdetail sod on sod.productid = prd.productid 
GROUP BY prdc.name
ORDER BY 2 DESC
LIMIT 5

SELECT prdc.name, prd.name, sum(sod.unitprice * sod.orderqty) AS total_amount
FROM production.product prd
INNER JOIN production.productsubcategory prdsc on prd.productsubcategoryid = prdsc.productsubcategoryid
INNER JOIN production.productsubcategory prdc on prdsc.productcategoryid = prdc.productcategoryid
INNER JOIN sales.salesorderdetail sod on sod.productid = prd.productid 
GROUP BY prdc.name, prd.name
ORDER BY 3 DESC

SELECT prdc.name, count(*) AS total_products, sum(sod.unitprice * sod.orderqty) AS total_amount
FROM production.product prd
INNER JOIN production.productsubcategory prdsc on prd.productsubcategoryid = prdsc.productsubcategoryid
INNER JOIN production.productsubcategory prdc on prdsc.productcategoryid = prdc.productcategoryid
INNER JOIN sales.salesorderdetail sod on sod.productid = prd.productid 
GROUP BY prdc.name
ORDER BY 3 DESC

SELECT prdc.name, prd.name AS total_products, sum(sod.unitprice * sod.orderqty) AS total_amount
FROM production.product prd
INNER JOIN production.productsubcategory prdsc on prd.productsubcategoryid = prdsc.productsubcategoryid
INNER JOIN production.productsubcategory prdc on prdsc.productcategoryid = prdc.productcategoryid
INNER JOIN sales.salesorderdetail sod on sod.productid = prd.productid 
GROUP BY prdc.name, prd.name
ORDER BY 3 DESC

SELECT prdc.name, prd.name AS total_products, sum(sod.unitprice * sod.orderqty) AS total_amount
FROM production.product prd
INNER JOIN production.productsubcategory prdsc on prd.productsubcategoryid = prdsc.productsubcategoryid
INNER JOIN production.productsubcategory prdc on prdsc.productcategoryid = prdc.productcategoryid
INNER JOIN sales.salesorderdetail sod on sod.productid = prd.productid 
GROUP BY prdc.name, prd.name
ORDER BY 3 DESC

SELECT Category, count(*) Total_Product, sum(TotalAmount) as Total
FROM(
	SELECT prdc.name AS Category, prd.name AS Product, sum(sod.unitprice * sod.orderqty) AS TotalAmount
	FROM production.product prd
	INNER JOIN production.productsubcategory prdsc on prd.productsubcategoryid = prdsc.productsubcategoryid
	INNER JOIN production.productsubcategory prdc on prdsc.productcategoryid = prdc.productcategoryid
	INNER JOIN sales.salesorderdetail sod on sod.productid = prd.productid 
	GROUP BY prdc.name, prd.name
	ORDER BY 1 DESC
	)t
GROUP BY Category