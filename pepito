CREATE TABLE [DATA_PRAXIS].[USUARIOS](
    [id_usuario] [varchar](20) NOT NULL,
    [password] [varchar](20) NOT NULL,
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


CREATE TABLE [DATA_PRAXIS].[AFILIADOS](
    [id_usuario] [varchar](20) NOT NULL,
    [nombre] [varchar](20) NOT NULL,
    [id_afiliado_principal] [varchar](20) NOT NULL,
    [id_afiliado_sufijo] [varchar](20) NOT NULL,
    [apellido] [varchar](20) NOT NULL,
    [dirección_completa] [varchar](20) NOT NULL,
    [telefono] [varchar](20) NOT NULL,
    [mail] [varchar](20) NOT NULL,
    [fecha_nacimiento] [varchar](20) NOT NULL,
    [sexo] [varchar](20) NOT NULL,
    [estado_civil] [varchar](20) NOT NULL,
    [cantidad_familiares_a_cargo] [varchar](20) NOT NULL,
    [id_plan_medico] [varchar](20) NOT NULL,
    [cantidad_bonos_consulta] [varchar](20) NOT NULL,
    [tipo_documento] [varchar](20) NOT NULL,
    [numero_documento] [varchar](20) NOT NULL,
    [estado_afiliado] [varchar](20) NOT NULL
)


CREATE TABLE [DATA_PRAXIS].[HISTORIAL_CAMBIOS_PLANES](
    [fecha_modificación] [varchar](20) NOT NULL,
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


CREATE TABLE [DATA_PRAXIS].[ESPECIALIDADES](
    [id_especialidad] [varchar](20) NOT NULL,
    [id_tipo_especialidad] [varchar](20) NOT NULL
    [descripcion_especialidad] [varchar](20) NOT NULL
)


CREATE TABLE [DATA_PRAXIS].[TIPO_ESPECIALIDAD](
    [id_tipo_especialidad] [varchar](20) NOT NULL
    [descripcion_tipo_especialidad] [varchar](20) NOT NULL
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
