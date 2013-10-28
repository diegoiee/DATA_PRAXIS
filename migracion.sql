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

--PERSONA
-------------
INSERT INTO PERSONA

SELECT DISTINCT
'DNI', --tipodoc
ISNULL(paciente_dni,medico_dni),
ISNULL(paciente_nombre,medico_nombre),
ISNULL(paciente_apellido,medico_apellido),
ISNULL(paciente_telefono,medico_telefono),
ISNULL(paciente_direccion,medico_direccion),
ISNULL(paciente_mail,medico_mail),
ISNULL(paciente_fecha_nac,medico_fecha_nac),
NULL,--id_sexo
0,--cant familiares a cargo
NULL--id_estado_civil

FROM maestra

where (paciente_dni is not null) or (medico_dni is not null)



--AFILIADO (joineo los datos personales contra la tabla maestra)
---------

INSERT INTO AFILIADOS

SELECT funcion_obtener_id_afiliado,  a.id_plan_medico, 0 (nro_bono_consulta arranca en 0), b.id_persona, NULL
FROM maestra a, datos_persona b
WHERE a.dni = b.dni


--TIPO ESPECIALIDAD
--------------

INSERT INTO ESPECIALIDAD

SELECT DISTINCT ESPECIALIDAD_TIPO_CODIGO, ESPECIALIDAD_TIPO_DESCRIPCION
FROM MAESTRA
WHERE ESPECIALIDAD_TIPO_CODIGO IS NOT NULL


--ESPECIALIDAD
--------------

INSERT INTO ESPECIALIDAD

SELECT DISTINCT ESPECIALIDAD_CODIGO, ESPECIALIDAD_DESCRIPCION, ESPECIALIDAD_TIPO_CODIGO
FROM MAESTRA
WHERE ESPECIALIDAD_CODIGO IS NOT NULL


--PROFESIONAL (joineo los datos personales contra la tabla maestra)
-------------

INSERT INTO AFILIADOS

SELECT a.id_plan_medico, b.id_persona, NULL(matricula), NULL(fecha_baja)
FROM maestra a, datos_persona b
WHERE a.dni = b.dni


--MEDICAMENTO
------------

INSERT INTO MEDICAMENTOS

SELECT distinct varchar_medicamento
FROM maestra
where varchar_medicamento is not null


--PLAN MEDICO
-------------

INSERT INTO PLAN_MEDICO

SELECT distinct plan_med_codigo, plan_med_descr, plan_med_precio_consulta, null , plan_med_precio_farmacia, null 
FROM maestra
where plan_med_codigo is not null






--AGENDA y CONSULTA (no hay turnos sin consulta en la tabla maestra)
-------------------

INSERT INTO AGENDA

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
