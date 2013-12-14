USE GD2C2013

begin tran

IF OBJECT_ID('DATA_PRAXIS.[estadistica1]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].estadistica1

IF OBJECT_ID('DATA_PRAXIS.[estadistica2]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].estadistica2

IF OBJECT_ID('DATA_PRAXIS.[estadistica3]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].estadistica3

IF OBJECT_ID('DATA_PRAXIS.[estadistica4]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].estadistica4

IF OBJECT_ID('DATA_PRAXIS.[CREAR_USUARIOS]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].CREAR_USUARIOS

IF OBJECT_ID('DATA_PRAXIS.[CANCELAR_TURNOS_POR_PROFESIONAL]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[CANCELAR_TURNOS_POR_PROFESIONAL]

IF OBJECT_ID('DATA_PRAXIS.[TRAER_TURNOS_DE_AFILIADO]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[TRAER_TURNOS_DE_AFILIADO]

IF OBJECT_ID('DATA_PRAXIS.[CANCELAR_TURNO_Y_LOGUEAR]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[CANCELAR_TURNO_Y_LOGUEAR]

IF OBJECT_ID('DATA_PRAXIS.[MIGRAR_AFILIADO]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_AFILIADO]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_AFILIADO_ACTUALIZACION]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_AFILIADO_ACTUALIZACION]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_AGENDA]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_AGENDA]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_BONO_COMPRA]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_BONO_COMPRA]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_BONO_CONSULTA]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_BONO_CONSULTA]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_BONO_CONSULTA_ACTUALIZACION]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_BONO_CONSULTA_ACTUALIZACION]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_BONO_FARMACIA]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_BONO_FARMACIA]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_BONO_FARMACIA_ACTUALIZACION]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_BONO_FARMACIA_ACTUALIZACION]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_CONSULTA]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_CONSULTA]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_ESPECIALIDAD]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_ESPECIALIDAD]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_ESTADO_TURNO_ACTUALIZACION]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_ESTADO_TURNO_ACTUALIZACION]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_MEDICAMENTOS]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_MEDICAMENTOS]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_PERSONA]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_PERSONA]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_PLAN_MEDICO]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_PLAN_MEDICO]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_PROFESIONAL]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_PROFESIONAL]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_PROFESIONAL_ESPECIALIDAD]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_PROFESIONAL_ESPECIALIDAD]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_RECETA]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_RECETA]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_RECETA_MEDICAMENTO]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_RECETA_MEDICAMENTO]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_RECETA_MEDICAMENTO_BONO_FARMACIA]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_RECETA_MEDICAMENTO_BONO_FARMACIA]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_TIPO_ESPECIALIDAD]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_TIPO_ESPECIALIDAD]

IF OBJECT_ID('[DATA_PRAXIS].[MIGRAR_TURNO]', 'P') IS NOT NULL
DROP PROC [DATA_PRAXIS].[MIGRAR_TURNO]



IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[VISTA_PROFESIONALES]'))
DROP VIEW [DATA_PRAXIS].[VISTA_PROFESIONALES]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[VISTA_ABMROL]'))
DROP VIEW [DATA_PRAXIS].[VISTA_ABMROL]

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[VISTA_AFILIADO]'))
DROP VIEW [DATA_PRAXIS].VISTA_AFILIADO



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

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[ESTADO_ROL]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.ESTADO_ROL 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[FUNCIONALIDAD]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.FUNCIONALIDAD

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[USUARIO]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.USUARIO 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[ESTADO_USUARIO]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.ESTADO_USUARIO 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[RECETA_MEDICAMENTO_BONO_FARMACIA]') AND type in (N'U'))
DROP TABLE   DATA_PRAXIS.RECETA_MEDICAMENTO_BONO_FARMACIA

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[BONO_FARMACIA]') AND type in (N'U'))
DROP TABLE   DATA_PRAXIS.BONO_FARMACIA

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
        id_rol INT IDENTITY(1,1) PRIMARY KEY,
        nombre_rol VARCHAR(50) NOT NULL,
        id_estado_rol TINYINT NOT NULL DEFAULT 1 FOREIGN KEY REFERENCES DATA_PRAXIS.ESTADO_ROL(id_estado_rol)  --Motivo para TINYINT y no BIT, escalabilidad. 0=Inactivo, 1=Activo.
)

CREATE TABLE DATA_PRAXIS.FUNCIONALIDAD (
	id_funcionalidad INT IDENTITY(1,1) PRIMARY KEY,
	descripcion_funcionalidad VARCHAR(255) NOT NULL,
	estado_funcionalidad TINYINT NOT NULL DEFAULT 1   --Motivo para TINYINT y no BIT, escalabilidad. 0=Inactivo, 1=Activo.
)



CREATE TABLE DATA_PRAXIS.PERSONA ( --OK
	id_persona BIGINT IDENTITY(1,1) PRIMARY KEY,
	id_tipo_documento TINYINT not null FOREIGN KEY REFERENCES DATA_PRAXIS.TIPO_DOCUMENTO  (id_tipo_documento),
	numero_documento NUMERIC(18,0) NOT NULL, 	--paciente_dni o medico_dni
	nombre VARCHAR(255) NOT NULL,	         	--paciente_nombre o medico_nombre
	apellido VARCHAR(255) NOT NULL,          	--paciente_apellido o medico_apellido
	telefono NUMERIC(18,0),                  	--paciente_telefono o medico_telefono
	direccion VARCHAR(255) NOT NULL,          	--paciente_direccion o medico_direccion
	mail VARCHAR(255) NOT NULL,              	--paciente_mail o medico_mail
	fecha_nacimiento DATETIME NOT NULL,      	--paciente_fecha_nac o medico_fecha_nac
	id_sexo TINYINT not null FOREIGN KEY REFERENCES DATA_PRAXIS.SEXO (id_sexo),
	cantidad_familiares_a_cargo INT  NOT NULL DEFAULT 0,
	id_estado_civil TINYINT not null  FOREIGN KEY REFERENCES DATA_PRAXIS.ESTADO_CIVIL (id_estado_civil)
	CONSTRAINT numero_documento_unico UNIQUE(id_tipo_documento,numero_documento)
)

CREATE TABLE [DATA_PRAXIS].[ESTADO_USUARIO] (-- revisar longitud password
        [id_estado_usuario] [TINYINT] PRIMARY KEY  ,
        estado_usuario varchar(255) not null
)

CREATE TABLE [DATA_PRAXIS].[USUARIO] (-- revisar longitud password
        [id_usuario] [BIGINT]  PRIMARY KEY IDENTITY(1,1),
        [id_persona] [BIGINT] FOREIGN KEY REFERENCES [DATA_PRAXIS].[PERSONA] (id_persona),
        [nombre_usuario] [VARCHAR](255)  NOT NULL,  
        [clave_usuario] [VARCHAR](255) NOT NULL,
        [intentos_ingreso] [int] NOT NULL DEFAULT 0,
        [id_estado_usuario] [TINYINT] not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[ESTADO_USUARIO] (id_estado_usuario) DEFAULT 1
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
	desc_plan_medico VARCHAR(255) NOT NULL,            --plan_med_descripcion
	precio_bono_consulta numeric(18,0) not null,            --plan_med_precio_bono_consulta
	fecha_asiento_precio_bono_consulta DATETIME,   
	precio_bono_farmacia numeric(18,0) not null,            --plan_med_precio_bono_farmacia
	fecha_asiento_precio_bono_farmacia DATETIME
)

CREATE TABLE DATA_PRAXIS.AFILIADO ( --OK
        id_afiliado BIGINT primary key,
        id_persona BIGINT NOT NULL FOREIGN KEY REFERENCES DATA_PRAXIS.PERSONA (id_persona),
        id_plan_medico numeric(18,0) NOT NULL FOREIGN KEY REFERENCES DATA_PRAXIS.PLAN_MEDICO (id_plan_medico), --plan_med_codigo
        numero_consulta int  DEFAULT 0,
        fecha_baja datetime DEFAULT NULL
)

CREATE TABLE [DATA_PRAXIS].[CAMBIO_PLAN_HIST](--OK
	id_cambio_plan BIGINT IDENTITY (1,1) PRIMARY KEY,
        [id_usuario] [bigint] not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[USUARIO](id_usuario),
	id_afiliado bigint not null foreign key references data_praxis.afiliado(id_afiliado),
        [fecha_modificacion] [datetime] not null,
        [id_plan_viejo] [numeric](18,0) NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[PLAN_MEDICO] (id_plan_medico),
        [id_plan_nuevo] [numeric](18,0) NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[PLAN_MEDICO] (id_plan_medico),
        [motivo_del_cambio] [varchar](255) null
        
)


CREATE TABLE DATA_PRAXIS.TIPO_ESPECIALIDAD( --OK
	id_tipo_especialidad NUMERIC(18,0) PRIMARY KEY,
	descripcion_tipo_especialidad varchar(255) NOT NULL
)


CREATE TABLE DATA_PRAXIS.ESPECIALIDAD( --OK
	id_especialidad NUMERIC(18,0) PRIMARY KEY,
	id_tipo_especialidad NUMERIC (18,0) not null FOREIGN KEY REFERENCES DATA_PRAXIS.TIPO_ESPECIALIDAD (ID_TIPO_ESPECIALIDAD),
	descripcion_especialidad varchar(255) NOT NULL
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
        id_afiliado bigint not null FOREIGN KEY references DATA_PRAXIS.AFILIADO (id_afiliado),
        id_plan_medico numeric(18,0) not null FOREIGN KEY references DATA_PRAXIS.PLAN_MEDICO (id_plan_medico),
)

CREATE TABLE [DATA_PRAXIS].[BONO_CONSULTA](
        id_bono_consulta numeric(18,0) primary key,
        id_bono_compra bigint not null FOREIGN KEY references DATA_PRAXIS.BONO_COMPRA (id_bono_compra),
        precio_compra numeric(18,2) not null,
        numero_consulta int,
        fecha_impresion DATETIME
)

CREATE TABLE DATA_PRAXIS.MEDICAMENTO  (
	id_medicamento BIGINT IDENTITY(1,1) PRIMARY KEY,
	descripcion_medicamento VARCHAR(255) not null
)

CREATE TABLE DATA_PRAXIS.AGENDA( 
	id_agenda BIGINT IDENTITY(1,1) PRIMARY KEY,
        fecha_turno date not null,
        id_horario_turno TINYINT NOT NULL FOREIGN KEY REFERENCES DATA_PRAXIS.HORARIO_TURNO (id_horario_turno),
        id_profesional BIGINT not null FOREIGN KEY REFERENCES DATA_PRAXIS.PROFESIONAL (id_profesional),
        id_especialidad  numeric(18,0) not null FOREIGN KEY REFERENCES DATA_PRAXIS.ESPECIALIDAD (id_especialidad),
        id_estado_turno TINYINT not null  FOREIGN KEY REFERENCES DATA_PRAXIS.ESTADO_TURNO (id_estado_turno)
)

CREATE TABLE [DATA_PRAXIS].[TURNO]( 
        [id_turno] [numeric](18,0) primary key,
        id_agenda bigint not null foreign key references data_praxis.agenda(id_agenda),
        [id_afiliado] [BIGINT] not null foreign key references [DATA_PRAXIS].[AFILIADO] (id_afiliado)
)

CREATE TABLE DATA_PRAXIS.CONSULTA ( --OK
        id_consulta BIGINT identity(1,1) PRIMARY KEY,
        id_bono_consulta numeric(18,0) not null FOREIGN KEY REFERENCES DATA_PRAXIS.BONO_CONSULTA (id_bono_consulta),
	id_turno numeric(18,0) not null FOREIGN KEY REFERENCES DATA_PRAXIS.TURNO (id_turno),
        horario_llegada time null,
        estado_consulta tinyint not null, --0 si el medico todavia no cargo los resultados, 1 si la consulta se realizo, 2 si la consulta no se realizo
        sintomas varchar(255) null,
        diagnostico varchar(255) null
)

CREATE TABLE DATA_PRAXIS.RECETA  (
	id_receta BIGINT IDENTITY(1,1) PRIMARY KEY,
	id_consulta BIGINT not null FOREIGN KEY references DATA_PRAXIS.CONSULTA (id_consulta)
)

CREATE TABLE DATA_PRAXIS.BONO_FARMACIA( --OK
	id_bono_farmacia numeric(18,0) primary key,
	id_bono_compra bigint not null FOREIGN KEY references DATA_PRAXIS.BONO_COMPRA (id_bono_compra),
	precio_compra numeric(18,2) not null,
	fecha_impresion datetime
)

CREATE TABLE DATA_PRAXIS.RECETA_MEDICAMENTO_BONO_FARMACIA  (
	id_receta BIGINT not null FOREIGN KEY references DATA_PRAXIS.RECETA (id_receta),
	id_medicamento BIGINT not null FOREIGN KEY references DATA_PRAXIS.MEDICAMENTO (id_medicamento),
	id_bono_farmacia numeric(18,0) not null FOREIGN KEY references DATA_PRAXIS.BONO_FARMACIA (id_bono_farmacia),
	cantidad_medicamento tinyint not null default 1
)

CREATE TABLE DATA_PRAXIS.TIPO_CANCELACION ( --OK
		id_tipo_cancelacion TINYINT PRIMARY KEY,
		descripcion_tipo_cancelacion VARCHAR(255) NOT NULL
 )
  
 CREATE TABLE DATA_PRAXIS.TURNO_CANCELADO_HIST  (
 id_turno_cancelado bigint identity(1,1) primary key,
 [fecha_turno] [DATE] not null,
 [id_horario_turno] [TINYINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[HORARIO_TURNO] (id_horario_turno),
 [id_profesional] [BIGINT] not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[PROFESIONAL] (id_profesional),
 [id_consulta] [BIGINT] FOREIGN KEY REFERENCES [DATA_PRAXIS].[CONSULTA](id_consulta),
 [id_afiliado] [BIGINT] not null foreign key references [DATA_PRAXIS].[AFILIADO] (id_afiliado),
 [id_especialidad ] [numeric](18,0) not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[ESPECIALIDAD] (id_especialidad),
 [id_tipo_cancelacion] TINYINT not null  FOREIGN KEY REFERENCES [DATA_PRAXIS].[TIPO_CANCELACION] (id_tipo_cancelacion),
 [motivo_cancelacion] VARCHAR(255) NOT NULL 
  
)

CREATE INDEX IX_PERSONA_numero_documento
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
--//////////////////////

--TIPO_CANCELACIONES

 INSERT INTO DATA_PRAXIS.TIPO_CANCELACION (id_tipo_cancelacion,descripcion_tipo_cancelacion)
	  VALUES (1,'Profesional'), (2,'Afiliado')  

--TIPO_DNI --OK
-------------- 

INSERT INTO DATA_PRAXIS.TIPO_DOCUMENTO (id_tipo_documento, descripcion_tipo_documento)
	VALUES(1,'D.N.I.'),(2,'PASAPORTE'),(3,'L.C'),(4,'C.I.'),(5,'L.E')

--SEXO -- OK
------------

INSERT INTO DATA_PRAXIS.SEXO (id_sexo, descripcion_sexo)
	VALUES(1,'MUJER'),(2,'HOMBRE'),(3,'No Especificado')



--ESTADO ROL
--------------------

INSERT INTO DATA_PRAXIS.ESTADO_ROL (id_estado_rol,estado_rol)
	VALUES (0,'INACTIVO'),(1,'ACTIVO'),(2,'ELIMINADO')

--ESTADO USUARIO
--------------------


INSERT INTO DATA_PRAXIS.ESTADO_USUARIO (id_estado_usuario,estado_usuario)
	VALUES (0,'INACTIVO'),(1,'ACTIVO')



--ROL -- OK
------------

INSERT INTO DATA_PRAXIS.ROL (nombre_rol, id_estado_rol)
	VALUES
('Afiliado',1),
('Profesional',1),
('Administrativo',1),
('Administrador General',1)

INSERT INTO DATA_PRAXIS.FUNCIONALIDAD
	VALUES 
	('ABMAfiliados',1),
	('ABMProfesionales',1),
	('RegistrarAgenda',1),
	('CompraBonos',1),
	('PedirTurno',1),
	('RegistrarLlegada',1),
	('RegistrarResultadoAtMedica',1),
	('RecetaMedica',1),
	('Estadisticas',1),
	('CancelarAtencionMedica',1),
	('ABMRol',1)

	
INSERT INTO DATA_PRAXIS.ROL_FUNCIONALIDAD
	VALUES 
	(1,4),
	(1,5),
	(1,10),
	(2,3),
	(2,7),
	(2,8),
	(2,10),
	(3,1),
	(3,2),
	(3,3),
	(3,4),
	(3,5),
	(3,6),
	(3,10),
	(3,9),
	(4,1),
	(4,2),
	(4,3),
	(4,4),
	(4,5),
	(4,6),
	(4,7),
	(4,8),
	(4,9),
	(4,10),
	(4,11)
	
-- INSERT USUARIO ADMINISTRADOR
------------------------------------------

INSERT INTO DATA_PRAXIS.USUARIO (  nombre_usuario,clave_usuario,id_estado_usuario)
  	VALUES ('Admin','e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7',1),
  	('test','e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7',1)


INSERT INTO DATA_PRAXIS.USUARIO_ROL
	VALUES 
	(1,4),
	(2,1),
	(2,2),
	(2,3),
	(2,4)


	


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
VALUES (1,'Soltero/a'),(2,'Casado/a'),(3,'Divorciado/a'),(4,'Viudo/a'),(5,'Concubino/a'),(6,'No Especificado')

--Estado-Turno --OK
-------------------

INSERT INTO DATA_PRAXIS.ESTADO_TURNO (id_estado_turno, estado_turno)
VALUES (1,'DISPONIBLE'), (2,'OTORGADO'),(3,'CANCELADO')

COMMIT TRAN T1


BEGIN TRAN T2
go
CREATE VIEW DATA_PRAXIS.VISTA_PROFESIONALES AS 
SELECT PROF.id_profesional,PERSONA.id_persona,PERSONA.apellido,PERSONA.nombre, TD.descripcion_tipo_documento AS 'tipo_documento', PERSONA.numero_documento, PERSONA.direccion, PERSONA.telefono, PERSONA.mail, PERSONA.fecha_nacimiento,  SX.descripcion_sexo AS 'sexo', PROF.matricula,PROF.fecha_de_baja
FROM DATA_PRAXIS.PERSONA PERSONA
JOIN DATA_PRAXIS.PROFESIONAL PROF ON PERSONA.id_persona = PROF.id_persona
LEFT JOIN DATA_PRAXIS.TIPO_DOCUMENTO TD ON PERSONA.id_tipo_documento = TD.id_tipo_documento
LEFT JOIN DATA_PRAXIS.SEXO SX ON PERSONA.id_sexo = SX.id_sexo

go

CREATE VIEW DATA_PRAXIS.VISTA_ABMROL AS 
SELECT a.id_rol, a.nombre_rol, b.estado_rol
            FROM DATA_PRAXIS.ROL a
            JOIN DATA_PRAXIS.ESTADO_ROL b ON b.id_estado_rol=a.id_estado_rol
go

CREATE VIEW DATA_PRAXIS.VISTA_AFILIADO AS 
SELECT AFIL.id_afiliado,PERSONA.id_persona,PERSONA.apellido,PERSONA.nombre,TD.id_tipo_documento, TD.descripcion_tipo_documento AS 'tipo_documento', PERSONA.numero_documento, PERSONA.direccion, PERSONA.telefono, PERSONA.mail, PERSONA.fecha_nacimiento,  ISNULL(SX.descripcion_sexo,'no ingresado') AS 'sexo',SX.id_sexo, ISNULL(EC.descripcion_estado_civil,'no ingresado') as 'estado civil',EC.id_estado_civil, PERSONA.cantidad_familiares_a_cargo,PM.desc_plan_medico as 'plan medico',PM.id_plan_medico,AFIL.fecha_baja
FROM DATA_PRAXIS.PERSONA PERSONA
JOIN DATA_PRAXIS.AFILIADO AFIL ON PERSONA.id_persona = AFIL.id_persona
LEFT JOIN DATA_PRAXIS.TIPO_DOCUMENTO TD ON PERSONA.id_tipo_documento = TD.id_tipo_documento
LEFT JOIN DATA_PRAXIS.SEXO SX ON PERSONA.id_sexo = SX.id_sexo
LEFT JOIN DATA_PRAXIS.ESTADO_CIVIL EC ON PERSONA.id_estado_civil=EC.id_estado_civil
LEFT JOIN DATA_PRAXIS.PLAN_MEDICO PM ON AFIL.id_plan_medico=PM.id_plan_medico
go
COMMIT TRAN T2




--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////////////       CREAR PROCEDIMIENTOS       ////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

GO

CREATE procedure [DATA_PRAXIS].[estadistica3] --bonos farmacia recetados
@fecha_inicio varchar(20),
@fecha_fin varchar(20),
@fecha_actual varchar(20)
as
begin
SET LANGUAGE Español
select top 5 datename(month,fecha_turno)as 'mes',descripcion_especialidad, COUNT(*) as 'cantidad' from (SELECT distinct id_receta,id_bono_farmacia from DATA_PRAXIS.RECETA_MEDICAMENTO_BONO_FARMACIA) a
                            join DATA_PRAXIS.RECETA b on a.id_receta=b.id_receta
                            join DATA_PRAXIS.CONSULTA c on c.id_consulta=b.id_consulta
                            join DATA_PRAXIS.TURNO d on d.id_turno=c.id_turno
                            join DATA_PRAXIS.AGENDA e on e.id_agenda=d.id_agenda
                            join DATA_PRAXIS.ESPECIALIDAD f on e.id_especialidad=f.id_especialidad
                            where  e.fecha_turno between @fecha_inicio and @fecha_fin
                            group by datename(month,fecha_turno),descripcion_especialidad
                            order by 3 desc
end

GO

CREATE procedure [DATA_PRAXIS].[estadistica2] --bonos farmacia vencidos
@fecha_inicio varchar(20),
@fecha_fin varchar(20),
@fecha_actual varchar(20)
as
/*begin
SET LANGUAGE Español
SELECT TOP 5 DATENAME(MONTH,DATEADD(DAY,60,b.fecha_compra)) as 'mes',c.id_afiliado, count(*) as 'cantidad' 
FROM DATA_PRAXIS.BONO_FARMACIA a 
JOIN DATA_PRAXIS.bono_compra b on a.id_bono_compra=b.id_bono_compra 
JOIN DATA_PRAXIS.afiliado c on b.id_afiliado=c.id_afiliado 
WHERE id_bono_farmacia not in (select id_bono_farmacia from DATA_PRAXIS.RECETA_MEDICAMENTO_BONO_FARMACIA) and   
DATEADD(DAY,60,b.fecha_compra) < @fecha_actual and DATEADD(DAY,60,b.fecha_compra) between @fecha_inicio and @fecha_fin
GROUP BY c.id_afiliado,DATENAME(MONTH,DATEADD(DAY,60,b.fecha_compra))*/


begin
SET LANGUAGE Español
SELECT TOP 5 DATENAME(MONTH,DATEADD(DAY,61,b.fecha_compra)) as 'mes',c.id_afiliado , count(*) as 'cantidad' 
FROM DATA_PRAXIS.BONO_FARMACIA a 
JOIN DATA_PRAXIS.bono_compra b on a.id_bono_compra=b.id_bono_compra 
JOIN DATA_PRAXIS.afiliado c on b.id_afiliado=c.id_afiliado 
WHERE   b.fecha_compra < dateadd(day,-60,@fecha_actual) and 
		b.fecha_compra between dateadd(day,-61,@fecha_inicio) and dateadd(day,-61,@fecha_fin) 
		and id_bono_farmacia not in (select distinct id_bono_farmacia from DATA_PRAXIS.RECETA_MEDICAMENTO_BONO_FARMACIA)
GROUP BY DATENAME(MONTH,DATEADD(DAY,61,b.fecha_compra)),c.id_afiliado
end

GO

CREATE procedure [DATA_PRAXIS].[estadistica1] --cancelaciones
@fecha_inicio varchar(20),
@fecha_fin varchar(20),
@fecha_actual varchar(20)
as
begin
SET LANGUAGE Español
SELECT TOP 5 DATENAME(MONTH,fecha_turno) as 'mes',a.[id_especialidad ] ,COUNT(*) 
FROM DATA_PRAXIS.TURNO_CANCELADO_HIST a
where fecha_turno between @fecha_inicio and @fecha_fin
group by DATENAME(MONTH,fecha_turno),a.[id_especialidad ]                                                      
                          
                   
end



GO

CREATE procedure [DATA_PRAXIS].[estadistica4] --bonos no usados por sus compradores
@fecha_inicio varchar(20),
@fecha_fin varchar(20),
@fecha_actual varchar(20)
as

begin
SET LANGUAGE Español
select top 10 datename(month,fecha_turno) as 'mes',a.id_afiliado, count(*) as 'cantidad' from ( --se podria haber echo todo en un solo paso
select fecha_turno,g.id_afiliado,b.id_bono_farmacia--aca meto los bonos farmacia
from DATA_PRAXIS.BONO_FARMACIA a
join DATA_PRAXIS.RECETA_MEDICAMENTO_BONO_FARMACIA b on a.id_bono_farmacia=b.id_bono_farmacia
join DATA_PRAXIS.RECETA c on b.id_receta=c.id_receta
join DATA_PRAXIS.CONSULTA d on d.id_consulta=c.id_consulta
join DATA_PRAXIS.TURNO e on e.id_turno=d.id_turno
join DATA_PRAXIS.AGENDA z on z.id_agenda=e.id_agenda
join DATA_PRAXIS.AFILIADO g on g.id_afiliado=e.id_afiliado
join DATA_PRAXIS.BONO_COMPRA f on a.id_bono_compra=f.id_bono_compra
where  fecha_turno between @fecha_inicio and @fecha_fin and g.id_afiliado <> f.id_afiliado -- and fecha_turno <= @fecha_actual

union

SELECT fecha_turno,d.id_afiliado,b.id_bono_consulta--aca meto los bonos consulta 
FROM DATA_PRAXIS.consulta a 
join DATA_PRAXIS.bono_consulta b on b.id_bono_consulta=a.id_bono_consulta
join DATA_PRAXIS.turno c on c.id_turno=a.id_turno
join DATA_PRAXIS.AGENDA z on z.id_agenda=c.id_agenda
join DATA_PRAXIS.afiliado d on d.id_afiliado=c.id_afiliado
join DATA_PRAXIS.bono_compra e on e.id_bono_compra=b.id_bono_compra--(por id_compra contra la tabla bono_consulta)
WHERE  fecha_turno between @fecha_inicio and @fecha_fin and c.id_afiliado <> e.id_afiliado --and fecha_turno <= @fecha_actual 
) a
group by datename(month,fecha_turno),id_afiliado
end


go
CREATE PROCEDURE [DATA_PRAXIS].[TRAER_TURNOS_DE_AFILIADO]
@ID_AFILIADO BIGINT
AS
BEGIN
SELECT * FROM (
SELECT T.id_turno, A.fecha_turno, H.horario_turno, PE.apellido, PE.nombre, E.descripcion_especialidad, TE.descripcion_tipo_especialidad
                                   FROM DATA_PRAXIS.TURNO T
                                   JOIN DATA_PRAXIS.AGENDA A ON T.id_agenda= A.id_agenda
                                   JOIN DATA_PRAXIS.HORARIO_TURNO H ON A.id_horario_turno = H.id_horario_turno
                                   JOIN DATA_PRAXIS.PROFESIONAL PR ON A.id_profesional = PR.id_profesional
                                   JOIN DATA_PRAXIS.PERSONA PE ON PE.id_persona = PR.id_persona
                                   JOIN DATA_PRAXIS.ESPECIALIDAD E ON A.id_especialidad = E.id_especialidad
                                   JOIN DATA_PRAXIS.TIPO_ESPECIALIDAD TE ON E.id_tipo_especialidad = TE.id_tipo_especialidad
                                   WHERE T.id_afiliado = @ID_AFILIADO and T.id_afiliado in (select id_afiliado FROM DATA_PRAXIS.AFILIADO where fecha_baja is null)
                                   
) as alias
WHERE alias.id_turno not in (SELECT id_turno from DATA_PRAXIS.CONSULTA)
END  

go
CREATE  PROCEDURE  [DATA_PRAXIS].[CANCELAR_TURNO_Y_LOGUEAR]
   @id_turno NUMERIC(18,0), 
   @tipo_cancelacion  TINYINT,
   @motivo_cancelacion nvarchar(255) 
AS 
BEGIN TRAN T1
   UPDATE DATA_PRAXIS.AGENDA
   SET id_estado_turno = 1
  FROM  DATA_PRAXIS.AGENDA A
  JOIN DATA_PRAXIS.TURNO T ON A.id_agenda = T.id_agenda
   WHERE id_turno = @id_turno
 
  INSERT INTO DATA_PRAXIS.TURNO_CANCELADO_HIST
  (fecha_turno, id_horario_turno, id_profesional, id_consulta, id_afiliado, [id_especialidad ], id_tipo_cancelacion, motivo_cancelacion) 
 
 SELECT A.fecha_turno, A.id_horario_turno,A.id_profesional,NULL, T.id_afiliado,A.id_especialidad, @tipo_cancelacion, @motivo_cancelacion
 FROM DATA_PRAXIS.AGENDA A
 JOIN DATA_PRAXIS.TURNO T ON A.id_agenda = T.id_agenda 
 WHERE id_turno = @id_turno

DELETE FROM DATA_PRAXIS.TURNO
WHERE id_turno = @id_turno  

COMMIT TRAN T1


go

CREATE PROCEDURE [DATA_PRAXIS].[CANCELAR_TURNOS_POR_PROFESIONAL]
@FECHA1 DATE ,
@FECHA2 DATE,
@MOTIVO VARCHAR(255),
@ID_PROFESIONAL BIGINT 
AS
BEGIN

IF @FECHA2 IS NULL

BEGIN

begin tran t3




INSERT INTO DATA_PRAXIS.TURNO_CANCELADO_HIST (fecha_turno, id_horario_turno, id_profesional, id_afiliado, [id_especialidad ], id_tipo_cancelacion, motivo_cancelacion)
SELECT fecha_turno, id_horario_turno, id_profesional, T.id_afiliado, A.id_especialidad, 1,@MOTIVO
	FROM DATA_PRAXIS.AGENDA A 
	JOIN DATA_PRAXIS.TURNO T ON A.id_agenda = T.id_agenda
	 where A.id_profesional = @ID_PROFESIONAL AND
				A.fecha_turno = @FECHA1 AND
				A.id_estado_turno <> 3 
				
UPDATE DATA_PRAXIS.AGENDA 
SET id_estado_turno = 3
WHERE fecha_turno = @FECHA1 AND
id_estado_turno <> 3

DELETE FROM DATA_PRAXIS.TURNO  WHERE id_agenda IN (
    SELECT  id_agenda 
	FROM DATA_PRAXIS.AGENDA A 
	 where A.id_profesional=@ID_PROFESIONAL AND
				A.fecha_turno =@FECHA1 
				) 

commit tran t3

END
ELSE
BEGIN

begin tran t4


INSERT INTO DATA_PRAXIS.TURNO_CANCELADO_HIST (fecha_turno, id_horario_turno, id_profesional,  id_afiliado, [id_especialidad ], id_tipo_cancelacion, motivo_cancelacion)
SELECT fecha_turno, id_horario_turno, id_profesional,T.id_afiliado, A.id_especialidad, 1,@MOTIVO
	FROM DATA_PRAXIS.AGENDA A 
	JOIN DATA_PRAXIS.TURNO T ON A.id_agenda = T.id_agenda
	 where A.id_profesional=@ID_PROFESIONAL AND
				A.fecha_turno >=@FECHA1  and
				A.fecha_turno <= @FECHA2  AND
				id_estado_turno <> 3


DELETE FROM DATA_PRAXIS.TURNO  WHERE id_agenda IN (
    SELECT  A.id_agenda 
	FROM DATA_PRAXIS.AGENDA A 
	JOIN DATA_PRAXIS.TURNO T ON A.id_agenda = T.id_agenda
	WHERE A.id_profesional=@ID_PROFESIONAL AND
				A.fecha_turno >= @FECHA1 AND
				A.fecha_turno <= @FECHA2 
)

UPDATE DATA_PRAXIS.AGENDA 
SET id_estado_turno = 3
WHERE fecha_turno >= @FECHA1 and
			  fecha_turno <= @FECHA2  AND
id_estado_turno <> 3


commit tran t4
END
END



GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_PERSONA
	
AS
BEGIN 

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
3,  --id_sexo
0,     --cant familiares a cargo
6 --id_estado_civil
FROM gd_esquema.Maestra

END


GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_PLAN_MEDICO
	
AS
BEGIN 

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

END


GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_TIPO_ESPECIALIDAD
	
AS
BEGIN 

--TIPO_ESPECIALIDAD --OK
-------------
INSERT INTO DATA_PRAXIS.TIPO_ESPECIALIDAD
SELECT distinct
Tipo_Especialidad_Codigo,
Tipo_Especialidad_Descripcion
FROM gd_esquema.Maestra 
where Tipo_Especialidad_Codigo is not null

END


GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_ESPECIALIDAD
	
AS
BEGIN 


--ESPECIALIDAD --OK
-------------
INSERT INTO DATA_PRAXIS.ESPECIALIDAD
SELECT distinct
Especialidad_Codigo,
Tipo_Especialidad_Codigo,
Especialidad_Descripcion
FROM gd_esquema.Maestra 
where Especialidad_Codigo is not null

END

GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_AFILIADO
	
AS
BEGIN 


--AFILIADO   
-------------
INSERT INTO DATA_PRAXIS.AFILIADO                                 
SELECT
((ROW_NUMBER()OVER(order by Paciente_Dni))*100)+1,
b.id_persona,
a.Plan_Med_Codigo,
0,
NULL
FROM (SELECT distinct Paciente_Dni,Plan_Med_Codigo FROM gd_esquema.Maestra WHERE Paciente_Dni is not null) a
join data_praxis.PERSONA b on a.paciente_dni=b.numero_documento

END


GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_PROFESIONAL
	
AS
BEGIN 

--PROFESIONAL --OK
-------------
INSERT INTO DATA_PRAXIS.PROFESIONAL
SELECT
b.id_persona,
NULL,
NULL
FROM (SELECT distinct Medico_Dni FROM gd_esquema.Maestra WHERE Medico_Dni is not null) a
join data_praxis.PERSONA b on a.medico_dni=b.numero_documento

END


GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_PROFESIONAL_ESPECIALIDAD
	
AS
BEGIN 

--MEDICO_ESPECIALIDAD --OK
-------------------------
INSERT INTO DATA_PRAXIS.PROFESIONAL_ESPECIALIDAD
SELECT (
SELECT id_profesional FROM DATA_PRAXIS.PROFESIONAL 
WHERE id_persona=(SELECT aux.id_persona FROM DATA_PRAXIS.PERSONA aux where aux.numero_documento = asd.Medico_Dni)
), asd.Especialidad_Codigo

FROM
(SELECT DISTINCT Medico_Dni, Especialidad_Codigo FROM gd_esquema.Maestra WHERE Medico_Dni is not null) asd

END

GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_BONO_COMPRA
	
AS
BEGIN 

--BONO_COMPRA --OK
-------------------------
INSERT INTO DATA_PRAXIS.BONO_COMPRA(fecha_compra,id_afiliado,id_plan_medico)

SELECT  DISTINCT M.Compra_Bono_Fecha, A.id_afiliado,Plan_Med_Codigo
FROM gd_esquema.Maestra M
JOIN DATA_PRAXIS.PERSONA P ON  P.numero_documento = M.Paciente_Dni
JOIN DATA_PRAXIS.AFILIADO A ON  A.id_persona = P.id_persona 
WHERE M.Compra_Bono_Fecha IS NOT NULL 
AND (BONO_CONSULTA_NUMERO IS NOT NULL or BONO_FARMACIA_NUMERO is not null)

END

GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_BONO_CONSULTA
	
AS
BEGIN 

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

END


GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_BONO_FARMACIA
	
AS
BEGIN 



--BONO_FARMACIA --OK
-------------------------
INSERT INTO DATA_PRAXIS.BONO_FARMACIA

SELECT  A.BONO_FARMACIA_NUMERO,  D.id_bono_compra,E.precio_bono_farmacia, A.COMPRA_BONO_FECHA
FROM  gd_esquema.Maestra A
JOIN DATA_PRAXIS.PERSONA  B ON A.PACIENTE_DNI = B.NUMERO_DOCUMENTO
JOIN DATA_PRAXIS.AFILIADO C ON B.ID_PERSONA = C.ID_PERSONA
JOIN DATA_PRAXIS.BONO_COMPRA  D ON C.ID_AFILIADO = D.ID_AFILIADO AND D.fecha_compra = A.COMPRA_BONO_FECHA
JOIN DATA_PRAXIS.PLAN_MEDICO E ON E.id_plan_medico = C.id_plan_medico
WHERE A.Bono_farmacia_Numero IS NOT NULL

END

GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_MEDICAMENTOS
	
AS
BEGIN 


--MEDICAMENTOS
---------------

INSERT INTO DATA_PRAXIS.MEDICAMENTO (descripcion_medicamento)
SELECT  DISTINCT Bono_Farmacia_Medicamento
FROM  gd_esquema.Maestra 
WHERE Bono_Farmacia_Medicamento IS NOT NULL

END

GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_AGENDA
	
AS
BEGIN 

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

END

GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_TURNO
	
AS
BEGIN 

--TURNO(reservas concretadas)
-------------------------------------
insert into data_praxis.turno(id_turno,id_agenda,id_afiliado)

select a.turno_numero,g.id_agenda, f.id_afiliado --estado activo
from (
	select * 
	from gd_esquema.Maestra
	where
	Medico_Dni is not null and --estas condiciones traen los turnos reservados sin concretar (no hay turnos repetidos)
	compra_bono_fecha is null and
	consulta_sintomas is null and
	Turno_numero is not null
	) a

left join data_praxis.horario_turno b on b.horario_turno=CAST(a.turno_fecha as TIME)
left join data_praxis.persona c on c.numero_documento=a.Paciente_Dni 
left join data_praxis.persona d on d.numero_documento=a.Medico_Dni
left join data_praxis.profesional e on d.id_persona=e.id_persona
left join data_praxis.afiliado f on c.id_persona=f.id_persona
left join data_praxis.agenda g on g.id_horario_turno=b.id_horario_turno and g.fecha_turno=CAST(a.turno_fecha AS DATE) and g.id_profesional=e.id_profesional


END

GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_CONSULTA
	
AS
BEGIN 

--CONSULTA
-----------

/*
Pregunta1: En la tabla maestra, un turno concretado tiene tambien otro registro con el mismo nroTurno para representar la reserva? o cuando se concreta el turno se completan los campos faltantes... ver si hay nro de turno repetido para una misma turno_fecha.
Pregunta2: No conviene usar id_turno en vez de id_consulta? total id_consulta para que sirve, que sentido tiene que exista? complicar la migracion?
*/

insert into data_praxis.consulta(id_bono_consulta,id_turno,horario_llegada,sintomas,diagnostico,estado_consulta)

select a.bono_consulta_numero, b.id_turno, NULL, a.consulta_sintomas,a.consulta_enfermedades,'1' --estado activo
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

END


GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_RECETA
	
AS
BEGIN 

--RECETA
-------------

INSERT INTO DATA_PRAXIS.RECETA  (id_consulta)
SELECT   C.id_consulta
FROM DATA_PRAXIS.CONSULTA C

END


GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_RECETA_MEDICAMENTO_BONO_FARMACIA
	
AS
BEGIN 

--RECETA_MEDICAMENTO

insert into data_praxis.RECETA_MEDICAMENTO_BONO_FARMACIA(id_receta,id_medicamento,cantidad_medicamento,id_bono_farmacia)
select e.id_receta,b.id_medicamento,1,Bono_Farmacia_Numero from gd_esquema.Maestra a
join DATA_PRAXIS.MEDICAMENTO b on a.Bono_Farmacia_Medicamento=b.descripcion_medicamento
join DATA_PRAXIS.TURNO c on a.Turno_Numero=c.id_turno
join DATA_PRAXIS.CONSULTA d on c.id_turno=d.id_turno
join DATA_PRAXIS.RECETA e on e.id_consulta=d.id_consulta

END
GO


/*CREATE PROCEDURE DATA_PRAXIS.MIGRAR_BONO_FARMACIA_ACTUALIZACION
	
AS
BEGIN 

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

END

GO*/
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_ESTADO_TURNO_ACTUALIZACION	
AS
BEGIN 

--ACTUALIZACION DE ESTADO_TURNO 
MERGE INTO DATA_PRAXIS.AGENDA T
   USING DATA_PRAXIS.TURNO S 
      ON s.id_agenda = t.id_agenda
     
WHEN MATCHED THEN
   UPDATE 
      SET id_estado_turno = 2;
END


GO
CREATE PROCEDURE DATA_PRAXIS.MIGRAR_AFILIADO_ACTUALIZACION	
AS
BEGIN 

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


END


GO

CREATE PROCEDURE DATA_PRAXIS.MIGRAR_BONO_CONSULTA_ACTUALIZACION	
AS
BEGIN 


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


END
GO

CREATE PROCEDURE DATA_PRAXIS.CREAR_USUARIOS	
AS
BEGIN 

begin tran

INSERT INTO DATA_PRAXIS.USUARIO(id_persona,nombre_usuario,clave_usuario,intentos_ingreso,id_estado_usuario)
SELECT id_persona,numero_documento,'688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6',0,1 --pass asd
FROM DATA_PRAXIS.PERSONA

INSERT INTO DATA_PRAXIS.USUARIO_ROL(id_usuario,id_rol)
SELECT c.id_usuario, 1
FROM DATA_PRAXIS.PERSONA a
JOIN DATA_PRAXIS.AFILIADO b on a.id_persona=b.id_persona
JOIN DATA_PRAXIS.USUARIO c on CONVERT(VARCHAR,a.numero_documento)=c.nombre_usuario

INSERT INTO DATA_PRAXIS.USUARIO_ROL(id_usuario,id_rol)
SELECT c.id_usuario, 2
FROM DATA_PRAXIS.PERSONA a
JOIN DATA_PRAXIS.PROFESIONAL b on a.id_persona=b.id_persona
JOIN DATA_PRAXIS.USUARIO c on CONVERT(VARCHAR,a.numero_documento)=c.nombre_usuario

commit tran

END
GO


EXEC DATA_PRAXIS.MIGRAR_PERSONA
EXEC DATA_PRAXIS.MIGRAR_PLAN_MEDICO	
EXEC DATA_PRAXIS.MIGRAR_TIPO_ESPECIALIDAD
EXEC DATA_PRAXIS.MIGRAR_ESPECIALIDAD
EXEC DATA_PRAXIS.MIGRAR_AFILIADO
EXEC DATA_PRAXIS.MIGRAR_PROFESIONAL
EXEC DATA_PRAXIS.MIGRAR_PROFESIONAL_ESPECIALIDAD	
EXEC DATA_PRAXIS.MIGRAR_BONO_COMPRA
EXEC DATA_PRAXIS.MIGRAR_BONO_CONSULTA
EXEC DATA_PRAXIS.MIGRAR_BONO_FARMACIA
EXEC DATA_PRAXIS.MIGRAR_MEDICAMENTOS
EXEC DATA_PRAXIS.MIGRAR_AGENDA
EXEC DATA_PRAXIS.MIGRAR_TURNO
EXEC DATA_PRAXIS.MIGRAR_CONSULTA
EXEC DATA_PRAXIS.MIGRAR_RECETA
EXEC DATA_PRAXIS.MIGRAR_RECETA_MEDICAMENTO_BONO_FARMACIA
EXEC DATA_PRAXIS.MIGRAR_ESTADO_TURNO_ACTUALIZACION	
EXEC DATA_PRAXIS.MIGRAR_AFILIADO_ACTUALIZACION	
EXEC DATA_PRAXIS.MIGRAR_BONO_CONSULTA_ACTUALIZACION
EXEC DATA_PRAXIS.CREAR_USUARIOS
