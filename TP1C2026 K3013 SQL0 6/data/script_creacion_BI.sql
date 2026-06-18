IF OBJECT_ID('BI_dim_rangos_etario', 'U') IS NOT NULL DROP TABLE BI_dim_rangos_etario;
IF OBJECT_ID('BI_dim_temporadas', 'U') IS NOT NULL DROP TABLE BI_dim_temporadas;
IF OBJECT_ID('BI_dim_tipo_servicio', 'U') IS NOT NULL DROP TABLE BI_dim_tipo_servicio;
IF OBJECT_ID('BI_dim_canal_venta', 'U') IS NOT NULL DROP TABLE BI_dim_canal_venta;
IF OBJECT_ID('BI_dim_estado_propuesta', 'U') IS NOT NULL DROP TABLE BI_dim_estado_propuesta;
IF OBJECT_ID('BI_dim_aspecto', 'U') IS NOT NULL DROP TABLE BI_dim_aspecto;
IF OBJECT_ID('BI_dim_valoracion', 'U') IS NOT NULL DROP TABLE BI_dim_valoracion;
IF OBJECT_ID('BI_dim_cliente', 'U') IS NOT NULL DROP TABLE BI_dim_cliente;
IF OBJECT_ID('BI_dim_agente', 'U') IS NOT NULL DROP TABLE BI_dim_agente;
IF OBJECT_ID('BI_dim_tiempo', 'U') IS NOT NULL DROP TABLE BI_dim_tiempo;
IF OBJECT_ID('BI_hechos_ventas', 'U') IS NOT NULL DROP TABLE BI_hechos_ventas;
IF OBJECT_ID('BI_hechos_propuestas', 'U') IS NOT NULL DROP TABLE BI_hechos_propuestas;
IF OBJECT_ID('BI_hechos_cotizaciones', 'U') IS NOT NULL DROP TABLE BI_hechos_cotizaciones;
IF OBJECT_ID('BI_hechos_encuestas', 'U') IS NOT NULL DROP TABLE BI_hechos_encuestas;
IF OBJECT_ID('BI_vw_promedio_ticket','V') IS NOT NULL DROP VIEW BI_vw_promedio_ticket;
IF OBJECT_ID('BI_vw_distribucion_facturacion','V') IS NOT NULL DROP VIEW BI_vw_distribucion_facturacion;
IF OBJECT_ID('BI_vw_rankings_solicitudes','V') IS NOT NULL DROP VIEW BI_vw_rankings_solicitudes;
IF OBJECT_ID('BI_vw_promedio_anticipacion_solicitudes','V') IS NOT NULL DROP VIEW BI_vw_promedio_anticipacion_solicitudes;
IF OBJECT_ID('BI_vw_tasa_aceptacion_propuestas','V') IS NOT NULL DROP VIEW BI_vw_tasa_aceptacion_propuestas;
IF OBJECT_ID('BI_vw_promedio_cotizaciones','V') IS NOT NULL DROP VIEW BI_vw_promedio_cotizaciones;
IF OBJECT_ID('BI_vw_promedio_tiempo_respuestas','V') IS NOT NULL DROP VIEW BI_vw_promedio_tiempo_respuestas;
IF OBJECT_ID('BI_vw_desvio_cotizacion','V') IS NOT NULL DROP VIEW BI_vw_desvio_cotizacion;
IF OBJECT_ID('BI_vw_rankings_aspectos','V') IS NOT NULL DROP VIEW BI_vw_rankings_aspectos;
IF OBJECT_ID('BI_vw_promedio_satisfaccion_agentes','V') IS NOT NULL DROP VIEW BI_vw_promedio_satisfaccion_agentes;
IF OBJECT_ID('BI_migrar_dim_rangos_etario','P') IS NOT NULL DROP PROCEDURE BI_migrar_dim_rangos_etario;
IF OBJECT_ID('BI_migrar_dim_temporadas','P') IS NOT NULL DROP PROCEDURE BI_migrar_dim_temporadas;
IF OBJECT_ID('BI_migrar_dim_tipo_servicio','P') IS NOT NULL DROP PROCEDURE BI_migrar_dim_tipo_servicio;
IF OBJECT_ID('BI_migrar_dim_canal_venta','P') IS NOT NULL DROP PROCEDURE BI_migrar_dim_canal_venta;
IF OBJECT_ID('BI_migrar_dim_estado_propuesta','P') IS NOT NULL DROP PROCEDURE BI_migrar_dim_estado_propuesta;
IF OBJECT_ID('BI_migrar_dim_aspecto','P') IS NOT NULL DROP PROCEDURE BI_migrar_dim_aspecto;
IF OBJECT_ID('BI_migrar_dim_valoracion','P') IS NOT NULL DROP PROCEDURE BI_migrar_dim_valoracion;
IF OBJECT_ID('BI_migrar_dim_cliente','P') IS NOT NULL DROP PROCEDURE BI_migrar_dim_cliente;
IF OBJECT_ID('BI_migrar_dim_agente','P') IS NOT NULL DROP PROCEDURE BI_migrar_dim_agente;
IF OBJECT_ID('BI_migrar_dim_tiempo','P') IS NOT NULL DROP PROCEDURE BI_migrar_dim_tiempo;
IF OBJECT_ID('BI_migrar_hechos_ventas','P') IS NOT NULL DROP PROCEDURE BI_migrar_hechos_ventas;
IF OBJECT_ID('BI_migrar_hechos_propuestas','P') IS NOT NULL DROP PROCEDURE BI_migrar_hechos_propuestas;
IF OBJECT_ID('BI_migrar_hechos_cotizaciones','P') IS NOT NULL DROP PROCEDURE BI_migrar_hechos_cotizaciones;
IF OBJECT_ID('BI_migrar_hechos_encuestas','P') IS NOT NULL DROP PROCEDURE BI_migrar_hechos_encuestas;

/*
=================================
========== DIMENSIONES ==========
=================================
*/

CREATE TABLE BI_dim_rangos_etario(
    id_rango_etario     BIGINT IDENTITY(1,1) PRIMARY KEY,
    descripcion         CHAR (25),
    edad_desde          INT,
    edad_hasta          INT
);
GO

CREATE TABLE BI_dim_temporada(
    id_temporada    BIGINT IDENTITY(1,1) PRIMARY KEY,
    nombre          CHAR(10),
    mes_inicio      INT,
    mes_fin         INT
);
GO

CREATE TABLE BI_dim_tipo_servicio(
    id_tipo_servicio    BIGINT IDENTITY(1,1) PRIMARY KEY,
    nombre              CHAR(30)
);
GO


CREATE TABLE BI_dim_canal_venta(
    id_canal_venta      BIGINT IDENTITY(1,1) PRIMARY KEY,
    nombre              CHAR(15)
);
GO


CREATE TABLE BI_dim_estado_propuesta(
    id_estado_propuesta     BIGINT IDENTITY (1,1) PRIMARY KEY,
    estado                  CHAR(10)
);
GO

CREATE TABLE BI_dim_aspecto(
    id_aspecto      BIGINT IDENTITY(1,1) PRIMARY KEY,
    descripcion     CHAR(255)
);
GO

CREATE TABLE BI_dim_valoracion(
    id_valoracion   BIGINT IDENTITY(1,1) PRIMARY KEY,
    id_aspecto      BIGINT,
    puntaje         INT,
    CONSTRAINT FK_valoracion_aspecto FOREIGN KEY (id_aspecto) 
        REFERENCES BI_dim_aspecto(id_aspecto)
);
GO

CREATE TABLE BI_dim_tiempo(
    id_tiempo       BIGINT IDENTITY (1, 1) PRIMARY KEY,
    fecha           DATE,
    anio            INT,
    cuatrimestre    INT,
    mes             INT,
    nombre_mes      CHAR(20)
);
GO

CREATE TABLE BI_dim_cliente(
    id_cliente      BIGINT PRIMARY KEY,
    nombre          CHAR(255),
    apellido        CHAR(255),
    dni             CHAR(255),
    rango_edad      BIGINT,
    CONSTRAINT FK_cliente_rango FOREIGN KEY (rango_edad) 
        REFERENCES BI_dim_rangos_etario (id_rango_etario)
);
GO

CREATE TABLE BI_dim_agente(
    id_agente       BIGINT PRIMARY KEY,
    nombre          CHAR(255),
    apellido        CHAR(255),
    dni             CHAR(255),
    rango_edad      BIGINT,
    CONSTRAINT FK_agente_rango FOREIGN KEY (rango_edad) 
        REFERENCES BI_dim_rangos_etario (id_rango_etario)
);
GO


/*
====================================================
===================== HECHOS =======================
====================================================
*/

CREATE TABLE BI_hechos_ventas(
    id_cliente              BIGINT,
    id_canal_venta          BIGINT,
    id_tiempo_venta         BIGINT,
    id_tipo_servicio        BIGINT,
    importe_total           DECIMAL(18,2),
    CONSTRAINT FK_hv_cliente FOREIGN KEY (id_cliente) 
        REFERENCES BI_dim_cliente (id_cliente),
    CONSTRAINT FK_hv_canal_venta FOREIGN KEY (id_canal_venta)
        REFERENCES BI_dim_canal_venta (id_canal_venta),
    CONSTRAINT FK_hv_tipo_servicio FOREIGN KEY (id_tipo_servicio)
        REFERENCES BI_dim_tipo_servicio (id_tipo_servicio),
    CONSTRAINT FK_hv_tiempo_venta FOREIGN KEY (id_tiempo_venta)
        REFERENCES BI_dim_tiempo (id_tiempo),
);
GO

CREATE TABLE BI_hechos_propuestas(
    id_agente               BIGINT,
    id_cliente              BIGINT,
    id_estado_propuesta     BIGINT,
    id_tiempo_propuesta     BIGINT,
    id_tiempo_cotizacion    BIGINT,
    importe_total           DECIMAL(18,2),
    presupuesto_estimado    DECIMAL(18,2),
    CONSTRAINT FK_hp_agente FOREIGN KEY (id_agente) 
        REFERENCES BI_dim_agente (id_agente),
    CONSTRAINT FK_hp_cliente FOREIGN KEY (id_cliente) 
        REFERENCES BI_dim_cliente (id_cliente),
    CONSTRAINT FK_hp_estado_propuesta FOREIGN KEY (id_estado_propuesta) 
        REFERENCES BI_dim_estado_propuesta (id_estado_propuesta),
    CONSTRAINT FK_hp_tiempo_propuesta FOREIGN KEY (id_tiempo_propuesta)
        REFERENCES BI_dim_tiempo (id_tiempo),
    CONSTRAINT FK_hp_tiempo_cotizacion FOREIGN KEY (id_tiempo_cotizacion)
        REFERENCES BI_dim_tiempo (id_tiempo)
);
GO

CREATE TABLE BI_hechos_cotizaciones(
    id_cliente              BIGINT,
    id_agente               BIGINT,
    id_temporada            BIGINT,
    id_tiempo_cotizacion    BIGINT,
    id_tiempo_inicio        BIGINT,
    importe_total           DECIMAL(18,2),
    CONSTRAINT FK_hc_agente FOREIGN KEY (id_agente) 
        REFERENCES BI_dim_agente (id_agente),
    CONSTRAINT FK_hc_cliente FOREIGN KEY (id_cliente) 
        REFERENCES BI_dim_cliente (id_cliente),
    CONSTRAINT FK_hc_temporada FOREIGN KEY (id_temporada)
        REFERENCES BI_dim_temporada (id_temporada),
    CONSTRAINT FK_hc_tiempo_cotizacion FOREIGN KEY (id_tiempo_cotizacion)
        REFERENCES BI_dim_tiempo (id_tiempo),
    CONSTRAINT FK_hc_tiempo_inicio FOREIGN KEY (id_tiempo_inicio)
        REFERENCES BI_dim_tiempo (id_tiempo)
);
GO

CREATE TABLE BI_hechos_encuestas(
    id_agente       BIGINT,
    id_aspecto      BIGINT,
    id_tiempo       BIGINT,
    puntaje         INT,
    CONSTRAINT FK_he_agente FOREIGN KEY (id_agente) 
        REFERENCES BI_dim_agente (id_agente),
    CONSTRAINT FK_he_tiempo_inicio FOREIGN KEY (id_tiempo)
        REFERENCES BI_dim_tiempo (id_tiempo),
    CONSTRAINT FK_he_aspecto FOREIGN KEY (id_aspecto)
        REFERENCES BI_dim_aspecto (id_aspecto)

);
GO


/*
==================================
============= VISTAS =============
==================================
*/

/* == 1 == */
CREATE VIEW BI_vw_promedio_ticket AS
SELECT dt.nombre_mes                                        AS mes,
       dre.descripcion                                      AS rango_etario_cliente,
       dcv.nombre                                           AS canal_venta,
       CAST(SUM(importe_total)/COUNT(*) AS DECIMAL(18,2))   AS promedio_ticket
FROM BI_hechos_ventas hv
    JOIN BI_dim_tiempo dt               ON hv.id_tiempo_venta = dt.id_tiempo
    JOIN BI_dim_cliente dc              ON hv.id_cliente = dc.id_cliente
    JOIN BI_dim_rangos_etario dre       ON dc.rango_edad = dre.id_rango_etario
    JOIN BI_dim_canal_venta dcv         ON hv.id_canal_venta = dcv.id_canal_venta
GROUP BY dt.nombre_mes, dre.descripcion, dcv.nombre; -- y agrupamos por año?
GO

/* == 2 == */
CREATE VIEW BI_vw_distribucion_facturacion AS
SELECT dt.anio                                                  AS año,
       dt.cuatrimestre                                          AS cuatrimestre,
       dts.nombre                                               AS tipo_servicio,
       CAST(COUNT(*)/SUM(importe_total) AS DECIMAL(18,2))       AS porcentaje_facturacion
FROM BI_hechos_ventas hv
    JOIN BI_dim_tiempo dt               ON hv.id_tiempo_venta = dt.id_tiempo
    JOIN BI_dim_cliente dc              ON hv.id_cliente = dc.id_cliente
    JOIN BI_dim_tipo_servicio dts       ON hv.id_tipo_servicio = dts.id_tipo_servicio
GROUP BY dts.nombre, dt.anio, dt.cuatrimestre
ORDER BY porcentaje_facturacion DESC;
GO

/* == 3 == */
CREATE VIEW BI_vw_rankings_solicitudes AS
SELECT COUNT(*)                         AS cantidad_solicitudes,
       dtemporada.nombre                AS temporada,
       dts.anio                         AS año,
       dre.descripcion                  AS rango_etario_cliente
FROM BI_hechos_cotizaciones hc
    JOIN BI_dim_tiempo dts              ON hc.id_tiempo_cotizacion = dts.id_tiempo
    JOIN BI_dim_cliente dc              ON hc.id_cliente = dc.id_cliente
    JOIN BI_dim_rangos_etario dre       ON dc.rango_edad = dre.id_rango_etario
    JOIN BI_dim_temporada dtemporada    ON hc.id_temporada = dtemporada.id_temporada
GROUP BY dtemporada.nombre, dts.anio, dre.descripcion
ORDER BY cantidad_solicitudes DESC;
GO

/* == 4 == */
CREATE VIEW BI_vw_promedio_anticipacion_solicitudes AS
SELECT dts.cuatrimestre                          AS cuatrimestre,
       dre.descripcion                           AS rango_etario_cliente,
       AVG(DATEDIFF(DAY, dts.fecha, dtit.fecha)) AS promedio_dias
FROM BI_hechos_cotizaciones hc
    JOIN BI_dim_tiempo dts              ON hc.id_tiempo_cotizacion = dts.id_tiempo
    JOIN BI_dim_tiempo dtit             ON hc.id_tiempo_inicio = dtit.id_tiempo
    JOIN BI_dim_cliente dc              ON hc.id_cliente = dc.id_cliente
    JOIN BI_dim_rangos_etario dre       ON dc.rango_edad = dre.id_rango_etario
GROUP BY dre.descripcion, dts.cuatrimestre
ORDER BY promedio_dias DESC;
GO

/* == 5 == */
CREATE VIEW BI_vw_tasa_aceptacion_propuestas
AS
SELECT
    dt.cuatrimestre                 AS cuatrimestre,
    CAST(100 * SUM(CASE WHEN dep.estado = 'Aceptado' THEN 1 ELSE 0 END) 
            / NULLIF( SUM(CASE WHEN dep.estado IN ('Aceptado','Rechazado') 
            THEN 1 ELSE 0 END), 0) AS DECIMAL(18,2)
        )                           AS porcentaje
FROM BI_hechos_propuestas hp
    INNER JOIN BI_dim_tiempo dt             ON hp.id_tiempo_propuesta = dt.id_tiempo
    INNER JOIN BI_dim_estado_propuesta dep  ON hp.id_estado_propuesta = dep.id_estado_propuesta
GROUP BY dt.cuatrimestre
ORDER BY porcentaje DESC;
GO

/* == 6 == */
CREATE VIEW BI_vw_promedio_cotizaciones AS
SELECT dtempo.nombre                                      AS temporada,
       dti.anio                                           AS año,
       CAST(SUM(importe_total)/COUNT(*) AS DECIMAL(18,2)) AS importe_promedio
FROM BI_hechos_cotizaciones hc
   JOIN BI_dim_tiempo dti              ON hc.id_tiempo_inicio = dti.id_tiempo
   JOIN BI_dim_tiempo dts              ON hc.id_tiempo_cotizacion = dts.id_tiempo
   JOIN BI_dim_cliente dc              ON hc.id_cliente = dc.id_cliente
   JOIN BI_dim_rangos_etario dre       ON dc.rango_edad = dre.id_rango_etario
   JOIN BI_dim_temporada dtempo        ON hc.id_temporada = dtempo.id_temporada
GROUP BY dtempo.nombre, dti.anio, dtempo.nombre
ORDER BY importe_promedio DESC;
GO

/* == 7 == */
CREATE VIEW BI_vw_promedio_tiempo_respuestas AS
SELECT dre.descripcion                         AS rango_etario_agente,
       dtp.mes                                 AS mes,
       DATEDIFF(DAY, dtc.fecha ,dtp.fecha)     AS promedio_en_dias
FROM BI_hechos_propuestas hp
   JOIN BI_dim_tiempo dtp              ON hp.id_tiempo_propuesta = dtp.id_tiempo
   JOIN BI_dim_tiempo dtc              ON hp.id_tiempo_cotizacion = dtp.id_tiempo
   JOIN BI_dim_agente da               ON hp.id_agente = da.id_agente
   JOIN BI_dim_rangos_etario dre       ON da.rango_edad = dre.id_rango_etario
GROUP BY dre.descripcion, dtp.mes
ORDER BY promedio_en_dias DESC;
GO

/* == 8 == */
CREATE VIEW BI_vw_desvio_cotizacion AS
SELECT
       (hp.importe_total - hp.presupuesto_estimado)
       / NULLIF(hp.presupuesto_estimado,0)          AS desvio
FROM BI_hechos_propuestas hp
   JOIN BI_dim_tiempo dtp              ON hp.id_tiempo_propuesta = dtp.id_tiempo
   JOIN BI_dim_tiempo dtc              ON hp.id_tiempo_cotizacion = dtc.id_tiempo
   JOIN BI_dim_agente da               ON hp.id_cliente = da.id_agente
   JOIN BI_dim_rangos_etario dre       ON da.rango_edad = dre.id_rango_etario
GROUP BY dre.descripcion, dtp.mes
ORDER BY desvio DESC;
GO

/* == 9 == */
CREATE VIEW BI_vw_rankings_aspectos AS
SELECT dt.cuatrimestre                                  AS cuatrimestre,
       da.descripcion                                   AS aspecto,
       CAST(SUM(puntaje)/COUNT(*) AS DECIMAL(18,2))     AS promedio_puntaje
FROM BI_hechos_encuestas he
    JOIN BI_dim_aspecto da                              ON he.id_aspecto = da.id_aspecto
    JOIN BI_dim_tiempo dt                               ON he.id_tiempo = dt.id_tiempo
GROUP BY da.descripcion, dt.cuatrimestre
GO

/* == 10 == */
CREATE VIEW BI_vw_promedio_satisfaccion_agentes AS
SELECT dt.mes                                          AS mes,
       dre.descripcion                                 AS rango_etario_agente,
       CAST(SUM(puntaje)/COUNT(*) AS DECIMAL(18,2))    AS promedio_puntaje
FROM BI_hechos_encuestas he
    JOIN BI_dim_agente da                              ON he.id_agente = da.id_agente
    JOIN BI_dim_rangos_etario dre                      ON dre.id_rango_etario = da.rango_edad
    JOIN BI_dim_tiempo dt                              ON he.id_tiempo = dt.id_tiempo
GROUP BY dre.descripcion, dt.cuatrimestre
GO

/*
============================================
=========== PROCEDURES MIGRACION ===========
============================================
*/
CREATE PROCEDURE BI_migrar_dim_rangos_etario AS
BEGIN
    RETURN;
END;
GO

CREATE PROCEDURE BI_migrar_dim_temporadas AS
BEGIN
    RETURN;
END;
GO

CREATE PROCEDURE BI_migrar_dim_tipo_servicio AS
BEGIN
    RETURN;
END;
GO

CREATE PROCEDURE BI_migrar_dim_canal_venta AS
BEGIN
    RETURN;
END;
GO

CREATE PROCEDURE BI_migrar_dim_estado_propuesta AS
BEGIN
    RETURN;
END;
GO

CREATE PROCEDURE BI_migrar_dim_aspecto AS
BEGIN
    RETURN;
END;
GO

CREATE PROCEDURE BI_migrar_dim_valoracion AS
BEGIN
    RETURN;
END;
GO

CREATE PROCEDURE BI_migrar_dim_cliente AS
BEGIN
    RETURN;
END;
GO

CREATE PROCEDURE BI_migrar_dim_agente AS
BEGIN
    RETURN;
END;
GO

CREATE PROCEDURE BI_migrar_dim_tiempo AS
BEGIN
    RETURN;
END;
GO

CREATE PROCEDURE BI_migrar_hechos_ventas AS
BEGIN
    RETURN;
END;
GO

CREATE PROCEDURE BI_migrar_hechos_propuestas AS
BEGIN
    RETURN;
END;
GO

CREATE PROCEDURE BI_migrar_hechos_cotizaciones AS
BEGIN
    RETURN;
END;
GO

CREATE PROCEDURE BI_migrar_hechos_encuestas AS
BEGIN
    RETURN;
END;

/*
EXEC BI_migrar_dim_rangos_etario;
EXEC BI_migrar_dim_temporadas;
EXEC BI_migrar_dim_tipo_servicio;
EXEC BI_migrar_dim_canal_venta;
EXEC BI_migrar_dim_estado_propuesta;
EXEC BI_migrar_dim_aspecto;
EXEC BI_migrar_dim_valoracion;
EXEC BI_migrar_dim_cliente;
EXEC BI_migrar_dim_agente;
EXEC BI_migrar_dim_tiempo;
EXEC BI_migrar_hechos_ventas;
EXEC BI_migrar_hechos_propuestas;
EXEC BI_migrar_hechos_cotizaciones;
EXEC BI_migrar_hechos_encuestas;
*/