/*
--Ejemplo de como crear una tabla con primary key simple o compuesta

CREATE TABLE PEPITO1(
	CAMPO1 varchar(30) not null,
	CAMPO2 varchar(20) not null,
	CAMPO3 varchar(20) not null,
	CONSTRAINT nombreConstraint PRIMARY KEY(campo1)
)

--Ejemplo de como crear una FOREIGN KEY que hace referencia a la primary key de PEPITO1

CREATE TABLE PEPITO2(
	CAMPO1 varchar(30) not null,
	CAMPO2 varchar(20) not null,
	CAMPO3 varchar(30) not null, 
	CONSTRAINT nombreConstraint2 FOREIGN KEY(CAMPO3) REFERENCES PEPITO1(CAMPO1)
)

*/

/*

--Ejemplo simple para crear Stored Procedures (SP)

CREATE PROCEDURE nombreSP
	@param1 varchar(20) --parametros
AS
BEGIN
	INSERT INTO dbo.PEPITO values(@param1,@param1,@param1)
END

--Otro ejemplo de SP usando transacciones y try catch

CREATE PROCEDURE asd
	@param1 varchar(20)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		insert into dbo.PEPITO14 values(@param1,@param1,@param1)
		insert into dbo.PEPITO5 values(@param1,@param1,@param1)
		COMMIT
	END TRY

	BEGIN CATCH --el catch captura antes que el transaction el error, por ende si no hago el rollback en el catch quedara sin hacerse
		PRINT 'ERROR'
		ROLLBACK
	END CATCH
END


*/



CREATE TABLE DATA_PRAXIS.Tipos_documentos ( --OK
	id_tipo_documento TINYINT PRIMARY KEY,
	tipo_documento VARCHAR(255) NOT NULL
)

CREATE TABLE  DATA_PRAXIS.Sexo ( --OK
	id_sexo TINYINT PRIMARY KEY,
	descripcion_sexo VARCHAR(255) NOT NULL
)

CREATE TABLE  DATA_PRAXIS.Estado_Civil (
	id_estado_civil TINYINT PRIMARY KEY,
	descripcion_estado_civil VARCHAR(255) NOT NULL
)

CREATE TABLE DATA_PRAXIS.PLANES_MEDICOS ( --OK
	id_plan_medico numeric(18,0) PRIMARY KEY, 
	desc_plan_medico VARCHAR(255) NULL,
	precio_consulta numeric(18,0), 
	fecha_asiento_precio_bono_consulta DATETIME,
	precio_farmacia numeric(18,0), 
	fecha_asiento_precio_bono_farmacia DATETIME
)


CREATE TABLE [DATA_PRAXIS].[DATOS_PERSONA](
	[id_persona] [BIGINT] PRIMARY KEY IDENTITY(1,1),
	[id_tipo_documento] [TINYINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[TIPOS_DOCUMENTOS](id_tipo_documento),
	[numero_documento] [NUMERIC](18,0) NOT NULL,
	[nombre] [varchar](255)  not null,
	[apellido] [varchar](255) not null,
	[telefono] [numeric](18,0) not null,
	[mail] [varchar](255) not null,
	[fecha_nacimiento] [DATETIME] not null,
	[id_sexo][TINYINT] FOREIGN KEY REFERENCES [DATA_PRAXIS].[SEXO] (id_sexo),
	[cantidad_familiares_a_cargo][int] not null DEFAULT 0,
	[id_estado_civil] [TINYINT] FOREIGN KEY REFERENCES [DATA_PRAXIS].[ESTADO_CIVIL](id_estado_civil)
)

CREATE TABLE [DATA_PRAXIS].[AFILIADOS] (
        [id_afiliado] [BIGINT] PRIMARY KEY,
        [id_plan_medico] [numeric](18,0) NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[PLANES_MEDICOS] (id_plan_medico),
        [numero_bonos_consulta] [int]  DEFAULT 0,
        [id_persona] [BIGINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[DATOS_PERSONA] (id_persona),
        [fecha_baja] [datetime] DEFAULT NULL
)

CREATE TABLE DATA_PRAXIS.PROFESIONALES (
	id_profesional BIGINT IDENTITY (1,1) PRIMARY KEY,
	[id_persona] [BIGINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[DATOS_PERSONA] (id_persona),
	matricula numeric(18,0) DEFAULT NULL,
	fecha_de_baja DATETIME DEFAULT NULL
)

CREATE TABLE DATA_PRAXIS.RANGOS_HORARIOS ( --OK
	id_rango_horario_turno TINYINT IDENTITY (1,1) PRIMARY KEY,
	rango_horario VARCHAR(255) NOT NULL
)

CREATE TABLE DATA_PRAXIS.ESTADO_TURNO ( --OK
	id_estados_turno TINYINT IDENTITY (1,1) PRIMARY KEY,
	estado_turno BIT NOT NULL
)


CREATE TABLE [DATA_PRAXIS].[USUARIOS](
--falta
)


CREATE TABLE [DATA_PRAXIS].[ROLES](
--falta
)


CREATE TABLE [DATA_PRAXIS].[FUNCIONES](
--falta
)


CREATE TABLE [DATA_PRAXIS].[USUARIOS_ROLES](
--falta
)


CREATE TABLE [DATA_PRAXIS].[ROLES_FUNCIONES](
--falta
)



CREATE TABLE [DATA_PRAXIS].[HISTORIAL_CAMBIOS_PLANES](
--falta
)


CREATE TABLE [DATA_PRAXIS].[PROFESIONALES_ESPECIALIDAD](
--falta
)


CREATE TABLE [DATA_PRAXIS].[TIPO_ESPECIALIDAD]( --OK
	[id_tipo_especialidad] NUMERIC(18,0) PRIMARY KEY,
	[descripcion_tipo_especialidad] [varchar](255) NOT NULL
)


CREATE TABLE [DATA_PRAXIS].[ESPECIALIDADES]( --OK
	[id_especialidad] NUMERIC(18,0) PRIMARY KEY,
	[id_tipo_especialidad] NUMERIC (18,0) FOREIGN KEY REFERENCES DATA_PRAXIS.TIPO_ESPECIALIDAD (ID_TIPO_ESPECIALIDAD),
	[descripcion_especialidad] [varchar](255) NOT NULL
)



CREATE TABLE [DATA_PRAXIS].[BONO_CONSULTA](
--falta 
)


CREATE TABLE [DATA_PRAXIS].[BONO_FARMACIA](
--falta
)


CREATE TABLE [DATA_PRAXIS].[CONSULTA](
--falta
)


CREATE TABLE [DATA_PRAXIS].[TURNOS_DISPONIBLES](

falta completar...

)


CREATE TABLE [DATA_PRAXIS].[TURNOS_RESERVADOS](

falta completar...

)


CREATE TABLE [DATA_PRAXIS].[REGISTRO_CANCELACIONES](

falta completar...

)


CREATE TABLE [DATA_PRAXIS].[RECETAS_MEDICAS](

falta completar...

)

--//////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////      MIGRACION     ///////////////////////////////////
--///////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////
/*
En general el problema es con repetir varias veces la consulta de la tabla maestra.
Estaria bueno poder en una misma consulta migrar varias tablas, 
recorriendo una unica vez todas las filas y segun que condicion cumpla cada fila hacer un insert a una u otra tabla
*/

--DATOS_PERSONA
-------------
INSERT INTO datos_persona

SELECT datos_profesionales_persona
FROM maestra

UNION

SELECT datos_pacientes_persona
FROM profesionales



--AFILIADOS (joineo los datos personales contra la tabla maestra)
---------

INSERT INTO AFILIADOS

SELECT funcion_obtener_id_afiliado,  a.id_plan_medico, 0 (nro_bono_consulta arranca en 0), b.id_persona, NULL
FROM maestra a, datos_persona b
WHERE a.dni = b.dni



--PROFESIONALES (joineo los datos personales contra la tabla maestra)
-------------

INSERT INTO AFILIADOS

SELECT a.id_plan_medico, b.id_persona, NULL(matricula), NULL(fecha_baja)
FROM maestra a, datos_persona b
WHERE a.dni = b.dni



--TIPO_ESPECIALIDAD
-----------------
INSERT INTO TIPO_ESPECIALIDADES

SELECT distinct id_tipo_especialidad, descripcion_tipo_especialidad
FROM maestra


--ESPECIALIDADES
--------------

INSERT INTO ESPECIALIDADES

SELECT distinct id_especialidad, id_tipo_especialidad, descripcion_especialidad
FROM maestra


--MEDICAMENTOS
------------

INSERT INTO MEDICAMENTOS

SELECT distinct varchar_medicamento
FROM maestra
where varchar_medicamento is not null


--AGENDA
------
--falta...


--CONSULTA
--------
--falta...


--BONOS_COMPRA
------------
--falta...


--BONOS_FARMACIA
--------------
--falta...


--BONOS_CONSULTA
--------------
--falta...
