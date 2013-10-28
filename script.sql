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


CREATE TABLE [DATA_PRAXIS].[USUARIOS](
    [id_usuario] [varchar](20) NOT NULL,
    [password] [varchar](20) NOT NULL
)


CREATE TABLE [DATA_PRAXIS].[ROLES](
    [id_rol] [varchar](20) NOT NULL,
    [nombre_rol] [varchar](40) NOT NULL,
    [estado] [varchar](30) NOT NULL
)


CREATE TABLE [DATA_PRAXIS].[FUNCIONES](
    [id_funcion] [varchar](20) NOT NULL,
    [descripcion] [varchar](40) NOT NULL
)


CREATE TABLE [DATA_PRAXIS].[USUARIOS_ROLES](
    [id_usuario] [varchar](20) NOT NULL,
    [id_rol] [varchar](40) NOT NULL,
)


CREATE TABLE [DATA_PRAXIS].[ROLES_FUNCIONES](
    [id_rol] [varchar](20) NOT NULL,
    [id_funcion] [varchar](40) NOT NULL
)



CREATE TABLE [DATA_PRAXIS].[HISTORIAL_CAMBIOS_PLANES](
    [fecha_modificacion] [varchar](20) NOT NULL,
    [id_usuario] [varchar](20) NOT NULL,
    [id_plan_viejo] [varchar](20) NOT NULL,
    [id_plan_nuevo] [varchar](20) NOT NULL,
    [motivo_del_cambio] [varchar](20) NOT NULL,
)


CREATE TABLE [DATA_PRAXIS].[PROFESIONALES](
    [nombre] [varchar](20) NOT NULL,
    [apellido] [varchar](20) NOT NULL,
    [tipo_documento] [varchar](20) NOT NULL,
    [numero_documento] [varchar](20) NOT NULL,
    [direccion_completa] [varchar](20) NOT NULL,
    [telefono] [varchar](20) NOT NULL,
    [mail] [varchar](20) NOT NULL,
    [fecha_nacimiento] [varchar](20) NOT NULL,
    [sexo] [varchar](20) NOT NULL,
    [matricula] [varchar](20) NOT NULL,
    [estado_profesional] [varchar](20) NOT NULL
)


CREATE TABLE [DATA_PRAXIS].[PROFESIONALES_ESPECIALIDAD](
    [id_profesional] [varchar](20) NOT NULL,
    [id_especialidad] [varchar](20) NOT NULL
)


CREATE TABLE [DATA_PRAXIS].[ESPECIALIDADES]( --OK
    [id_especialidad] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
    [id_tipo_especialidad] INT FOREIGN KEY REFERENCES DATA_PRAXIS.TIPO_ESPECIALIDAD (ID_TIPO_ESPECIALIDAD),
    [descripcion_especialidad] [varchar](255) NOT NULL
)


CREATE TABLE [DATA_PRAXIS].[TIPO_ESPECIALIDAD]( --OK
    [id_tipo_especialidad] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
    [descripcion_tipo_especialidad] [varchar](255) NOT NULL
)


CREATE TABLE [DATA_PRAXIS].[PLANES_MEDICOS](
    [id_plan] [varchar](20) NOT NULL
    [descripcion_plan] [varchar](20) NOT NULL
    [precio_bono_consulta] [varchar](20) NOT NULL
    [fecha_asiento_precio_consulta] [varchar](20) NOT NULL    
    [precio_bono_farmacia] [varchar](20) NOT NULL
    [fecha_asiento_precio_farmacia] [varchar](20) NOT NULL    
)


CREATE TABLE [DATA_PRAXIS].[BONO_CONSULTA](
    [id_plan] [varchar](20) NOT NULL
    [fecha_compra] [varchar](20) NOT NULL
    [fecha_vencimiento] [varchar](20) NOT NULL
    [precio_compra] [varchar](20) NOT NULL    
    [id_afiliado] [varchar](20) NOT NULL
    [numero_bono_consulta] [varchar](20) NOT NULL    
)


CREATE TABLE [DATA_PRAXIS].[BONO_FARMACIA](
    [id_plan] [varchar](20) NOT NULL
    [fecha_compra] [varchar](20) NOT NULL
    [descripcion_medicamento] [varchar](20) NOT NULL
    [fecha_vencimiento] [varchar](20) NOT NULL    
    [precio_de_compra] [varchar](20) NOT NULL
)


CREATE TABLE [DATA_PRAXIS].[CONSULTA](
    [id_consulta] [varchar](20) NOT NULL
    [id_turno] [varchar](20) NOT NULL
    [id_bono_consulta] [varchar](20) NOT NULL
    [horario_llegada] [varchar](20) NOT NULL    
    [sintomas] [varchar](20) NOT NULL
    [diagnostico] [varchar](20) NOT NULL
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
