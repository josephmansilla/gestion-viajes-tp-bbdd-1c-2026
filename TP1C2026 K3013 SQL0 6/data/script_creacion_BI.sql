DROP TABLE IF EXISTS BI_canal_venta;
DROP TABLE IF EXISTS BI_rangos_tiempo;
DROP TABLE IF EXISTS BI_rangos_etario_cliente;
DROP TABLE IF EXISTS BI_rangos_etario_agente;
DROP TABLE IF EXISTS BI_temporadas;
DROP TABLE IF EXISTS BI_tipo_servicio;
DROP TABLE IF EXISTS BI_estado_propuesta;

/* ENUMS TABLA BI */

CREATE TABLE BI_rangos_tiempo (
	id_rango_tiempo SMALLINT IDENTITY(1,1),
	descripcion CHAR(25) NOT NULL CHECK (descripcion IN (
		'anio', 'cuatrimestre', 'mes'))
	CONSTRAINT PK_rango_tiempo PRIMARY KEY (id_rango_tiempo)
);
GO

CREATE TABLE BI_rangos_etario_cliente (
	id_rango_etario SMALLINT IDENTITY(1,1),
	descripcion CHAR(25) NOT NULL CHECK (descripcion IN (
		'MENOR_A_25', 'ENTRE_25_Y_30_ANIOS', 'ENTRE_35_Y_50_ANIOS', 'MAYOR_DE_50_ANIOS'))
	-- 25 inclusive -- 30 inclusive -- 50 inclusive
	CONSTRAINT PK_rango_etario_cliente PRIMARY KEY (id_rango_etario)
);
GO

CREATE TABLE BI_rangos_etario_agente (
	id_rango_etario SMALLINT IDENTITY(1,1),
	descripcion CHAR(25) NOT NULL CHECK (descripcion IN (
		'ENTRE_25_Y_30_ANIOS', 'ENTRE_35_Y_50_ANIOS', 'MAYOR_DE_50_ANIOS'))
		-- inclusives
	CONSTRAINT PK_rango_etario_agente PRIMARY KEY (id_rango_etario)
);
GO

CREATE TABLE BI_temporadas (
	id_temporada SMALLINT PRIMARY KEY IDENTITY(1,1),
	nombre CHAR(25) NOT NULL CHECK (nombre IN (
		'VERANO', 'OTONIO', 'INVIERNO', 'PRIMAVERA'))
	-- (ENERO -> MARZO) (ABRIL -> JUNIO) (JULIO -> SEPTIEMBRE) (OCTUBRE -> DICIEMBRE)
);
GO

CREATE TABLE BI_tipo_servicio (
	id_tipo_servicio SMALLINT PRIMARY KEY IDENTITY(1,1),
	descripcion CHAR(30) NOT NULL CHECK (descripcion IN (
		'VENTA_DIRECTA', 'PROPUESTA_A_MEDIDA'))
);
GO

CREATE TABLE BI_estado_propuesta (
	id_estado SMALLINT IDENTITY(1,1),
    estado  CHAR(10) NOT NULL CHECK (estado IN (
		'Aceptada', 'Rechazada')), -- CASTEAR
    CONSTRAINT PK_estado_propuesta PRIMARY KEY (id_estado)
);
GO

CREATE TABLE BI_canal_venta (
	id_canal_venta SMALLINT IDENTITY(1,1),
    nombre  CHAR(15) NOT NULL CHECK (nombre IN (
		'Mail', 'Presencial', 'Telefono', 'WhatsApp')), -- CASTEAR
    CONSTRAINT PK_canal_venta PRIMARY KEY (id_canal_venta)
);
GO

/* TABLAS BI */

CREATE TABLE BI_ventas (
	id_venta SMALLINT,
	id_canal_venta SMALLINT NOT NULL,
	id_rango_etario_cliente SMALLINT NOT NULL,
	id_temporada SMALLINT NOT NULL,
	id_tipo_servicio SMALLINT NOT NULL,
	id_estado_propuesta SMALLINT NOT NULL,
	fecha_solicitud DATE NOT NULL,
	fecha_inicio_viaje DATE NOT NULL,
	importe DECIMAL(10,2) NOT NULL,
	dias_anticipacion INT NOT NULL,
	puntaje_satisfaccion INT NOT NULL,
	CONSTRAINT PK_ventas PRIMARY KEY (id_venta),
	CONSTRAINT FK_canal_venta FOREIGN KEY (id_canal_venta) 
		REFERENCES BI_canal_venta(id_canal_venta),
	CONSTRAINT FK_rango_etario_cliente FOREIGN KEY (id_rango_etario_cliente) 
		REFERENCES BI_rangos_etario_cliente(id_rango_etario),
	CONSTRAINT FK_temporada FOREIGN KEY (id_temporada) 
		REFERENCES BI_temporadas(id_temporada),
	CONSTRAINT FK_tipo_servicio FOREIGN KEY (id_tipo_servicio) 
		REFERENCES BI_tipo_servicio(id_tipo_servicio),
	CONSTRAINT FK_estado_propuesta FOREIGN KEY (id_estado_propuesta) 
		REFERENCES BI_estado_propuesta(id_estado)
);
GO

/* MIGRACION DE TABLAS NORMALZIADAS A BI */




/* VIEWS */

--1.Ticket promedio. Valor promedio de venta mensual según rango etario de
--cliente y canal de venta.

CREATE VIEW ticket_promedio AS
SELECT * FROM BI_canal_venta;
GO

--2. Distribución de Facturación: Porcentaje de facturación correspondiente a cada
--tipo de servicio (ventas directas o propuestas a medida), para cada cuatrimestre
--de cada año.

--3. Ranking de solicitudes por temporadas: Cantidad de solicitudes realizadas,
--agrupadas por temporada de cada año y rango etario del cliente.

--4. Anticipación promedio de solicitudes. Promedio de días de anticipación con
--los que el cliente realiza la solicitud de viaje, calculado como la diferencia entre
--fecha de solicitud y fecha de inicio tentativa. Segmentado por rango etario del
--cliente y cuatrimestre.

--5. Tasa de aceptación de propuestas. Porcentaje de propuestas aceptadas sobre el
--total de propuestas emitidas, calculado por cuatrimestre.

--6. Cotización promedio por temporada: Importe promedio de las propuestas
--emitidas, agrupado por temporada/año. Se deberá considerar como referencia
--temporal la fecha de inicio del viaje.

--7. Tiempo promedio de respuesta: Tiempo promedio (en días) entre la fecha de
--solicitud y la fecha de emisión de la propuesta. Segmentado por rango etario del
--agente y mes. Se deberá considerar como referencia temporal la fecha de
--solicitud.

--8. Desvío de presupuesto: Desvío promedio entre el presupuesto estimado
--informado en la solicitud y el importe de la propuesta generada.

--9. Ranking de aspectos mejor y peor valorados: Promedio de puntaje por
--aspecto evaluado, permitiendo identificar los aspectos con mejor y peor
--valoración en cada cuatrimestre.

--10. Satisfacción promedio por agente: Puntaje promedio obtenido en las
--encuestas, segmentado por rango etario del agente y mes.


