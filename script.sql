--script de creacion de objetos de base de datos

EXEC('CREATE SCHEMA [DATA_PRAXIS] AUTHORIZATION [dbo]')


CREATE TABLE DATA_PRAXIS.TIPO_DOCUMENTO ( --OK
	id_tipo_documento TINYINT PRIMARY KEY,
	descripcion_tipo_documento VARCHAR(20) NOT NULL
)

CREATE TABLE  DATA_PRAXIS.SEXO ( --OK
	id_sexo TINYINT PRIMARY KEY,
	descripcion_sexo VARCHAR(20) NOT NULL
)

CREATE TABLE  DATA_PRAXIS.ESTADO_CIVIL ( --OK
	id_estado_civil TINYINT PRIMARY KEY,
	descripcion_estado_civil VARCHAR(255) NOT NULL
)

CREATE TABLE DATA_PRAXIS.PLAN_MEDICO ( --OK
	id_plan_medico numeric(18,0) PRIMARY KEY,      --plan_med_codigo
	desc_plan_medico VARCHAR(255) NULL,            --plan_med_descripcion
	precio_bono_consulta numeric(18,0),            --plan_med_precio_bono_consulta
	fecha_asiento_precio_bono_consulta DATETIME,   
	precio_bono_farmacia numeric(18,0),            --plan_med_precio_bono_farmacia
	fecha_asiento_precio_bono_farmacia DATETIME
)


CREATE TABLE [DATA_PRAXIS].[PERSONA]( --OK
	[id_persona] [BIGINT] PRIMARY KEY IDENTITY(1,1),
	[id_tipo_documento] [TINYINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[TIPO_DOCUMENTO](id_tipo_documento),
	[numero_documento] [NUMERIC](18,0) NOT NULL, --paciente_dni o medico_dni
	[nombre] [varchar](255)  not null,	     --paciente_nombre o medico_nombre
	[apellido] [varchar](255) not null,          --paciente_apellido o medico_apellido
	[direccion] [varchar](255) not null,         --paciente_direccion o medico_direccion
	[telefono] [numeric](18,0) not null,         --paciente_telefono o medico_telefono
	[mail] [varchar](255) not null,              --paciente_mail o medico_mail
	[fecha_nacimiento] [DATETIME] not null,      --paciente_fecha_nac o medico_fecha_nac
	[id_sexo][TINYINT] FOREIGN KEY REFERENCES [DATA_PRAXIS].[SEXO] (id_sexo),
	[cantidad_familiares_a_cargo][int] not null DEFAULT 0,
	[id_estado_civil] [TINYINT] FOREIGN KEY REFERENCES [DATA_PRAXIS].[ESTADO_CIVIL](id_estado_civil)
)

CREATE TABLE [DATA_PRAXIS].[AFILIADO] ( --OK
        [id_afiliado] [BIGINT] PRIMARY KEY,
        [id_plan_medico] [numeric](18,0) NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[PLANE_MEDICO] (id_plan_medico), --plan_med_codigo
        [numero_consulta] [int]  DEFAULT 0,
        [id_persona] [BIGINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[PERSONA] (id_persona),
        [fecha_baja] [datetime] DEFAULT NULL
)

CREATE TABLE DATA_PRAXIS.PROFESIONAL ( --OK
	id_profesional BIGINT IDENTITY (1,1) PRIMARY KEY,
	[id_persona] [BIGINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[DATOS_PERSONA] (id_persona),
	matricula numeric(18,0) DEFAULT NULL,
	fecha_de_baja DATETIME DEFAULT NULL
)

CREATE TABLE DATA_PRAXIS.HORARIO_TURNO ( --OK
	id_horario_turno TINYINT IDENTITY (1,1) PRIMARY KEY,
	horario [time] NOT NULL
)

CREATE TABLE DATA_PRAXIS.ESTADO_TURNO ( --OK
	id_estados_turno TINYINT IDENTITY (1,1) PRIMARY KEY,
	estado_turno BIT NOT NULL
)

CREATE TABLE DATA_PRAXIS.ESTADO_ROL ( --OK
	id_estado_rol TINYINT IDENTITY (1,1) PRIMARY KEY,
	descripcion_estado_rol VARCHAR(255) NOT NULL
)

CREATE TABLE DATA_PRAXIS.ESTADO_USUARIO ( --OK
	id_estado_usuario TINYINT IDENTITY (1,1) PRIMARY KEY,
	descripcion_estado_usuario VARCHAR(255) NOT NULL
)

CREATE TABLE [DATA_PRAXIS].[USUARIO] (-- revisar longitud password
        [id_usuario] [BIGINT] PRIMARY KEY IDENTITY(1,1),
        [id_persona] [BIGINT] FOREIGN KEY REFERENCES [DATA_PRAXIS].[PERSONA] (id_persona),
        [clave_usuario] [VARCHAR](255) NOT NULL,
        [intentos_ingreso] [int] NOT NULL DEFAULT 0,
        [id_estado_usuario] [TINYINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[ESTADO_USUARIO] (id_estado_usuario),
)


CREATE TABLE [DATA_PRAXIS].[ROL] (--OK
        [id_rol] [INT] PRIMARY KEY IDENTITY(1,1),
        [nombre_rol] [VARCHAR](255) NOT NULL,
        [estado_rol] [int] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[ESTADO_ROL] (id_estado_rol),
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





