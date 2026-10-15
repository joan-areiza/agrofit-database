/* =========================================================
   CONSULTAS BÁSICAS CON SELECT Y FILTRADO (1-10)
   ========================================================= */

-- 1. Listar todos los usuarios registrados en el sistema
SELECT *
FROM usuarios;

-- 2. Consultar los datos de los centros de formación
SELECT nombre_centro, direccion_centro
FROM centros_formacion;

-- 3. Filtrar usuarios de tipo aprendiz
SELECT u.numero_documento_usuario,
       u.nombres_usuario,
       u.apellidos_usuario,
       u.correo_usuario
FROM usuarios u
INNER JOIN roles r ON u.id_rol_usuario_fk = r.id_rol_pk
WHERE r.nombre_rol = 'APRENDIZ';

-- 4. Consultar fichas de formación en jornada diurna
SELECT f.numero_ficha, f.fecha_inicio_ficha
FROM fichas_formacion f
INNER JOIN jornadas j ON f.id_jornada_ficha_fk = j.id_jornada_pk
WHERE j.nombre_jornada = 'DIURNA';

-- 5. Buscar máquinas operativas
SELECT nombre_maquina
FROM maquinas
WHERE estado_maquina = 1;          -- Ajusta el valor según cómo se guarde "OPERATIVA" (1 = operativa)

-- 6. Filtrar ejercicios por grupo muscular (id_musculo = 7 → Cuádriceps)
SELECT *
FROM ejercicios
WHERE id_musculo_ejercicio_fk = 7;

-- 7. Consultar rutinas de nivel principiante
SELECT r.nombre_rutina, o.nombre_objetivo_rutina
FROM rutinas r
INNER JOIN niveles_rutina n ON r.id_nivel_rutina_fk = n.id_nivel_rutina_pk
INNER JOIN objetivos_rutina o ON r.id_objetivo_rutina_fk = o.id_objetivo_rutina_pk
WHERE n.nombre_nivel_rutina = 'Principiante';

-- 8. Usar operador BETWEEN para edades (18 a 22 años)
SELECT nombres_usuario,
       apellidos_usuario,
       TIMESTAMPDIFF(YEAR, fecha_nacimiento_usuario, CURDATE()) AS edad
FROM usuarios
WHERE TIMESTAMPDIFF(YEAR, fecha_nacimiento_usuario, CURDATE()) BETWEEN 18 AND 22;

-- 9. Usar operador IN para tipos de documento
SELECT *
FROM usuarios
WHERE cod_tipo_documento_usuario_fk IN ('CC', 'CE');

-- 10. Usar operador LIKE para buscar correos institucionales del SENA
SELECT *
FROM usuarios
WHERE correo_usuario LIKE '%@sena.edu.co'
   OR correo_usuario LIKE '%@misena.edu.co';


/* =========================================================
   ORDENAMIENTO, LÍMITES Y DISTINCT (11-20)
   ========================================================= */

-- 11. Ordenar usuarios por edad de forma descendente
SELECT nombres_usuario,
       apellidos_usuario,
       TIMESTAMPDIFF(YEAR, fecha_nacimiento_usuario, CURDATE()) AS edad
FROM usuarios
ORDER BY edad DESC;

-- 12. Limitar el resultado de los registros de progreso
SELECT *
FROM seguimientos_progreso_usuario
LIMIT 5;

-- 13. Obtener jornadas distintas de las fichas
SELECT DISTINCT j.nombre_jornada
FROM fichas_formacion f
INNER JOIN jornadas j ON f.id_jornada_ficha_fk = j.id_jornada_pk;

-- 14. Ordenar alfabéticamente los programas de formación
SELECT nombre_programa
FROM programas_formacion
ORDER BY nombre_programa ASC;

-- 15. Consultar los 3 aprendices con mayor peso registrado
SELECT u.nombres_usuario,
       u.apellidos_usuario,
       e.peso_evaluacion
FROM evaluaciones_fisicas e
INNER JOIN usuarios u ON e.id_usuario_evaluacion_fk = u.id_usuario_pk
INNER JOIN aprendices a ON u.id_usuario_pk = a.id_usuario_aprendiz_fk
ORDER BY e.peso_evaluacion DESC
LIMIT 3;

-- 16. Usar OFFSET para paginación de usuarios
SELECT *
FROM usuarios
LIMIT 5 OFFSET 10;

-- 17. Ordenar ejercicios por nombre de máquina asociada
SELECT e.*, m.nombre_maquina
FROM ejercicios e
LEFT JOIN maquinas m ON e.id_maquina_ejercicio_fk = m.id_maquina_pk
ORDER BY e.id_maquina_ejercicio_fk ASC;

-- 18. Filtrar y ordenar las asignaciones de rutinas activas
SELECT *
FROM asignaciones_rutina_usuario
WHERE estado_asignacion_rutina = 1          -- Ajusta según el valor de 'ACTIVA'
ORDER BY fecha_hora_inicio_asignacion_rutina DESC;

-- 19. Listar dependencias de un centro específico ordenadas
SELECT d.nombre_dependencia_funcionario
FROM dependencias_funcionario d
WHERE d.cod_centro_dependencia_fk = '1'    -- Ajusta el código real del centro
ORDER BY d.nombre_dependencia_funcionario ASC;

-- 20. Obtener estados únicos de las máquinas
SELECT DISTINCT estado_maquina
FROM maquinas;


/* =========================================================
   FUNCIONES AGREGADAS Y AGRUPAMIENTOS (21-30)
   ========================================================= */

-- 21. Contar el total de usuarios registrados
SELECT COUNT(*) AS total_usuarios
FROM usuarios;

-- 22. Calcular el peso promedio de los aprendices
SELECT AVG(e.peso_evaluacion) AS peso_promedio_aprendices
FROM evaluaciones_fisicas e
INNER JOIN usuarios u ON e.id_usuario_evaluacion_fk = u.id_usuario_pk
INNER JOIN aprendices a ON u.id_usuario_pk = a.id_usuario_aprendiz_fk;

-- 23. Encontrar la altura máxima y mínima
SELECT MAX(altura_evaluacion) AS altura_maxima,
       MIN(altura_evaluacion) AS altura_minima
FROM evaluaciones_fisicas;

-- 24. Sumar el total de series de un ejercicio en las rutinas
SELECT SUM(series_rutina) AS total_series
FROM detalles_rutina
WHERE id_ejercicio_rutina_fk = 1;

-- 25. Agrupar fichas por jornada
SELECT j.nombre_jornada, COUNT(*) AS cantidad_fichas
FROM fichas_formacion f
INNER JOIN jornadas j ON f.id_jornada_ficha_fk = j.id_jornada_pk
GROUP BY j.nombre_jornada;

-- 26. Agrupar máquinas por estado
SELECT estado_maquina, COUNT(*) AS cantidad
FROM maquinas
GROUP BY estado_maquina;

-- 27. Filtrar agrupamientos con HAVING (Jornadas con más de 5 fichas)
SELECT j.nombre_jornada, COUNT(*) AS cantidad_fichas
FROM fichas_formacion f
INNER JOIN jornadas j ON f.id_jornada_ficha_fk = j.id_jornada_pk
GROUP BY j.nombre_jornada
HAVING COUNT(*) > 5;

-- 28. Calcular el promedio de edad por tipo de usuario
SELECT r.nombre_rol,
       AVG(TIMESTAMPDIFF(YEAR, u.fecha_nacimiento_usuario, CURDATE())) AS edad_promedio
FROM usuarios u
INNER JOIN roles r ON u.id_rol_usuario_fk = r.id_rol_pk
WHERE r.nombre_rol IN ('APRENDIZ', 'FUNCIONARIO')
GROUP BY r.nombre_rol;

-- 29. Contar músculos por parte del cuerpo (más de 2)
SELECT p.nombre_parte_cuerpo, COUNT(*) AS cantidad_musculos
FROM musculos m
INNER JOIN partes_cuerpo p ON m.id_parte_cuerpo_musculo_fk = p.id_parte_cuerpo_pk
GROUP BY p.nombre_parte_cuerpo
HAVING COUNT(*) > 2;

-- 30. Obtener la sumatoria de repeticiones por rutina
SELECT r.nombre_rutina, SUM(d.repeticiones_rutina) AS total_repeticiones
FROM detalles_rutina d
INNER JOIN rutinas r ON d.id_rutina_fk = r.id_rutina_pk
GROUP BY r.nombre_rutina;


/* =========================================================
   CONSULTAS CON JOINS / CRUCE DE TABLAS (31-48)
   ========================================================= */

-- 31. INNER JOIN: Listar aprendices con su código de ficha
SELECT u.numero_documento_usuario,
       u.nombres_usuario,
       u.apellidos_usuario,
       f.numero_ficha
FROM aprendices a
INNER JOIN usuarios u ON a.id_usuario_aprendiz_fk = u.id_usuario_pk
INNER JOIN fichas_formacion f ON a.id_ficha_aprendiz_fk = f.id_ficha_formacion_pk;

-- 32. LEFT JOIN: Mostrar todos los usuarios y sus seguimientos de progreso
SELECT u.*, s.*
FROM usuarios u
LEFT JOIN seguimientos_progreso_usuario s ON u.id_usuario_pk = s.id_usuario_progreso_fk;

-- 33. RIGHT JOIN: Listar ejercicios y sus respectivas máquinas
SELECT e.nombre_ejercicio, m.nombre_maquina
FROM ejercicios e
RIGHT JOIN maquinas m ON e.id_maquina_ejercicio_fk = m.id_maquina_pk;

-- 34. Relacionar dependencias con sus centros de formación
SELECT d.nombre_dependencia_funcionario, c.nombre_centro
FROM dependencias_funcionario d
INNER JOIN centros_formacion c ON d.cod_centro_dependencia_fk = c.cod_centro_pk;

-- 35. Consultar ejercicios con sus respectivos músculos y partes del cuerpo
SELECT e.nombre_ejercicio,
       m.nombre_musculo,
       p.nombre_parte_cuerpo
FROM ejercicios e
INNER JOIN musculos m ON e.id_musculo_ejercicio_fk = m.id_musculo_pk
INNER JOIN partes_cuerpo p ON m.id_parte_cuerpo_musculo_fk = p.id_parte_cuerpo_pk;

-- 36. Listar asignaciones de rutinas con nombres de usuario e instructor
SELECT aru.*,
       CONCAT(u.nombres_usuario, ' ', u.apellidos_usuario) AS nombre_usuario,
       ei.nombre_especialidad_instructor
FROM asignaciones_rutina_usuario aru
INNER JOIN aprendices a ON aru.id_usuario_fk = a.id_aprendiz_pk
INNER JOIN usuarios u ON a.id_usuario_aprendiz_fk = u.id_usuario_pk
INNER JOIN instructores i ON aru.id_instructor_asigna_rutina_fk = i.id_instructor_pk
INNER JOIN especialidades_instructor ei ON i.id_especialidad_instructor_fk = ei.id_especialidad_instructor_pk;

-- 37. Consultar fichas y sus programas de formación
SELECT f.numero_ficha,
       j.nombre_jornada,
       p.nombre_programa
FROM fichas_formacion f
INNER JOIN jornadas j ON f.id_jornada_ficha_fk = j.id_jornada_pk
INNER JOIN programas_formacion p ON f.id_programa_ficha_fk = p.id_programa_pk;

-- 38. Listar funcionarios y sus dependencias
SELECT CONCAT(u.nombres_usuario, ' ', u.apellidos_usuario) AS nombre_completo,
       d.nombre_dependencia_funcionario
FROM funcionarios f
INNER JOIN usuarios u ON f.id_usuario_funcionario_fk = u.id_usuario_pk
INNER JOIN dependencias_funcionario d ON f.id_dependencia_funcionario_fk = d.id_dependencia_funcionario_pk;

-- 39. Detalle completo de ejercicios dentro de una rutina
SELECT e.nombre_ejercicio,
       d.series_rutina,
       d.repeticiones_rutina
FROM detalles_rutina d
INNER JOIN rutinas r ON d.id_rutina_fk = r.id_rutina_pk
INNER JOIN ejercicios e ON d.id_ejercicio_rutina_fk = e.id_ejercicio_pk
WHERE r.nombre_rutina = 'Hipertrofia de Tren Superior';

-- 40. Programas de formación por centro de formación (Agropecuario)
SELECT p.nombre_programa, c.nombre_centro
FROM programas_formacion p
INNER JOIN centros_formacion c ON p.cod_centro_formacion_programa_fk = c.cod_centro_pk
WHERE c.nombre_centro LIKE '%Agropecuario%';

-- 41. Obtener instructores y los datos personales de su usuario asociado
SELECT ei.nombre_especialidad_instructor,
       u.numero_documento_usuario,
       u.nombres_usuario,
       u.apellidos_usuario
FROM instructores i
INNER JOIN usuarios u ON i.id_usuario_instructor_fk = u.id_usuario_pk
INNER JOIN especialidades_instructor ei ON i.id_especialidad_instructor_fk = ei.id_especialidad_instructor_pk;

-- 42. Seguimiento de progreso con nombres de usuario
SELECT e.peso_evaluacion,
       e.grasa_corporal_evaluacion,
       u.nombres_usuario,
       u.apellidos_usuario
FROM evaluaciones_fisicas e
INNER JOIN usuarios u ON e.id_usuario_evaluacion_fk = u.id_usuario_pk;

-- 43. Ejercicios que no requieren ninguna máquina
SELECT *
FROM ejercicios
WHERE id_maquina_ejercicio_fk IS NULL;

-- 44. Conteo de aprendices por cada ficha de formación
SELECT f.numero_ficha, COUNT(*) AS cantidad_aprendices
FROM aprendices a
INNER JOIN fichas_formacion f ON a.id_ficha_aprendiz_fk = f.id_ficha_formacion_pk
GROUP BY f.numero_ficha;

-- 45. Listar dependencias del centro de formación de Teleinformática
SELECT d.nombre_dependencia_funcionario
FROM dependencias_funcionario d
INNER JOIN centros_formacion c ON d.cod_centro_dependencia_fk = c.cod_centro_pk
WHERE c.nombre_centro LIKE '%Teleinformática%';

-- 46. Máquinas utilizadas en ejercicios de tren superior (Pecho)
SELECT DISTINCT m.nombre_maquina
FROM ejercicios e
INNER JOIN maquinas m ON e.id_maquina_ejercicio_fk = m.id_maquina_pk
INNER JOIN musculos mu ON e.id_musculo_ejercicio_fk = mu.id_musculo_pk
WHERE mu.nombre_musculo LIKE '%Pectoral%'
   OR mu.nombre_musculo LIKE '%Pecho%';

-- 47. Consultar funcionarios que laboran en dependencias de Bienestar al Aprendiz
SELECT u.*
FROM funcionarios f
INNER JOIN usuarios u ON f.id_usuario_funcionario_fk = u.id_usuario_pk
INNER JOIN dependencias_funcionario d ON f.id_dependencia_funcionario_fk = d.id_dependencia_funcionario_pk
WHERE d.nombre_dependencia_funcionario = 'Bienestar al Aprendiz';

-- 48. Relación de rutinas y la cantidad de ejercicios que poseen
SELECT r.nombre_rutina, COUNT(d.id_detalle_rutina_pk) AS cantidad_ejercicios
FROM rutinas r
LEFT JOIN detalles_rutina d ON r.id_rutina_pk = d.id_rutina_fk
GROUP BY r.nombre_rutina;


/* =========================================================
   SUBCONSULTAS Y CTEs (49-51)
   ========================================================= */

-- 49. Subconsulta en WHERE: Usuarios con peso superior al promedio
SELECT u.nombres_usuario, u.apellidos_usuario, e.peso_evaluacion
FROM evaluaciones_fisicas e
INNER JOIN usuarios u ON e.id_usuario_evaluacion_fk = u.id_usuario_pk
WHERE e.peso_evaluacion > (
    SELECT AVG(peso_evaluacion)
    FROM evaluaciones_fisicas
);

-- 50. Subconsulta con IN: Aprendices de fichas con jornada nocturna
SELECT u.nombres_usuario, u.apellidos_usuario
FROM aprendices a
INNER JOIN usuarios u ON a.id_usuario_aprendiz_fk = u.id_usuario_pk
WHERE a.id_ficha_aprendiz_fk IN (
    SELECT f.id_ficha_formacion_pk
    FROM fichas_formacion f
    INNER JOIN jornadas j ON f.id_jornada_ficha_fk = j.id_jornada_pk
    WHERE j.nombre_jornada = 'NOCTURNA'
);

-- 51. Usar una CTE (WITH) para calcular estadísticas de peso
WITH peso_maximo_por_rol AS (
    SELECT r.nombre_rol,
           MAX(e.peso_evaluacion) AS peso_maximo
    FROM evaluaciones_fisicas e
    INNER JOIN usuarios u ON e.id_usuario_evaluacion_fk = u.id_usuario_pk
    INNER JOIN roles r ON u.id_rol_usuario_fk = r.id_rol_pk
    GROUP BY r.nombre_rol
)
SELECT * FROM peso_maximo_por_rol;