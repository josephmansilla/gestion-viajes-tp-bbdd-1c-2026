/* =========================================================
= = = = = = = =  0) LIMPIEZA / PREP DEL ESQUEMA  = = = = = =
========================================================= */
USE GD1C2026
GO

/* ---------- DROP PROCEDURES ---------- */
IF OBJECT_ID('DB_GD1C2026.migrar_paises',                     'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_paises;
IF OBJECT_ID('DB_GD1C2026.migrar_provincias',                 'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_provincias;
IF OBJECT_ID('DB_GD1C2026.migrar_localidades',                'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_localidades;
IF OBJECT_ID('DB_GD1C2026.migrar_ciudades',                   'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_ciudades;
IF OBJECT_ID('DB_GD1C2026.migrar_agencias',                   'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_agencias;
IF OBJECT_ID('DB_GD1C2026.migrar_agentes',                    'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_agentes;
IF OBJECT_ID('DB_GD1C2026.migrar_clientes',                   'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_clientes;
IF OBJECT_ID('DB_GD1C2026.migrar_alianzas',                   'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_alianzas;
IF OBJECT_ID('DB_GD1C2026.migrar_aerolineas',                 'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_aerolineas;
IF OBJECT_ID('DB_GD1C2026.migrar_aeropuertos',                'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_aeropuertos;
IF OBJECT_ID('DB_GD1C2026.migrar_vuelos_disponibles',         'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_vuelos_disponibles;
IF OBJECT_ID('DB_GD1C2026.migrar_aeropuertos_por_vuelos',     'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_aeropuertos_por_vuelos;
IF OBJECT_ID('DB_GD1C2026.migrar_proveedores',                'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_proveedores;
IF OBJECT_ID('DB_GD1C2026.migrar_hospedajes_disponibles',     'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_hospedajes_disponibles;
IF OBJECT_ID('DB_GD1C2026.migrar_habitaciones_disponibles',   'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_habitaciones_disponibles;
IF OBJECT_ID('DB_GD1C2026.migrar_excursiones_disponibles',    'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_excursiones_disponibles;
IF OBJECT_ID('DB_GD1C2026.migrar_aspectos',                   'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_aspectos;
IF OBJECT_ID('DB_GD1C2026.migrar_encuestas',                  'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_encuestas;
IF OBJECT_ID('DB_GD1C2026.migrar_valoraciones',               'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_valoraciones;
IF OBJECT_ID('DB_GD1C2026.migrar_canales_venta',              'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_canales_venta;
IF OBJECT_ID('DB_GD1C2026.migrar_medios_pago',                'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_medios_pago;
IF OBJECT_ID('DB_GD1C2026.migrar_estado_propuesta',           'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_estado_propuesta;
IF OBJECT_ID('DB_GD1C2026.migrar_solicitudes_cotizacion',     'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_solicitudes_cotizacion;
IF OBJECT_ID('DB_GD1C2026.migrar_detalle_solicitud_ciudades', 'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_detalle_solicitud_ciudades;
IF OBJECT_ID('DB_GD1C2026.migrar_propuestas',                 'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_propuestas;
IF OBJECT_ID('DB_GD1C2026.migrar_propuestas_vuelo',           'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_propuestas_vuelo;
IF OBJECT_ID('DB_GD1C2026.migrar_propuestas_habitacion',      'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_propuestas_habitacion;
IF OBJECT_ID('DB_GD1C2026.migrar_propuestas_hospedaje',       'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_propuestas_hospedaje;
IF OBJECT_ID('DB_GD1C2026.migrar_ventas',                     'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_ventas;
IF OBJECT_ID('DB_GD1C2026.migrar_vuelos',                     'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_vuelos;
IF OBJECT_ID('DB_GD1C2026.migrar_vuelos_por_venta',           'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_vuelos_por_venta;
IF OBJECT_ID('DB_GD1C2026.migrar_hospedajes',                 'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_hospedajes;
IF OBJECT_ID('DB_GD1C2026.migrar_hospedajes_por_venta',       'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_hospedajes_por_venta;
IF OBJECT_ID('DB_GD1C2026.migrar_excursiones',                'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_excursiones;
IF OBJECT_ID('DB_GD1C2026.migrar_excursiones_por_venta',      'P') IS NOT NULL DROP PROCEDURE DB_GD1C2026.migrar_excursiones_por_venta;
GO

/* ---------- DROP TABLES (en orden inverso de dependencias) ---------- */
IF OBJECT_ID('DB_GD1C2026.excursiones_por_venta',             'U') IS NOT NULL DROP TABLE DB_GD1C2026.excursiones_por_venta;
IF OBJECT_ID('DB_GD1C2026.hospedajes_por_venta',              'U') IS NOT NULL DROP TABLE DB_GD1C2026.hospedajes_por_venta;
IF OBJECT_ID('DB_GD1C2026.vuelos_por_venta',                  'U') IS NOT NULL DROP TABLE DB_GD1C2026.vuelos_por_venta;
IF OBJECT_ID('DB_GD1C2026.excursiones',                       'U') IS NOT NULL DROP TABLE DB_GD1C2026.excursiones;
IF OBJECT_ID('DB_GD1C2026.hospedajes',                        'U') IS NOT NULL DROP TABLE DB_GD1C2026.hospedajes;
IF OBJECT_ID('DB_GD1C2026.vuelos',                            'U') IS NOT NULL DROP TABLE DB_GD1C2026.vuelos;
IF OBJECT_ID('DB_GD1C2026.ventas',                            'U') IS NOT NULL DROP TABLE DB_GD1C2026.ventas;
IF OBJECT_ID('DB_GD1C2026.propuestas_hospedaje',              'U') IS NOT NULL DROP TABLE DB_GD1C2026.propuestas_hospedaje;
IF OBJECT_ID('DB_GD1C2026.propuestas_habitacion',             'U') IS NOT NULL DROP TABLE DB_GD1C2026.propuestas_habitacion;
IF OBJECT_ID('DB_GD1C2026.propuestas_vuelo',                  'U') IS NOT NULL DROP TABLE DB_GD1C2026.propuestas_vuelo;
IF OBJECT_ID('DB_GD1C2026.propuestas',                        'U') IS NOT NULL DROP TABLE DB_GD1C2026.propuestas;
IF OBJECT_ID('DB_GD1C2026.detalle_solicitud_ciudades',        'U') IS NOT NULL DROP TABLE DB_GD1C2026.detalle_solicitud_ciudades;
IF OBJECT_ID('DB_GD1C2026.solicitudes_cotizacion',            'U') IS NOT NULL DROP TABLE DB_GD1C2026.solicitudes_cotizacion;
IF OBJECT_ID('DB_GD1C2026.valoraciones',                      'U') IS NOT NULL DROP TABLE DB_GD1C2026.valoraciones;
IF OBJECT_ID('DB_GD1C2026.encuestas',                         'U') IS NOT NULL DROP TABLE DB_GD1C2026.encuestas;
IF OBJECT_ID('DB_GD1C2026.aspectos',                          'U') IS NOT NULL DROP TABLE DB_GD1C2026.aspectos;
IF OBJECT_ID('DB_GD1C2026.aeropuertos_por_vuelos_disponibles','U') IS NOT NULL DROP TABLE DB_GD1C2026.aeropuertos_por_vuelos_disponibles;
IF OBJECT_ID('DB_GD1C2026.vuelos_disponibles',                'U') IS NOT NULL DROP TABLE DB_GD1C2026.vuelos_disponibles;
IF OBJECT_ID('DB_GD1C2026.aeropuertos',                       'U') IS NOT NULL DROP TABLE DB_GD1C2026.aeropuertos;
IF OBJECT_ID('DB_GD1C2026.aerolineas',                        'U') IS NOT NULL DROP TABLE DB_GD1C2026.aerolineas;
IF OBJECT_ID('DB_GD1C2026.alianzas',                          'U') IS NOT NULL DROP TABLE DB_GD1C2026.alianzas;
IF OBJECT_ID('DB_GD1C2026.habitaciones_disponibles',          'U') IS NOT NULL DROP TABLE DB_GD1C2026.habitaciones_disponibles;
IF OBJECT_ID('DB_GD1C2026.hospedajes_disponibles',            'U') IS NOT NULL DROP TABLE DB_GD1C2026.hospedajes_disponibles;
IF OBJECT_ID('DB_GD1C2026.excursiones_disponibles',           'U') IS NOT NULL DROP TABLE DB_GD1C2026.excursiones_disponibles;
IF OBJECT_ID('DB_GD1C2026.proveedores',                       'U') IS NOT NULL DROP TABLE DB_GD1C2026.proveedores;
IF OBJECT_ID('DB_GD1C2026.agentes',                           'U') IS NOT NULL DROP TABLE DB_GD1C2026.agentes;
IF OBJECT_ID('DB_GD1C2026.agencias',                          'U') IS NOT NULL DROP TABLE DB_GD1C2026.agencias;
IF OBJECT_ID('DB_GD1C2026.clientes',                          'U') IS NOT NULL DROP TABLE DB_GD1C2026.clientes;
IF OBJECT_ID('DB_GD1C2026.ciudades',                          'U') IS NOT NULL DROP TABLE DB_GD1C2026.ciudades;
IF OBJECT_ID('DB_GD1C2026.localidades',                       'U') IS NOT NULL DROP TABLE DB_GD1C2026.localidades;
IF OBJECT_ID('DB_GD1C2026.provincias',                        'U') IS NOT NULL DROP TABLE DB_GD1C2026.provincias;
IF OBJECT_ID('DB_GD1C2026.paises',                            'U') IS NOT NULL DROP TABLE DB_GD1C2026.paises;
IF OBJECT_ID('DB_GD1C2026.estado_propuesta',                  'U') IS NOT NULL DROP TABLE DB_GD1C2026.estado_propuesta;
IF OBJECT_ID('DB_GD1C2026.canal_venta',                       'U') IS NOT NULL DROP TABLE DB_GD1C2026.canal_venta;
IF OBJECT_ID('DB_GD1C2026.medio_pago',                        'U') IS NOT NULL DROP TABLE DB_GD1C2026.medio_pago;
GO

/* ---------- DROP y RECREAR SCHEMA ---------- */
IF SCHEMA_ID('DB_GD1C2026') IS NULL
BEGIN
    EXEC('CREATE SCHEMA DB_GD1C2026;');
END
GO

/* =========================================================
= = = = = = = =  1) CATÁLOGOS SIMPLES  = = = = = = = = = = =
= (estado_propuesta, canal_venta, medio_pago, alianzas)    =
========================================================= */

CREATE TABLE DB_GD1C2026.estado_propuesta (
    estado  NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_estado_propuesta PRIMARY KEY (estado)
);
GO

CREATE TABLE DB_GD1C2026.canal_venta (
    nombre  NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_canal_venta PRIMARY KEY (nombre)
);
GO

CREATE TABLE DB_GD1C2026.medio_pago (
    nombre  NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_medio_pago PRIMARY KEY (nombre)
);
GO

CREATE TABLE DB_GD1C2026.alianzas (
    nombre_alianza  NVARCHAR(255) NOT NULL,
    CONSTRAINT PK_alianzas PRIMARY KEY (nombre_alianza)
);
GO

/* =========================================================
= = = = = = =  2) GEOGRAFÍA: PAISES, PROVINCIAS, LOC.  = = =
========================================================= */

CREATE TABLE DB_GD1C2026.paises (
    codigo_pais BIGINT          NOT NULL,
    nombre      NVARCHAR(255)   NOT NULL,
    CONSTRAINT PK_paises PRIMARY KEY (codigo_pais)
);
GO

CREATE TABLE DB_GD1C2026.provincias (
    codigo_provincia    BIGINT          NOT NULL,
    codigo_pais         BIGINT          NOT NULL,
    nombre              NVARCHAR(255)   NOT NULL,
    CONSTRAINT PK_provincias PRIMARY KEY (codigo_provincia),
    CONSTRAINT FK_provincias_paises FOREIGN KEY (codigo_pais)
        REFERENCES DB_GD1C2026.paises (codigo_pais)
);
GO

CREATE TABLE DB_GD1C2026.localidades (
    codigo_localidad    BIGINT          NOT NULL,
    codigo_provincia    BIGINT          NOT NULL,
    nombre              NVARCHAR(255)   NOT NULL,
    CONSTRAINT PK_localidades PRIMARY KEY (codigo_localidad),
    CONSTRAINT FK_localidades_provincias FOREIGN KEY (codigo_provincia)
        REFERENCES DB_GD1C2026.provincias (codigo_provincia)
);
GO

CREATE TABLE DB_GD1C2026.ciudades (
    codigo_ciudad       BIGINT          NOT NULL,
    codigo_pais         BIGINT          NOT NULL,
    codigo_localidad    BIGINT          NOT NULL,
    nombre              NVARCHAR(255)   NOT NULL,
    CONSTRAINT PK_ciudades PRIMARY KEY (codigo_ciudad),
    CONSTRAINT FK_ciudades_paises     FOREIGN KEY (codigo_pais)
        REFERENCES DB_GD1C2026.paises (codigo_pais),
    CONSTRAINT FK_ciudades_localidades FOREIGN KEY (codigo_localidad)
        REFERENCES DB_GD1C2026.localidades (codigo_localidad)
);
GO

/* =========================================================
= = = = = = =  3) ACTORES: AGENCIAS, AGENTES, CLIENTES  = =
========================================================= */

CREATE TABLE DB_GD1C2026.agencias (
    numero_agencia      BIGINT          NOT NULL,
    codigo_localidad    BIGINT          NOT NULL,
    direccion           NVARCHAR(255)   NOT NULL,
    telefono            NVARCHAR(255)   NOT NULL,
    email               NVARCHAR(255)   NOT NULL,
    CONSTRAINT PK_agencias PRIMARY KEY (numero_agencia),
    CONSTRAINT FK_agencias_localidades FOREIGN KEY (codigo_localidad)
        REFERENCES DB_GD1C2026.localidades (codigo_localidad)
);
GO

CREATE TABLE DB_GD1C2026.agentes (
    legajo_agente       BIGINT          NOT NULL,
    agencia             BIGINT          NOT NULL,
    codigo_localidad    BIGINT          NOT NULL,
    nombre              NVARCHAR(255)   NOT NULL,
    apellido            NVARCHAR(255)   NOT NULL,
    dni                 NVARCHAR(255)   NOT NULL,
    direccion           NVARCHAR(255)   NOT NULL,
    fecha_nacimiento    DATE            NOT NULL,
    telefono            NVARCHAR(255)   NOT NULL,
    email               NVARCHAR(255)   NOT NULL,
    CONSTRAINT PK_agentes PRIMARY KEY (legajo_agente),
    CONSTRAINT FK_agentes_agencias    FOREIGN KEY (agencia)
        REFERENCES DB_GD1C2026.agencias (numero_agencia),
    CONSTRAINT FK_agentes_localidades FOREIGN KEY (codigo_localidad)
        REFERENCES DB_GD1C2026.localidades (codigo_localidad)
);
GO

CREATE TABLE DB_GD1C2026.clientes (
    codigo_cliente      BIGINT          NOT NULL,
    codigo_localidad    BIGINT          NOT NULL,
    nombre              NVARCHAR(255)   NOT NULL,
    apellido            NVARCHAR(255)   NOT NULL,
    dni                 NVARCHAR(255)   NOT NULL,
    telefono            NVARCHAR(255)   NOT NULL,
    email               NVARCHAR(255)   NOT NULL,
    direccion           NVARCHAR(255)   NOT NULL,
    fecha_nacimiento    DATE            NOT NULL,
    CONSTRAINT PK_clientes PRIMARY KEY (codigo_cliente),
    CONSTRAINT FK_clientes_localidades FOREIGN KEY (codigo_localidad)
        REFERENCES DB_GD1C2026.localidades (codigo_localidad)
);
GO

/* =========================================================
= = = = = = =  4) AEROLÍNEAS Y AEROPUERTOS  = = = = = = = =
========================================================= */

CREATE TABLE DB_GD1C2026.aerolineas (
    codigo_aerolinea    NVARCHAR(255)   NOT NULL,
    codigo_pais         BIGINT          NOT NULL,
    nombre              NVARCHAR(255)   NOT NULL,
    alianza             NVARCHAR(255)   NOT NULL,
    CONSTRAINT PK_aerolineas PRIMARY KEY (codigo_aerolinea),
    CONSTRAINT FK_aerolineas_paises   FOREIGN KEY (codigo_pais)
        REFERENCES DB_GD1C2026.paises (codigo_pais),
    CONSTRAINT FK_aerolineas_alianzas FOREIGN KEY (alianza)
        REFERENCES DB_GD1C2026.alianzas (nombre_alianza)
);
GO

CREATE TABLE DB_GD1C2026.aeropuertos (
    codigo_aeropuerto   NVARCHAR(255)   NOT NULL,
    codigo_ciudad       BIGINT          NOT NULL,
    descripcion         NVARCHAR(200)       NULL,
    CONSTRAINT PK_aeropuertos PRIMARY KEY (codigo_aeropuerto),
    CONSTRAINT FK_aeropuertos_ciudades FOREIGN KEY (codigo_ciudad)
        REFERENCES DB_GD1C2026.ciudades (codigo_ciudad)
);
GO

/* =========================================================
= = = = = = =  5) VUELOS DISPONIBLES Y TABLA PUENTE  = = = =
========================================================= */

CREATE TABLE DB_GD1C2026.aeropuertos_por_vuelos_disponibles (
    aeropuertos_id              BIGINT          NOT NULL,
    codigo_aeropuerto_salida    NVARCHAR(255)   NOT NULL,
    codigo_aeropuerto_llegada   NVARCHAR(255)   NOT NULL,
    CONSTRAINT PK_aeropuertos_por_vuelos_disponibles PRIMARY KEY (aeropuertos_id),
    CONSTRAINT FK_apvd_aeropuerto_salida  FOREIGN KEY (codigo_aeropuerto_salida)
        REFERENCES DB_GD1C2026.aeropuertos (codigo_aeropuerto),
    CONSTRAINT FK_apvd_aeropuerto_llegada FOREIGN KEY (codigo_aeropuerto_llegada)
        REFERENCES DB_GD1C2026.aeropuertos (codigo_aeropuerto)
);
GO

CREATE TABLE DB_GD1C2026.vuelos_disponibles (
    codigo_vuelos_disponibles   BIGINT          NOT NULL,
    codigo_aerolinea            NVARCHAR(255)   NOT NULL,
    codigo_aeropuertos          BIGINT          NOT NULL,
    fecha_salida                DATE            NOT NULL,
    fecha_llegada               DATE            NOT NULL,
    horario_salida              NVARCHAR(50)    NOT NULL,
    horario_llegada             NVARCHAR(50)    NOT NULL,
    duracion                    INT                 NULL,
    incluye_carry               BIT             NOT NULL,
    incluye_valija              BIT             NOT NULL,
    codigo_vuelo                VARCHAR(10)     NOT NULL,
    precio_unitario             DECIMAL(18,2)   NOT NULL,
    CONSTRAINT PK_vuelos_disponibles PRIMARY KEY (codigo_vuelos_disponibles),
    CONSTRAINT FK_aerolineas FOREIGN KEY (codigo_aerolinea)
        REFERENCES DB_GD1C2026.aerolineas (codigo_aerolinea),
    CONSTRAINT FK_aeropuertos_por_vuelos_disponibles FOREIGN KEY (codigo_aeropuertos)
        REFERENCES DB_GD1C2026.aeropuertos_por_vuelos_disponibles (aeropuertos_id)
);
GO

/* =========================================================
= = = = = = = = = =  6) PROVEEDORES  = = = = = = = = = = = =
========================================================= */

CREATE TABLE DB_GD1C2026.proveedores (
    numero_proveedor    BIGINT          NOT NULL,
    nombre              NVARCHAR(255)   NOT NULL,
    email               NVARCHAR(255)   NOT NULL,
    telefono            NVARCHAR(255)   NOT NULL,
    CONSTRAINT PK_proveedores PRIMARY KEY (numero_proveedor)
);
GO

/* =========================================================
= = = =  7) HOSPEDAJES DISPONIBLES Y HABITACIONES = = = = =
========================================================= */

CREATE TABLE DB_GD1C2026.hospedajes_disponibles (
    codigo_hospedaje        BIGINT          NOT NULL,
    codigo_ciudad           BIGINT          NOT NULL,
    nombre                  NVARCHAR(255)       NULL,
    direccion               NVARCHAR(255)       NULL,
    incluye_desayuno        BIT                 NULL,
    horario_check_in        NVARCHAR(50)        NULL,
    horario_check_out       NVARCHAR(50)        NULL,
    descripcion             NVARCHAR(MAX)       NULL,
    CONSTRAINT PK_hospedajes_disponibles PRIMARY KEY (codigo_hospedaje),
    CONSTRAINT FK_hospedajes_disp_ciudades FOREIGN KEY (codigo_ciudad)
        REFERENCES DB_GD1C2026.ciudades (codigo_ciudad)
);
GO

CREATE TABLE DB_GD1C2026.habitaciones_disponibles (
    numero_habitacion       BIGINT          NOT NULL,
    codigo_hospedaje        BIGINT          NOT NULL,
    precio_noche            DECIMAL(18,2)   NOT NULL,
    descripcion             NVARCHAR(MAX)       NULL,
    CONSTRAINT PK_habitaciones_disponibles PRIMARY KEY (numero_habitacion),
    CONSTRAINT FK_habitaciones_disp_hospedajes FOREIGN KEY (codigo_hospedaje)
        REFERENCES DB_GD1C2026.hospedajes_disponibles (codigo_hospedaje)
);
GO

/* =========================================================
= = = = = = = =  8) EXCURSIONES DISPONIBLES  = = = = = = = =
========================================================= */

CREATE TABLE DB_GD1C2026.excursiones_disponibles (
    codigo_excursion_disponibles    BIGINT          NOT NULL,
    codigo_proveedor                BIGINT          NOT NULL,
    nombre                          NVARCHAR(255)   NOT NULL,
    precio_unitario                 DECIMAL(18,2)   NOT NULL,
    horario                         DATE            NOT NULL,
    duracion                        INT             NOT NULL,
    descripcion                     NVARCHAR(MAX)       NULL,
    CONSTRAINT PK_excursiones_disponibles PRIMARY KEY (codigo_excursion_disponibles),
    CONSTRAINT FK_excursiones_disp_proveedores FOREIGN KEY (codigo_proveedor)
        REFERENCES DB_GD1C2026.proveedores (numero_proveedor)
);
GO

/* =========================================================
= = = = = = = = = =  9) ENCUESTAS Y VALORACIONES  = = = = =
========================================================= */

CREATE TABLE DB_GD1C2026.aspectos (
    codigo_aspecto  BIGINT          NOT NULL,
    descripcion     NVARCHAR(MAX)   NOT NULL,
    CONSTRAINT PK_aspectos PRIMARY KEY (codigo_aspecto)
);
GO

CREATE TABLE DB_GD1C2026.encuestas (
    codigo_encuesta         BIGINT          NOT NULL,
    descripcion             NVARCHAR(MAX)   NOT NULL,
    fecha_realizado         DATE            NOT NULL,
    comentario_abierto      NVARCHAR(MAX)       NULL,
    CONSTRAINT PK_encuestas PRIMARY KEY (codigo_encuesta)
);
GO

CREATE TABLE DB_GD1C2026.valoraciones (
    codigo_valoracion   BIGINT  NOT NULL,
    codigo_encuesta     BIGINT  NOT NULL,
    codigo_aspecto      BIGINT  NOT NULL,
    puntaje             INT     NOT NULL,
    CONSTRAINT PK_valoraciones PRIMARY KEY (codigo_valoracion),
    CONSTRAINT FK_valoraciones_encuestas FOREIGN KEY (codigo_encuesta)
        REFERENCES DB_GD1C2026.encuestas (codigo_encuesta),
    CONSTRAINT FK_valoraciones_aspectos  FOREIGN KEY (codigo_aspecto)
        REFERENCES DB_GD1C2026.aspectos (codigo_aspecto)
);
GO

/* =========================================================
= = = = = = =  10) SOLICITUDES DE COTIZACIÓN  = = = = = = =
========================================================= */

CREATE TABLE DB_GD1C2026.solicitudes_cotizacion (
    numero_solicitud            BIGINT          NOT NULL,
    codigo_cliente              BIGINT          NOT NULL,
    codigo_agente               BIGINT          NOT NULL,
    codigo_encuesta             BIGINT              NULL,
    fecha_realizada             DATE            NOT NULL,
    fecha_inicio_tentativa      DATE            NOT NULL,
    fecha_fin_tentativa         DATE            NOT NULL,
    cantidad_pasajeros          INT             NOT NULL,
    cantidad_dias_aproximados   INT             NOT NULL,
    presupuesto_estimado        DECIMAL(18,2)   NOT NULL,
    observaciones               NVARCHAR(MAX)       NULL,
    CONSTRAINT PK_solicitudes_cotizacion PRIMARY KEY (numero_solicitud),
    CONSTRAINT FK_sc_clientes  FOREIGN KEY (codigo_cliente)
        REFERENCES DB_GD1C2026.clientes (codigo_cliente),
    CONSTRAINT FK_sc_agentes   FOREIGN KEY (codigo_agente)
        REFERENCES DB_GD1C2026.agentes (legajo_agente),
    CONSTRAINT FK_sc_encuestas FOREIGN KEY (codigo_encuesta)
        REFERENCES DB_GD1C2026.encuestas (codigo_encuesta)
);
GO

CREATE TABLE DB_GD1C2026.detalle_solicitud_ciudades (
    codigo_detalle      BIGINT  NOT NULL,
    numero_solicitud    BIGINT  NOT NULL,
    codigo_ciudad       BIGINT  NOT NULL,
    cantidad_dias       INT     NOT NULL,
    CONSTRAINT PK_detalle_solicitud_ciudades PRIMARY KEY (codigo_detalle),
    CONSTRAINT FK_dsc_solicitudes FOREIGN KEY (numero_solicitud)
        REFERENCES DB_GD1C2026.solicitudes_cotizacion (numero_solicitud),
    CONSTRAINT FK_dsc_ciudades    FOREIGN KEY (codigo_ciudad)
        REFERENCES DB_GD1C2026.ciudades (codigo_ciudad)
);
GO

/* =========================================================
= = = = = = = = = = = 11) PROPUESTAS  = = = = = = = = = = =
========================================================= */

CREATE TABLE DB_GD1C2026.propuestas (
    codigo_propuesta            BIGINT          NOT NULL,
    codigo_cliente              BIGINT          NOT NULL,
    codigo_solicitud_cotizacion BIGINT          NOT NULL,
    codigo_agente               BIGINT          NOT NULL,
    estado_propuesta            NVARCHAR(50)    NOT NULL,
    fecha_emision               DATE            NOT NULL,
    vigencia_hasta              DATE            NOT NULL,
    fecha_desde                 DATE            NOT NULL,
    fecha_hasta                 DATE            NOT NULL,
    subtotal                    DECIMAL(18,2)   NOT NULL,
    descuento                   DECIMAL(18,2)   NOT NULL,
    importe_total               DECIMAL(18,2)   NOT NULL,
    CONSTRAINT PK_propuestas PRIMARY KEY (codigo_propuesta, codigo_cliente),
    CONSTRAINT FK_propuestas_clientes     FOREIGN KEY (codigo_cliente)
        REFERENCES DB_GD1C2026.clientes (codigo_cliente),
    CONSTRAINT FK_propuestas_solicitudes  FOREIGN KEY (codigo_solicitud_cotizacion)
        REFERENCES DB_GD1C2026.solicitudes_cotizacion (numero_solicitud),
    CONSTRAINT FK_propuestas_agentes      FOREIGN KEY (codigo_agente)
        REFERENCES DB_GD1C2026.agentes (legajo_agente),
    CONSTRAINT FK_propuestas_estado       FOREIGN KEY (estado_propuesta)
        REFERENCES DB_GD1C2026.estado_propuesta (estado)
);
GO

CREATE TABLE DB_GD1C2026.propuestas_vuelo (
    codigo_propuesta_vuelo      BIGINT          NOT NULL,
    codigo_propuesta            BIGINT          NOT NULL,
    codigo_cliente              BIGINT          NOT NULL,
    codigo_vuelo_disponible     BIGINT          NOT NULL,
    cantidad_pasajes            INT             NOT NULL,
    subtotal                    DECIMAL(18,2)   NOT NULL,
    CONSTRAINT PK_propuestas_vuelo PRIMARY KEY (codigo_propuesta_vuelo),
    CONSTRAINT FK_pv_propuestas      FOREIGN KEY (codigo_propuesta, codigo_cliente)
        REFERENCES DB_GD1C2026.propuestas (codigo_propuesta, codigo_cliente),
    CONSTRAINT FK_pv_vuelos_disp     FOREIGN KEY (codigo_vuelo_disponible)
        REFERENCES DB_GD1C2026.vuelos_disponibles (codigo_vuelos_disponibles)
);
GO

CREATE TABLE DB_GD1C2026.propuestas_habitacion (
    codigo_propuesta_habitacion     BIGINT       NOT NULL,
    codigo_habitacion_disponible    BIGINT       NOT NULL,
    codigo_propuesta_hospedaje      BIGINT       NOT NULL,
    cantidad                        INT          NOT NULL,
    CONSTRAINT PK_propuestas_habitacion PRIMARY KEY (codigo_propuesta_habitacion),
    CONSTRAINT FK_ph_habitaciones_disp FOREIGN KEY (codigo_habitacion_disponible)
        REFERENCES DB_GD1C2026.habitaciones_disponibles (numero_habitacion),
    CONSTRAINT FK_propuestas_hospedaje FOREIGN KEY (codigo_propuesta_hospedaje)
        REFERENCES DB_GD1C2026.propuestas_hospedaje (codigo_propuesta_hospedaje)
);
GO

CREATE TABLE DB_GD1C2026.propuestas_hospedaje (
    codigo_propuesta_hospedaje  BIGINT          NOT NULL,
    codigo_propuesta            BIGINT          NOT NULL,
    codigo_cliente              BIGINT          NOT NULL,
    codigo_hospedaje_disponible BIGINT          NOT NULL,
    fecha_desde                 DATE            NOT NULL,
    fecha_hasta                 DATE            NOT NULL,
    cantidad_dias               INT             NOT NULL,
    subtotal                    DECIMAL(18,2)   NOT NULL,
    CONSTRAINT PK_propuestas_hospedaje PRIMARY KEY (codigo_propuesta_hospedaje),
    CONSTRAINT FK_phosp_propuestas     FOREIGN KEY (codigo_propuesta, codigo_cliente)
        REFERENCES DB_GD1C2026.propuestas (codigo_propuesta, codigo_cliente),
    CONSTRAINT FK_phosp_hospedajes_disp FOREIGN KEY (codigo_hospedaje_disponible)
        REFERENCES DB_GD1C2026.hospedajes_disponibles (codigo_hospedaje)
);
GO

/* =========================================================
= = = = = = = = = = = 12) VENTAS  = = = = = = = = = = = = =
========================================================= */

CREATE TABLE DB_GD1C2026.ventas (
    numero_venta        BIGINT          NOT NULL,
    numero_agencia      BIGINT          NOT NULL,
    codigo_cliente      BIGINT          NOT NULL,
    legajo_agente       BIGINT          NOT NULL,
    codigo_encuesta     BIGINT              NULL,
    codigo_propuesta    BIGINT          NOT NULL,
    canal_venta         NVARCHAR(50)    NOT NULL,
    medio_pago          NVARCHAR(50)    NOT NULL,
    fecha_venta         DATE            NOT NULL,
    subtotal            DECIMAL(18,2)   NOT NULL,
    descuento           DECIMAL(18,2)   NOT NULL,
    importe_total       DECIMAL(18,2)   NOT NULL,
    observaciones       NVARCHAR(MAX)       NULL,
    CONSTRAINT PK_ventas PRIMARY KEY (numero_venta),
    CONSTRAINT FK_ventas_agencias   FOREIGN KEY (numero_agencia)
        REFERENCES DB_GD1C2026.agencias (numero_agencia),
    CONSTRAINT FK_ventas_clientes   FOREIGN KEY (codigo_cliente)
        REFERENCES DB_GD1C2026.clientes (codigo_cliente),
    CONSTRAINT FK_ventas_agentes    FOREIGN KEY (legajo_agente)
        REFERENCES DB_GD1C2026.agentes (legajo_agente),
    CONSTRAINT FK_ventas_encuestas  FOREIGN KEY (codigo_encuesta)
        REFERENCES DB_GD1C2026.encuestas (codigo_encuesta),
    CONSTRAINT FK_ventas_propuestas FOREIGN KEY (codigo_propuesta)
        REFERENCES DB_GD1C2026.propuestas (codigo_propuesta),
    CONSTRAINT FK_ventas_canal      FOREIGN KEY (canal_venta)
        REFERENCES DB_GD1C2026.canal_venta (nombre),
    CONSTRAINT FK_ventas_medio_pago FOREIGN KEY (medio_pago)
        REFERENCES DB_GD1C2026.medio_pago (nombre)
);
GO

/* =========================================================
= = = = = = =  13) DETALLE DE VENTA: VUELOS, HOSPEDAJES,  =
=                  EXCURSIONES Y TABLAS PUENTE  = = = = = =
========================================================= */

CREATE TABLE DB_GD1C2026.vuelos (
    codigo_vuelo                BIGINT          NOT NULL,
    codigo_vuelo_disponible     BIGINT          NOT NULL,
    cantidad_pasajes            INT             NOT NULL,
    precio_unitario             DECIMAL(18,2)   NOT NULL,
    codigo_reserva_operacion    NVARCHAR(255)   NOT NULL,
    subtotal                    DECIMAL(18,2)   NOT NULL,
    CONSTRAINT PK_vuelos PRIMARY KEY (codigo_vuelo),
    CONSTRAINT FK_vuelos_disponibles FOREIGN KEY (codigo_vuelo_disponible)
        REFERENCES DB_GD1C2026.vuelos_disponibles (codigo_vuelos_disponibles)
);
GO

CREATE TABLE DB_GD1C2026.vuelos_por_venta (
    codigo_vuelo    BIGINT  NOT NULL,
    codigo_venta    BIGINT  NOT NULL,
    CONSTRAINT PK_vuelos_por_venta PRIMARY KEY (codigo_vuelo, codigo_venta),
    CONSTRAINT FK_vpv_vuelos FOREIGN KEY (codigo_vuelo)
        REFERENCES DB_GD1C2026.vuelos (codigo_vuelo),
    CONSTRAINT FK_vpv_ventas FOREIGN KEY (codigo_venta)
        REFERENCES DB_GD1C2026.ventas (numero_venta)
);
GO

CREATE TABLE DB_GD1C2026.hospedajes (
    codigo_hospedaje            BIGINT          NOT NULL,
    codigo_hospedaje_disponible BIGINT          NOT NULL,
    fecha_desde                 DATE            NOT NULL,
    fecha_hasta                 DATE            NOT NULL,
    cantidad                    INT             NOT NULL,
    precio_unitario             DECIMAL(18,2)   NOT NULL,
    cantidad_dias_aproximados   INT             NOT NULL,
    codigo_reserva              NVARCHAR(255)   NOT NULL,
    subtotal                    DECIMAL(18,2)   NOT NULL,
    CONSTRAINT PK_hospedajes PRIMARY KEY (codigo_hospedaje),
    CONSTRAINT FK_hospedajes_disponibles FOREIGN KEY (codigo_hospedaje_disponible)
        REFERENCES DB_GD1C2026.hospedajes_disponibles (codigo_hospedaje)
);
GO

CREATE TABLE DB_GD1C2026.hospedajes_por_venta (
    codigo_venta        BIGINT  NOT NULL,
    codigo_hospedaje    BIGINT  NOT NULL,
    CONSTRAINT PK_hospedajes_por_venta PRIMARY KEY (codigo_venta, codigo_hospedaje),
    CONSTRAINT FK_hpv_ventas     FOREIGN KEY (codigo_venta)
        REFERENCES DB_GD1C2026.ventas (numero_venta),
    CONSTRAINT FK_hpv_hospedajes FOREIGN KEY (codigo_hospedaje)
        REFERENCES DB_GD1C2026.hospedajes (codigo_hospedaje)
);
GO

CREATE TABLE DB_GD1C2026.excursiones (
    codigo_excursion                BIGINT          NOT NULL,
    codigo_excursion_disponibles    BIGINT          NOT NULL,
    fecha_reserva                   DATETIME        NOT NULL,
    cantidad                        INT             NOT NULL,
    codigo_reserva                  NVARCHAR(255)   NOT NULL,
    subtotal                        DECIMAL(18,2)   NOT NULL,
    CONSTRAINT PK_excursiones PRIMARY KEY (codigo_excursion),
    CONSTRAINT FK_excursiones_disponibles FOREIGN KEY (codigo_excursion_disponibles)
        REFERENCES DB_GD1C2026.excursiones_disponibles (codigo_excursion_disponibles)
);
GO

CREATE TABLE DB_GD1C2026.excursiones_por_venta (
    codigo_venta        BIGINT  NOT NULL,
    codigo_excursion    BIGINT  NOT NULL,
    CONSTRAINT PK_excursiones_por_venta PRIMARY KEY (codigo_venta, codigo_excursion),
    CONSTRAINT FK_epv_ventas      FOREIGN KEY (codigo_venta)
        REFERENCES DB_GD1C2026.ventas (numero_venta),
    CONSTRAINT FK_epv_excursiones FOREIGN KEY (codigo_excursion)
        REFERENCES DB_GD1C2026.excursiones (codigo_excursion)
);
GO

/* =========================================================
= = = = = = = = = = = PROCEDURES DE MIGRACIÓN  = = = = = = =
========================================================= */

/* ---- países ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_paises AS
BEGIN
    -- Inserta todos los países únicos referenciados en la tabla maestra.
    -- Se genera un codigo_pais secuencial con ROW_NUMBER.
    INSERT INTO DB_GD1C2026.paises (codigo_pais, nombre)
    SELECT
        ROW_NUMBER() OVER (ORDER BY pais) AS codigo_pais,
        pais                              AS nombre
    FROM (
        SELECT DISTINCT Aeropuerto_Salida_Pais  AS pais FROM gd_esquema.Maestra WHERE Aeropuerto_Salida_Pais  IS NOT NULL
        UNION
        SELECT DISTINCT Aeropuerto_Llegada_Pais AS pais FROM gd_esquema.Maestra WHERE Aeropuerto_Llegada_Pais IS NOT NULL
        UNION
        SELECT DISTINCT Aerolinea_Pais          AS pais FROM gd_esquema.Maestra WHERE Aerolinea_Pais          IS NOT NULL
        UNION
        SELECT DISTINCT Hospedaje_Pais          AS pais FROM gd_esquema.Maestra WHERE Hospedaje_Pais          IS NOT NULL
    ) p;
END;
GO

/* ---- provincias ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_provincias AS
BEGIN
    -- Inserta provincias únicas derivadas de los datos de agencias, agentes y clientes.
    -- Como la tabla maestra almacena provincia como texto libre, mapeamos al país
    -- buscando si la provincia coincide con un país conocido (datos argentinos donde
    -- la columna Provincia contiene el nombre de provincia local).
    -- Usamos el primer país disponible como fallback para provincias sin país directo.
    INSERT INTO DB_GD1C2026.provincias (codigo_provincia, codigo_pais, nombre)
    SELECT
        ROW_NUMBER() OVER (ORDER BY src.provincia) AS codigo_provincia,
        ISNULL(p.codigo_pais, (SELECT TOP 1 codigo_pais FROM DB_GD1C2026.paises ORDER BY codigo_pais)) AS codigo_pais,
        src.provincia                              AS nombre
    FROM (
        SELECT DISTINCT Agencia_Provincia  AS provincia FROM gd_esquema.Maestra WHERE Agencia_Provincia  IS NOT NULL
        UNION
        SELECT DISTINCT Agente_Provincia   AS provincia FROM gd_esquema.Maestra WHERE Agente_Provincia   IS NOT NULL
        UNION
        SELECT DISTINCT Cliente_Provincia  AS provincia FROM gd_esquema.Maestra WHERE Cliente_Provincia  IS NOT NULL
    ) src
    LEFT JOIN DB_GD1C2026.paises p ON p.nombre = src.provincia;
END;
GO

/* ---- localidades ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_localidades AS
BEGIN
    -- Inserta localidades únicas a partir de las columnas de localidad de la tabla maestra.
    INSERT INTO DB_GD1C2026.localidades (codigo_localidad, codigo_provincia, nombre)
    SELECT
        ROW_NUMBER() OVER (ORDER BY src.localidad, src.provincia) AS codigo_localidad,
        pr.codigo_provincia,
        src.localidad                                             AS nombre
    FROM (
        SELECT DISTINCT Agencia_Localidad AS localidad, Agencia_Provincia AS provincia
        FROM gd_esquema.Maestra
        WHERE Agencia_Localidad IS NOT NULL AND Agencia_Provincia IS NOT NULL
        UNION
        SELECT DISTINCT Agente_Localidad,  Agente_Provincia
        FROM gd_esquema.Maestra
        WHERE Agente_Localidad  IS NOT NULL AND Agente_Provincia  IS NOT NULL
        UNION
        SELECT DISTINCT Cliente_Localidad, Cliente_Provincia
        FROM gd_esquema.Maestra
        WHERE Cliente_Localidad IS NOT NULL AND Cliente_Provincia IS NOT NULL
    ) src
    JOIN DB_GD1C2026.provincias pr ON pr.nombre = src.provincia;
END;
GO

/* ---- ciudades ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_ciudades AS
BEGIN
    DECLARE @offset BIGINT;

    -- Paso 1: Para las ciudades de aeropuertos y hospedajes necesitamos localidades.
    -- Creamos localidades sintéticas para cada ciudad única que no existe aún en localidades.
    -- Usamos la primera provincia del país correspondiente como provincia contenedora.
    SET @offset = ISNULL((SELECT MAX(codigo_localidad) FROM DB_GD1C2026.localidades), 0);

    INSERT INTO DB_GD1C2026.localidades (codigo_localidad, codigo_provincia, nombre)
    SELECT
        @offset + ROW_NUMBER() OVER (ORDER BY src.ciudad, src.pais) AS codigo_localidad,
        (
            SELECT TOP 1 pr2.codigo_provincia
            FROM DB_GD1C2026.provincias pr2
            JOIN DB_GD1C2026.paises     p2  ON p2.codigo_pais = pr2.codigo_pais
            WHERE p2.nombre = src.pais
            ORDER BY pr2.codigo_provincia
        )                                                            AS codigo_provincia,
        src.ciudad                                                   AS nombre
    FROM (
        SELECT DISTINCT Aeropuerto_Salida_Ciudad  AS ciudad, Aeropuerto_Salida_Pais  AS pais
        FROM gd_esquema.Maestra WHERE Aeropuerto_Salida_Ciudad  IS NOT NULL AND Aeropuerto_Salida_Pais  IS NOT NULL
        UNION
        SELECT DISTINCT Aeropuerto_Llegada_Ciudad, Aeropuerto_Llegada_Pais
        FROM gd_esquema.Maestra WHERE Aeropuerto_Llegada_Ciudad IS NOT NULL AND Aeropuerto_Llegada_Pais IS NOT NULL
        UNION
        SELECT DISTINCT Hospedaje_Ciudad, Hospedaje_Pais
        FROM gd_esquema.Maestra WHERE Hospedaje_Ciudad IS NOT NULL AND Hospedaje_Pais IS NOT NULL
    ) src
    WHERE NOT EXISTS (
        SELECT 1 FROM DB_GD1C2026.localidades l WHERE l.nombre = src.ciudad
    );

    -- Paso 2: Insertar ciudades mapeando a país y localidad.
    INSERT INTO DB_GD1C2026.ciudades (codigo_ciudad, codigo_pais, codigo_localidad, nombre)
    SELECT
        ROW_NUMBER() OVER (ORDER BY src.ciudad, src.pais) AS codigo_ciudad,
        p.codigo_pais,
        l.codigo_localidad,
        src.ciudad AS nombre
    FROM (
        SELECT DISTINCT Aeropuerto_Salida_Ciudad  AS ciudad, Aeropuerto_Salida_Pais  AS pais
        FROM gd_esquema.Maestra WHERE Aeropuerto_Salida_Ciudad  IS NOT NULL AND Aeropuerto_Salida_Pais  IS NOT NULL
        UNION
        SELECT DISTINCT Aeropuerto_Llegada_Ciudad, Aeropuerto_Llegada_Pais
        FROM gd_esquema.Maestra WHERE Aeropuerto_Llegada_Ciudad IS NOT NULL AND Aeropuerto_Llegada_Pais IS NOT NULL
        UNION
        SELECT DISTINCT Hospedaje_Ciudad, Hospedaje_Pais
        FROM gd_esquema.Maestra WHERE Hospedaje_Ciudad IS NOT NULL AND Hospedaje_Pais IS NOT NULL
    ) src
    JOIN DB_GD1C2026.paises      p ON p.nombre = src.pais
    JOIN DB_GD1C2026.localidades l ON l.nombre = src.ciudad;
END;
GO

/* ---- agencias ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_agencias AS
BEGIN
    INSERT INTO DB_GD1C2026.agencias (numero_agencia, codigo_localidad, direccion, telefono, email)
    SELECT DISTINCT
        m.Agencia_Nro_Agencia        AS numero_agencia,
        l.codigo_localidad,
        m.Agencia_Direccion          AS direccion,
        m.Agencia_Telefono           AS telefono,
        m.Agencia_Mail               AS email
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.localidades l ON l.nombre = m.Agencia_Localidad
    WHERE m.Agencia_Nro_Agencia IS NOT NULL;
END;
GO

/* ---- agentes ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_agentes AS
BEGIN
    INSERT INTO DB_GD1C2026.agentes (legajo_agente, agencia, codigo_localidad, nombre, apellido, dni, direccion, fecha_nacimiento, telefono, email)
    SELECT DISTINCT
        m.Agente_Legajo              AS legajo_agente,
        m.Agencia_Nro_Agencia        AS agencia,
        l.codigo_localidad,
        m.Agente_Nombre              AS nombre,
        m.Agente_Apellido            AS apellido,
        m.Agente_Dni                 AS dni,
        m.Agente_Direccion           AS direccion,
        CAST(m.Agente_Fecha_Nac AS DATE) AS fecha_nacimiento,
        m.Agente_Telefono            AS telefono,
        m.Agente_Mail                AS email
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.localidades l ON l.nombre = m.Agente_Localidad
    WHERE m.Agente_Legajo IS NOT NULL;
END;
GO

/* ---- clientes ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_clientes AS
BEGIN
    INSERT INTO DB_GD1C2026.clientes (codigo_cliente, codigo_localidad, nombre, apellido, dni, telefono, email, direccion, fecha_nacimiento)
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY m.Cliente_Dni) AS codigo_cliente,
        l.codigo_localidad,
        m.Cliente_Nombre             AS nombre,
        m.Cliente_Apellido           AS apellido,
        m.Cliente_Dni                AS dni,
        m.Cliente_Tel                AS telefono,
        m.Cliente_Mail               AS email,
        m.Cliente_Direccion          AS direccion,
        CAST(m.Cliente_Fecha_Nac AS DATE) AS fecha_nacimiento
    FROM (
        SELECT DISTINCT Cliente_Nombre, Cliente_Apellido, Cliente_Dni, Cliente_Tel, Cliente_Mail,
                        Cliente_Direccion, Cliente_Fecha_Nac, Cliente_Localidad, Cliente_Provincia
        FROM gd_esquema.Maestra
        WHERE Cliente_Dni IS NOT NULL
    ) m
    JOIN DB_GD1C2026.localidades l ON l.nombre = m.Cliente_Localidad;
END;
GO

/* ---- alianzas ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_alianzas AS
BEGIN
    INSERT INTO DB_GD1C2026.alianzas (nombre_alianza)
    SELECT DISTINCT Aerolinea_Alianza
    FROM gd_esquema.Maestra
    WHERE Aerolinea_Alianza IS NOT NULL;
END;
GO

/* ---- aerolineas ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_aerolineas AS
BEGIN
    INSERT INTO DB_GD1C2026.aerolineas (codigo_aerolinea, codigo_pais, nombre, alianza)
    SELECT DISTINCT
        m.Aerolinea_Codigo   AS codigo_aerolinea,
        p.codigo_pais,
        m.Aerolinea_Nombre   AS nombre,
        m.Aerolinea_Alianza  AS alianza
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.paises p ON p.nombre = m.Aerolinea_Pais
    WHERE m.Aerolinea_Codigo IS NOT NULL;
END;
GO

/* ---- aeropuertos ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_aeropuertos AS
BEGIN
    INSERT INTO DB_GD1C2026.aeropuertos (codigo_aeropuerto, codigo_ciudad, descripcion)
    SELECT DISTINCT
        src.codigo,
        c.codigo_ciudad,
        src.descripcion
    FROM (
        SELECT DISTINCT
            Aeropuerto_Salida_Codigo      AS codigo,
            Aeropuerto_Salida_Descripcion AS descripcion,
            Aeropuerto_Salida_Ciudad      AS ciudad
        FROM gd_esquema.Maestra
        WHERE Aeropuerto_Salida_Codigo IS NOT NULL
        UNION
        SELECT DISTINCT
            Aeropuerto_Llegada_Codigo,
            Aeropuerto_Llegada_Descripcion,
            Aeropuerto_Llegada_Ciudad
        FROM gd_esquema.Maestra
        WHERE Aeropuerto_Llegada_Codigo IS NOT NULL
    ) src
    JOIN DB_GD1C2026.ciudades c ON c.nombre = src.ciudad;
END;
GO

/* ---- vuelos_disponibles ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_vuelos_disponibles AS
BEGIN
    INSERT INTO DB_GD1C2026.vuelos_disponibles (
        codigo_vuelos_disponibles, codigo_aerolinea,
        fecha_salida, fecha_llegada, horario_salida, horario_llegada,
        duracion, incluye_carry, incluye_valija, precio_unitario
    )
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY m.Vuelo_Fecha_Salida, m.Aerolinea_Codigo) AS codigo_vuelos_disponibles,
        m.Aerolinea_Codigo          AS codigo_aerolinea,
        CAST(m.Vuelo_Fecha_Salida   AS DATE) AS fecha_salida,
        CAST(m.Vuelo_Fecha_Llegada  AS DATE) AS fecha_llegada,
        m.Vuelo_Horario_Salida      AS horario_salida,
        m.Vuelo_Horario_Llegada     AS horario_llegada,
        m.Vuelo_Duracion            AS duracion,
        m.Vuelo_Incluye_Carry       AS incluye_carry,
        m.Vuelo_Incluye_Valija      AS incluye_valija,
        m.Vuelo_Precio              AS precio_unitario
    FROM gd_esquema.Maestra m
    WHERE m.Aerolinea_Codigo IS NOT NULL AND m.Vuelo_Fecha_Salida IS NOT NULL;
END;
GO

/* ---- aeropuertos_por_vuelos_disponibles ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_aeropuertos_por_vuelos AS
BEGIN
    INSERT INTO DB_GD1C2026.aeropuertos_por_vuelos_disponibles (
        aeropuertos_id,
        codigo_aeropuerto_salida,
        codigo_aeropuerto_llegada
    )
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY m.Aeropuerto_Salida_Codigo, m.Aeropuerto_Llegada_Codigo) AS aeropuertos_id,
        m.Aeropuerto_Salida_Codigo  AS codigo_aeropuerto_salida,
        m.Aeropuerto_Llegada_Codigo AS codigo_aeropuerto_llegada
    FROM gd_esquema.Maestra m
    WHERE m.Aeropuerto_Salida_Codigo IS NOT NULL AND m.Aeropuerto_Llegada_Codigo IS NOT NULL;
END;
GO

/* ---- proveedores ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_proveedores AS
BEGIN
    INSERT INTO DB_GD1C2026.proveedores (numero_proveedor, nombre, email, telefono)
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY m.Proveedor_Nombre) AS numero_proveedor,
        m.Proveedor_Nombre   AS nombre,
        m.Proveedor_Mail     AS email,
        m.Proveedor_Telefono AS telefono
    FROM gd_esquema.Maestra m
    WHERE m.Proveedor_Nombre IS NOT NULL;
END;
GO

/* ---- hospedajes_disponibles ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_hospedajes_disponibles AS
BEGIN
    INSERT INTO DB_GD1C2026.hospedajes_disponibles (
        codigo_hospedaje, codigo_ciudad, codigo_pais,
        nombre, direccion, incluye_desayuno,
        horario_check_in, horario_check_out
    )
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY m.Hospedaje_Nombre, m.Hospedaje_Ciudad) AS codigo_hospedaje,
        c.codigo_ciudad,
        p.codigo_pais,
        m.Hospedaje_Nombre          AS nombre,
        m.Hospedaje_Direccion       AS direccion,
        m.Hospedaje_Incluye_Desayuno AS incluye_desayuno,
        m.Hospedaje_Check_In        AS horario_check_in,
        m.Hospedaje_Check_Out       AS horario_check_out
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.ciudades c ON c.nombre = m.Hospedaje_Ciudad
    JOIN DB_GD1C2026.paises   p ON p.nombre = m.Hospedaje_Pais
    WHERE m.Hospedaje_Nombre IS NOT NULL;
END;
GO

/* ---- habitaciones_disponibles ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_habitaciones_disponibles AS
BEGIN
    INSERT INTO DB_GD1C2026.habitaciones_disponibles (numero_habitacion, codigo_hospedaje, precio_noche, descripcion)
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY m.Habitacion_Nombre, m.Hospedaje_Nombre) AS numero_habitacion,
        hd.codigo_hospedaje,
        m.Habitacion_Precio_Noche   AS precio_noche,
        m.Habitacion_Descripcion    AS descripcion
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.hospedajes_disponibles hd ON hd.nombre = m.Hospedaje_Nombre
    WHERE m.Habitacion_Nombre IS NOT NULL;
END;
GO

/* ---- excursiones_disponibles ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_excursiones_disponibles AS
BEGIN
    INSERT INTO DB_GD1C2026.excursiones_disponibles (
        codigo_excursion_disponibles, codigo_proveedor,
        nombre, precio_unitario, duracion, descripcion
    )
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY m.Excursion_Nombre) AS codigo_excursion_disponibles,
        pr.numero_proveedor,
        m.Excursion_Nombre       AS nombre,
        m.Excursion_Precio       AS precio_unitario,
        m.Excursion_Duracion     AS duracion,
        m.Excursion_Descripcion  AS descripcion
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.proveedores pr ON pr.nombre = m.Proveedor_Nombre
    WHERE m.Excursion_Nombre IS NOT NULL;
END;
GO

/* ---- aspectos ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_aspectos AS
BEGIN
    INSERT INTO DB_GD1C2026.aspectos (codigo_aspecto, descripcion)
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY m.Aspecto_Aspecto) AS codigo_aspecto,
        m.Aspecto_Aspecto AS descripcion
    FROM gd_esquema.Maestra m
    WHERE m.Aspecto_Aspecto IS NOT NULL;
END;
GO

/* ---- encuestas ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_encuestas AS
BEGIN
    INSERT INTO DB_GD1C2026.encuestas (codigo_encuesta, fecha_realizado, comentario_abierto)
    SELECT DISTINCT
        m.Encuesta_Codigo_Encuesta   AS codigo_encuesta,
        CAST(m.Encuesta_Fecha_Encuesta AS DATE) AS fecha_realizado,
        m.Encuesta_Comentarios       AS comentario_abierto
    FROM gd_esquema.Maestra m
    WHERE m.Encuesta_Codigo_Encuesta IS NOT NULL;
END;
GO

/* ---- valoraciones ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_valoraciones AS
BEGIN
    INSERT INTO DB_GD1C2026.valoraciones (codigo_valoracion, codigo_encuesta, codigo_aspecto, puntaje)
    SELECT
        ROW_NUMBER() OVER (ORDER BY m.Encuesta_Codigo_Encuesta, a.codigo_aspecto) AS codigo_valoracion,
        m.Encuesta_Codigo_Encuesta  AS codigo_encuesta,
        a.codigo_aspecto,
        m.Detalle_Encuesta_Puntaje  AS puntaje
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.aspectos a ON a.descripcion = m.Aspecto_Aspecto
    WHERE m.Encuesta_Codigo_Encuesta IS NOT NULL
      AND m.Aspecto_Aspecto          IS NOT NULL
      AND m.Detalle_Encuesta_Puntaje IS NOT NULL;
END;
GO

/* ---- canales de venta ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_canales_venta AS
BEGIN
    INSERT INTO DB_GD1C2026.canal_venta (nombre)
    SELECT DISTINCT m.Venta_Canal_Venta
    FROM gd_esquema.Maestra m
    WHERE m.Venta_Canal_Venta IS NOT NULL;
END;
GO

/* ---- medios de pago ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_medios_pago AS
BEGIN
    INSERT INTO DB_GD1C2026.medio_pago (nombre)
    SELECT DISTINCT m.Venta_Medio_Pago
    FROM gd_esquema.Maestra m
    WHERE m.Venta_Medio_Pago IS NOT NULL;
END;
GO

/* ---- estado_propuesta ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_estado_propuesta AS
BEGIN
    INSERT INTO DB_GD1C2026.estado_propuesta (estado)
    SELECT DISTINCT m.Propuesta_Estado
    FROM gd_esquema.Maestra m
    WHERE m.Propuesta_Estado IS NOT NULL;
END;
GO

/* ---- solicitudes_cotizacion ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_solicitudes_cotizacion AS
BEGIN
    INSERT INTO DB_GD1C2026.solicitudes_cotizacion (
        numero_solicitud, codigo_cliente, codigo_agente, codigo_encuesta,
        fecha_realizada, fecha_inicio_tentativa, fecha_fin_tentativa,
        cantidad_pasajeros, presupuesto_estimado, observaciones
    )
    SELECT DISTINCT
        m.Solicitud_Nro_Solicitud                   AS numero_solicitud,
        cl.codigo_cliente,
        m.Agente_Legajo                             AS codigo_agente,
        m.Encuesta_Codigo_Encuesta                  AS codigo_encuesta,
        CAST(m.Solicitud_Fecha_Solicitud AS DATE)    AS fecha_realizada,
        CAST(m.Solicitud_Fecha_Inicio_Tentativa AS DATE) AS fecha_inicio_tentativa,
        CAST(m.Solicitud_Fecha_Fin_Tentativa    AS DATE) AS fecha_fin_tentativa,
        m.Solicitud_Cant_Pax                        AS cantidad_pasajeros,
        m.Solicitud_Presupuesto_Estimado            AS presupuesto_estimado,
        m.Solicitud_Observaciones                   AS observaciones
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.clientes cl ON cl.dni = m.Cliente_Dni
    WHERE m.Solicitud_Nro_Solicitud IS NOT NULL;
END;
GO

/* ---- detalle_solicitud_ciudades ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_detalle_solicitud_ciudades AS
BEGIN
    INSERT INTO DB_GD1C2026.detalle_solicitud_ciudades (
        codigo_detalle, numero_solicitud, codigo_ciudad, cantidad_dias
    )
    SELECT
        ROW_NUMBER() OVER (ORDER BY m.Solicitud_Nro_Solicitud, c.codigo_ciudad) AS codigo_detalle,
        m.Solicitud_Nro_Solicitud   AS numero_solicitud,
        c.codigo_ciudad,
        m.Detalle_Solicitud_Cant_Dias_Aprox AS cantidad_dias
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.ciudades c ON c.nombre = m.Detalle_Solicitud_Ciudad
    WHERE m.Solicitud_Nro_Solicitud IS NOT NULL
      AND m.Detalle_Solicitud_Ciudad IS NOT NULL;
END;
GO

/* ---- propuestas ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_propuestas AS
BEGIN
    INSERT INTO DB_GD1C2026.propuestas (
        codigo_propuesta, codigo_cliente, codigo_solicitud_cotizacion,
        codigo_agente, estado_propuesta,
        fecha_emision, vigencia_hasta, fecha_desde, fecha_hasta,
        subtotal, descuento, importe_total
    )
    SELECT DISTINCT
        m.Propuesta_Nro_Propuesta               AS codigo_propuesta,
        cl.codigo_cliente,
        m.Solicitud_Nro_Solicitud               AS codigo_solicitud_cotizacion,
        m.Agente_Legajo                         AS codigo_agente,
        m.Propuesta_Estado                      AS estado_propuesta,
        CAST(m.Propuesta_Fecha_Emision AS DATE)  AS fecha_emision,
        CAST(m.Propuesta_Vigencia_Hasta AS DATE) AS vigencia_hasta,
        CAST(m.Propuesta_Fecha_Desde    AS DATE) AS fecha_desde,
        CAST(m.Propuesta_Fecha_Hasta    AS DATE) AS fecha_hasta,
        m.Propuesta_Subtotal                    AS subtotal,
        m.Propuesta_Descuento                   AS descuento,
        m.Propuesta_Importe_Total               AS importe_total
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.clientes cl ON cl.dni = m.Cliente_Dni
    WHERE m.Propuesta_Nro_Propuesta IS NOT NULL;
END;
GO

/* ---- propuestas_vuelo ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_propuestas_vuelo AS
BEGIN
    INSERT INTO DB_GD1C2026.propuestas_vuelo (
        codigo_propuesta_vuelo, codigo_propuesta, codigo_cliente,
        codigo_vuelo_disponible, cantidad_pasajes, subtotal
    )
    SELECT
        ROW_NUMBER() OVER (ORDER BY m.Propuesta_Nro_Propuesta, vd.codigo_vuelos_disponibles) AS codigo_propuesta_vuelo,
        m.Propuesta_Nro_Propuesta       AS codigo_propuesta,
        cl.codigo_cliente,
        vd.codigo_vuelos_disponibles,
        m.Detalle_Propuesta_Vuelo_Cant_Pasajes  AS cantidad_pasajes,
        m.Detalle_Propuesta_Vuelo_Subtotal      AS subtotal
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.clientes cl ON cl.dni = m.Cliente_Dni
    JOIN DB_GD1C2026.vuelos_disponibles vd
        ON vd.codigo_aerolinea = m.Aerolinea_Codigo
        AND vd.fecha_salida    = CAST(m.Vuelo_Fecha_Salida AS DATE)
        AND vd.precio_unitario = m.Vuelo_Precio
    WHERE m.Propuesta_Nro_Propuesta IS NOT NULL
      AND m.Detalle_Propuesta_Vuelo_Cant_Pasajes IS NOT NULL;
END;
GO

/* ---- propuestas_habitacion ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_propuestas_habitacion AS
BEGIN
    INSERT INTO DB_GD1C2026.propuestas_habitacion (
        codigo_propuesta_habitacion, codigo_habitacion_disponible, cantidad
    )
    SELECT
        ROW_NUMBER() OVER (ORDER BY m.Propuesta_Nro_Propuesta, hab.numero_habitacion) AS codigo_propuesta_habitacion,
        hab.numero_habitacion   AS codigo_habitacion_disponible,
        m.Detalle_Propuesta_Hospedaje_Cant AS cantidad
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.hospedajes_disponibles hd ON hd.nombre = m.Hospedaje_Nombre
    JOIN DB_GD1C2026.habitaciones_disponibles hab ON hab.codigo_hospedaje = hd.codigo_hospedaje
    WHERE m.Propuesta_Nro_Propuesta IS NOT NULL
      AND m.Detalle_Propuesta_Hospedaje_Cant IS NOT NULL;
END;
GO

/* ---- propuestas_hospedaje ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_propuestas_hospedaje AS
BEGIN
    INSERT INTO DB_GD1C2026.propuestas_hospedaje (
        codigo_propuesta_hospedaje, codigo_propuesta, codigo_cliente,
        codigo_hospedaje_disponible, codigo_propuesta_habitacion,
        fecha_desde, fecha_hasta, cantidad_dias, subtotal
    )
    SELECT
        ROW_NUMBER() OVER (ORDER BY m.Propuesta_Nro_Propuesta, hd.codigo_hospedaje) AS codigo_propuesta_hospedaje,
        m.Propuesta_Nro_Propuesta   AS codigo_propuesta,
        cl.codigo_cliente,
        hd.codigo_hospedaje         AS codigo_hospedaje_disponible,
        ph.codigo_propuesta_habitacion,
        CAST(m.Detalle_Propuesta_Hospedaje_Fecha_Desde AS DATE) AS fecha_desde,
        CAST(m.Detalle_Propuesta_Hospedaje_Fecha_Hasta AS DATE) AS fecha_hasta,
        DATEDIFF(DAY,
            CAST(m.Detalle_Propuesta_Hospedaje_Fecha_Desde AS DATE),
            CAST(m.Detalle_Propuesta_Hospedaje_Fecha_Hasta AS DATE)) AS cantidad_dias,
        m.Detalle_Propuesta_Hospedaje_Subtotal AS subtotal
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.clientes cl ON cl.dni = m.Cliente_Dni
    JOIN DB_GD1C2026.hospedajes_disponibles hd ON hd.nombre = m.Hospedaje_Nombre
    JOIN DB_GD1C2026.habitaciones_disponibles hab ON hab.codigo_hospedaje = hd.codigo_hospedaje
    JOIN DB_GD1C2026.propuestas_habitacion ph ON ph.codigo_habitacion_disponible = hab.numero_habitacion
    WHERE m.Propuesta_Nro_Propuesta IS NOT NULL
      AND m.Detalle_Propuesta_Hospedaje_Fecha_Desde IS NOT NULL;
END;
GO

/* ---- ventas ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_ventas AS
BEGIN
    INSERT INTO DB_GD1C2026.ventas (
        numero_venta, numero_agencia, codigo_cliente, legajo_agente,
        codigo_encuesta, codigo_propuesta, codigo_cliente_prop,
        canal_venta, medio_pago,
        fecha_venta, subtotal, descuento, importe_total
    )
    SELECT DISTINCT
        m.Venta_Nro_Venta            AS numero_venta,
        m.Agencia_Nro_Agencia        AS numero_agencia,
        cl.codigo_cliente,
        m.Agente_Legajo              AS legajo_agente,
        m.Encuesta_Codigo_Encuesta   AS codigo_encuesta,
        m.Propuesta_Nro_Propuesta    AS codigo_propuesta,
        cl.codigo_cliente            AS codigo_cliente_prop,
        m.Venta_Canal_Venta          AS canal_venta,
        m.Venta_Medio_Pago           AS medio_pago,
        CAST(m.Venta_Fecha_Venta AS DATE) AS fecha_venta,
        m.Venta_Subtotal             AS subtotal,
        m.Venta_Descuento            AS descuento,
        m.Venta_Importe_Total        AS importe_total
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.clientes cl ON cl.dni = m.Cliente_Dni
    WHERE m.Venta_Nro_Venta IS NOT NULL;
END;
GO

/* ---- vuelos (detalle de venta) ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_vuelos AS
BEGIN
    INSERT INTO DB_GD1C2026.vuelos (
        codigo_vuelo, codigo_vuelo_disponible,
        cantidad_pasajes, precio_unitario, codigo_reserva_operacion, subtotal
    )
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY m.Venta_Nro_Venta, vd.codigo_vuelos_disponibles) AS codigo_vuelo,
        vd.codigo_vuelos_disponibles,
        m.Detalle_Venta_Vuelo_Cantidad_Pasajes  AS cantidad_pasajes,
        m.Detalle_Venta_Vuelo_Precio_Unitario   AS precio_unitario,
        m.Detalle_Venta_Vuelo_Cod_Reserva       AS codigo_reserva_operacion,
        m.Detalle_Venta_Vuelo_Subtotal          AS subtotal
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.vuelos_disponibles vd
        ON vd.codigo_aerolinea = m.Aerolinea_Codigo
        AND vd.fecha_salida    = CAST(m.Vuelo_Fecha_Salida AS DATE)
        AND vd.precio_unitario = m.Vuelo_Precio
    WHERE m.Venta_Nro_Venta IS NOT NULL
      AND m.Detalle_Venta_Vuelo_Cantidad_Pasajes IS NOT NULL;
END;
GO

/* ---- vuelos_por_venta ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_vuelos_por_venta AS
BEGIN
    INSERT INTO DB_GD1C2026.vuelos_por_venta (codigo_vuelo, codigo_venta)
    SELECT DISTINCT
        v.codigo_vuelo,
        m.Venta_Nro_Venta AS codigo_venta
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.vuelos_disponibles vd
        ON vd.codigo_aerolinea = m.Aerolinea_Codigo
        AND vd.fecha_salida    = CAST(m.Vuelo_Fecha_Salida AS DATE)
        AND vd.precio_unitario = m.Vuelo_Precio
    JOIN DB_GD1C2026.vuelos v ON v.codigo_vuelo_disponible = vd.codigo_vuelos_disponibles
        AND v.codigo_reserva_operacion = m.Detalle_Venta_Vuelo_Cod_Reserva
    WHERE m.Venta_Nro_Venta IS NOT NULL
      AND m.Detalle_Venta_Vuelo_Cantidad_Pasajes IS NOT NULL;
END;
GO

/* ---- hospedajes (detalle de venta) ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_hospedajes AS
BEGIN
    INSERT INTO DB_GD1C2026.hospedajes (
        codigo_hospedaje, codigo_hospedaje_disponible,
        fecha_desde, fecha_hasta, cantidad,
        precio_unitario, codigo_reserva, subtotal
    )
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY m.Venta_Nro_Venta, hd.codigo_hospedaje) AS codigo_hospedaje,
        hd.codigo_hospedaje          AS codigo_hospedaje_disponible,
        CAST(m.Detalle_Venta_Hospedaje_Fecha_Desde AS DATE) AS fecha_desde,
        CAST(m.Detalle_Venta_Hospedaje_Fecha_Hasta AS DATE) AS fecha_hasta,
        m.Detalle_Venta_Hospedaje_Cantidad          AS cantidad,
        m.Detalle_Venta_Hospedaje_Precio_Unitario   AS precio_unitario,
        m.Detalle_Venta_Hospedaje_Cod_Reserva       AS codigo_reserva,
        m.Detalle_Venta_Hospedaje_Subtotal          AS subtotal
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.hospedajes_disponibles hd ON hd.nombre = m.Hospedaje_Nombre
    WHERE m.Venta_Nro_Venta IS NOT NULL
      AND m.Detalle_Venta_Hospedaje_Cantidad IS NOT NULL;
END;
GO

/* ---- hospedajes_por_venta ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_hospedajes_por_venta AS
BEGIN
    INSERT INTO DB_GD1C2026.hospedajes_por_venta (codigo_venta, codigo_hospedaje)
    SELECT DISTINCT
        m.Venta_Nro_Venta   AS codigo_venta,
        h.codigo_hospedaje
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.hospedajes_disponibles hd ON hd.nombre = m.Hospedaje_Nombre
    JOIN DB_GD1C2026.hospedajes h
        ON h.codigo_hospedaje_disponible = hd.codigo_hospedaje
        AND h.codigo_reserva = m.Detalle_Venta_Hospedaje_Cod_Reserva
    WHERE m.Venta_Nro_Venta IS NOT NULL
      AND m.Detalle_Venta_Hospedaje_Cantidad IS NOT NULL;
END;
GO

/* ---- excursiones (detalle de venta) ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_excursiones AS
BEGIN
    INSERT INTO DB_GD1C2026.excursiones (
        codigo_excursion, codigo_excursion_disponibles,
        fecha_reserva, cantidad, codigo_reserva, subtotal
    )
    SELECT DISTINCT
        ROW_NUMBER() OVER (ORDER BY m.Venta_Nro_Venta, ed.codigo_excursion_disponibles) AS codigo_excursion,
        ed.codigo_excursion_disponibles,
        m.Detalle_Venta_Excursion_Fecha_Reserva AS fecha_reserva,
        m.Detalle_Venta_Excursion_Cant           AS cantidad,
        m.Detalle_Venta_Excursion_Cod_Reserva    AS codigo_reserva,
        m.Detalle_Venta_Excursion_Subtotal       AS subtotal
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.excursiones_disponibles ed ON ed.nombre = m.Excursion_Nombre
    WHERE m.Venta_Nro_Venta IS NOT NULL
      AND m.Detalle_Venta_Excursion_Cant IS NOT NULL;
END;
GO

/* ---- excursiones_por_venta ---- */
CREATE PROCEDURE DB_GD1C2026.migrar_excursiones_por_venta AS
BEGIN
    INSERT INTO DB_GD1C2026.excursiones_por_venta (codigo_venta, codigo_excursion)
    SELECT DISTINCT
        m.Venta_Nro_Venta    AS codigo_venta,
        e.codigo_excursion
    FROM gd_esquema.Maestra m
    JOIN DB_GD1C2026.excursiones_disponibles ed ON ed.nombre = m.Excursion_Nombre
    JOIN DB_GD1C2026.excursiones e
        ON e.codigo_excursion_disponibles = ed.codigo_excursion_disponibles
        AND e.codigo_reserva = m.Detalle_Venta_Excursion_Cod_Reserva
    WHERE m.Venta_Nro_Venta IS NOT NULL
      AND m.Detalle_Venta_Excursion_Cant IS NOT NULL;
END;
GO

/* =========================================================
= = = = = = = = = = = EJECUCIÓN DE MIGRACIÓN = = = = = = = =
========================================================= */

BEGIN TRANSACTION

    EXECUTE DB_GD1C2026.migrar_paises;
    EXECUTE DB_GD1C2026.migrar_provincias;
    EXECUTE DB_GD1C2026.migrar_localidades;
    EXECUTE DB_GD1C2026.migrar_ciudades;
    EXECUTE DB_GD1C2026.migrar_alianzas;
    EXECUTE DB_GD1C2026.migrar_aerolineas;
    EXECUTE DB_GD1C2026.migrar_aeropuertos;
    EXECUTE DB_GD1C2026.migrar_vuelos_disponibles;
    EXECUTE DB_GD1C2026.migrar_aeropuertos_por_vuelos;
    EXECUTE DB_GD1C2026.migrar_proveedores;
    EXECUTE DB_GD1C2026.migrar_hospedajes_disponibles;
    EXECUTE DB_GD1C2026.migrar_habitaciones_disponibles;
    EXECUTE DB_GD1C2026.migrar_excursiones_disponibles;
    EXECUTE DB_GD1C2026.migrar_aspectos;
    EXECUTE DB_GD1C2026.migrar_encuestas;
    EXECUTE DB_GD1C2026.migrar_valoraciones;
    EXECUTE DB_GD1C2026.migrar_canales_venta;
    EXECUTE DB_GD1C2026.migrar_medios_pago;
    EXECUTE DB_GD1C2026.migrar_estado_propuesta;
    EXECUTE DB_GD1C2026.migrar_agencias;
    EXECUTE DB_GD1C2026.migrar_agentes;
    EXECUTE DB_GD1C2026.migrar_clientes;
    EXECUTE DB_GD1C2026.migrar_solicitudes_cotizacion;
    EXECUTE DB_GD1C2026.migrar_detalle_solicitud_ciudades;
    EXECUTE DB_GD1C2026.migrar_propuestas;
    EXECUTE DB_GD1C2026.migrar_propuestas_vuelo;
    EXECUTE DB_GD1C2026.migrar_propuestas_habitacion;
    EXECUTE DB_GD1C2026.migrar_propuestas_hospedaje;
    EXECUTE DB_GD1C2026.migrar_ventas;
    EXECUTE DB_GD1C2026.migrar_vuelos;
    EXECUTE DB_GD1C2026.migrar_vuelos_por_venta;
    EXECUTE DB_GD1C2026.migrar_hospedajes;
    EXECUTE DB_GD1C2026.migrar_hospedajes_por_venta;
    EXECUTE DB_GD1C2026.migrar_excursiones;
    EXECUTE DB_GD1C2026.migrar_excursiones_por_venta;

COMMIT TRANSACTION;
