begin tran

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

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[ROL]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.ROL 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATA_PRAXIS].[FUNCIONALIDAD]') AND type in (N'U'))
DROP TABLE DATA_PRAXIS.FUNCIONALIDAD

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
