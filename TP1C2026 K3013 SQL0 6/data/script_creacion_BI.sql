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
    puntaje         INT
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
    rango_edad      BIGINT
    CONSTRAINT FK_cliente_rango FOREIGN KEY (rango_edad) 
        REFERENCES BI_dim_rangos_etario (id_rango_etario)
);
GO

CREATE TABLE BI_dim_agente(
    id_agente       BIGINT PRIMARY KEY,
    nombre          CHAR(255),
    apellido        CHAR(255),
    dni             CHAR(255),
    rango_edad      BIGINT
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
    importe_total           DECIMAL(18,2)
    CONSTRAINT FK_cliente FOREIGN KEY (id_cliente) 
        REFERENCES BI_dim_cliente (id_cliente),
    CONSTRAINT FK_canal_venta FOREIGN KEY (id_canal_venta)
        REFERENCES BI_dim_canal_venta (id_canal_venta),
    CONSTRAINT FK_tiempo_servicio FOREIGN KEY (id_tipo_servicio)
        REFERENCES BI_dim_tipo_servicio (id_tipo_servicio)
);
GO

CREATE TABLE BI_hechos_propuestas(
    id_agente               BIGINT,
    id_cliente              BIGINT,
    id_estado_propuesta     BIGINT,
    id_tiempo_propuesta     BIGINT,
    importe_total           DECIMAL(18,2)
    CONSTRAINT FK_agente FOREIGN KEY (id_agente) 
        REFERENCES BI_dim_agente (id_agente),
    CONSTRAINT FK_cliente FOREIGN KEY (id_cliente) 
        REFERENCES BI_dim_cliente (id_cliente),
    CONSTRAINT FK_estado_propuesta FOREIGN KEY (id_estado_propuesta) 
        REFERENCES BI_dim_estado_propuesta (id_estado_propuesta),
    CONSTRAINT FK_tiempo_propuesta FOREIGN KEY (id_tiempo_propuesta)
        REFERENCES BI_dim_tiempo (id_tiempo)
);
GO

CREATE TABLE BI_hechos_cotizaciones(
    id_cliente              BIGINT,
    id_agente               BIGINT,
    id_temporada            BIGINT,
    id_tiempo_solicitud     BIGINT,
    id_tiempo_inicio        BIGINT,
    importe_total           DECIMAL(18,2)
    CONSTRAINT FK_agente FOREIGN KEY (id_agente) 
        REFERENCES BI_dim_agente (id_agente),
    CONSTRAINT FK_cliente FOREIGN KEY (id_cliente) 
        REFERENCES BI_dim_cliente (id_cliente),
    CONSTRAINT FK_temporada FOREIGN KEY (id_temporada)
        REFERENCES BI_dim_temporada (id_temporada),
    CONSTRAINT FK_tiempo_solicitud FOREIGN KEY (id_tiempo_solicitud)
        REFERENCES BI_dim_tiempo (id_tiempo),
    CONSTRAINT FK_tiempo_inicio FOREIGN KEY (id_tiempo_inicio)
        REFERENCES BI_dim_tiempo (id_tiempo)
);
GO

CREATE TABLE BI_hechos_encuestas(
    id_agente       BIGINT,
    id_cliente      BIGINT,
    id_valoracion   BIGINT,
    id_tiempo       BIGINT
    CONSTRAINT FK_agente FOREIGN KEY (id_agente) 
        REFERENCES BI_dim_agente (id_agente),
    CONSTRAINT FK_cliente FOREIGN KEY (id_cliente) 
        REFERENCES BI_dim_cliente (id_cliente),
    CONSTRAINT FK_tiempo_inicio FOREIGN KEY (id_tiempo)
        REFERENCES BI_dim_tiempo (id_tiempo)
);
GO


/*=========================================================
    VISTAS 
=========================================================*/
CREATE VIEW BI_vw_promedio_ticket AS
SELECT CAST (NULL AS INT) AS mes,
       CAST (NULL AS CHAR (25)) AS rango_etario_cliente,
       CAST (NULL AS CHAR (15)) AS canal_venta,
       CAST (NULL AS INT) AS cantidad_ventas,
       CAST (NULL AS DECIMAL (18, 2)) AS total_facturado,
       CAST (NULL AS DECIMAL (18, 2)) AS promedio_ticket
WHERE  1 = 0;
GO

CREATE VIEW BI_vw_distribucion_facturacion AS
SELECT CAST (NULL AS INT) AS anio,
       CAST (NULL AS INT) AS cuatrimestre,
       CAST (NULL AS CHAR (30)) AS tipo_servicio,
       CAST (NULL AS DECIMAL (18, 2)) AS total_facturacion,
       CAST (NULL AS INT) AS cantidad_facturacion,
       CAST (NULL AS DECIMAL (18, 2)) AS porcentaje_facturacion
WHERE  1 = 0;
GO

CREATE VIEW BI_vw_rankings_solicitudes AS
SELECT CAST (NULL AS INT) AS cantidad_solicitudes,
       CAST (NULL AS CHAR (10)) AS temporada,
       CAST (NULL AS INT) AS anio,
       CAST (NULL AS CHAR (25)) AS rango_etario_cliente
WHERE  1 = 0;
GO

CREATE VIEW BI_vw_promedio_anticipacion_solicitudes AS
SELECT CAST (NULL AS INT) AS cuatrimestre,
       CAST (NULL AS INT) AS rango_etario,
       CAST (NULL AS DATE) AS fecha_inicio_tentativa,
       CAST (NULL AS DATE) AS fecha_solicitud,
       CAST (NULL AS INT) AS promedio_dias
WHERE  1 = 0;
GO

CREATE VIEW BI_vw_tasa_aceptacion_propuestas AS
SELECT CAST (NULL AS INT) AS anio,
       CAST (NULL AS INT) AS cuatrimestre,
       CAST (NULL AS INT) AS total_propuestas_aceptadas,
       CAST (NULL AS INT) AS total_propuestas_no_aceptadas,
       CAST (NULL AS DECIMAL (18, 2)) AS porcentaje
WHERE  1 = 0;
GO

CREATE VIEW BI_vw_promedio_cotizaciones AS
SELECT CAST (NULL AS CHAR (10)) AS temporada,
       CAST (NULL AS INT) AS anio,
       CAST (NULL AS INT) AS cantidad_propuestas,
       CAST (NULL AS DECIMAL (18, 2)) AS importe_promedio
WHERE  1 = 0;
GO

CREATE VIEW BI_vw_promedio_tiempo_respuestas AS
SELECT CAST (NULL AS CHAR (25)) AS rango_etario_agente,
       CAST (NULL AS INT) AS mes,
       CAST (NULL AS DATE) AS fecha_solicitud,
       CAST (NULL AS DATE) AS fecha_emision_propuesta,
       CAST (NULL AS INT) AS promedio_en_dias
WHERE  1 = 0;
GO

CREATE VIEW BI_vw_desvio_cotizacion AS
SELECT CAST (NULL AS DECIMAL (18, 2)) AS presupuesto_estimado,
       CAST (NULL AS DECIMAL (18, 2)) AS importe_propuesta,
       CAST (NULL AS DECIMAL (18, 2)) AS desvio
WHERE  1 = 0;
GO

CREATE VIEW BI_vw_rankings_aspectos AS
SELECT CAST (NULL AS INT) AS cuatrimestre,
       CAST (NULL AS CHAR (255)) AS aspecto,
       CAST (NULL AS FLOAT) AS promedio_puntaje
WHERE  1 = 0;
GO

CREATE VIEW BI_vw_promedio_satisfaccion_agentes AS
SELECT CAST (NULL AS INT) AS mes,
       CAST (NULL AS CHAR (25)) AS rango_etario_agente,
       CAST (NULL AS FLOAT) AS promedio_puntaje
WHERE  1 = 0;
GO

/*=========================================================
    PROCEDURES MIGRACION (VACIOS)
=========================================================*/
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