EXEC('CREATE SCHEMA [DATA_PRAXIS] AUTHORIZATION [gd]')


--EXEC('DROP SCHEMA [DATA_PRAXIS]')


CREATE TABLE [DATA_PRAXIS.TIPO_DOCUMENTO] ( --OK
	id_tipo_documento TINYINT PRIMARY KEY,
	descripcion_tipo_documento VARCHAR(20) NOT NULL
)


CREATE TABLE [DATA_PRAXIS.SEXO] ( --OK
	id_sexo TINYINT PRIMARY KEY ,
	descripcion_sexo VARCHAR(20) NOT NULL
)


CREATE TABLE [DATA_PRAXIS.HORARIO_TURNO] ( --OK
	id_horario_turno TINYINT IDENTITY(1,1) PRIMARY KEY,
	horario_turno VARCHAR(255) NOT NULL
)


CREATE TABLE [DATA_PRAXIS.ESTADO_CIVIL] ( --OK
	id_estado_civil TINYINT PRIMARY KEY,
	descripcion_estado_civil VARCHAR(255) NOT NULL
)


CREATE TABLE [DATA_PRAXIS.ESTADO_TURNO] ( --OK
	id_estado_turno TINYINT PRIMARY KEY,
	estado_turno VARCHAR(20) NOT NULL    --Motivo para usar un VARCHAR en lugar de un BIT: escalabilidad.Ej: se agrega estado reserva.
)

CREATE TABLE [DATA_PRAXIS.ROL] (
        id_rol INT PRIMARY KEY,
        nombre_rol VARCHAR(20) NOT NULL,
        estado_rol TINYINT NOT NULL DEFAULT 1   --Motivo para TINYINT y no BIT, escalabilidad. 0=Inactivo, 1=Activo.
)


CREATE TABLE [DATA_PRAXIS.PERSONA] ( --OK
	id_persona BIGINT IDENTITY(1,1) PRIMARY KEY,
	id_tipo_documento TINYINT NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS.TIPO_DOCUMENTO] (id_tipo_documento),
	numero_documento NUMERIC(18,0) NOT NULL, 	--paciente_dni o medico_dni
	nombre VARCHAR(255) NOT NULL,	         	--paciente_nombre o medico_nombre
	apellido VARCHAR(255) NOT NULL,          	--paciente_apellido o medico_apellido
	telefono NUMERIC(18,0),                  	--paciente_telefono o medico_telefono
	direccion VARCHAR(255) NOT NULL,          	--paciente_direccion o medico_direccion
	mail VARCHAR(255) NOT NULL,              	--paciente_mail o medico_mail
	fecha_nacimiento DATETIME NOT NULL,      	--paciente_fecha_nac o medico_fecha_nac
	id_sexo TINYINT FOREIGN KEY REFERENCES [DATA_PRAXIS].SEXO (id_sexo),
	cantidad_familiares_a_cargo INT  NOT NULL DEFAULT 0,
	id_estado_civil TINYINT FOREIGN KEY REFERENCES [DATA_PRAXIS.ESTADO_CIVIL] (id_estado_civil)
)


CREATE TABLE [DATA_PRAXIS].[USUARIO] (-- revisar longitud password
        [id_usuario] [BIGINT] PRIMARY KEY IDENTITY(1,1),
        [id_persona] [BIGINT] FOREIGN KEY REFERENCES [DATA_PRAXIS].[PERSONA] (id_persona),
        [clave_usuario] [VARCHAR](255) NOT NULL,
        [intentos_ingreso] [int] NOT NULL DEFAULT 0,
        [id_estado_usuario] [TINYINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[ESTADO_USUARIO] (id_estado_usuario),
)




CREATE TABLE [DATA_PRAXIS].[FUNCIONALIDAD](--OK
        [id_funcionalidad] [BIGINT] PRIMARY KEY IDENTITY(1,1),
        [descripcion_funcionalidad] [varchar](255) not null
)




CREATE TABLE [DATA_PRAXIS].[ROL_FUNCIONALIDAD](--OK
        [id_rol] [BIGINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[ROL](id_rol),
        [id_funcionalidad] [BIGINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[FUNCIONALIDAD](id_funcionalidad)
)


CREATE TABLE [DATA_PRAXIS].[USUARIO_ROL]( --OK
        [id_usuario] [BIGINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[USUARIO](id_usuario),
        [id_rol] [BIGINT] not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[ROL](id_rol),
)



CREATE TABLE [DATA_PRAXIS].[CAMBIO_PLAN_HIST](--OK
	[id_usuario] [bigint] not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[USUARIO](id_usuario),
        [fecha_modificacion] [datetime] not null,
        [id_plan_viejo] [numeric](18,0) NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[PLAN_MEDICO] (id_plan_medico),
        [id_plan_nuevo] [numeric](18,0) NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[PLAN_MEDICO] (id_plan_medico),
        [motivo_del_cambio] [varchar](255) null
        constraint pk_historial_cambio_planes_t PRIMARY KEY (id_usuario, fecha_modificacion)
)


CREATE TABLE [DATA_PRAXIS].[PROFESIONAL_ESPECIALIDAD] (--OK
        [id_profesional] [BIGINT] not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[PROFESIONAL] (id_profesional),
        [id_especialidad ][numeric](18,0) not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[ESPECIALIDAD] (id_especialidad)
)


CREATE TABLE [DATA_PRAXIS].[TIPO_ESPECIALIDAD]( --OK
	[id_tipo_especialidad] NUMERIC(18,0) PRIMARY KEY,
	[descripcion_tipo_especialidad] [varchar](255) NOT NULL
)


CREATE TABLE [DATA_PRAXIS].[ESPECIALIDAD]( --OK
	[id_especialidad] NUMERIC(18,0) PRIMARY KEY,
	[id_tipo_especialidad] NUMERIC (18,0) FOREIGN KEY REFERENCES DATA_PRAXIS.TIPO_ESPECIALIDAD (ID_TIPO_ESPECIALIDAD),
	[descripcion_especialidad] [varchar](255) NOT NULL
)



CREATE TABLE [DATA_PRAXIS].[BONO_CONSULTA]( --revisar si hace falta el campo id receta
        id_bono_consulta numeric(18,0) primary key,
        id_receta bigint null FOREIGN KEY References DATA_PRAXIS.RECETA (id_receta), --
     	id_bono_compra bigint FOREIGN KEY references DATA_PRAXIS.BONO_COMPRA (id_bono_compra),
        precio_compra numeric(18,2) null,
        numero_consulta int
)


CREATE TABLE [DATA_PRAXIS].[BONO_FARMACIA]( --OK
	id_bono_farmacia numeric(18,0) primary key,
	id_receta bigint FOREIGN KEY references DATA_PRAXIS.RECETA (id_receta),
	id_bono_compra bigint FOREIGN KEY references DATA_PRAXIS.BONO_COMPRA (id_bono_compra)
	precio_compra numeric(18,2) null
)

CREATE TABLE [DATA_PRAXIS].[BONO_COMPRA]( --OK
	id_bono_compra bigint identity(1,1) primary key,
	id_afiliado bigint FOREIGN KEY references DATA_PRAXIS.AFILIADO (id_afiliado),
	id_plan_medico numeric(18,0) FOREIGN KEY references DATA_PRAXIS.PLAN_MEDICO (id_plan_medico),
	id_consulta bigint foreign key references DATA_PRAXIS.CONSULTA(id_consulta),
	precio_total numeric(18,2)
)


CREATE TABLE DATA_PRAXIS.CONSULTA ( --OK
        id_consulta BIGINT identity(1,1) PRIMARY KEY,
        id_bono_consulta numeric(18,0) not null FOREIGN KEY REFERENCES DATA_PRAXIS.BONO_CONSULTA (id_bono_consulta),
        horario_llegada datetime null,
        sintomas varchar(255) null,
        diagnostico varchar(255) null
)



CREATE TABLE [DATA_PRAXIS].[AGENDA]( 
        [fecha_turno] [date] not null,
        [id_horario_turno] [BIGINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[HORARIO_TURNO] (id_horario_turno),
        [id_profesional] [BIGINT] not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[PROFESIONAL] (id_profesional),
        [id_consulta] [BIGINT] FOREIGN KEY REFERENCES [DATA_PRAXIS].[CONSULTA](id_consulta),
        [id_turno] [numeric](18,0) null,
        [id_afiliado] [BIGINT] foreign key references [DATA_PRAXIS].[AFILIADO] (id_afiliado),
        [id_especialidad ] [numeric](18,0) not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[ESPECIALIDAD] (id_especialidad),
        [id_estado_turno] [int] null,
        constraint pk_agenda primary key(fecha,id_horario_turno,id_profesional)
)



--////////////////////////////////
--////  Insertion Section   /////
--//////////////////////////////

--TIPO_DNI --OK
-------------- 

INSERT INTO [DATA_PRAXIS.TIPO_DOCUMENTO] (id_tipo_documento, descripcion_tipo_documento)
	VALUES(1,'D.N.I.'),(2,'PASAPORTE'),(3,'L.C'),(4,'C.I.'),(5,'L.E')

--SEXO -- OK
------------

INSERT INTO [DATA_PRAXIS.SEXO] (id_sexo, descripcion_sexo)
	VALUES(1,'MUJER'),(2,'HOMBRE')

--HORARIO_TURNO --OK
--------------------

INSERT INTO [DATA_PRAXIS.HORARIO_TURNO] (horario_turno)
VALUES ('00:00 - 00:30 hs.'),('00:30 - 01:00 hs.'),('01:00 - 01:30 hs.'),('01:30 - 02:00 hs.'),('02:00 - 02:30 hs.'),('02:30 - 03:00 hs.'),('03:00 - 03:30 hs.'),('03:30 - 04:00 hs.'),('04:00 - 04:30 hs.'),('04:30 - 05:00 hs.'),('05:00 - 05:30 hs.'),('05:30 - 06:00 hs.'),('06:00 - 06:30 hs.'),('06:30 - 07:00 hs.'),('07:00 - 07:30 hs.'),('07:30 - 08:00 hs.'),('08:00 - 08:30 hs.'),('08:30 - 09:00 hs.'),('09:00 - 09:30 hs.'),('09:30 - 10:00 hs.'),('10:00 - 10:30 hs.'),('10:30 - 11:00 hs.'),('11:00 - 11:30 hs.'),('11:30 - 12:00 hs.'),('12:00 - 12:30 hs.'),('12:30 - 13:00 hs.'),('13:00 - 13:30 hs.'),('13:30 - 14:00 hs.'),('14:00 - 14:30 hs.'),('14:30 - 15:00 hs.'),('15:00 - 15:30 hs.'),('15:30 - 16:00 hs.'),('16:00 - 16:30 hs.'),('16:30 - 17:00 hs.'),('17:00 - 17:30 hs.'),('17:30 - 18:00 hs.'),('18:00 - 18:30 hs.'),('18:30 - 19:00 hs.'),('19:00 - 19:30 hs.'),('19:30 - 20:00 hs.'),('20:00 - 20:30 hs.'),('20:30 - 21:00 hs.'),('21:00 - 21:30 hs.'),('21:30 - 22:00 hs.'),('22:00 - 22:30 hs.'),('22:30 - 23:00 hs.'),('23:00 - 23:30 hs.'),('23:30 - 00:00 hs.')

--Estado-Civil --OK
-------------------

INSERT INTO [DATA_PRAXIS.ESTADO_CIVIL] (id_estado_civil, descripcion_estado_civil)
(1,'Soltero-a'),(2,'Casado-a'),(3,'Divorciado-a'),(4,'Viudo-a'),(5,'Separado-a'),(6,'Concubino-a'),(7,'Difunto-a')

--Estado-Turno --OK
-------------------

INSERT INTO [DATA_PRAXIS.ESTADO_TURNO] (id_estado_turno, estado_turno)
VALUES (1,'DISPONIBLE'), (2,'OTORGADO')

INSERT INTO [DATA_PRAXIS.PERSONA] (
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
NULL--id_estado_civil
FROM gd_esquema.Maestra




