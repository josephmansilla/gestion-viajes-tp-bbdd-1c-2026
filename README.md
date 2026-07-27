# 🌍✈️ Gestión de Viajes | Business Intelligence

> **Trabajo Práctico de Gestión de Datos** | 1° Cuatrimestre 2026  
> Grupo: **SQL0** | Universidad Tecnológica Nacional - FRBA

| [Joseph Mansilla](https://github.com/josephmansilla) | [Tobias Calio](https://github.com/caliotobias) | [Martin Morris](https://github.com/martomorri)
|:--:|:--:|:--:|
| <img src="https://avatars.githubusercontent.com/u/162230766?s=400&u=6ac208c05e9fedd414fefc12db5c38efe1c6fcd8&v=4" alt="Joseph Mansilla" width="76" height="76"> | <img src="https://avatars.githubusercontent.com/u/179876635?v=4" alt="Tobias Calio" width="76" height="76"> | <img src="https://avatars.githubusercontent.com/u/106319796?v=4" alt="Martin Morris" width="76" height="76"> | 
---

## 📋 Tabla de Contenidos

- [Descripción General](#-descripción-general)
- [Base de Datos](#-base-de-datos)
- [Modelo de BI](#-modelo-de-inteligencia-de-negocios)
- [Vistas Analíticas](#-vistas-analíticas)
- [Detalles de Implementación](#-detalles-de-implementación)
- [Estructura de Archivos](#-estructura-de-archivos)

---

## 🎯 Descripción General

Este proyecto implementa un sistema integral de **Business Intelligence** para una agencia de viajes que comercializa servicios turísticos.

### 🔄 Fases del Proyecto

| Fase | Descripción |
|------|-------------|
| **1️⃣ Modelo Transaccional** | Migración y normalización de datos desde tabla maestra |
| **2️⃣ Modelo de BI** | Data warehouse con vistas analíticas para dashboards |

### 📊 Servicios Ofrecidos

- ✈️ **Ventas Directas**: Vuelos, hospedajes, excursiones
- 🎁 **Propuestas a Medida**: Paquetes personalizados de viajes
- 📝 **Encuestas de Satisfacción**: Evaluación de experiencia del cliente

---

## 🗄️ Base de Datos

```
🔧 Motor: SQL Server 2022
📦 Base de Datos: GD1C2026
📂 Esquema Transaccional: gd_esquema
📂 Esquema BI: SQL0
📥 Fuente: Tabla maestra (gd_esquema.Maestra)
```

---

## 🏗️ Modelo Transaccional

### 📌 Tablas de Referencia

```sql
├── 👥 clientes          -- Información de clientes
├── 🧑‍💼 agentes           -- Información de agentes
├── 🏢 agencias          -- Información de agencias
└── 📞 canal_venta       -- Canales (mail, teléfono, presencial, whatsapp)
```

### 💼 Tablas de Operaciones

```sql
├── 💰 ventas                    -- Registro de ventas directas
├── 📋 solicitudes_cotizacion    -- Solicitudes de viajes a medida
├── 📄 propuestas                -- Propuestas personalizadas
└── ⭐ encuestas                  -- Encuestas de satisfacción
```

### 🎫 Tablas de Detalle de Productos

```sql
├── ✈️ venta_vuelo              -- Vuelos en cada venta
├── 🏨 venta_hospedaje          -- Hospedajes en cada venta
├── 🎢 venta_excursion          -- Excursiones en cada venta
├── ✈️ propuesta_vuelo          -- Vuelos en cada propuesta
└── 🏨 propuesta_hospedaje      -- Hospedajes en cada propuesta
```

### 📚 Tablas de Catálogo (Precargadas)

```sql
├── ✈️ vuelos              -- Información de vuelos disponibles
├── 🏨 hospedajes          -- Información de hospedajes
├── 🛏️ habitaciones        -- Tipos de habitaciones
├── 🎢 excursiones         -- Información de excursiones
├── 📊 aspectos            -- Aspectos evaluados en encuestas
└── ⭐ valoraciones        -- Puntajes de aspectos
```

---

## 🔬 Modelo de Inteligencia de Negocios

### 📐 Dimensiones

| Dimensión | Descripción | Campos |
|-----------|-------------|--------|
| **⏰ BI_dim_tiempo** | Desglose temporal | año, cuatrimestre, mes, fecha, nombre_mes |
| **👤 BI_dim_cliente** | Clientes con rango etario | id, nombre, apellido, dni, rango_edad |
| **🧑‍💼 BI_dim_agente** | Agentes con rango etario | id, nombre, apellido, dni, rango_edad |
| **📊 BI_dim_rangos_etario** | Rangos etarios | id, descripcion, edad_desde, edad_hasta |
| **🌡️ BI_dim_temporada** | Temporadas de viaje | id, nombre, mes_inicio, mes_fin |
| **🛍️ BI_dim_tipo_servicio** | Tipo de servicio | id, nombre |
| **📞 BI_dim_canal_venta** | Canales de venta | id, nombre |
| **✅ BI_dim_estado_propuesta** | Estados de propuesta | id, estado |
| **📋 BI_dim_aspecto** | Aspectos evaluados | id, descripcion |

### 📊 Tablas de Hechos

```sql
├── 💰 BI_hechos_ventas           -- Hechos de ventas directas
├── 📄 BI_hechos_propuestas       -- Hechos de propuestas emitidas
├── 📋 BI_hechos_cotizaciones     -- Hechos de solicitudes
└── ⭐ BI_hechos_encuestas        -- Hechos de encuestas de satisfacción
```

---

## 📊 Vistas Analíticas

### 1️⃣ Promedio Ticket 🎫

```
Vista: BI_vw_promedio_ticket
Propósito: Valor promedio de venta mensual
Dimensiones: Rango etario cliente × Canal de venta × Mes
Métrica: Promedio importe_total
```

### 2️⃣ Distribución de Facturación 💵

```
Vista: BI_vw_distribucion_facturacion
Propósito: Porcentaje de facturación por tipo de servicio
Dimensiones: Año × Cuatrimestre × Tipo de servicio
Métrica: Porcentaje de ingresos
```

### 3️⃣ Rankings de Solicitudes 📈

```
Vista: BI_vw_rankings_solicitudes
Propósito: Cantidad de solicitudes por temporada
Dimensiones: Temporada × Año × Rango etario cliente
Métrica: Cantidad de solicitudes
```

### 4️⃣ Anticipación Promedio de Solicitudes 📅

```
Vista: BI_vw_promedio_anticipacion_solicitudes
Propósito: Días previos con los que se solicitan viajes
Dimensiones: Cuatrimestre × Rango etario cliente
Métrica: Promedio de días (fecha_solicitud - fecha_inicio_tentativa)
```

### 5️⃣ Tasa de Aceptación de Propuestas ✅

```
Vista: BI_vw_tasa_aceptacion_propuestas
Propósito: Porcentaje de propuestas aceptadas
Dimensiones: Cuatrimestre
Métrica: (Aceptadas / Total) × 100
```

### 6️⃣ Cotización Promedio por Temporada 💰

```
Vista: BI_vw_promedio_cotizaciones
Propósito: Importe promedio de propuestas
Dimensiones: Temporada × Año
Métrica: Promedio importe_total (por fecha inicio viaje)
```

### 7️⃣ Tiempo Promedio de Respuesta ⏱️

```
Vista: BI_vw_promedio_tiempo_respuestas
Propósito: Días entre solicitud y propuesta
Dimensiones: Rango etario agente × Mes
Métrica: Promedio de días (fecha_propuesta - fecha_solicitud)
```

### 8️⃣ Desvío de Presupuesto 📊

```
Vista: BI_vw_desvio_cotizacion
Propósito: Diferencia entre presupuesto estimado e importe final
Dimensiones: Rango etario agente × Mes
Métrica: (importe_propuesta - presupuesto_estimado) / presupuesto_estimado
```

### 9️⃣ Rankings de Aspectos ⭐

```
Vista: BI_vw_rankings_aspectos
Propósito: Aspectos mejor y peor valorados
Dimensiones: Cuatrimestre × Aspecto
Métrica: Promedio de puntaje (1-5)
```

### 🔟 Satisfacción Promedio por Agente 😊

```
Vista: BI_vw_promedio_satisfaccion_agentes
Propósito: Satisfacción según agente
Dimensiones: Rango etario agente × Mes
Métrica: Promedio de puntaje en encuestas (1-5)
```

---

## 🎯 Detalles de Implementación

### 🔢 Rangos Etarios

Se calculan dinámicamente usando: `DATEDIFF(YEAR, fecha_nacimiento, GETDATE())`

#### 👨‍👩‍👧‍👦 Clientes

| Rango | Edad |
|-------|------|
| Menores de 25 años inclusive | 0-25 |
| Entre 25 y 35 años inclusive | 26-35 |
| Entre 35 y 50 años inclusive | 36-50 |
| Mayores de 50 años | 51+ |

#### 🧑‍💼 Agentes

| Rango | Edad |
|-------|------|
| Entre 25 y 35 años | 25-35 |
| Entre 35 y 50 años | 36-50 |
| Mayores de 50 años | 51+ |

### 📅 Dimensión Tiempo

Se construye agregando todas las fechas de operaciones:

```sql
✅ Fechas de venta (SQL0.ventas.fecha_venta)
✅ Fechas de emisión de propuestas (SQL0.propuestas.fecha_emision)
✅ Fechas de encuestas (SQL0.encuestas.fecha_realizado)
✅ Fechas de solicitudes (SQL0.solicitudes_cotizacion.fecha_realizada)
✅ Fechas de inicio tentativo (SQL0.solicitudes_cotizacion.fecha_inicio_tentativa)
```

### 🌡️ Dimensión Temporada

Asignada según el mes de inicio tentativo del viaje:

```
🌞 Verano:     Diciembre, Enero, Febrero (12, 1, 2)
🍂 Otoño:      Marzo, Abril, Mayo (3, 4, 5)
❄️ Invierno:   Junio, Julio, Agosto (6, 7, 8)
🌸 Primavera:  Septiembre, Octubre, Noviembre (9, 10, 11)
```

### 📊 Cuatrimestres

Se usan bloques de 4 meses:

```
Q1: Enero - Abril (meses 1-4)
Q2: Mayo - Agosto (meses 5-8)
Q3: Septiembre - Diciembre (meses 9-12)
```

### 🛠️ Procedimientos de Migración

```sql
├── BI_migraciones_estaticas          -- Datos estáticos
├── BI_migrar_dim_cliente             -- Clientes con rango etario
├── BI_migrar_dim_agente              -- Agentes con rango etario
├── BI_migrar_dim_tiempo              -- Dimensión temporal
├── BI_migrar_dim_canal_venta         -- Canales de venta
├── BI_migrar_dim_aspecto             -- Aspectos de encuestas
├── BI_migrar_hechos_ventas           -- Hechos de ventas
├── BI_migrar_hechos_propuestas       -- Hechos de propuestas
├── BI_migrar_hechos_cotizaciones     -- Hechos de cotizaciones
└── BI_migrar_hechos_encuestas        -- Hechos de encuestas
```

---

## 📁 Estructura de Archivos

```
📦 TP1C2026_SQL0_GrupoBD.zip
│
├── 📄 README.md                          -- Este archivo
├── 📄 Readme.txt                         -- Info del grupo
├── 📋 Estrategia.pdf                     -- Documentación detallada
├── 🖼️ DER.jpg                            -- Modelo transaccional
├── 🖼️ DER_BI.jpg                         -- Modelo dimensional
│
└── 📂 data/
    ├── 📄 script_creacion_inicial.sql    
    │   ├── DROP de tablas/vistas previas
    │   ├── CREATE de tablas normalizadas
    │   ├── CREATE de índices y constraints
    │   └── Migración de datos desde tabla maestra
    │
    └── 📄 script_creacion_BI.sql      
        ├── DROP de tablas/vistas de BI
        ├── CREATE de dimensiones
        ├── CREATE de tablas de hechos
        ├── EXEC de procedimientos de migración
        └── CREATE de 10 vistas analíticas
```

---

## 🎨 Decisiones de Diseño

### 🔗 Integridad Referencial

Se implementan relaciones mediante constraints FK:

```sql
CONSTRAINT FK_cliente_rango FOREIGN KEY (rango_edad)
    REFERENCES BI_dim_rangos_etario (id_rango_etario)
```

### ⚡ Índices para Performance

```sql
-- FK usadas frecuentemente en JOINs
CREATE INDEX IDX_hechos_ventas_cliente ON BI_hechos_ventas(id_cliente)
CREATE INDEX IDX_hechos_ventas_tiempo ON BI_hechos_ventas(id_tiempo_venta)
```

### 🛡️ Manejo de Datos Faltantes

```sql
✓ Encuestas sin agente: INNER JOIN excluye
✓ Propuestas sin cotización: Relación mediante FK
✓ Fechas NULL: Validadas en procedimientos de migración
```

---

## 🧪 Validación

El script incluye:

- ✅ DROP de objetos anteriores (respetando FK)
- ✅ CREATE de todas las dimensiones
- ✅ CREATE de todas las tablas de hechos
- ✅ EXEC de procedimientos de migración
- ✅ CREATE de 10 vistas analíticas

**Todo en un único archivo que se ejecuta sin errores ni warnings.**

---

### 📚 Apéndice del Enunciado

> Documentación online con consideraciones generales:  
> https://docs.google.com/document/d/1MpRwc6ZkjoRukh-oVlyjf5LUz9_jIKgVCC5VBAwyUws/edit

---

## 📝 Notas Importantes

⚠️ **Datos Desnormalizados:**  
La tabla maestra puede contener inconsistencias (DNI duplicados, fechas invertidas, etc.). Estas se documentan pero NO se modifican.

🔐 **Seguridad:**  
Todos los objetos deben pertenecer al esquema del grupo (`SQL0`). De lo contrario, el TP será rechazado.

⏱️ **Cuatrimestres (No Trimestres):**  
El proyecto usa bloques de 4 meses, no la tradicional división 3+3+3+3.

🌍 **Temporadas (Hemisfério Sur):**  
Verano inicia en Diciembre para alinearse con Argentina.

---

## 🎓 Información del Trabajo Práctico

```
📚 Materia: Gestión de Datos
🏫 Facultad: Regional Buenos Aires (FRBA)
🎯 Objetivo: Implementar sistema de BI para agencia de viajes
📅 Período: 1° Cuatrimestre 2026
👥 Grupo: SQL0
```

---

<div align="center">

### ✈️ **Buen viaje a través del análisis de datos** ✈️

**Última actualización:** 18/06/2026  
**Versión:** V1.0

</div>

---

## 📖 Tabla de Referencias Rápidas

| Concepto | Referencia |
|----------|-----------|
| Rangos Etarios | [Ver sección](#-rangos-etarios) |
| Vistas Analíticas | [Ver sección](#-vistas-analíticas) |
| Pasos de Ejecución | [Ver sección](#-ejecución) |
| Procedimientos | [Ver sección](#-procedimientos-de-migración) |
| Decisiones de Diseño | [Ver sección](#-decisiones-de-diseño) |

---

**Made with ❤️ for Data Excellence** 📊✨
