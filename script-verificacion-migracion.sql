-- Cuántos países únicos hay en la Maestra vs cuántos migramos
SELECT 'paises' AS tabla,
    (SELECT COUNT(*) FROM (
        SELECT DISTINCT Aeropuerto_Salida_Pais  AS pais FROM gd_esquema.Maestra WHERE Aeropuerto_Salida_Pais  IS NOT NULL
        UNION
        SELECT DISTINCT Aeropuerto_Llegada_Pais FROM gd_esquema.Maestra WHERE Aeropuerto_Llegada_Pais IS NOT NULL
        UNION
        SELECT DISTINCT Aerolinea_Pais          FROM gd_esquema.Maestra WHERE Aerolinea_Pais          IS NOT NULL
        UNION
        SELECT DISTINCT Hospedaje_Pais          FROM gd_esquema.Maestra WHERE Hospedaje_Pais          IS NOT NULL
    ) x) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.paises) AS migrados;

-- Ventas sin cliente válido
SELECT COUNT(*) FROM SQL0.ventas v
WHERE NOT EXISTS (SELECT 1 FROM SQL0.clientes c WHERE c.codigo_cliente = v.codigo_cliente);

-- Propuestas sin solicitud válida
SELECT COUNT(*) FROM SQL0.propuestas p
WHERE NOT EXISTS (SELECT 1 FROM SQL0.solicitudes_cotizacion sc WHERE sc.numero_solicitud = p.codigo_solicitud_cotizacion);

-- Cuántas ventas hay en la Maestra vs cuántas migramos
SELECT
    (SELECT COUNT(DISTINCT Venta_Nro_Venta) FROM gd_esquema.Maestra WHERE Venta_Nro_Venta IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.ventas) AS migrados,
    (SELECT COUNT(DISTINCT Venta_Nro_Venta) FROM gd_esquema.Maestra WHERE Venta_Nro_Venta IS NOT NULL)
    - (SELECT COUNT(*) FROM SQL0.ventas) AS diferencia;

-- Clientes duplicados por DNI
SELECT dni, COUNT(*) FROM SQL0.clientes GROUP BY dni HAVING COUNT(*) > 1;

-- Propuestas duplicadas
SELECT codigo_propuesta, COUNT(*) FROM SQL0.propuestas GROUP BY codigo_propuesta HAVING COUNT(*) > 1;

SELECT 
    SUM(CASE WHEN codigo_cliente IS NULL THEN 1 ELSE 0 END) AS clientes_null,
    SUM(CASE WHEN legajo_agente  IS NULL THEN 1 ELSE 0 END) AS agentes_null,
    SUM(CASE WHEN fecha_venta    IS NULL THEN 1 ELSE 0 END) AS fechas_null
FROM SQL0.ventas;

-- Solicitudes en maestra vs migradas
SELECT
    (SELECT COUNT(DISTINCT Solicitud_Nro_Solicitud) FROM gd_esquema.Maestra WHERE Solicitud_Nro_Solicitud IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.solicitudes_cotizacion) AS migrados;

-- Propuestas en maestra vs migradas
SELECT
    (SELECT COUNT(DISTINCT Propuesta_Nro_Propuesta) FROM gd_esquema.Maestra WHERE Propuesta_Nro_Propuesta IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.propuestas) AS migrados;

-- Clientes en maestra vs migrados
SELECT
    (SELECT COUNT(DISTINCT Cliente_Dni) FROM gd_esquema.Maestra WHERE Cliente_Dni IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.clientes) AS migrados;

-- Agentes en maestra vs migrados
SELECT
    (SELECT COUNT(DISTINCT Agente_Legajo) FROM gd_esquema.Maestra WHERE Agente_Legajo IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.agentes) AS migrados;

-- Encuestas en maestra vs migradas
SELECT
    (SELECT COUNT(DISTINCT Encuesta_Codigo_Encuesta) FROM gd_esquema.Maestra WHERE Encuesta_Codigo_Encuesta IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.encuestas) AS migrados;

-- Vuelos disponibles
SELECT
    (SELECT COUNT(*) FROM (
        SELECT DISTINCT Aerolinea_Codigo, Aeropuerto_Salida_Codigo, Aeropuerto_Llegada_Codigo,
               Vuelo_Fecha_Salida, Vuelo_Horario_Salida
        FROM gd_esquema.Maestra
        WHERE Aerolinea_Codigo IS NOT NULL AND Vuelo_Fecha_Salida IS NOT NULL
    ) x) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.vuelos_disponibles) AS migrados;

-- Hospedajes disponibles
SELECT
    (SELECT COUNT(DISTINCT Hospedaje_Nombre) FROM gd_esquema.Maestra WHERE Hospedaje_Nombre IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.hospedajes_disponibles) AS migrados;

-- Excursiones disponibles
SELECT
    (SELECT COUNT(DISTINCT Excursion_Nombre) FROM gd_esquema.Maestra WHERE Excursion_Nombre IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.excursiones_disponibles) AS migrados;

-- Agencias
SELECT
    (SELECT COUNT(DISTINCT Agencia_Nro_Agencia) FROM gd_esquema.Maestra WHERE Agencia_Nro_Agencia IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.agencias) AS migrados;

-- Aerolineas
SELECT
    (SELECT COUNT(DISTINCT Aerolinea_Codigo) FROM gd_esquema.Maestra WHERE Aerolinea_Codigo IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.aerolineas) AS migrados;

-- Aeropuertos
SELECT
    (SELECT COUNT(*) FROM (
        SELECT DISTINCT Aeropuerto_Salida_Codigo AS codigo FROM gd_esquema.Maestra WHERE Aeropuerto_Salida_Codigo IS NOT NULL
        UNION
        SELECT DISTINCT Aeropuerto_Llegada_Codigo FROM gd_esquema.Maestra WHERE Aeropuerto_Llegada_Codigo IS NOT NULL
    ) x) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.aeropuertos) AS migrados;

-- Proveedores
SELECT
    (SELECT COUNT(DISTINCT Proveedor_Nombre) FROM gd_esquema.Maestra WHERE Proveedor_Nombre IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.proveedores) AS migrados;

-- Valoraciones
SELECT
    (SELECT COUNT(*) FROM gd_esquema.Maestra 
     WHERE Encuesta_Codigo_Encuesta IS NOT NULL 
       AND Aspecto_Aspecto IS NOT NULL 
       AND Detalle_Encuesta_Puntaje IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.valoraciones) AS migrados;

-- Detalle solicitud ciudades
SELECT
    (SELECT COUNT(*) FROM gd_esquema.Maestra 
     WHERE Solicitud_Nro_Solicitud IS NOT NULL AND Detalle_Solicitud_Ciudad IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.detalle_solicitud_ciudades) AS migrados;

-- Vuelos por venta
SELECT
    (SELECT COUNT(*) FROM gd_esquema.Maestra 
     WHERE Venta_Nro_Venta IS NOT NULL AND Detalle_Venta_Vuelo_Cantidad_Pasajes IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.vuelos_por_venta) AS migrados;

-- Hospedajes por venta
SELECT
    (SELECT COUNT(*) FROM gd_esquema.Maestra 
     WHERE Venta_Nro_Venta IS NOT NULL AND Detalle_Venta_Hospedaje_Cantidad IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.hospedajes_por_venta) AS migrados;

-- Excursiones por venta
SELECT
    (SELECT COUNT(*) FROM gd_esquema.Maestra 
     WHERE Venta_Nro_Venta IS NOT NULL AND Detalle_Venta_Excursion_Cant IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.excursiones_por_venta) AS migrados;

-- Propuestas vuelo
SELECT
    (SELECT COUNT(*) FROM gd_esquema.Maestra 
     WHERE Propuesta_Nro_Propuesta IS NOT NULL 
       AND Detalle_Propuesta_Vuelo_Cant_Pasajes IS NOT NULL) AS en_maestra,
    (SELECT COUNT(*) FROM SQL0.propuestas_vuelo) AS migrados;