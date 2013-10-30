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


--TIPO_DNI --OK
------------- 
INSERT INTO DATA_PRAXIS.TIPO_DOCUMENTO VALUES(1,'DNI')

--PERSONA --OK
------------- 
INSERT INTO DATA_PRAXIS.PERSONA(
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
NULL,--id_sexo
0,--cant familiares a cargo
NULL--id_estado_civil

FROM gd_esquema.Maestra




--AFILIADO (joineo los datos personales contra la tabla maestra)
---------

INSERT INTO DATA_PRAXIS.AFILIADOS

SELECT plan_med_codigo, 0 /*(nro_bono_consulta arranca en 0)*/,funcion_retornar_id_persona(paciente_dni), NULL
FROM maestra a, persona b
WHERE a.dni = b.dni


--TIPO ESPECIALIDAD
--------------

INSERT INTO DATA_PRAXIS.TIPO_ESPECIALIDAD

SELECT DISTINCT ESPECIALIDAD_TIPO_CODIGO, ESPECIALIDAD_TIPO_DESCRIPCION
FROM MAESTRA
WHERE ESPECIALIDAD_TIPO_CODIGO IS NOT NULL


--ESPECIALIDAD
--------------

INSERT INTO DATA_PRAXIS.ESPECIALIDAD

SELECT DISTINCT ESPECIALIDAD_CODIGO, ESPECIALIDAD_DESCRIPCION, ESPECIALIDAD_TIPO_CODIGO
FROM MAESTRA
WHERE ESPECIALIDAD_CODIGO IS NOT NULL


--PROFESIONAL (joineo los datos personales contra la tabla maestra)
-------------

INSERT INTO DATA_PRAXIS.AFILIADOS

SELECT a.id_plan_medico, b.id_persona, NULL(matricula), NULL(fecha_baja)
FROM maestra a, datos_persona b
WHERE a.dni = b.dni


--MEDICAMENTO
------------

INSERT INTO DATA_PRAXIS.MEDICAMENTOS

SELECT distinct varchar_medicamento
FROM maestra
where varchar_medicamento is not null


--PLAN MEDICO
-------------

INSERT INTO DATA_PRAXIS.PLAN_MEDICO

SELECT distinct plan_med_codigo, plan_med_descr, plan_med_precio_consulta, null , plan_med_precio_farmacia, null 
FROM maestra
where plan_med_codigo is not null






--AGENDA y CONSULTA (no hay turnos sin consulta en la tabla maestra)
-------------------

INSERT INTO DATA_PRAXIS.AGENDA

SELECT turno_fecha, 
funcion_obtener_id_horario(turno_horario), 
funcion_obtener_id_profesional(medico_dni), 
funcion_inserta_consulta_y_obtener_id_consulta(consulta_sintomas,consulta_enfermedades,bono_consulta_numero), --MIGRACION CONSULTA 
turno_numero,
funcion_obtener_id_afiliado(paciente_dni),
especialidad_codigo,
funcion_obtener_id_estado_turno(libre)

FROM maestra
where turno_fecha is not null




--BONOS_COMPRA
------------
--falta...


--BONOS_FARMACIA
--------------
--falta...


--BONOS_CONSULTA
--------------
--falta...
