--//////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////////////////////////////////////////////////////////////
--/////////////////////////////      MIGRACION     ///////////////////////////////////
--///////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////
/*
En general el problema es con repetir varias veces la consulta de la tabla maestra.
Estaria bueno poder en una misma consulta migrar varias tablas, 
recorriendo una unica vez todas las filas y segun que condicion cumpla cada fila hacer un insert a una u otra tabla
*/

--DATOS_PERSONA
-------------
INSERT INTO datos_persona

SELECT datos_profesionales_persona
FROM maestra

UNION

SELECT datos_pacientes_persona
FROM profesionales



--AFILIADOS (joineo los datos personales contra la tabla maestra)
---------

INSERT INTO AFILIADOS

SELECT funcion_obtener_id_afiliado,  a.id_plan_medico, 0 (nro_bono_consulta arranca en 0), b.id_persona, NULL
FROM maestra a, datos_persona b
WHERE a.dni = b.dni



--PROFESIONALES (joineo los datos personales contra la tabla maestra)
-------------

INSERT INTO AFILIADOS

SELECT a.id_plan_medico, b.id_persona, NULL(matricula), NULL(fecha_baja)
FROM maestra a, datos_persona b
WHERE a.dni = b.dni



--TIPO_ESPECIALIDAD
-----------------
INSERT INTO TIPO_ESPECIALIDADES

SELECT distinct id_tipo_especialidad, descripcion_tipo_especialidad
FROM maestra


--ESPECIALIDADES
--------------

INSERT INTO ESPECIALIDADES

SELECT distinct id_especialidad, id_tipo_especialidad, descripcion_especialidad
FROM maestra


--MEDICAMENTOS
------------

INSERT INTO MEDICAMENTOS

SELECT distinct varchar_medicamento
FROM maestra
where varchar_medicamento is not null


--AGENDA
------
--falta...


--CONSULTA
--------
--falta...


--BONOS_COMPRA
------------
--falta...


--BONOS_FARMACIA
--------------
--falta...


--BONOS_CONSULTA
--------------
--falta...
