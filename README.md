Script SQL para Análisis de Restaurante “Sabores del Mundo”

Descripción General

Este script SQL forma parte de un ejercicio práctico enfocado en analizar los datos de transacciones de clientes del restaurante “Sabores del Mundo”, conocido por su auténtica cocina y su ambiente acogedor. El restaurante lanzó recientemente un nuevo menú y ha estado recopilando datos detallados de las transacciones para identificar oportunidades que optimicen las ventas y mejoren la satisfacción del cliente.

Objetivos

El objetivo principal de este script es identificar cuáles son los elementos del menú que han tenido más y menos éxito, basándose en las preferencias y patrones de compra de los clientes. Al analizar estos datos, “Sabores del Mundo” busca tomar decisiones informadas para mejorar su oferta gastronómica y aumentar sus ventas.

Características Principales

Análisis del Menú

	1.	Número Total de Artículos en el Menú: Determinar el total de artículos disponibles en el menú.
	2.	Rango de Precios: Identificar los artículos más baratos y más caros disponibles.
	3.	Variedad de Cocina: Contar la cantidad de platos americanos presentes en el menú.
	4.	Precios Promedio: Calcular el precio promedio de todos los artículos del menú para entender la estrategia de precios.

Análisis de Pedidos

	1.	Cantidad de Pedidos Únicos: Determinar el total de pedidos únicos realizados.
	2.	Pedidos Más Grandes: Identificar los cinco pedidos con mayor número de artículos para entender el comportamiento de compra de los clientes.
	3.	Cronología de Pedidos: Encontrar las fechas del primer y último pedido para rastrear las tendencias de pedidos.
	4.	Frecuencia de Pedidos: Analizar la cantidad de pedidos realizados en un rango de fechas específico (del 1 al 5 de enero de 2023).

Análisis Combinado

	•	Reacción de los Clientes: Realizar un left join entre order_details y menu_items para explorar las preferencias y reacciones de los clientes hacia el menú.
	•	Información Clave: Desarrollar consultas personalizadas para obtener cinco conclusiones útiles para la gerencia del restaurante. Estas conclusiones guiarán las decisiones estratégicas para el lanzamiento del próximo menú.

Cómo Utilizar

	1.	Configuración de la Base de Datos: Comienza creando la base de datos usando el archivo create_restaurant_db.sql proporcionado.
	2.	Exploración de Datos: Usa el script para explorar las tablas menu_items y order_details.
	3.	Ejecución del Análisis: Ejecuta las consultas para responder preguntas analíticas específicas y obtener conclusiones significativas.

Conclusión

Este script SQL es una herramienta integral para que los gerentes de restaurantes y analistas de datos evalúen el rendimiento del menú y las preferencias de los clientes. Al aprovechar estos conocimientos, “Sabores del Mundo” puede refinar su oferta y mejorar la experiencia gastronómica de sus clientes.
