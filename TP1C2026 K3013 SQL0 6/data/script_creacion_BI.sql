USE GD1C2026
GO

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
		'VERANO', 'OTONIO', 'INVIERNO', 'PRIMAVERA')),
	mes_inicio INT NOT NULL,
	mes_fin INT NOT NULL
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

CREATE PROCEDURE sp_calcular_ticket_promedio (@rango_etario_cliente SMALLINT, @canal_venta SMALLINT) AS
BEGIN
	SELECT * FROM BI_canal_venta;
END;
GO

CREATE VIEW ticket_promedio AS
	SELECT * FROM BI_canal_venta;
GO

--2. Distribución de Facturación: Porcentaje de facturación correspondiente a cada
--tipo de servicio (ventas directas o propuestas a medida), para cada cuatrimestre
--de cada año.

CREATE PROCEDURE sp_calcular_distribucion_facturacion (@tipo_servicio SMALLINT, @rango_tiempo SMALLINT) AS
BEGIN
	SELECT * FROM BI_tipo_servicio;
END;
GO

CREATE VIEW distribucion_facturacion AS
		SELECT * FROM BI_tipo_servicio;
GO

--3. Ranking de solicitudes por temporadas: Cantidad de solicitudes realizadas,
--agrupadas por temporada de cada año y rango etario del cliente.

CREATE PROCEDURE sp_calcular_ranking_solicitudes_temporadas (@cantidad_solicitudes INT, @temporada SMALLINT, @rango_etario_cliente SMALLINT) AS
BEGIN	
	SELECT * FROM BI_temporadas;
END;
GO


--4. Anticipación promedio de solicitudes. Promedio de días de anticipación con
--los que el cliente realiza la solicitud de viaje, calculado como la diferencia entre
--fecha de solicitud y fecha de inicio tentativa. Segmentado por rango etario del
--cliente y cuatrimestre.

CREATE PROCEDURE sp_calcular_anticipacion_promedio (@promedio_dias INT, @fecha_solicitud DATE, @fecha_inicio_tentativa DATE, @rango_etario_cliente SMALLINT, @rango_tiempo SMALLINT) AS
BEGIN
	SELECT * FROM BI_rangos_etario_cliente;
END;
GO
--5. Tasa de aceptación de propuestas. Porcentaje de propuestas aceptadas sobre el
--total de propuestas emitidas, calculado por cuatrimestre.

CREATE PROCEDURE sp_calcular_tasa_aceptacion_propuestas (@tasa_aceptacion DECIMAL(5,2), @rango_tiempo SMALLINT) AS
BEGIN
	SELECT * FROM BI_estado_propuesta;
END;
GO

--6. Cotización promedio por temporada: Importe promedio de las propuestas
--emitidas, agrupado por temporada/año. Se deberá considerar como referencia
--temporal la fecha de inicio del viaje.

CREATE PROCEDURE sp_calcular_cotizacion_promedio_temporada (@temporada SMALLINT, @fecha_inicio_viaje DATE) AS
BEGIN
	SELECT * FROM BI_temporadas;
END;
GO

--7. Tiempo promedio de respuesta: Tiempo promedio (en días) entre la fecha de
--solicitud y la fecha de emisión de la propuesta. Segmentado por rango etario del
--agente y mes. Se deberá considerar como referencia temporal la fecha de
--solicitud.

CREATE PROCEDURE sp_calcular_tiempo_respuesta (@promedio_dias INT, @fecha_solicitud DATE, @fecha_emision_propuesta DATE, @rango_etario_agente SMALLINT, @mes SMALLINT) AS
BEGIN
	SELECT * FROM BI_rangos_etario_agente;
END;
GO

--8. Desvío de presupuesto: Desvío promedio entre el presupuesto estimado
--informado en la solicitud y el importe de la propuesta generada.


CREATE PROCEDURE sp_calcular_desvio_presupuesto (@presupuesto_estimado DECIMAL(10,2), @importe_propuesta DECIMAL(10,2)) AS
BEGIN
	SELECT * FROM BI_rangos_etario_agente;
END;
GO

--9. Ranking de aspectos mejor y peor valorados: Promedio de puntaje por
--aspecto evaluado, permitiendo identificar los aspectos con mejor y peor
--valoración en cada cuatrimestre.


CREATE PROCEDURE sp_calcular_ranking_aspectos (@aspecto_evaluado CHAR(30), @puntaje_promedio DECIMAL(5,2), @rango_tiempo SMALLINT) AS
BEGIN 
	SELECT * FROM BI_rangos_tiempo;
END;
GO

--10. Satisfacción promedio por agente: Puntaje promedio obtenido en las
--encuestas, segmentado por rango etario del agente y mes.

CREATE PROCEDURE sp_calcular_satisfaccion_promedio_agente (@rango_etario_agente SMALLINT, @mes SMALLINT) AS
BEGIN
	SELECT * FROM BI_rangos_etario_agente;
END;
GO