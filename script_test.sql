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

CREATE TABLE DATA_PRAXIS.BONO_FARMACIA( --OK
	id_bono_farmacia numeric(18,0) primary key,
	--id_receta bigint FOREIGN KEY references DATA_PRAXIS.RECETA (id_receta),
	id_bono_compra bigint FOREIGN KEY references DATA_PRAXIS.BONO_COMPRA (id_bono_compra),
	precio_compra numeric(18,2) null,
	fecha_impresion datetime
)

CREATE TABLE DATA_PRAXIS.MEDICAMENTO  (
	id_medicamento BIGINT IDENTITY(1,1) PRIMARY KEY,
	descripcion_medicamento VARCHAR(255)
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
        [id_horario_turno] [TINYINT] NOT NULL FOREIGN KEY REFERENCES [DATA_PRAXIS].[HORARIO_TURNO] (id_horario_turno),
        [id_profesional] [BIGINT] not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[PROFESIONAL] (id_profesional),
        [id_consulta] [BIGINT] FOREIGN KEY REFERENCES [DATA_PRAXIS].[CONSULTA](id_consulta),
        [id_turno] [numeric](18,0) null,
        [id_afiliado] [BIGINT] foreign key references [DATA_PRAXIS].[AFILIADO] (id_afiliado),
        [id_especialidad ] [numeric](18,0) not null FOREIGN KEY REFERENCES [DATA_PRAXIS].[ESPECIALIDAD] (id_especialidad),
        [id_estado_turno] [int] null,
        constraint pk_agenda primary key(fecha_turno,id_horario_turno,id_profesional)
)






CREATE INDEX pepito
ON DATA_PRAXIS.PERSONA(numero_documento)

GO

--////////////////////////////////////////////////
--  /////    Section - Functions     ///////////////
--////////////////////////////////////////////////

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

SELECT  A.BONO_FARMACIA_NUMERO,  D.id_bono_compra,E.precio_bono_farmacia, A.COMPRA_BONO_FECHA
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
insert into datapraxis.agenda(fecha_turno,id_horario_turno,id_profesional,id,turno,id_afiliado,id_especialidad,id_estado_turno)

select a.Turno_Fecha, b.id_horario_turno, e.id_profesional, NULL as 'id_consulta', a.Turno_Numero, f.id_afiliado, a.Especialidad_Codigo, 2
from (
	select * --este select deberia traer solamente los turnos reservados sin concretar
	from gd_esquema.Maestra 
	where 
	Medico_Dni is not null and 
	Turno_numero is not null and
	compra_bono_fecha is null and
	consulta_sintomas is null) a

left join data_praxis.horario_turno b on b.horario_turno=CAST(a.turno_fecha as TIME)
left join data_praxis.persona c on c.numero_documento=a.Paciente_Dni 
left join data_praxis.persona d on d.numero_documento=a.Medico_Dni
left join data_praxis.profesional e on d.id_persona=e.id_persona
left join data_praxis.afiliado f on c.id_persona=f.id_persona


--CONSULTA
-----------

/*
Pregunta1: En la tabla maestra, un turno concretado tiene tambien otro registro con el mismo nroTurno para representar la reserva? o cuando se concreta el turno se completan los campos faltantes... ver si hay nro de turno repetido para una misma turno_fecha.
Pregunta2: No conviene usar id_turno en vez de id_consulta? total id_consulta para que sirve, que sentido tiene que exista? complicar la migracion?
*/

commit tran t1;






