EXEC('CREATE SCHEMA DATA_PRAXIS AUTHORIZATION gd')


--EXEC('DROP SCHEMA DATA_PRAXIS')

--////////////////////////////////////////////////
--  /////    Section - Functions     ///////////////
--////////////////////////////////////////////////

/*
CREATE FUNCTION DATA_PRAXIS.OBTENER_ID_PERSONA
(
	@dni numeric(18,0)
)
RETURNS BIGINT   --   CONSULTAR CON DIEGO �STO!!!!!!!!!!!
AS
BEGIN
	DECLARE @id_persona_retorno numeric(18,0)
	SET @id_persona_retorno = (	SELECT id_persona 
					FROM  DATA_PRAXIS.PERSONA 
					WHERE numero_documento = @dni)
	RETURN @id_persona_retorno 
END
GO
*/

CREATE FUNCTION DATA_PRAXIS.OBTENER_ID_PERSONA
(
	@dni numeric(18,0)
)
RETURNS BIGINT   --   CONSULTAR CON DIEGO �STO!!!!!!!!!!!
AS
BEGIN
	DECLARE @id_persona_retorno NUMERIC(18,0)
	SET @id_persona_retorno = (	SELECT id_persona 
					FROM  DATA_PRAXIS.PERSONA 
					WHERE numero_documento = @dni)
	RETURN @id_persona_retorno 
END
GO


CREATE FUNCTION DATA_PRAXIS.OBTENER_ID_AFILIADO
(
	@dni numeric(18,0)
)
RETURNS BIGINT   --   CONSULTAR CON DIEGO �STO!!!!!!!!!!!
AS
BEGIN
	DECLARE @id_persona_afiliado numeric(18,0)
	SET @id_afiliado_retorno = (	SELECT id_afiliado
					FROM  DATA_PRAXIS.PERSONA 
					WHERE numero_documento = @dni)
	RETURN @id_persona_retorno 
END
GO


-- Tables creation Section



CREATE TABLE DATA_PRAXIS.TIPO_DOCUMENTO ( --OK
	id_tipo_documento TINYINT PRIMARY KEY,
	descripcion_tipo_documento VARCHAR(20) NOT NULL
)


CREATE TABLE DATA_PRAXIS.SEXO ( --OK
	id_sexo TINYINT PRIMARY KEY ,
	descripcion_sexo VARCHAR(20) NOT NULL
)


CREATE TABLE DATA_PRAXIS.HORARIO_TURNO ( --OK
	id_horario_turno TINYINT IDENTITY(1,1) PRIMARY KEY,
	horario_turno VARCHAR(255) NOT NULL
)


CREATE TABLE DATA_PRAXIS.ESTADO_CIVIL ( --OK
	id_estado_civil TINYINT PRIMARY KEY,
	descripcion_estado_civil VARCHAR(255) NOT NULL
)


CREATE TABLE DATA_PRAXIS.ESTADO_TURNO ( --OK
	id_estado_turno TINYINT PRIMARY KEY,
	estado_turno VARCHAR(20) NOT NULL    --Motivo para usar un VARCHAR en lugar de un BIT: escalabilidad.Ej: se agrega estado reserva.
)

CREATE TABLE DATA_PRAXIS.ROL (
        id_rol INT PRIMARY KEY,
        nombre_rol VARCHAR(20) NOT NULL,
        estado_rol TINYINT NOT NULL DEFAULT 1   --Motivo para TINYINT y no BIT, escalabilidad. 0=Inactivo, 1=Activo.
)

CREATE TABLE DATA_PRAXIS.FUNCIONALIDAD (
	id_func INT IDENTITY(1,1) PRIMARY KEY,
	desc_func VARCHAR(255) NOT NULL,
	estado_funcionalidad TINYINT NOT NULL DEFAULT 1   --Motivo para TINYINT y no BIT, escalabilidad. 0=Inactivo, 1=Activo.
)


CREATE TABLE DATA_PRAXIS.PERSONA ( --OK
	id_persona BIGINT IDENTITY(1,1) PRIMARY KEY,
	id_tipo_documento TINYINT  FOREIGN KEY REFERENCES DATA_PRAXIS.TIPO_DOCUMENTO  (id_tipo_documento),
	numero_documento NUMERIC(18,0) NOT NULL, 	--paciente_dni o medico_dni
	nombre VARCHAR(255) NOT NULL,	         	--paciente_nombre o medico_nombre
	apellido VARCHAR(255) NOT NULL,          	--paciente_apellido o medico_apellido
	telefono NUMERIC(18,0),                  	--paciente_telefono o medico_telefono
	direccion VARCHAR(255) NOT NULL,          	--paciente_direccion o medico_direccion
	mail VARCHAR(255) NOT NULL,              	--paciente_mail o medico_mail
	fecha_nacimiento DATETIME NOT NULL,      	--paciente_fecha_nac o medico_fecha_nac
	id_sexo TINYINT FOREIGN KEY REFERENCES DATA_PRAXIS.SEXO (id_sexo),
	cantidad_familiares_a_cargo INT  NOT NULL DEFAULT 0,
	id_estado_civil TINYINT FOREIGN KEY REFERENCES DATA_PRAXIS.ESTADO_CIVIL (id_estado_civil)
)

CREATE TABLE DATA_PRAXIS.PLAN_MEDICO ( --OK
	id_plan_medico NUMERIC(18,0) PRIMARY KEY,      --plan_med_codigo
	desc_plan_medico VARCHAR(255) NULL,            --plan_med_descripcion
	precio_bono_consulta numeric(18,0),            --plan_med_precio_bono_consulta
	fecha_asiento_precio_bono_consulta DATETIME,   
	precio_bono_farmacia numeric(18,0),            --plan_med_precio_bono_farmacia
	fecha_asiento_precio_bono_farmacia DATETIME
)


CREATE TABLE DATA_PRAXIS.TIPO_ESPECIALIDAD( --OK
	id_tipo_especialidad NUMERIC(18,0) PRIMARY KEY,
	descripcion_tipo_especialidad varchar(255) NOT NULL
)


CREATE TABLE DATA_PRAXIS.ESPECIALIDAD( --OK
	id_especialidad NUMERIC(18,0) PRIMARY KEY,
	id_tipo_especialidad NUMERIC (18,0) FOREIGN KEY REFERENCES DATA_PRAXIS.TIPO_ESPECIALIDAD (ID_TIPO_ESPECIALIDAD),
	descripcion_especialidad varchar(255) NOT NULL
)


CREATE TABLE DATA_PRAXIS.AFILIADO ( --OK
        id_afiliado BIGINT,
        id_persona BIGINT NOT NULL FOREIGN KEY REFERENCES DATA_PRAXIS.PERSONA (id_persona),
        id_plan_medico numeric(18,0) NOT NULL FOREIGN KEY REFERENCES DATA_PRAXIS.PLAN_MEDICO (id_plan_medico), --plan_med_codigo
        numero_consulta int  DEFAULT 0,
        fecha_baja datetime DEFAULT NULL
)


CREATE TABLE DATA_PRAXIS.PROFESIONAL ( --OK
	id_profesional BIGINT IDENTITY (1,1) PRIMARY KEY,
	id_persona BIGINT NOT NULL FOREIGN KEY REFERENCES DATA_PRAXIS.PERSONA (id_persona),
	matricula numeric(18,0) DEFAULT NULL,
	fecha_de_baja DATETIME DEFAULT NULL
)


CREATE TABLE DATA_PRAXIS.PROFESIONAL_ESPECIALIDAD (--OK
        id_profesional BIGINT NOT NULL FOREIGN KEY REFERENCES DATA_PRAXIS.PROFESIONAL (id_profesional),
        id_especialidad numeric(18,0) not null FOREIGN KEY REFERENCES DATA_PRAXIS.ESPECIALIDAD (id_especialidad)
)

GO







--select dbo.Obtener_id_Persona(Paciente_dni) from gd_esquema.Maestra


--//////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////
--///////////////////////    Llenado, nuevas tablas    ///////////////////////////
--///////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////

--TIPO_DNI --OK
-------------- 

INSERT INTO DATA_PRAXIS.TIPO_DOCUMENTO (id_tipo_documento, descripcion_tipo_documento)
	VALUES(1,'D.N.I.'),(2,'PASAPORTE'),(3,'L.C'),(4,'C.I.'),(5,'L.E')

--SEXO -- OK
------------

INSERT INTO DATA_PRAXIS.SEXO (id_sexo, descripcion_sexo)
	VALUES(1,'MUJER'),(2,'HOMBRE')

--HORARIO_TURNO --OK
--------------------

INSERT INTO DATA_PRAXIS.HORARIO_TURNO (horario_turno)
VALUES ('00:00 - 00:30 hs.'),('00:30 - 01:00 hs.'),('01:00 - 01:30 hs.'),('01:30 - 02:00 hs.'),('02:00 - 02:30 hs.'),('02:30 - 03:00 hs.'),('03:00 - 03:30 hs.'),('03:30 - 04:00 hs.'),('04:00 - 04:30 hs.'),('04:30 - 05:00 hs.'),('05:00 - 05:30 hs.'),('05:30 - 06:00 hs.'),('06:00 - 06:30 hs.'),('06:30 - 07:00 hs.'),('07:00 - 07:30 hs.'),('07:30 - 08:00 hs.'),('08:00 - 08:30 hs.'),('08:30 - 09:00 hs.'),('09:00 - 09:30 hs.'),('09:30 - 10:00 hs.'),('10:00 - 10:30 hs.'),('10:30 - 11:00 hs.'),('11:00 - 11:30 hs.'),('11:30 - 12:00 hs.'),('12:00 - 12:30 hs.'),('12:30 - 13:00 hs.'),('13:00 - 13:30 hs.'),('13:30 - 14:00 hs.'),('14:00 - 14:30 hs.'),('14:30 - 15:00 hs.'),('15:00 - 15:30 hs.'),('15:30 - 16:00 hs.'),('16:00 - 16:30 hs.'),('16:30 - 17:00 hs.'),('17:00 - 17:30 hs.'),('17:30 - 18:00 hs.'),('18:00 - 18:30 hs.'),('18:30 - 19:00 hs.'),('19:00 - 19:30 hs.'),('19:30 - 20:00 hs.'),('20:00 - 20:30 hs.'),('20:30 - 21:00 hs.'),('21:00 - 21:30 hs.'),('21:30 - 22:00 hs.'),('22:00 - 22:30 hs.'),('22:30 - 23:00 hs.'),('23:00 - 23:30 hs.'),('23:30 - 00:00 hs.')

--Estado-Civil --OK
-------------------

INSERT INTO DATA_PRAXIS.ESTADO_CIVIL (id_estado_civil, descripcion_estado_civil)
VALUES (1,'Soltero/a'),(2,'Casado/a'),(3,'Divorciado/a'),(4,'Viudo/a'),(5,'Concubino/a'),(6,'Difunto/a')

--Estado-Turno --OK
-------------------

INSERT INTO DATA_PRAXIS.ESTADO_TURNO (id_estado_turno, estado_turno)
VALUES (1,'DISPONIBLE'), (2,'OTORGADO')

--//////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////      MIGRACION     ///////////////////////////////////
--///////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////
/*
En general el problema es repetir varias veces la consulta de la tabla maestra.
Estaria bueno poder en una misma consulta migrar varias tablas, 
recorriendo una unica vez todas las filas y segun que condicion cumpla cada fila hacer un insert a una u otra tabla
*/



--PERSONA --OK
-------------- 
INSERT INTO DATA_PRAXIS.PERSONA (
id_tipo_documento,
numero_documento,
nombre,
apellido,
telefono,
direccion,
mail,
fecha_nacimiento,
id_sexo,
cantidad_familiares_a_cargo,
id_estado_civil)
SELECT DISTINCT
1, --tipodoc 
ISNULL(medico_dni,paciente_dni),
ISNULL(medico_nombre,paciente_nombre),
ISNULL(medico_apellido,paciente_apellido),
ISNULL(medico_telefono,paciente_telefono),
ISNULL(medico_direccion,paciente_direccion),
ISNULL(medico_mail,paciente_mail),
ISNULL(medico_fecha_nac,paciente_fecha_nac),
NULL,  --id_sexo
0,     --cant familiares a cargo
NULL --id_estado_civil
FROM gd_esquema.Maestra

--PLAN_MEDICO--
-------------

INSERT INTO DATA_PRAXIS.PLAN_MEDICO
SELECT DISTINCT 
plan_med_codigo,
plan_med_descripcion,
plan_med_precio_bono_consulta,
NULL,
plan_med_precio_bono_farmacia,
NULL
FROM gd_esquema.Maestra


--ESPECIALIDAD --OK
-------------
INSERT INTO DATA_PRAXIS.ESPECIALIDAD
SELECT distinct
Especialidad_Codigo,
Tipo_Especialidad_Codigo,
Especialidad_Descripcion
FROM gd_esquema.Maestra 
where Especialidad_Codigo is not null


--TIPO_ESPECIALIDAD --OK
-------------
INSERT INTO DATA_PRAXIS.TIPO_ESPECIALIDAD
SELECT distinct
Tipo_Especialidad_Codigo,
Tipo_Especialidad_Descripcion
FROM gd_esquema.Maestra 
where Tipo_Especialidad_Codigo is not null





--AFILIADO   --NO FUNCIONA, REVISAR
-------------
INSERT INTO DATA_PRAXIS.AFILIADO                                 
SELECT
(ROW_NUMBER()OVER(order by Paciente_Dni))*100,
DATA_PRAXIS.OBTENER_ID_PERSONA(asd.Paciente_Dni),
asd.Plan_Med_Codigo,
0,
NULL
FROM (SELECT distinct Paciente_Dni,Plan_Med_Codigo FROM gd_esquema.Maestra WHERE Paciente_Dni is not null) asd

--PROFESIONAL --OK
-------------
INSERT INTO DATA_PRAXIS.PROFESIONAL
SELECT
DATA_PRAXIS.OBTENER_ID_PERSONA(asd.Medico_Dni),
NULL,
NULL
FROM (SELECT distinct Medico_Dni FROM gd_esquema.Maestra WHERE Medico_Dni is not null) asd




--MEDICO_ESPECIALIDAD --OK
-------------------------
INSERT INTO DATA_PRAXIS.PROFESIONAL_ESPECIALIDAD
SELECT (
SELECT id_profesional FROM DATA_PRAXIS.PROFESIONAL 
WHERE id_persona=(SELECT aux.id_persona FROM DATA_PRAXIS.PERSONA aux where aux.numero_documento = asd.Medico_Dni)
), asd.Especialidad_Codigo

FROM
(SELECT DISTINCT Medico_Dni, Especialidad_Codigo FROM gd_esquema.Maestra WHERE Medico_Dni is not null) asd

