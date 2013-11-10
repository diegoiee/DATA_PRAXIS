begin tran


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[VISTA_PROFESIONALES]'))
DROP VIEW [DATA_PRAXIS].[VISTA_PROFESIONALES]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[ESTADO_ROL]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.ESTADO_ROL 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[TURNO_CANCELADO_HIST]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.TURNO_CANCELADO_HIST 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[TIPO_CANCELACION]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.TIPO_CANCELACION 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[CAMBIO_PLAN_HIST]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.CAMBIO_PLAN_HIST 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[ROL_FUNCIONALIDAD]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.ROL_FUNCIONALIDAD 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[USUARIO_ROL]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.USUARIO_ROL 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[ROL]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.ROL 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[FUNCIONALIDAD]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.FUNCIONALIDAD

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[USUARIO]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.USUARIO 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[ESTADO_USUARIO]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.ESTADO_USUARIO 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[BONO_FARMACIA]') AND type in (N'U'))
DROP TABLE   DATA_PRAXIS.BONO_FARMACIA

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[RECETA_MEDICAMENTO]') AND type in (N'U'))
DROP TABLE   DATA_PRAXIS.RECETA_MEDICAMENTO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[MEDICAMENTO]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.MEDICAMENTO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[RECETA]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.RECETA

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[CONSULTA]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.CONSULTA

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[TURNO]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.TURNO 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[AGENDA]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.AGENDA

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[BONO_CONSULTA]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.BONO_CONSULTA

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[BONO_COMPRA]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.BONO_COMPRA 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[PROFESIONAL_ESPECIALIDAD]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.PROFESIONAL_ESPECIALIDAD

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[ESPECIALIDAD]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.ESPECIALIDAD

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[TIPO_ESPECIALIDAD]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.TIPO_ESPECIALIDAD

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[AFILIADO]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.AFILIADO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[PROFESIONAL]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.PROFESIONAL 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[PERSONA]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.PERSONA 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[TIPO_DOCUMENTO]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.TIPO_DOCUMENTO 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[SEXO]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.SEXO 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[HORARIO_TURNO]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.HORARIO_TURNO 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[ESTADO_TURNO]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.ESTADO_TURNO 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[PLAN_MEDICO]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.PLAN_MEDICO 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[ESTADO_CIVIL]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.ESTADO_CIVIL 



--////////////////////////////////////////////////
--  /////    Section - Functions     ///////////////
--////////////////////////////////////////////////
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[OBTENER_ID_PERSONA]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION DATA_PRAXIS.OBTENER_ID_PERSONA

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[OBTENER_ID_AFILIADO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION DATA_PRAXIS.OBTENER_ID_AFILIADO

IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'DATA_PRAXIS')
EXEC('DROP SCHEMA DATA_PRAXIS')

commit tran

--------------------------------------------------------------------------------------------------------
--///////////////////////////////////////////////////////////////////////////////////////
--SCRIPT DE CREACION

begin tran t1;
EXEC('CREATE SCHEMA DATA_PRAXIS AUTHORIZATION gd')


CREATE TABLE DATA_PRAXIS.TIPO_DOCUMENTO ( --OK
	id_tipo_documento TINYINT PRIMARY KEY,
	descripcion_tipo_documento VARCHAR(20) NOT NULL
)


CREATE TABLE DATA_PRAXIS.SEXO ( --OK
	id_sexo TINYINT PRIMARY KEY ,
	descripcion_sexo VARCHAR(20) NOT NULL
)

CREATE TABLE DATA_PRAXIS.ESTADO_ROL ( --OK
	id_estado_rol TINYINT PRIMARY KEY ,
	estado_rol VARCHAR(255) NOT NULL
)


CREATE TABLE DATA_PRAXIS.HORARIO_TURNO ( --OK
	id_horario_turno TINYINT IDENTITY(1,1) PRIMARY KEY,
	horario_turno TIME NOT NULL
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
        id_estado_rol TINYINT NOT NULL DEFAULT 1   --Motivo para TINYINT y no BIT, escalabilidad. 0=Inactivo, 1=Activo.
)

CREATE TABLE DATA_PRAXIS.FUNCIONALIDAD (
	id_funcionalidad INT IDENTITY(1,1) PRIMARY KEY,
	descripcion_funcionalidad VARCHAR(255) NOT NULL,
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

CREATE TABLE [DATA_PRAXIS].[ESTADO_USUARIO] (-- revisar longitud password
        [id_estado_usuario] [TINYINT] PRIMARY KEY  ,
        estado_usuario varchar(255)
)

CREATE TABLE [DATA_PRAXIS].[USUARIO] (-- revisar longitud password
        [id_usuario] [BIGINT]  PRIMARY KEY IDENTITY(1,1),
        [id_persona] [BIGINT] FOREIGN KEY REFERENCES [DATA_PRAXIS].[PERSONA] (id_persona),
        [nombre_usuario] [VARCHAR](255)  NOT NULL,  
        [clave_usuario] [VARCHAR](255) NOT NULL,
        [intentos_ingreso] [int] NOT NULL DEFAULT 0,
        [id_estado_usuario] [TINYINT] FOREIGN KEY REFERENCES [DATA_PRAXIS].[ESTADO_USUARIO] (id_estado_usuario) DEFAULT 1
)

CREATE TABLE [DATA_PRAXIS].[ROL_FUNCIONALIDAD](--OK
        [id_rol] int NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[ROL](id_rol),
        [id_funcionalidad] int NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[FUNCIONALIDAD](id_funcionalidad)
)

CREATE TABLE [DATA_PRAXIS].[USUARIO_ROL]( --OK
        [id_usuario] [BIGINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[USUARIO](id_usuario),
        [id_rol] int not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[ROL](id_rol),
)

CREATE TABLE DATA_PRAXIS.PLAN_MEDICO ( --OK
	id_plan_medico NUMERIC(18,0) PRIMARY KEY,      --plan_med_codigo
	desc_plan_medico VARCHAR(255) NULL,            --plan_med_descripcion
	precio_bono_consulta numeric(18,0),            --plan_med_precio_bono_consulta
	fecha_asiento_precio_bono_consulta DATETIME,   
	precio_bono_farmacia numeric(18,0),            --plan_med_precio_bono_farmacia
	fecha_asiento_precio_bono_farmacia DATETIME
)

CREATE TABLE [DATA_PRAXIS].[CAMBIO_PLAN_HIST](--OK
        [id_usuario] [bigint] not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[USUARIO](id_usuario),
        [fecha_modificacion] [datetime] not null,
        [id_plan_viejo] [numeric](18,0) NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[PLAN_MEDICO] (id_plan_medico),
        [id_plan_nuevo] [numeric](18,0) NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[PLAN_MEDICO] (id_plan_medico),
        [motivo_del_cambio] [varchar](255) null
        constraint pk_historial_cambio_planes_t PRIMARY KEY (id_usuario, fecha_modificacion)
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
        id_afiliado BIGINT primary key,
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

CREATE TABLE [DATA_PRAXIS].[BONO_COMPRA]( --OK
        id_bono_compra bigint identity(1,1) primary key,
        fecha_compra DATETIME NOT NULL,
        id_afiliado bigint FOREIGN KEY references DATA_PRAXIS.AFILIADO (id_afiliado),
        id_plan_medico numeric(18,0) FOREIGN KEY references DATA_PRAXIS.PLAN_MEDICO (id_plan_medico),
)

CREATE TABLE [DATA_PRAXIS].[BONO_CONSULTA](
        id_bono_consulta numeric(18,0) primary key,
        id_bono_compra bigint FOREIGN KEY references DATA_PRAXIS.BONO_COMPRA (id_bono_compra),
        precio_compra numeric(18,2) null,
        numero_consulta int,
        fecha_impresion DATETIME
)

CREATE TABLE DATA_PRAXIS.MEDICAMENTO  (
	id_medicamento BIGINT IDENTITY(1,1) PRIMARY KEY,
	descripcion_medicamento VARCHAR(255)
)

CREATE TABLE DATA_PRAXIS.AGENDA( 
	id_agenda BIGINT IDENTITY(1,1) PRIMARY KEY,
        fecha_turno date not null,
        id_horario_turno TINYINT NOT NULL FOREIGN KEY REFERENCES DATA_PRAXIS.HORARIO_TURNO (id_horario_turno),
        id_profesional BIGINT not null FOREIGN KEY REFERENCES DATA_PRAXIS.PROFESIONAL (id_profesional),
        id_especialidad  numeric(18,0) not null FOREIGN KEY REFERENCES DATA_PRAXIS.ESPECIALIDAD (id_especialidad),
        id_estado_turno int null  
)

CREATE TABLE [DATA_PRAXIS].[TURNO]( 
        [id_turno] [numeric](18,0) primary key,
        id_agenda bigint foreign key references data_praxis.agenda(id_agenda),
        [id_afiliado] [BIGINT] foreign key references [DATA_PRAXIS].[AFILIADO] (id_afiliado)
)

CREATE TABLE DATA_PRAXIS.CONSULTA ( --OK
        id_consulta BIGINT identity(1,1) PRIMARY KEY,
        id_bono_consulta numeric(18,0) not null FOREIGN KEY REFERENCES DATA_PRAXIS.BONO_CONSULTA (id_bono_consulta),
		id_turno numeric(18,0) FOREIGN KEY REFERENCES DATA_PRAXIS.TURNO (id_turno),
        horario_llegada time null,
        sintomas varchar(255) null,
        diagnostico varchar(255) null
)

CREATE TABLE DATA_PRAXIS.RECETA  (
	id_receta BIGINT IDENTITY(1,1) PRIMARY KEY,
	id_consulta BIGINT FOREIGN KEY references DATA_PRAXIS.CONSULTA (id_consulta)
)

CREATE TABLE DATA_PRAXIS.RECETA_MEDICAMENTO  (
	id_receta_medicamento BIGINT IDENTITY(1,1) PRIMARY KEY,
	id_receta BIGINT FOREIGN KEY references DATA_PRAXIS.RECETA (id_receta),
	id_medicamento BIGINT FOREIGN KEY references DATA_PRAXIS.MEDICAMENTO (id_medicamento),
	cantidad_medicamento tinyint not null default 1
)

CREATE TABLE DATA_PRAXIS.BONO_FARMACIA( --OK
	id_bono_farmacia numeric(18,0) primary key,
	--id_receta bigint FOREIGN KEY references DATA_PRAXIS.RECETA (id_receta),
	id_bono_compra bigint FOREIGN KEY references DATA_PRAXIS.BONO_COMPRA (id_bono_compra),
	precio_compra numeric(18,2) null,
	fecha_impresion datetime,
	id_receta_medicamento BIGINT FOREIGN KEY references DATA_PRAXIS.RECETA_MEDICAMENTO (id_receta_medicamento)
)

CREATE TABLE DATA_PRAXIS.TIPO_CANCELACION ( --OK
		id_tipo_cancelacion TINYINT PRIMARY KEY,
		descripcion_tipo_cancelacion VARCHAR(255) NOT NULL
 )
  
/* CREATE TABLE DATA_PRAXIS.TURNO_CANCELADO_HIST  (
  [fecha_turno] [DATE] not null,
  [id_horario_turno] [TINYINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[HORARIO_TURNO] (id_horario_turno),
   [id_profesional] [BIGINT] not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[PROFESIONAL] (id_profesional),
  [id_consulta] [BIGINT] FOREIGN KEY REFERENCES [DATA_PRAXIS].[CONSULTA](id_consulta),
  [id_turno] [numeric](18,0) null,
   [id_afiliado] [BIGINT] foreign key references [DATA_PRAXIS].[AFILIADO] (id_afiliado),
   [id_especialidad ] [numeric](18,0) not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[ESPECIALIDAD] (id_especialidad),
  [id_tipo_cancelacion] TINYINT  FOREIGN KEY REFERENCES [DATA_PRAXIS].[TIPO_CANCELACION] (id_tipo_cancelacion),
  [motivo_cancelacion] VARCHAR(255) NOT NULL, 
  constraint pk_turno_cancelado primary key(fecha_turno,id_horario_turno,id_profesional)
)*/

CREATE INDEX pepito
ON DATA_PRAXIS.PERSONA(numero_documento)

GO

--////////////////////////////////////////////////
--  /////    Section - Functions     ///////////////
--////////////////////////////////////////////////
/*
CREATE FUNCTION DATA_PRAXIS.OBTENER_ID_PERSONA
(
	@dni numeric(18,0)
)
RETURNS BIGINT   
AS
BEGIN
	DECLARE @id_persona_retorno BIGINT
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

	RETURN (select id_afiliado
	from DATA_PRAXIS.AFILIADO
	where id_persona=DATA_PRAXIS.OBTENER_ID_PERSONA(@dni))
END
GO

----
*/


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



--ESTADO ROL
--------------------

INSERT INTO DATA_PRAXIS.ESTADO_ROL (id_estado_rol,estado_rol)
	VALUES (0,'INACTIVO'),(1,'ACTIVO')

--ESTADO USUARIO
--------------------


INSERT INTO DATA_PRAXIS.ESTADO_USUARIO (id_estado_usuario,estado_usuario)
	VALUES (0,'INACTIVO'),(1,'ACTIVO')



--ROL -- OK
------------

INSERT INTO DATA_PRAXIS.ROL (id_rol, nombre_rol, id_estado_rol)
	VALUES (1,'Afiliado',0),(2,'Profesional',0),(3,'Administrativo',0
	)
	
	
	
-- INSERT USUARIO ADMINISTRADOR
------------------------------------------

INSERT INTO DATA_PRAXIS.USUARIO (  nombre_usuario,clave_usuario,id_estado_usuario)
  	VALUES ('Admin','e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7',1)



--HORARIO_TURNO --OK
--------------------

INSERT INTO DATA_PRAXIS.HORARIO_TURNO (horario_turno)
values
('00:00:00'),
('00:30:00'),
('01:00:00'),
('01:30:00'),
('02:00:00'),
('02:30:00'),
('03:00:00'),
('03:30:00'),
('04:00:00'),
('04:30:00'),
('05:00:00'),
('05:30:00'),
('06:00:00'),
('06:30:00'),
('07:00:00'),
('07:30:00'),
('08:00:00'),
('08:30:00'),
('09:00:00'),
('09:30:00'),
('10:00:00'),
('10:30:00'),
('11:00:00'),
('11:30:00'),
('12:00:00'),
('12:30:00'),
('13:00:00'),
('13:30:00'),
('14:00:00'),
('14:30:00'),
('15:00:00'),
('15:30:00'),
('16:00:00'),
('16:30:00'),
('17:00:00'),
('17:30:00'),
('18:00:00'),
('18:30:00'),
('19:00:00'),
('19:30:00'),
('20:00:00'),
('20:30:00'),
('21:00:00'),
('21:30:00'),
('22:00:00'),
('22:30:00'),
('23:00:00'),
('23:30:00')

--Estado-Civil --OK
-------------------

INSERT INTO DATA_PRAXIS.ESTADO_CIVIL (id_estado_civil, descripcion_estado_civil)
VALUES (1,'Soltero/a'),(2,'Casado/a'),(3,'Divorciado/a'),(4,'Viudo/a'),(5,'Concubino/a')

--Estado-Turno --OK
-------------------

INSERT INTO DATA_PRAXIS.ESTADO_TURNO (id_estado_turno, estado_turno)
VALUES (1,'DISPONIBLE'), (2,'OTORGADO')

COMMIT TRAN T1


BEGIN TRAN T2
CREATE VIEW DATA_PRAXIS.VISTA_PROFESIONALES AS 
SELECT PERSONA.apellido,PERSONA.nombre, TD.descripcion_tipo_documento AS 'tipo_documento', PERSONA.numero_documento, PERSONA.direccion, PERSONA.telefono, PERSONA.mail, PERSONA.fecha_nacimiento,  SX.descripcion_sexo AS 'sexo', PROF.matricula
FROM DATA_PRAXIS.PERSONA PERSONA
JOIN DATA_PRAXIS.PROFESIONAL PROF ON PERSONA.id_persona = PROF.id_persona
LEFT JOIN DATA_PRAXIS.TIPO_DOCUMENTO TD ON PERSONA.id_tipo_documento = TD.id_tipo_documento
LEFT JOIN DATA_PRAXIS.SEXO SX ON PERSONA.id_sexo = SX.id_sexo

COMMIT TRAN T2

BEGIN TRAN T3
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


--TIPO_ESPECIALIDAD --OK
-------------
INSERT INTO DATA_PRAXIS.TIPO_ESPECIALIDAD
SELECT distinct
Tipo_Especialidad_Codigo,
Tipo_Especialidad_Descripcion
FROM gd_esquema.Maestra 
where Tipo_Especialidad_Codigo is not null

--ESPECIALIDAD --OK
-------------
INSERT INTO DATA_PRAXIS.ESPECIALIDAD
SELECT distinct
Especialidad_Codigo,
Tipo_Especialidad_Codigo,
Especialidad_Descripcion
FROM gd_esquema.Maestra 
where Especialidad_Codigo is not null



--AFILIADO   --NO FUNCIONA, REVISAR
-------------
INSERT INTO DATA_PRAXIS.AFILIADO                                 
SELECT
(ROW_NUMBER()OVER(order by Paciente_Dni))*100,
b.id_persona,
a.Plan_Med_Codigo,
0,
NULL
FROM (SELECT distinct Paciente_Dni,Plan_Med_Codigo FROM gd_esquema.Maestra WHERE Paciente_Dni is not null) a
join data_praxis.PERSONA b on a.paciente_dni=b.numero_documento

--PROFESIONAL --OK
-------------
INSERT INTO DATA_PRAXIS.PROFESIONAL
SELECT
b.id_persona,
NULL,
NULL
FROM (SELECT distinct Medico_Dni FROM gd_esquema.Maestra WHERE Medico_Dni is not null) a
join data_praxis.PERSONA b on a.medico_dni=b.numero_documento




--MEDICO_ESPECIALIDAD --OK
-------------------------
INSERT INTO DATA_PRAXIS.PROFESIONAL_ESPECIALIDAD
SELECT (
SELECT id_profesional FROM DATA_PRAXIS.PROFESIONAL 
WHERE id_persona=(SELECT aux.id_persona FROM DATA_PRAXIS.PERSONA aux where aux.numero_documento = asd.Medico_Dni)
), asd.Especialidad_Codigo

FROM
(SELECT DISTINCT Medico_Dni, Especialidad_Codigo FROM gd_esquema.Maestra WHERE Medico_Dni is not null) asd




--BONO_COMPRA --OK
-------------------------
INSERT INTO DATA_PRAXIS.BONO_COMPRA(fecha_compra,id_afiliado,id_plan_medico)

SELECT  DISTINCT M.Compra_Bono_Fecha, A.id_afiliado,Plan_Med_Codigo
FROM gd_esquema.Maestra M
JOIN DATA_PRAXIS.PERSONA P ON  P.numero_documento = M.Paciente_Dni
JOIN DATA_PRAXIS.AFILIADO A ON  A.id_persona = P.id_persona 
WHERE M.Compra_Bono_Fecha IS NOT NULL 
AND (BONO_CONSULTA_NUMERO IS NOT NULL or BONO_FARMACIA_NUMERO is not null)



--BONO_CONSULTA --OK
-------------------------
INSERT INTO DATA_PRAXIS.BONO_CONSULTA

SELECT  A.BONO_CONSULTA_NUMERO,  D.id_bono_compra,E.precio_bono_consulta, NULL, A.COMPRA_BONO_FECHA
FROM  gd_esquema.Maestra A
JOIN DATA_PRAXIS.PERSONA  B ON A.PACIENTE_DNI = B.NUMERO_DOCUMENTO
JOIN DATA_PRAXIS.AFILIADO C ON B.ID_PERSONA = C.ID_PERSONA
JOIN DATA_PRAXIS.BONO_COMPRA  D ON C.ID_AFILIADO = D.ID_AFILIADO AND D.fecha_compra = A.COMPRA_BONO_FECHA
JOIN DATA_PRAXIS.PLAN_MEDICO E ON E.id_plan_medico = C.id_plan_medico
WHERE A.Bono_Consulta_Numero IS NOT NULL


--BONO_FARMACIA --OK
-------------------------
INSERT INTO DATA_PRAXIS.BONO_FARMACIA

SELECT  A.BONO_FARMACIA_NUMERO,  D.id_bono_compra,E.precio_bono_farmacia, A.COMPRA_BONO_FECHA, NULL
FROM  gd_esquema.Maestra A
JOIN DATA_PRAXIS.PERSONA  B ON A.PACIENTE_DNI = B.NUMERO_DOCUMENTO
JOIN DATA_PRAXIS.AFILIADO C ON B.ID_PERSONA = C.ID_PERSONA
JOIN DATA_PRAXIS.BONO_COMPRA  D ON C.ID_AFILIADO = D.ID_AFILIADO AND D.fecha_compra = A.COMPRA_BONO_FECHA
JOIN DATA_PRAXIS.PLAN_MEDICO E ON E.id_plan_medico = C.id_plan_medico
WHERE A.Bono_farmacia_Numero IS NOT NULL


--MEDICAMENTOS
---------------

INSERT INTO DATA_PRAXIS.MEDICAMENTO (descripcion_medicamento)
SELECT  DISTINCT Bono_Farmacia_Medicamento
FROM  gd_esquema.Maestra 
WHERE Bono_Farmacia_Medicamento IS NOT NULL

--AGENDA(solo  reserva sin concretar)
-------------------------------------
insert into data_praxis.agenda(fecha_turno,id_horario_turno,id_profesional,id_especialidad,id_estado_turno)

select a.Turno_Fecha, b.id_horario_turno, e.id_profesional, a.Especialidad_Codigo,1
from (
	select * --este select deberia traer solamente los turnos reservados sin concretar
	from gd_esquema.Maestra GG
	where
	Medico_Dni is not null and --estas condiciones traen los turnos reservados sin concretar (no hay turnos repetidos)
	compra_bono_fecha is null and
	consulta_sintomas is null and
	Turno_numero is not null
	) a

left join data_praxis.horario_turno b on b.horario_turno=CAST(a.turno_fecha as TIME)
left join data_praxis.persona d on d.numero_documento=a.Medico_Dni
left join data_praxis.profesional e on d.id_persona=e.id_persona

--TURNO(reservas concretadas)
-------------------------------------
insert into data_praxis.turno(id_turno,id_agenda,id_afiliado)

select a.turno_numero,g.id_agenda, f.id_afiliado --estado activo
from (
	select * 
	from gd_esquema.Maestra
	where
	Medico_Dni is not null and --estas condiciones traen los turnos reservados concretados (no hay turnos repetidos)
	Turno_numero is not null and
	compra_bono_fecha is null and
	consulta_sintomas is not null and
	Bono_Farmacia_Numero is not null and
	Bono_Consulta_Numero is not null
	) a

left join data_praxis.horario_turno b on b.horario_turno=CAST(a.turno_fecha as TIME)
left join data_praxis.persona c on c.numero_documento=a.Paciente_Dni 
left join data_praxis.persona d on d.numero_documento=a.Medico_Dni
left join data_praxis.profesional e on d.id_persona=e.id_persona
left join data_praxis.afiliado f on c.id_persona=f.id_persona
left join data_praxis.agenda g on g.id_horario_turno=b.id_horario_turno and g.fecha_turno=CAST(a.turno_fecha AS DATE) and g.id_profesional=e.id_profesional




--CONSULTA
-----------

/*
Pregunta1: En la tabla maestra, un turno concretado tiene tambien otro registro con el mismo nroTurno para representar la reserva? o cuando se concreta el turno se completan los campos faltantes... ver si hay nro de turno repetido para una misma turno_fecha.
Pregunta2: No conviene usar id_turno en vez de id_consulta? total id_consulta para que sirve, que sentido tiene que exista? complicar la migracion?
*/

insert into data_praxis.consulta(id_bono_consulta,id_turno,horario_llegada,sintomas,diagnostico)

select a.bono_consulta_numero, b.id_turno, NULL, a.consulta_sintomas,a.consulta_enfermedades --estado activo
from (
	select * 
	from gd_esquema.Maestra
	where
	Medico_Dni is not null and --estas condiciones traen los turnos reservados concretados (no hay turnos repetidos)
	Turno_numero is not null and
	compra_bono_fecha is null and
	consulta_sintomas is not null and
	Bono_Farmacia_Numero is not null and
	Bono_Consulta_Numero is not null
	) a

join data_praxis.turno b on b.id_turno=a.turno_numero


--RECETA
-------------

INSERT INTO DATA_PRAXIS.RECETA  (id_consulta)
SELECT   C.id_consulta
FROM DATA_PRAXIS.CONSULTA C

--RECETA_MEDICAMENTO

insert into data_praxis.receta_medicamento(id_receta,id_medicamento,cantidad_medicamento)
select e.id_receta,b.id_medicamento,1 from gd_esquema.Maestra a
join DATA_PRAXIS.MEDICAMENTO b on a.Bono_Farmacia_Medicamento=b.descripcion_medicamento
join DATA_PRAXIS.TURNO c on a.Turno_Numero=c.id_turno
join DATA_PRAXIS.CONSULTA d on c.id_turno=d.id_turno
join DATA_PRAXIS.RECETA e on e.id_consulta=d.id_consulta

--ACTUALIZACION DE BONO FARMACIA (campo id_receta_medicamento)
MERGE INTO DATA_PRAXIS.BONO_FARMACIA T
   USING (
   
select f.id_receta_medicamento,a.bono_farmacia_numero 
from gd_esquema.Maestra a
join DATA_PRAXIS.MEDICAMENTO b on a.Bono_Farmacia_Medicamento=b.descripcion_medicamento
join DATA_PRAXIS.TURNO c on a.Turno_Numero=c.id_turno
join DATA_PRAXIS.CONSULTA d on c.id_turno=d.id_turno
join DATA_PRAXIS.RECETA e on e.id_consulta=d.id_consulta
join DATA_PRAXIS.RECETA_MEDICAMENTO f on e.id_receta=f.id_receta
) S 
      ON s.bono_farmacia_numero = t.id_bono_farmacia
        
WHEN MATCHED THEN
   UPDATE 
      SET id_receta_medicamento = S.id_receta_medicamento;
      
--ACTUALIZACION DE ESTADO_TURNO 
MERGE INTO DATA_PRAXIS.AGENDA T
   USING DATA_PRAXIS.TURNO S 
      ON s.id_agenda = t.id_agenda
        
WHEN MATCHED THEN
   UPDATE 
      SET id_estado_turno = 2;
      
--ACTUALIZACION NRO CONSULTAS DE CADA AFILIADO

MERGE INTO DATA_PRAXIS.afiliado T
   USING (select id_afiliado, COUNT(*) as 'cantidad'
from data_praxis.bono_consulta a
join data_praxis.bono_compra b on a.id_bono_compra=b.id_bono_compra
group by id_afiliado ) S 
      ON s.id_afiliado = t.id_afiliado
        
WHEN MATCHED THEN
   UPDATE 
      SET numero_consulta = s.cantidad;
      
      
--ACTUALIZACION CAMPO NRO CONSULTA DE CADA BONO

MERGE INTO DATA_PRAXIS.bono_consulta T
   USING 
   (	select b.id_afiliado,a.id_bono_consulta,ROW_NUMbER() OVER (partition by b.id_afiliado ORDER BY b.fecha_compra) as 'cantidad'
	from data_praxis.bono_consulta a
	join data_praxis.bono_compra b on a.id_bono_compra=b.id_bono_compra
	join (  select bono_consulta_numero 
		from gd_esquema.Maestra 
		where
		Medico_Dni is not null and --estas condiciones traen los turnos reservados concretados (no hay turnos repetidos)
		Turno_numero is not null and
		compra_bono_fecha is null and
		consulta_sintomas is not null and
		Bono_Farmacia_Numero is not null and
		Bono_Consulta_Numero is not null 
		)c on c.bono_consulta_numero=a.id_bono_consulta
		) S 
		
		ON s.id_bono_consulta = t.id_bono_consulta
        
	WHEN MATCHED THEN
	   UPDATE 
	      SET numero_consulta = s.cantidad;



commit tran t3;

