--A) CREAR BASE DE DATOS
SELECT *
FROM menu_items;

--B) 1. NUMERO DE ARTÍCULOS EN EL MENÚ
SELECT COUNT(*)
FROM menu_items;
/*32*/

-- 2. CUAL ES EL ARTICULO MENOS CARO Y EL MÁS CARO EN EL MENÚ?
SELECT * 
FROM menu_items
ORDER BY price ASC;
/*MENOS CARO EDAMAME*/

SELECT *
FROM menu_items
ORDER BY price DESC;
/*MAS CARO SHRIMP SCAMPI*/

-- 3. ¿Cuántos platos americanos hay en el menú?
SELECT COUNT(*)
FROM menu_items
WHERE category='American';
/*6*/

-- 4. ¿Cuál es el precio promedio de los platos?
SELECT AVG(price) AS average_price
FROM menu_items;
/*13.28*/

-- C) TABLA "ORDER_DETAILS"
SELECT *
FROM order_details;

-- 1.¿Cuántos pedidos únicos se realizaron en total?
SELECT COUNT(DISTINCT order_id)
FROM order_details;
/*5370*/

-- 2. ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?
SELECT COUNT(item_id) AS total_orders, order_id
FROM order_details
GROUP BY order_id
ORDER BY total_orders DESC
LIMIT 5;
/*440,2675,3473,4305,443*/

-- 3. ¿Cuándo se realizó el primer pedido y el último pedido?
SELECT *
FROM order_details
ORDER BY order_date ASC;
/* 2023-01-01 */

SELECT *
FROM order_details
ORDER BY order_date DESC;
/* 2023-03-31 */

-- 4. ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
SELECT COUNT(*)
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-05';
/*702*/

-- D) Usar ambas tablas para conocer la reacción de los clientes respecto al menú (LEFT JOIN).
SELECT order_details.*, menu_items.*
FROM order_details
LEFT JOIN menu_items ON order_details.item_id = menu_items.menu_item_id;

-- 1. 5 recomendaciones para el dueño

-- 1era recomendacion
SELECT menu_items.item_name, COUNT(order_details.item_id) AS order_count
FROM order_details
LEFT JOIN menu_items ON order_details.item_id = menu_items.menu_item_id
GROUP BY menu_items.item_name
ORDER BY order_count DESC
LIMIT 10;

/* Estos son los 10 productos más pedidos en el restaurante. Sin embargo, la popularidad no siempre 
significa satisfacción del cliente. Algunos artículos pueden ser pedidos con frecuencia pero también 
devueltos o recibidos con quejas, lo que indica problemas en su preparación o calidad. 

Recomiendo crear grupos de enfoque y cuestionarios para evaluar la satisfacción del cliente y analizar 
esta área. Si se identifican fallas, es importante mejorar los procesos, como capacitar mejor al personal, 
revisar recetas y monitorear los resultados.*/

-- 2nda recomendacion
SELECT menu_items.category, COUNT(order_details.item_id) AS order_count
FROM order_details
LEFT JOIN menu_items ON order_details.item_id = menu_items.menu_item_id
GROUP BY menu_items.category
ORDER BY order_count DESC;

/*Al examinar el rendimiento de los diferentes tipos de platos en el menú, podemos determinar qué 
categorías son las más populares entre los clientes. Esto ayuda a enfocar los esfuerzos de promoción 
y a considerar la expansión de las categorías que tienen mejor desempeño. Creando ofertas especiales, 
considerar la expansion del menu en esa categoria podría ser una gran estrategia.*/

--3ra recommendacion

SELECT menu_items.item_name, menu_items.price, COUNT(order_details.item_id) AS order_count
FROM order_details
LEFT JOIN menu_items ON order_details.item_id = menu_items.menu_item_id
GROUP BY menu_items.item_name, menu_items.price
ORDER BY order_count DESC;

/*Con esta base de datos y la de la segunda recomendación, podemos observar que, aunque la categoría 
más popular es la asiática, no todos los productos de esta categoría están en los primeros cinco lugares. 
Por lo tanto, podríamos sugerir estrategias que incluyan promociones específicas para esta categoría, 
ya que la gente ya muestra una inclinación hacia ella.*/

--4ta recomendacion
SELECT menu_items.item_name, EXTRACT(MONTH FROM order_details.order_date) AS month,COUNT(order_details.item_id) AS order_count
FROM order_details
LEFT JOIN menu_items ON order_details.item_id = menu_items.menu_item_id
GROUP BY menu_items.item_name, EXTRACT(MONTH FROM order_details.order_date)
ORDER BY menu_items.item_name, month;

/*Con esta consulta, podemos pronosticar la demanda para items en nuestro menu. Esto nos puede apoyar para 
poder tener insumos listos en tiempos peak de ventas y tambien en caso de que la cadena de suministro falle
estar preparados con cuando vamos a necesitar y hasta poder prevenir*/

--5a recomendacion
SELECT menu_items.item_name, order_details.order_date, COUNT(order_details.item_id) AS order_count
FROM order_details
LEFT JOIN menu_items ON order_details.item_id = menu_items.menu_item_id
GROUP BY menu_items.item_name, order_details.order_date
ORDER BY order_details.order_date, order_count DESC;

/*Con esta consulta podemos analizar tendencias estacionales y podremos mejorar el menú basado en ellas.
Por ejemplo, podemos analizar que la hamburguesa agarra popularidad apartir de abril, lo que esto nos podria
decir que como se acerca el verano, podemos empezar a ofrecer promociones basadas en esa estacion para aumentar
el consumo ya que el publico ya va encaminado a ello.





