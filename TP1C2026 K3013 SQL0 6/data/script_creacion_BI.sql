USE GD1C2026
GO

IF OBJECT_ID('SQL0.BI_vw_promedio_ticket','V') IS NOT NULL DROP VIEW SQL0.BI_vw_promedio_ticket;
IF OBJECT_ID('SQL0.BI_vw_distribucion_facturacion','V') IS NOT NULL DROP VIEW SQL0.BI_vw_distribucion_facturacion;
IF OBJECT_ID('SQL0.BI_vw_rankings_solicitudes','V') IS NOT NULL DROP VIEW SQL0.BI_vw_rankings_solicitudes;
IF OBJECT_ID('SQL0.BI_vw_promedio_anticipacion_solicitudes','V') IS NOT NULL DROP VIEW SQL0.BI_vw_promedio_anticipacion_solicitudes;
IF OBJECT_ID('SQL0.BI_vw_tasa_aceptacion_propuestas','V') IS NOT NULL DROP VIEW SQL0.BI_vw_tasa_aceptacion_propuestas;
IF OBJECT_ID('SQL0.BI_vw_promedio_cotizaciones','V') IS NOT NULL DROP VIEW SQL0.BI_vw_promedio_cotizaciones;
IF OBJECT_ID('SQL0.BI_vw_promedio_tiempo_respuestas','V') IS NOT NULL DROP VIEW SQL0.BI_vw_promedio_tiempo_respuestas;
IF OBJECT_ID('SQL0.BI_vw_desvio_cotizacion','V') IS NOT NULL DROP VIEW SQL0.BI_vw_desvio_cotizacion;
IF OBJECT_ID('SQL0.BI_vw_rankings_aspectos','V') IS NOT NULL DROP VIEW SQL0.BI_vw_rankings_aspectos;
IF OBJECT_ID('SQL0.BI_vw_promedio_satisfaccion_agentes','V') IS NOT NULL DROP VIEW SQL0.BI_vw_promedio_satisfaccion_agentes;
IF OBJECT_ID('SQL0.BI_hechos_ventas', 'U') IS NOT NULL DROP TABLE SQL0.BI_hechos_ventas;
IF OBJECT_ID('SQL0.BI_hechos_propuestas', 'U') IS NOT NULL DROP TABLE SQL0.BI_hechos_propuestas;
IF OBJECT_ID('SQL0.BI_hechos_cotizaciones', 'U') IS NOT NULL DROP TABLE SQL0.BI_hechos_cotizaciones;
IF OBJECT_ID('SQL0.BI_hechos_encuestas', 'U') IS NOT NULL DROP TABLE SQL0.BI_hechos_encuestas;
IF OBJECT_ID('SQL0.BI_dim_valoracion', 'U') IS NOT NULL DROP TABLE SQL0.BI_dim_valoracion;
IF OBJECT_ID('SQL0.BI_dim_cliente', 'U') IS NOT NULL DROP TABLE SQL0.BI_dim_cliente;
IF OBJECT_ID('SQL0.BI_dim_agente', 'U') IS NOT NULL DROP TABLE SQL0.BI_dim_agente;
IF OBJECT_ID('SQL0.BI_dim_tiempo', 'U') IS NOT NULL DROP TABLE SQL0.BI_dim_tiempo;
IF OBJECT_ID('SQL0.BI_dim_aspecto', 'U') IS NOT NULL DROP TABLE SQL0.BI_dim_aspecto;
IF OBJECT_ID('SQL0.BI_dim_estado_propuesta', 'U') IS NOT NULL DROP TABLE SQL0.BI_dim_estado_propuesta;
IF OBJECT_ID('SQL0.BI_dim_canal_venta', 'U') IS NOT NULL DROP TABLE SQL0.BI_dim_canal_venta;
IF OBJECT_ID('SQL0.BI_dim_tipo_servicio', 'U') IS NOT NULL DROP TABLE SQL0.BI_dim_tipo_servicio;
IF OBJECT_ID('SQL0.BI_dim_temporada', 'U') IS NOT NULL DROP TABLE SQL0.BI_dim_temporada;
IF OBJECT_ID('SQL0.BI_dim_rangos_etario', 'U') IS NOT NULL DROP TABLE SQL0.BI_dim_rangos_etario;
IF OBJECT_ID('SQL0.BI_migrar_dim_rangos_etario','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migrar_dim_rangos_etario;
IF OBJECT_ID('SQL0.BI_migrar_dim_temporadas','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migrar_dim_temporadas;
IF OBJECT_ID('SQL0.BI_migrar_dim_tipo_servicio','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migrar_dim_tipo_servicio;
IF OBJECT_ID('SQL0.BI_migrar_dim_canal_venta','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migrar_dim_canal_venta;
IF OBJECT_ID('SQL0.BI_migrar_dim_estado_propuesta','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migrar_dim_estado_propuesta;
IF OBJECT_ID('SQL0.BI_migrar_dim_aspecto','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migrar_dim_aspecto;
IF OBJECT_ID('SQL0.BI_migrar_dim_valoracion','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migrar_dim_valoracion;
IF OBJECT_ID('SQL0.BI_migrar_dim_cliente','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migrar_dim_cliente;
IF OBJECT_ID('SQL0.BI_migrar_dim_agente','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migrar_dim_agente;
IF OBJECT_ID('SQL0.BI_migrar_dim_tiempo','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migrar_dim_tiempo;
IF OBJECT_ID('SQL0.BI_migrar_hechos_ventas','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migrar_hechos_ventas;
IF OBJECT_ID('SQL0.BI_migrar_hechos_propuestas','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migrar_hechos_propuestas;
IF OBJECT_ID('SQL0.BI_migrar_hechos_cotizaciones','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migrar_hechos_cotizaciones;
IF OBJECT_ID('SQL0.BI_migrar_hechos_encuestas','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migrar_hechos_encuestas;
IF OBJECT_ID('SQL0.BI_migraciones_estaticas','P') IS NOT NULL DROP PROCEDURE SQL0.BI_migraciones_estaticas;

/*
=================================
========== DIMENSIONES ==========
=================================
*/

CREATE TABLE SQL0.BI_dim_rangos_etario(
    id_rango_etario     BIGINT IDENTITY(1,1) PRIMARY KEY,
    descripcion         CHAR (35),
    edad_desde          INT,
    edad_hasta          INT
);
GO

CREATE TABLE SQL0.BI_dim_temporada(
    id_temporada    BIGINT IDENTITY(1,1) PRIMARY KEY,
    nombre          CHAR(10),
    mes_inicio      INT,
    mes_fin         INT
);
GO

CREATE TABLE SQL0.BI_dim_tipo_servicio(
    id_tipo_servicio    BIGINT IDENTITY(1,1) PRIMARY KEY,
    nombre              CHAR(30)
);
GO

CREATE TABLE SQL0.BI_dim_canal_venta(
    id_canal_venta      BIGINT IDENTITY(1,1) PRIMARY KEY,
    nombre              CHAR(15)
);
GO

CREATE TABLE SQL0.BI_dim_estado_propuesta(
    id_estado_propuesta     BIGINT IDENTITY (1,1) PRIMARY KEY,
    estado                  CHAR(10)
);
GO

CREATE TABLE SQL0.BI_dim_aspecto(
    id_aspecto      BIGINT IDENTITY(1,1) PRIMARY KEY,
    descripcion     CHAR(255)
);
GO

CREATE TABLE SQL0.BI_dim_valoracion(
    id_valoracion   BIGINT IDENTITY(1,1) PRIMARY KEY,
    id_aspecto      BIGINT,
    puntaje         INT,
    CONSTRAINT FK_valoracion_aspecto FOREIGN KEY (id_aspecto) 
        REFERENCES SQL0.BI_dim_aspecto(id_aspecto)
);
GO

CREATE TABLE SQL0.BI_dim_tiempo(
    id_tiempo       BIGINT IDENTITY (1, 1) PRIMARY KEY,
    fecha           DATE,
    anio            INT,
    cuatrimestre    INT,
    mes             INT,
    nombre_mes      CHAR(20)
);
GO

CREATE TABLE SQL0.BI_dim_cliente(
    id_cliente      BIGINT PRIMARY KEY,
    nombre          CHAR(255),
    apellido        CHAR(255),
    dni             CHAR(255),
    rango_edad      BIGINT,
    CONSTRAINT FK_cliente_rango FOREIGN KEY (rango_edad) 
        REFERENCES SQL0.BI_dim_rangos_etario (id_rango_etario)
);
GO

CREATE TABLE SQL0.BI_dim_agente(
    id_agente       BIGINT PRIMARY KEY,
    nombre          CHAR(255),
    apellido        CHAR(255),
    dni             CHAR(255),
    rango_edad      BIGINT,
    CONSTRAINT FK_agente_rango FOREIGN KEY (rango_edad) 
        REFERENCES SQL0.BI_dim_rangos_etario (id_rango_etario)
);
GO

/*
====================================================
===================== HECHOS =======================
====================================================
*/

CREATE TABLE SQL0.BI_hechos_ventas(
    id_cliente              BIGINT,
    id_canal_venta          BIGINT,
    id_tiempo_venta         BIGINT,
    id_tipo_servicio        BIGINT,
    importe_total           DECIMAL(18,2),
    CONSTRAINT FK_hv_cliente FOREIGN KEY (id_cliente) 
        REFERENCES SQL0.BI_dim_cliente (id_cliente),
    CONSTRAINT FK_hv_canal_venta FOREIGN KEY (id_canal_venta)
        REFERENCES SQL0.BI_dim_canal_venta (id_canal_venta),
    CONSTRAINT FK_hv_tipo_servicio FOREIGN KEY (id_tipo_servicio)
        REFERENCES SQL0.BI_dim_tipo_servicio (id_tipo_servicio),
    CONSTRAINT FK_hv_tiempo_venta FOREIGN KEY (id_tiempo_venta)
        REFERENCES SQL0.BI_dim_tiempo (id_tiempo)
);
GO

CREATE TABLE SQL0.BI_hechos_propuestas(
    id_agente               BIGINT,
    id_cliente              BIGINT,
    id_estado_propuesta     BIGINT,
    id_tiempo_propuesta     BIGINT,
    id_tiempo_cotizacion    BIGINT,
    importe_total           DECIMAL(18,2),
    presupuesto_estimado    DECIMAL(18,2),
    CONSTRAINT FK_hp_agente FOREIGN KEY (id_agente) 
        REFERENCES SQL0.BI_dim_agente (id_agente),
    CONSTRAINT FK_hp_cliente FOREIGN KEY (id_cliente) 
        REFERENCES SQL0.BI_dim_cliente (id_cliente),
    CONSTRAINT FK_hp_estado_propuesta FOREIGN KEY (id_estado_propuesta) 
        REFERENCES SQL0.BI_dim_estado_propuesta (id_estado_propuesta),
    CONSTRAINT FK_hp_tiempo_propuesta FOREIGN KEY (id_tiempo_propuesta)
        REFERENCES SQL0.BI_dim_tiempo (id_tiempo),
    CONSTRAINT FK_hp_tiempo_cotizacion FOREIGN KEY (id_tiempo_cotizacion)
        REFERENCES SQL0.BI_dim_tiempo (id_tiempo)
);
GO

CREATE TABLE SQL0.BI_hechos_cotizaciones(
    id_cliente              BIGINT,
    id_agente               BIGINT,
    id_temporada            BIGINT,
    id_tiempo_cotizacion    BIGINT,
    id_tiempo_inicio        BIGINT,
    importe_total           DECIMAL(18,2),
    CONSTRAINT FK_hc_agente FOREIGN KEY (id_agente) 
        REFERENCES SQL0.BI_dim_agente (id_agente),
    CONSTRAINT FK_hc_cliente FOREIGN KEY (id_cliente) 
        REFERENCES SQL0.BI_dim_cliente (id_cliente),
    CONSTRAINT FK_hc_temporada FOREIGN KEY (id_temporada)
        REFERENCES SQL0.BI_dim_temporada (id_temporada),
    CONSTRAINT FK_hc_tiempo_cotizacion FOREIGN KEY (id_tiempo_cotizacion)
        REFERENCES SQL0.BI_dim_tiempo (id_tiempo),
    CONSTRAINT FK_hc_tiempo_inicio FOREIGN KEY (id_tiempo_inicio)
        REFERENCES SQL0.BI_dim_tiempo (id_tiempo)
);
GO

CREATE TABLE SQL0.BI_hechos_encuestas(
    id_agente       BIGINT,
    id_aspecto      BIGINT,
    id_tiempo       BIGINT,
    puntaje         INT,
    CONSTRAINT FK_he_agente FOREIGN KEY (id_agente) 
        REFERENCES SQL0.BI_dim_agente (id_agente),
    CONSTRAINT FK_he_tiempo_inicio FOREIGN KEY (id_tiempo)
        REFERENCES SQL0.BI_dim_tiempo (id_tiempo),
    CONSTRAINT FK_he_aspecto FOREIGN KEY (id_aspecto)
        REFERENCES SQL0.BI_dim_aspecto (id_aspecto)
);
GO



/*
============================================
=========== PROCEDURES MIGRACION ===========
============================================
*/

CREATE PROCEDURE SQL0.BI_migraciones_estaticas AS
BEGIN
    INSERT INTO SQL0.BI_dim_rangos_etario (descripcion, edad_desde, edad_hasta)
    VALUES
        -- Rangos de clientes
        ('Menores de 25 años inclusive',    0,  25),
        ('Entre 25 y 35 años inclusive',    26, 35),
        ('Entre 35 y 50 años inclusive',    36, 50),
        -- Rangos de agentes
        ('Entre 25 y 35 años',              25, 35),
        ('Entre 35 y 50 años',              36, 50),
        -- Compartido
        ('Mayores de 50 años',              51, NULL);

    INSERT INTO SQL0.BI_dim_temporada (nombre, mes_inicio, mes_fin) 
        VALUES ('Verano', 12, 2), ('Otoño', 3, 5), 
               ('Invierno', 6, 8), ('Primavera', 9,11);

    INSERT INTO SQL0.BI_dim_tipo_servicio (nombre) 
        VALUES ('Venta Directa'), ('Propuesta a Medida');

    INSERT INTO SQL0.BI_dim_estado_propuesta (estado)
        VALUES ('Aceptado'), ('Rechazado');
END;
GO


CREATE PROCEDURE SQL0.BI_migrar_dim_canal_venta AS 
BEGIN 
    INSERT INTO SQL0.BI_dim_canal_venta (nombre)
    SELECT DISTINCT cv.nombre FROM SQL0.canal_venta cv;
END;
GO

CREATE PROCEDURE SQL0.BI_migrar_dim_aspecto AS 
BEGIN  
    INSERT INTO SQL0.BI_dim_aspecto (descripcion)
    SELECT DISTINCT a.descripcion FROM SQL0.aspectos a;
END;
GO


CREATE PROCEDURE SQL0.BI_migrar_dim_cliente AS
BEGIN
    INSERT INTO SQL0.BI_dim_cliente (id_cliente, nombre, apellido, dni, rango_edad)
    SELECT  c.codigo_cliente, c.nombre, 
            c.apellido, c.dni, dre.id_rango_etario
    FROM SQL0.clientes c
        INNER JOIN SQL0.BI_dim_rangos_etario dre
            ON dre.descripcion = CASE
                WHEN DATEDIFF(YEAR, c.fecha_nacimiento, GETDATE()) <= 25 THEN 'Menores de 25 años inclusive'
                WHEN DATEDIFF(YEAR, c.fecha_nacimiento, GETDATE()) <= 35 THEN 'Entre 25 y 35 años inclusive'
                WHEN DATEDIFF(YEAR, c.fecha_nacimiento, GETDATE()) <= 50 THEN 'Entre 35 y 50 años inclusive'
                ELSE 'Mayores de 50 años'
            END;
END;
GO

CREATE PROCEDURE SQL0.BI_migrar_dim_agente AS
BEGIN
    INSERT INTO SQL0.BI_dim_agente (id_agente, nombre, apellido, dni, rango_edad)
    SELECT  a.legajo_agente, a.nombre,
            a.apellido, a.dni, dre.id_rango_etario
    FROM SQL0.agentes a
        INNER JOIN SQL0.BI_dim_rangos_etario dre
            ON dre.descripcion = CASE
                WHEN DATEDIFF(YEAR, a.fecha_nacimiento, GETDATE()) <= 35 THEN 'Entre 25 y 35 años'
                WHEN DATEDIFF(YEAR, a.fecha_nacimiento, GETDATE()) <= 50 THEN 'Entre 35 y 50 años'
                WHEN DATEDIFF(YEAR, a.fecha_nacimiento, GETDATE()) >= 51 THEN 'Mayores de 50 años'
                ELSE 'soy un error' -- revisar...
            END;
END;
GO

CREATE PROCEDURE SQL0.BI_migrar_dim_tiempo AS
BEGIN

    INSERT INTO SQL0.BI_dim_tiempo (fecha, anio, cuatrimestre, mes, nombre_mes)
    SELECT DISTINCT
        fechas.fecha, YEAR(fechas.fecha),
        CASE
            WHEN MONTH(fechas.fecha) BETWEEN 1 AND 4 THEN 1
            WHEN MONTH(fechas.fecha) BETWEEN 5 AND 8 THEN 2
            ELSE 3
        END,
        MONTH(fechas.fecha), DATENAME(MONTH, fechas.fecha)
    FROM (
        SELECT v.fecha_venta AS fecha
        FROM SQL0.ventas v
        UNION
        SELECT p.fecha_emision AS fecha
        FROM SQL0.propuestas p
        UNION
        SELECT e.fecha_realizado AS fecha
        FROM SQL0.encuestas e
        UNION
        SELECT v.fecha FROM SQL0.solicitudes_cotizacion sc
        CROSS APPLY(VALUES (sc.fecha_realizada), (sc.fecha_inicio_tentativa)) v(fecha)
    ) fechas;
END;
GO

CREATE PROCEDURE SQL0.BI_migrar_hechos_ventas
AS
BEGIN

    INSERT INTO SQL0.BI_hechos_ventas(
            id_cliente, id_canal_venta, 
            id_tiempo_venta, id_tipo_servicio, importe_total)
    SELECT
        dc.id_cliente, dcv.id_canal_venta, dt.id_tiempo, dts.id_tipo_servicio, v.importe_total
    FROM SQL0.ventas v
        INNER JOIN SQL0.BI_dim_cliente dc
            ON dc.id_cliente = v.codigo_cliente
        INNER JOIN SQL0.BI_dim_canal_venta dcv
            ON dcv.nombre = v.canal_venta
        INNER JOIN SQL0.BI_dim_tiempo dt
            ON dt.fecha = v.fecha_venta
        INNER JOIN SQL0.BI_dim_tipo_servicio dts
            ON dts.nombre = IIF(v.codigo_propuesta IS NULL, 'Venta Directa', 'Propuesta a Medida')

END;
GO

CREATE PROCEDURE SQL0.BI_migrar_hechos_propuestas
AS
BEGIN

    INSERT INTO SQL0.BI_hechos_propuestas 
        (id_agente, id_cliente, id_estado_propuesta, 
        id_tiempo_propuesta,id_tiempo_cotizacion, 
        importe_total, presupuesto_estimado)
    SELECT
        da.id_agente, dc.id_cliente, dep.id_estado_propuesta,
        dtp.id_tiempo, dtc.id_tiempo, p.importe_total, sc.presupuesto_estimado
    FROM SQL0.propuestas p
        INNER JOIN SQL0.BI_dim_cliente dc
            ON dc.id_cliente = p.codigo_cliente
        INNER JOIN SQL0.BI_dim_agente da
            ON da.id_agente = p.codigo_agente
        INNER JOIN SQL0.BI_dim_estado_propuesta dep
            ON dep.estado = p.estado_propuesta
        INNER JOIN SQL0.BI_dim_tiempo dtp
            ON dtp.fecha = p.fecha_emision
        INNER JOIN SQL0.solicitudes_cotizacion sc
            ON sc.numero_solicitud = p.codigo_solicitud_cotizacion
        INNER JOIN SQL0.BI_dim_tiempo dtc
            ON dtc.fecha = sc.fecha_realizada;
END;
GO

CREATE PROCEDURE SQL0.BI_migrar_hechos_cotizaciones AS
BEGIN
    INSERT INTO SQL0.BI_hechos_cotizaciones
            (id_cliente, id_agente, id_temporada,
             id_tiempo_cotizacion, id_tiempo_inicio, importe_total)
    SELECT  dc.id_cliente, da.id_agente,
            dtmp.id_temporada, dtc.id_tiempo,
            dti.id_tiempo, sc.presupuesto_estimado
    FROM SQL0.solicitudes_cotizacion sc
        INNER JOIN SQL0.BI_dim_cliente dc
            ON dc.id_cliente = sc.codigo_cliente
        INNER JOIN SQL0.BI_dim_agente da
            ON da.id_agente = sc.codigo_agente
        INNER JOIN SQL0.BI_dim_tiempo dtc
            ON dtc.fecha = sc.fecha_realizada
        INNER JOIN SQL0.BI_dim_tiempo dti
            ON dti.fecha = sc.fecha_inicio_tentativa
        INNER JOIN SQL0.BI_dim_temporada dtmp
            ON (MONTH(sc.fecha_inicio_tentativa) IN (12, 1, 2)  AND dtmp.nombre = 'Verano'   )
            OR (MONTH(sc.fecha_inicio_tentativa) IN (3, 4, 5)   AND dtmp.nombre = 'Otoño'    )
            OR (MONTH(sc.fecha_inicio_tentativa) IN (6, 7, 8)   AND dtmp.nombre = 'Invierno' )
            OR (MONTH(sc.fecha_inicio_tentativa) IN (9, 10, 11) AND dtmp.nombre = 'Primavera');
END;
GO

CREATE PROCEDURE SQL0.BI_migrar_hechos_encuestas AS
BEGIN
    INSERT INTO SQL0.BI_hechos_encuestas
            (id_agente, id_aspecto, id_tiempo, puntaje)
    SELECT  da.id_agente, dasp.id_aspecto,
            dt.id_tiempo, v.puntaje
    FROM SQL0.valoraciones v
        INNER JOIN SQL0.encuestas e
            ON e.codigo_encuesta = v.codigo_encuesta
        INNER JOIN SQL0.aspectos a
            ON a.codigo_aspecto = v.codigo_aspecto
        INNER JOIN SQL0.BI_dim_agente da
            ON da.id_agente = e.codigo_agente
        INNER JOIN SQL0.BI_dim_tiempo dt
            ON dt.fecha = e.fecha_realizado
        INNER JOIN SQL0.BI_dim_aspecto dasp
            ON dasp.descripcion = a.descripcion;
END;
GO

/*
============================================
=========== EXEC PROCEDURES ================
============================================
*/

EXEC SQL0.BI_migraciones_estaticas;
EXEC SQL0.BI_migrar_dim_canal_venta;
EXEC SQL0.BI_migrar_dim_aspecto;
EXEC SQL0.BI_migrar_dim_cliente;
EXEC SQL0.BI_migrar_dim_agente;
EXEC SQL0.BI_migrar_dim_tiempo;
EXEC SQL0.BI_migrar_hechos_ventas;
EXEC SQL0.BI_migrar_hechos_propuestas;
EXEC SQL0.BI_migrar_hechos_cotizaciones;
EXEC SQL0.BI_migrar_hechos_encuestas;
GO


/*
==================================
============= VISTAS =============
==================================
*/

/* == 1 == */
CREATE VIEW SQL0.BI_vw_promedio_ticket AS
SELECT dt.nombre_mes                                        AS mes,
       dre.descripcion                                      AS rango_etario_cliente,
       dcv.nombre                                           AS canal_venta,
       CAST(SUM(importe_total)/COUNT(*) AS DECIMAL(18,2))   AS promedio_ticket
FROM SQL0.BI_hechos_ventas hv
    JOIN SQL0.BI_dim_tiempo dt               ON hv.id_tiempo_venta = dt.id_tiempo
    JOIN SQL0.BI_dim_cliente dc              ON hv.id_cliente = dc.id_cliente
    JOIN SQL0.BI_dim_rangos_etario dre       ON dc.rango_edad = dre.id_rango_etario
    JOIN SQL0.BI_dim_canal_venta dcv         ON hv.id_canal_venta = dcv.id_canal_venta
GROUP BY dt.nombre_mes, dre.descripcion, dcv.nombre;
GO

SELECT * FROM SQL0.BI_vw_promedio_ticket;
GO

/* == 2 == */ -- todos los porcentajes son 0
CREATE VIEW SQL0.BI_vw_distribucion_facturacion AS
SELECT dt.anio                                                  AS año,
       dt.cuatrimestre                                          AS cuatrimestre,
       dts.nombre                                               AS tipo_servicio,
       CAST(COUNT(*)/SUM(importe_total) AS DECIMAL(18,2))       AS porcentaje_facturacion
FROM SQL0.BI_hechos_ventas hv
    JOIN SQL0.BI_dim_tiempo dt               ON hv.id_tiempo_venta = dt.id_tiempo
    JOIN SQL0.BI_dim_cliente dc              ON hv.id_cliente = dc.id_cliente
    JOIN SQL0.BI_dim_tipo_servicio dts       ON hv.id_tipo_servicio = dts.id_tipo_servicio
GROUP BY dts.nombre, dt.anio, dt.cuatrimestre;
GO

SELECT * FROM SQL0.BI_vw_distribucion_facturacion
ORDER BY porcentaje_facturacion DESC;
GO

/* == 3 == */
CREATE VIEW SQL0.BI_vw_rankings_solicitudes AS
SELECT 
       dts.anio                         AS año,
       dtemporada.nombre                AS temporada,
       dre.descripcion                  AS rango_etario_cliente,
       COUNT(*)                         AS cantidad_solicitudes
FROM SQL0.BI_hechos_cotizaciones hc
    JOIN SQL0.BI_dim_tiempo dts              ON hc.id_tiempo_cotizacion = dts.id_tiempo
    JOIN SQL0.BI_dim_cliente dc              ON hc.id_cliente = dc.id_cliente
    JOIN SQL0.BI_dim_rangos_etario dre       ON dc.rango_edad = dre.id_rango_etario
    JOIN SQL0.BI_dim_temporada dtemporada    ON hc.id_temporada = dtemporada.id_temporada
GROUP BY dtemporada.nombre, dts.anio, dre.descripcion;
GO

SELECT * FROM SQL0.BI_vw_rankings_solicitudes
ORDER BY cantidad_solicitudes DESC;
GO

/* == 4 == */
CREATE VIEW SQL0.BI_vw_promedio_anticipacion_solicitudes AS
SELECT dts.cuatrimestre                          AS cuatrimestre,
       dre.descripcion                           AS rango_etario_cliente,
       AVG(DATEDIFF(DAY, dts.fecha, dtit.fecha)) AS promedio_dias
FROM SQL0.BI_hechos_cotizaciones hc
    JOIN SQL0.BI_dim_tiempo dts              ON hc.id_tiempo_cotizacion = dts.id_tiempo
    JOIN SQL0.BI_dim_tiempo dtit             ON hc.id_tiempo_inicio = dtit.id_tiempo
    JOIN SQL0.BI_dim_cliente dc              ON hc.id_cliente = dc.id_cliente
    JOIN SQL0.BI_dim_rangos_etario dre       ON dc.rango_edad = dre.id_rango_etario
GROUP BY dre.descripcion, dts.cuatrimestre;
GO

SELECT * FROM SQL0.BI_vw_promedio_anticipacion_solicitudes
ORDER BY promedio_dias DESC;
GO

/* == 5 == */ -- no anda
CREATE VIEW SQL0.BI_vw_tasa_aceptacion_propuestas AS
SELECT
    dt.cuatrimestre                 AS cuatrimestre,
    CAST(100 * SUM(CASE WHEN dep.estado = 'Aceptado' THEN 1 ELSE 0 END) 
            / NULLIF( SUM(CASE WHEN dep.estado IN ('Aceptado','Rechazado') 
            THEN 1 ELSE 0 END), 0) AS DECIMAL(18,2)
        )                           AS porcentaje
FROM SQL0.BI_hechos_propuestas hp
    INNER JOIN SQL0.BI_dim_tiempo dt             ON hp.id_tiempo_propuesta = dt.id_tiempo
    INNER JOIN SQL0.BI_dim_estado_propuesta dep  ON hp.id_estado_propuesta = dep.id_estado_propuesta
GROUP BY dt.cuatrimestre;
GO

SELECT cuatrimestre, porcentaje FROM SQL0.BI_vw_tasa_aceptacion_propuestas
ORDER BY porcentaje DESC;
GO


/* == 6 == */
CREATE VIEW SQL0.BI_vw_promedio_cotizaciones AS
SELECT dtempo.nombre                                      AS temporada,
       dti.anio                                           AS año,
       CAST(SUM(importe_total)/COUNT(*) AS DECIMAL(18,2)) AS importe_promedio
FROM SQL0.BI_hechos_cotizaciones hc
   JOIN SQL0.BI_dim_tiempo dti              ON hc.id_tiempo_inicio = dti.id_tiempo
   JOIN SQL0.BI_dim_tiempo dts              ON hc.id_tiempo_cotizacion = dts.id_tiempo
   JOIN SQL0.BI_dim_cliente dc              ON hc.id_cliente = dc.id_cliente
   JOIN SQL0.BI_dim_rangos_etario dre       ON dc.rango_edad = dre.id_rango_etario
   JOIN SQL0.BI_dim_temporada dtempo        ON hc.id_temporada = dtempo.id_temporada
GROUP BY dtempo.nombre, dti.anio, dtempo.nombre;
GO

SELECT temporada, año, importe_promedio FROM SQL0.BI_vw_promedio_cotizaciones
ORDER BY importe_promedio DESC;
GO

/* == 7 == */ -- da vacio todo
CREATE VIEW SQL0.BI_vw_promedio_tiempo_respuestas AS
SELECT dre.descripcion                         AS rango_etario_agente,
       dtp.mes                                 AS mes,
       DATEDIFF(DAY, dtc.fecha ,dtp.fecha)     AS promedio_en_dias
FROM SQL0.BI_hechos_propuestas hp
   JOIN SQL0.BI_dim_tiempo dtp              ON hp.id_tiempo_propuesta = dtp.id_tiempo
   JOIN SQL0.BI_dim_tiempo dtc              ON hp.id_tiempo_cotizacion = dtp.id_tiempo
   JOIN SQL0.BI_dim_agente da               ON hp.id_agente = da.id_agente
   JOIN SQL0.BI_dim_rangos_etario dre       ON da.rango_edad = dre.id_rango_etario
GROUP BY dre.descripcion, dtp.mes, DATEDIFF(DAY, dtc.fecha ,dtp.fecha);
GO

SELECT rango_etario_agente, mes, promedio_en_dias FROM SQL0.BI_vw_promedio_tiempo_respuestas
ORDER BY mes DESC, promedio_en_dias DESC; 

GO

/* == 8 == */ -- no da nada
CREATE VIEW SQL0.BI_vw_desvio_cotizacion AS
SELECT
       (hp.importe_total - hp.presupuesto_estimado)/hp.presupuesto_estimado AS desvio
FROM SQL0.BI_hechos_propuestas hp;
GO

SELECT * FROM SQL0.BI_vw_desvio_cotizacion;
GO

/* == 9 == */
CREATE VIEW SQL0.BI_vw_rankings_aspectos AS
SELECT dt.cuatrimestre                                  AS cuatrimestre,
       da.descripcion                                   AS aspecto,
       CAST(SUM(puntaje)/COUNT(*) AS DECIMAL(18,2))     AS promedio_puntaje
FROM SQL0.BI_hechos_encuestas he
    JOIN SQL0.BI_dim_aspecto da                              ON he.id_aspecto = da.id_aspecto
    JOIN SQL0.BI_dim_tiempo dt                               ON he.id_tiempo = dt.id_tiempo
GROUP BY da.descripcion, dt.cuatrimestre;
GO

SELECT cuatrimestre, aspecto, promedio_puntaje FROM SQL0.BI_vw_rankings_aspectos
ORDER BY cuatrimestre DESC, promedio_puntaje DESC;
GO

/* == 10 == */
CREATE VIEW SQL0.BI_vw_promedio_satisfaccion_agentes AS
SELECT dt.mes                                          AS mes,
       dre.descripcion                                 AS rango_etario_agente,
       CAST(SUM(puntaje)/COUNT(*) AS DECIMAL(18,2))    AS promedio_puntaje
FROM SQL0.BI_hechos_encuestas he
    JOIN SQL0.BI_dim_agente da                              ON he.id_agente = da.id_agente
    JOIN SQL0.BI_dim_rangos_etario dre                      ON dre.id_rango_etario = da.rango_edad
    JOIN SQL0.BI_dim_tiempo dt                              ON he.id_tiempo = dt.id_tiempo
GROUP BY dre.descripcion, dt.mes;
GO

SELECT mes, rango_etario_agente, promedio_puntaje FROM SQL0.BI_vw_promedio_satisfaccion_agentes
ORDER BY mes DESC, promedio_puntaje DESC;
