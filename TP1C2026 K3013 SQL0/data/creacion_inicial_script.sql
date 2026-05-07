-- ENTIDADES

CREATE TABLE provincias(
	codigo_provincia INT IDENTITY(1,1) PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL 
);

INSERT INTO provincias (nombre)
SELECT DISTINCT UPPER(nombre)
FROM (
	SELECT Agencia_Provincia AS nombre FROM gd_esquema.Maestra
	UNION 
	SELECT Agente_Provincia FROM gd_esquema.Maestra
	UNION
	SELECT Cliente_Provincia FROM gd_esquema.Maestra
) t
WHERE nombre IS NOT NULL;

SELECT * FROM provincias;

CREATE TABLE localidades(
	codigo_localidad INT IDENTITY(1,1) PRIMARY KEY,
	codigo_provincia INT,
	nombre VARCHAR(100) NOT NULL
		FOREIGN KEY (codigo_provincia) REFERENCES provincias (codigo_provincia)
);

SELECT l.codigo_localidad, l.nombre AS localidad_nombre, p.nombre AS provincia_nombre FROM localidades l
INNER JOIN provincias p ON p.codigo_provincia = l.codigo_provincia;

DROP TABLE localidades;
DROP TABLE provincias;


/*
CREATE TABLE paises(
	codigo_pais INT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL
);

CREATE TABLE ciudades(
	codigo_ciudad VARCHAR(5) PRIMARY KEY,
	codigo_pais INT,
	nombre VARCHAR(25) NOT NULL 
		FOREIGN KEY (codigo_pais) REFERENCES paises (codigo_pais)
);

-- AGENTES Y CLIENTES

CREATE TABLE agencias(
	numero_agencia INT PRIMARY KEY,
	codigo_localidad INT,
	direccion VARCHAR(30) NOT NULL,
	telefono NUMERIC(10,0) NOT NULL CHECK (telefono > 0),
	email VARCHAR(50) NOT NULL
		FOREIGN KEY (codigo_localidad) REFERENCES localidades (codigo_localidad)
);

CREATE TABLE agentes(
	legajo_agente INT PRIMARY KEY,
	codigo_agencia INT,
	codigo_localidad INT,
	codigo_provincia INT,
	nombre VARCHAR(40) NOT NULL,
	apellido VARCHAR(40) NOT NULL,
	dni NUMERIC(8,0) NOT NULL CHECK (dni > 0),
	direccion VARCHAR(50) NOT NULL,
	fecha_nacimiento DATETIME NOT NULL,
	telefono NUMERIC(10,0) NOT NULL CHECK (telefono > 0),
	email VARCHAR(50) NOT NULL
		FOREIGN KEY (codigo_agencia) REFERENCES agencias (numero_agencia),
		FOREIGN KEY (codigo_localidad) REFERENCES localidades (codigo_localidad),
		FOREIGN KEY (codigo_provincia) REFERENCES provincias (codigo_provincia)
);

CREATE TABLE clientes(
	codigo_cliente INT PRIMARY KEY,
	codigo_provincia INT,
	codigo_localidad INT,
	nombre VARCHAR(40),
	apellido VARCHAR(40),
	dni NUMERIC(8,0) NOT NULL CHECK (dni > 0),
	direccion VARCHAR(50) NOT NULL,
	telefono NUMERIC(10,0) NOT NULL CHECK (telefono > 0),
	email VARCHAR(50) NOT NULL,
	fecha_nacimiento DATETIME NOT NULL
		FOREIGN KEY (codigo_localidad) REFERENCES localidades (codigo_localidad),
		FOREIGN KEY (codigo_provincia) REFERENCES provincias (codigo_provincia)
);


-- ENCUESTAS

CREATE TABLE encuestas(
	codigo_encuesta INT PRIMARY KEY,
	agente_involucrado INT,
	cliente_involucrado INT,
	descripcion TEXT NOT NULL,
	fecha_realizado DATETIME NOT NULL,
	comentario_abierto TEXT
		FOREIGN KEY (agente_involucrado) REFERENCES agentes (legajo_agente),
		FOREIGN KEY (cliente_involucrado) REFERENCES clientes (codigo_cliente)
);

CREATE TABLE aspectos(
	codigo_aspecto INT PRIMARY KEY,
	descripcion TEXT NOT NULL
);

CREATE TABLE valoraciones(
	id_valoracion INT PRIMARY KEY,
	codigo_encuesta INT,
	codigo_aspecto INT,
	puntaje VARCHAR(2) NOT NULL CHECK (puntaje IN (0,1))
		FOREIGN KEY (codigo_encuesta) REFERENCES encuestas (codigo_encuesta),
		FOREIGN KEY (codigo_aspecto) REFERENCES aspectos (codigo_aspecto)
);


-- SOLICITUD

CREATE TABLE solicitudes_cotizacion(
	numero_solicitud INT PRIMARY KEY,
	codigo_cliente INT,
	codigo_agente INT,
	fecha_realizada DATETIME NOT NULL,
	fecha_inicio_tentativa DATETIME NOT NULL,
	fecha_fin_tentativa DATETIME NOT NULL,
	cantidad_pasajeros TINYINT NOT NULL,
	cantidad_dias_aproximados TINYINT NOT NULL,
	presupuesto_estimado FLOAT NOT NULL
		FOREIGN KEY (codigo_cliente) REFERENCES clientes (codigo_cliente),
		FOREIGN KEY (codigo_agente) REFERENCES agentes (legajo_agente)
);


-- PROPUESTAS

CREATE TABLE propuestas(
	codigo_propuesta INT PRIMARY KEY,
	codigo_agente INT,
	codigo_cliente INT,
	fecha_emision DATETIME NOT NULL,
	vigencia_hasta DATETIME NOT NULL,
	fecha_desde DATETIME NOT NULL,
	fecha_hasta DATETIME NOT NULL,
	subtotal FLOAT NOT NULL CHECK (subtotal > 0),
	descuento FLOAT NOT NULL CHECK (descuento > 0),
	importe_total FLOAT NOT NULL CHECK (importe_total > 0),
	estado BIT NOT NULL CHECK (estado IN (0,1)) DEFAULT 0
		FOREIGN KEY (codigo_agente) REFERENCES agentes (legajo_agente),
		FOREIGN KEY (codigo_cliente) REFERENCES clientes (codigo_cliente)
);


CREATE TABLE propuestas_vuelo(
	codigo_propuesta_vuelo INT PRIMARY KEY,
	cantidad_pasajes TINYINT NOT NULL CHECK (cantidad_pasajes > 0),
	precio_unitario FLOAT NOT NULL CHECK (precio_unitario > 0),
	subtotal FLOAT NOT NULL CHECK (subtotal > 0)
);

CREATE TABLE propuestas_hospedaje(
	codigo_propuesta_hospedaje INT PRIMARY KEY,
	cantidad TINYINT NOT NULL CHECK (cantidad > 0),
	precio FLOAT NOT NULL CHECK (precio > 0),
	subtotal FLOAT NOT NULL CHECK (subtotal > 0),
	fecha_desde DATETIME NOT NULL,
	fecha_hasta DATETIME NOT NULL
);

CREATE TABLE detalle_propuestas(
	codigo_detalle INT PRIMARY KEY,
	codigo_propuesta INT,
	codigo_propuesta_vuelo INT NULL,
	codigo_propuesta_hospedaje INT NULL
		FOREIGN KEY (codigo_propuesta) REFERENCES propuestas (codigo_propuesta),
		FOREIGN KEY (codigo_propuesta_vuelo) REFERENCES propuestas_vuelo (codigo_propuesta_vuelo),
		FOREIGN KEY (codigo_propuesta_hospedaje) REFERENCES propuestas_hospedaje (codigo_propuesta_hospedaje)
);


-- ACTIVIDADES

CREATE TABLE aeropuertos(
	codigo_aeropuerto VARCHAR(5) PRIMARY KEY,
	codigo_ciudad VARCHAR(5),
	codigo_pais INT,
	descripcion TEXT NOT NULL
		FOREIGN KEY (codigo_ciudad) REFERENCES ciudades (codigo_ciudad),
		FOREIGN KEY (codigo_pais) REFERENCES paises (codigo_pais)
);

CREATE TABLE aerolineas(
	codigo_aerolinea VARCHAR(4) PRIMARY KEY,
	codigo_pais INT,
	nombre VARCHAR(30) NOT NULL,
	alianza VARCHAR(20) NOT NULL
		FOREIGN KEY (codigo_pais) REFERENCES paises (codigo_pais)
);

CREATE TABLE vuelos_disponibles(
	codigo_vuelos_disponibles INT PRIMARY KEY,
	codigo_aeropuerto VARCHAR(5),
	codigo_aerolinea VARCHAR(4),
	fecha_salida DATETIME NOT NULL,
	hora_llegada DATETIME NOT NULL, 
	hora_salida DATETIME NOT NULL,
	duracion FLOAT NOT NULL CHECK (duracion > 0),
	precio_unitario FLOAT NOT NULL CHECK (precio_unitario > 0),
	incluye_carry BIT CHECK (incluye_carry IN (0,1)),
	incluye_valija BIT CHECK (incluye_valija IN (0,1)),
	codigo_vuelo VARCHAR(10)
		FOREIGN KEY (codigo_aeropuerto) REFERENCES aeropuertos (codigo_aeropuerto),
		FOREIGN KEY (codigo_aerolinea) REFERENCES aerolineas (codigo_aerolinea)		
);



CREATE TABLE vuelos(
	codigo_vuelo INT PRIMARY KEY,
	codigo_vuelo_disponible INT,
	cantidad_pasajes TINYINT NOT NULL,
	precio_unitario FLOAT NOT NULL CHECK (precio_unitario > 0),
	subtotal FLOAT NOT NULL CHECK (precio_unitario > 0),
	codigo_reserva VARCHAR(12) NOT NULL
		FOREIGN KEY (codigo_vuelo_disponible) REFERENCES vuelos_disponibles (codigo_vuelos_disponibles)
);

-- EXCURSIONES

CREATE TABLE proveedores(
	numero_proveedor INT PRIMARY KEY,
	nombre VARCHAR(40) NOT NULL,
	telefono INT NOT NULL CHECK (telefono > 0),
	email VARCHAR(50) NOT NULL
);

CREATE TABLE excursiones_disponibles(
	codigo_excursion_disponibles INT PRIMARY KEY,
	codigo_proveedor INT,
	nombre VARCHAR(30) NOT NULL,
	descripcion TEXT NOT NULL,
	horario DATETIME NOT NULL,
	duracion TINYINT NOT NUlL
		FOREIGN KEY (codigo_proveedor) REFERENCES proveedores (numero_proveedor)
);

CREATE TABLE excursiones(
	codigo_excursion INT PRIMARY KEY,
	codigo_excursion_disponibles INT,
	fecha_reserva DATETIME NOT NULL,
	cantidad TINYINT NOT NULL,
	precio_unitario FLOAT NOT NULL CHECK (cantidad > 0),
	subtotal FLOAT NOT NULL CHECK (subtotal > 0),
	codigo_reserva_excursion VARCHAR(10) NOT NULL
		FOREIGN KEY (codigo_excursion_disponibles) REFERENCES excursiones_disponibles (codigo_excursion_disponibles)
);



-- HOSPEDAJES

CREATE TABLE hospedajes_disponibles(
	codigo_hospedaje INT PRIMARY KEY,
	codigo_ciudad VARCHAR(5),
	codigo_pais INT,
	nombre VARCHAR(40) NOT NULL,
	direccion VARCHAR(80) NOT NULL,
	hora_check_in DATETIME NOT NULL,
	hora_check_out DATETIME NOT NULL,
	incluye_desayuno BIT CHECK (incluye_desayuno IN (0,1)),
	descripcion TEXT NOT NULL
		FOREIGN KEY (codigo_ciudad) REFERENCES ciudades (codigo_ciudad),
		FOREIGN KEY (codigo_pais) REFERENCES paises (codigo_pais)
);

CREATE TABLE habitaciones_disponibles(
	numero_habitacion INT PRIMARY KEY,
	codigo_hospedaje INT,
	descripcion TEXT NOT NULL,
	precio_noche FLOAT NOT NULL CHECK (precio_noche > 0)
		FOREIGN KEY (codigo_hospedaje) REFERENCES hospedajes_disponibles (codigo_hospedaje),
);


CREATE TABLE hospedajes(
	codigo_hospedaje INT PRIMARY KEY,
	codigo_hospedaje_disponible INT,
	fecha_desde DATETIME NOT NULL,
	fecha_hasta DATETIME NOT NULL,
	cantidad TINYINT NOT NULL,
	precio_unitario FLOAT NOT NULL CHECK (precio_unitario > 0),
	subtotal FLOAT NOT NULL CHECK (subtotal > 0),
	codigo_reserva_hospedaje VARCHAR(10) NOT NULL
		FOREIGN KEY (codigo_hospedaje_disponible) REFERENCES hospedajes_disponibles (codigo_hospedaje),
);


-- VENTAS

CREATE TABLE ventas(
	numero_venta INT PRIMARY KEY,
	numero_agencia INT,
	legajo_agente INT,
	codigo_cliente INT,
	fecha_venta DATETIME NOT NULL,
	canal_venta VARCHAR(10) NOT NULL
		CHECK (canal_venta IN ('MAIL', 'TELEFONO', 'PRESENCIAL', 'WHATSAPP')),
	medio_pago VARCHAR(10) NOT NULL
		CHECK (canal_venta IN ('EFECTIVO', 'TRANSFERENCIA', 'TARJETA DE DEBITO', 'TARJETA DE CREDITO')),
	subtotal FLOAT NOT NULL CHECK (subtotal > 0),
	descuento FLOAT NOT NULL CHECK (descuento >= 0),
	importe_total FLOAT NOT NULL CHECK (importe_total > 0)
		FOREIGN KEY (numero_agencia) REFERENCES agencias (numero_agencia),
		FOREIGN KEY (legajo_agente) REFERENCES agentes (legajo_agente),
		FOREIGN KEY (codigo_cliente) REFERENCES propuestas_hospedaje (codigo_propuesta_hospedaje)
);

CREATE TABLE detalle_ventas(
	codigo_detalle INT PRIMARY KEY,
	codigo_venta INT,
	codigo_hospedaje INT NULL,
	codigo_excursion INT NULL,
	codigo_vuelo INT NULL,
	codigo_ciudad VARCHAR(5),
	observaciones TEXT NOT NULL,
	cantidad_dias_aproximados TINYINT NOT NULL
		FOREIGN KEY (codigo_venta) REFERENCES ventas (numero_venta),
		FOREIGN KEY (codigo_hospedaje) REFERENCES hospedajes (codigo_hospedaje),
		FOREIGN KEY (codigo_excursion) REFERENCES excursiones (codigo_excursion),
		FOREIGN KEY (codigo_vuelo) REFERENCES vuelos (codigo_vuelo),
		FOREIGN KEY (codigo_ciudad) REFERENCES ciudades (codigo_ciudad) 
);*/