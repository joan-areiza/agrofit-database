CREATE DATABASE IF NOT EXISTS `agrofit`;

USE `agrofit`;

	CREATE TABLE IF NOT EXISTS `regiones` (
		`id_region_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_region` varchar(100) NOT NULL,
		PRIMARY KEY (`id_region_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `sexos` (
		`cod_sexo_pk` char(6) NOT NULL,
		`nombre_sexo` varchar(100) NOT NULL,
		PRIMARY KEY (`cod_sexo_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `tipos_documento` (
		`cod_tipo_documento_pk` char(6) NOT NULL,
		`nombre_tipo_documento` varchar(100) NOT NULL,
		PRIMARY KEY (`cod_tipo_documento_pk`) 
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `tipos_sangre` (
		`cod_tipo_sangre_pk` char(6) NOT NULL,
		`nombre_tipo_sangre` varchar(100) NOT NULL,
		PRIMARY KEY (`cod_tipo_sangre_pk`) 
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `estados_civil` (
		`id_estado_civil_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_estado_civil` varchar(100) NOT NULL,
		PRIMARY KEY (`id_estado_civil_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `roles` (
		`id_rol_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_rol` varchar(100) NOT NULL,
		PRIMARY KEY (`id_rol_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `hospitales` (
		`cod_hospital_pk` char(6) NOT NULL,
		`nombre_hospital` varchar(100) NOT NULL,
		`direccion_hospital` varchar(150) NOT NULL,
		PRIMARY KEY (`cod_hospital_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `eps` (
		`cod_eps_pk` char(6) NOT NULL,
		`nombre_eps` varchar(100) NOT NULL,
		`telefono_eps` char(11) NOT NULL,
		`direccion_eps` varchar(150) NOT NULL,
		PRIMARY KEY (`cod_eps_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `niveles_administrador` (
		`id_nivel_administrador_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_nivel_administrador` varchar(100) NOT NULL,
		PRIMARY KEY (`id_nivel_administrador_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `especialidades_entrenador` (
		`id_especialidad_entrenador_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_especialidad_entrenador` varchar(100) NOT NULL,
		PRIMARY KEY (`id_especialidad_entrenador_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `estados_aprendiz` (
		`id_estado_aprendiz_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_estado_aprendiz` varchar(100) NOT NULL,
		PRIMARY KEY (`id_estado_aprendiz_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `estados_funcionario` (
		`id_estado_funcionario_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_estado_funcionario` varchar(100) NOT NULL,
		PRIMARY KEY (`id_estado_funcionario_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `estados_rutina` (
		`id_estado_rutina_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_estado_rutina` varchar(100) NOT NULL,
		PRIMARY KEY (`id_estado_rutina_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `jornadas` (
		`id_jornada_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_jornada` varchar(100) NOT NULL,
		`estado_jornada` tinyint(1) NOT NULL,
		PRIMARY KEY (`id_jornada_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `modalidades` (
		`id_modalidad_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_modalidad` varchar(100) NOT NULL,
		PRIMARY KEY (`id_modalidad_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `niveles_actividad_fisica` (
		`id_nivel_actividad_fisica_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_nivel_actividad_fisica` varchar(100) NOT NULL,
		PRIMARY KEY (`id_nivel_actividad_fisica_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `niveles_formacion_programa` (
		`id_niveles_formacion_programa_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_nivel_formacion_programa` varchar(100) NOT NULL,
		PRIMARY KEY (`id_niveles_formacion_programa_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `niveles_rutina` (
		`id_nivel_rutina_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_nivel_rutina` varchar(100) NOT NULL,
		PRIMARY KEY (`id_nivel_rutina_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `objetivos_rutina` (
		`id_objetivo_rutina_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_objetivo_rutina` varchar(150) NOT NULL,
		`descripcion_objetivo` text DEFAULT NULL,
		PRIMARY KEY (`id_objetivo_rutina_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `partes_cuerpo` (
		`id_parte_cuerpo_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_parte_cuerpo` varchar(60) NOT NULL,
		`descripcion_parte_cuerpo` text DEFAULT NULL,
		PRIMARY KEY (`id_parte_cuerpo_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `requisitos_programa` (
		`id_requisito_programa_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_requisito_programa` varchar(100) NOT NULL,
		PRIMARY KEY (`id_requisito_programa_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `tipos_maquina` (
		`id_tipo_maquina_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_tipo_maquina` varchar(100) NOT NULL,
		PRIMARY KEY (`id_tipo_maquina_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `tipos_participacion_musculo` (
		`id_tipo_participacion_musculo_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_tipo_participacion_musculo` varchar(100) NOT NULL,
		PRIMARY KEY (`id_tipo_participacion_musculo_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `antecedentes_medicos` (
		`id_antecedente_medico_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_antecedente_medico` varchar(100) NOT NULL,
		PRIMARY KEY (`id_antecedente_medico_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `complexiones_fisicas` (
		`id_complexion_fisica_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_complexion_fisica` varchar(100) NOT NULL,
		PRIMARY KEY (`id_complexion_fisica_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `departamentos` (
		`cod_departamento_pk` char(6) NOT NULL,
		`nombre_departamento` varchar(100) NOT NULL,
		`id_region_departamento_fk` int(11) NOT NULL,
		PRIMARY KEY (`cod_departamento_pk`),
		KEY `id_region_departamento_fk` (`id_region_departamento_fk`),
		CONSTRAINT `id_region_departamento_fk` FOREIGN KEY (`id_region_departamento_fk`) REFERENCES `regiones` (`id_region_pk`) ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `municipios` (
		`cod_municipio_pk` char(6) NOT NULL,
		`nombre_municipio` varchar(150) NOT NULL,
		`cod_departamento_municipio_fk` char(6) NOT NULL,
		PRIMARY KEY (`cod_municipio_pk`),
		KEY `cod_departamento_municipio_fk` (`cod_departamento_municipio_fk`),
		CONSTRAINT `cod_departamento_municipio_fk` FOREIGN KEY (`cod_departamento_municipio_fk`) REFERENCES `departamentos` (`cod_departamento_pk`) ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `centros_formacion` (
		`id_centro_pk` int(11) NOT NULL AUTO_INCREMENT,
		`cod_centro` char(6) NOT NULL,
		`nombre_centro` varchar(100) NOT NULL,
		`direccion_centro` varchar(150) NOT NULL,
		`dias_permitidos` int(2) NOT NULL,
		`cod_municipio_centro_fk` char(6) NOT NULL,
		PRIMARY KEY (`id_centro_pk`),
        UNIQUE KEY `cod_centro` (`cod_centro`),
		KEY `cod_municipio_centro_fk` (`cod_municipio_centro_fk`),
		CONSTRAINT `cod_municipio_centro_fk` FOREIGN KEY (`cod_municipio_centro_fk`) REFERENCES `municipios` (`cod_municipio_pk`) ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `sedes` (
		`id_sede_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_sede` varchar(100) NOT NULL,
		`direccion_sede` varchar(50) NOT NULL,
		`id_centro_sede_fk` int(11) NOT NULL,
		PRIMARY KEY (`id_sede_pk`),
		KEY `id_centro_sede_fk` (`id_centro_sede_fk`),
		CONSTRAINT `id_centro_sede_fk` FOREIGN KEY (`id_centro_sede_fk`) REFERENCES `centros_formacion` (`id_centro_pk`) ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `dependencias_funcionario` (
		`id_dependencia_funcionario_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_dependencia_funcionario` varchar(100) NOT NULL,
		`id_centro_dependencia_fk` int(11) NOT NULL,
		PRIMARY KEY (`id_dependencia_funcionario_pk`),
		KEY `id_centro_dependencia_fk` (`id_centro_dependencia_fk`),
		CONSTRAINT `id_centro_dependencia_fk` FOREIGN KEY (`id_centro_dependencia_fk`) REFERENCES `centros_formacion` (`id_centro_pk`) ON DELETE NO ACTION ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `usuarios` (
		`id_usuario_pk` int(11) NOT NULL AUTO_INCREMENT,
		`numero_documento_usuario` varchar(11) NOT NULL,
		`cod_tipo_documento_usuario_fk` char(6) NOT NULL,
		`correo_usuario` varchar(120) NOT NULL,
		`telefono_usuario` varchar(11) DEFAULT NULL,
		`telefono_emergencia_usuario` varchar(11) DEFAULT NULL,
		`clave_usuario` varchar(64) NOT NULL,
		`nombres_usuario` varchar(100) NOT NULL,
		`apellidos_usuario` varchar(100) NOT NULL,
		`cod_sexo_usuario_fk` char(6) NOT NULL,
		`cod_tipo_sangre_usuario_fk` char(6) NOT NULL,
		`fecha_nacimiento_usuario` date NOT NULL,
		`id_estado_civil_usuario_fk` int(11) NOT NULL,
		`cod_departamento_usuario_fk` char(6) NOT NULL,
		`cod_municipio_usuario_fk` char(6) NOT NULL,
		`direccion_usuario` varchar(150) NOT NULL,
		`foto_usuario` blob DEFAULT NULL,
		`fecha_registro_usuario` datetime NOT NULL,
		`estado_usuario` tinyint(1) NOT NULL,
		`id_rol_usuario_fk` int(11) NOT NULL,
		`cod_hospital_usuario_fk` char(6) NOT NULL,
		`cod_eps_usuario_fk` char(6) NOT NULL,
		PRIMARY KEY (`id_usuario_pk`, `numero_documento_usuario`),
		UNIQUE KEY `correo_usuario` (`correo_usuario`),
		KEY `cod_tipo_documento_usuario_fk` (`cod_tipo_documento_usuario_fk`),
		KEY `cod_sexo_usuario_fk` (`cod_sexo_usuario_fk`),
		KEY `cod_tipo_sangre_usuario_fk` (`cod_tipo_sangre_usuario_fk`),
		KEY `id_estado_civil_usuario_fk` (`id_estado_civil_usuario_fk`),
		KEY `cod_departamento_usuario_fk` (`cod_departamento_usuario_fk`),
		KEY `cod_municipio_usuario_fk` (`cod_municipio_usuario_fk`),
		KEY `id_rol_usuario_fk` (`id_rol_usuario_fk`),
		KEY `cod_hospital_usuario_fk` (`cod_hospital_usuario_fk`),
		KEY `cod_eps_usuario_fk` (`cod_eps_usuario_fk`),
		CONSTRAINT `cod_departamento_usuario_fk` FOREIGN KEY (`cod_departamento_usuario_fk`) REFERENCES `departamentos` (`cod_departamento_pk`) ON UPDATE CASCADE,
		CONSTRAINT `cod_municipio_usuario_fk` FOREIGN KEY (`cod_municipio_usuario_fk`) REFERENCES `municipios` (`cod_municipio_pk`) ON UPDATE CASCADE,
		CONSTRAINT `cod_sexo_usuario_fk` FOREIGN KEY (`cod_sexo_usuario_fk`) REFERENCES `sexos` (`cod_sexo_pk`) ON UPDATE CASCADE,
		CONSTRAINT `cod_tipo_documento_usuario_fk` FOREIGN KEY (`cod_tipo_documento_usuario_fk`) REFERENCES `tipos_documento` (`cod_tipo_documento_pk`) ON UPDATE CASCADE,
		CONSTRAINT `cod_tipo_sangre_usuario_fk` FOREIGN KEY (`cod_tipo_sangre_usuario_fk`) REFERENCES `tipos_sangre` (`cod_tipo_sangre_pk`) ON UPDATE CASCADE,
		CONSTRAINT `cod_eps_usuario_fk` FOREIGN KEY (`cod_eps_usuario_fk`) REFERENCES `eps` (`cod_eps_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_estado_civil_usuario_fk` FOREIGN KEY (`id_estado_civil_usuario_fk`) REFERENCES `estados_civil` (`id_estado_civil_pk`) ON UPDATE CASCADE,
		CONSTRAINT `cod_hospital_usuario_fk` FOREIGN KEY (`cod_hospital_usuario_fk`) REFERENCES `hospitales` (`cod_hospital_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_rol_usuario_fk` FOREIGN KEY (`id_rol_usuario_fk`) REFERENCES `roles` (`id_rol_pk`) ON DELETE NO ACTION ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `estados_contacto` (
		`id_estado_contacto_pk` INT(11) NOT NULL AUTO_INCREMENT,
		`nombre_estado` VARCHAR(50) NOT NULL,
		PRIMARY KEY (`id_estado_contacto_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `mensajes_contacto` (
		`id_mensaje_pk` INT(11) NOT NULL AUTO_INCREMENT,
		`nombres_remitente` VARCHAR(150) NOT NULL,
		`correo_remitente` VARCHAR(150) NOT NULL,
		`titulo_mensaje` VARCHAR(150) NOT NULL,
		`contenido_mensaje` TEXT NOT NULL,
		`fecha_envio` DATETIME NOT NULL,
		`id_estado_contacto_fk` INT(11) NOT NULL,
		PRIMARY KEY (`id_mensaje_pk`),
		KEY `id_estado_contacto_fk` (`id_estado_contacto_fk`),
		CONSTRAINT `id_estado_contacto_fk` FOREIGN KEY (`id_estado_contacto_fk`) REFERENCES `estados_contacto` (`id_estado_contacto_pk`) ON UPDATE CASCADE ON DELETE NO ACTION
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `entrenadores` (
		`id_entrenador_pk` int(11) NOT NULL AUTO_INCREMENT,
		`id_usuario_entrenador_fk` int(11) NOT NULL,
		`id_especialidad_entrenador_fk` int(11) NOT NULL,
		`estado_entrenador` tinyint(1) NOT NULL,
		PRIMARY KEY (`id_entrenador_pk`),
		KEY `id_usuario_entrenador_fk` (`id_usuario_entrenador_fk`),
		KEY `id_especialidad_entrenador_fk` (`id_especialidad_entrenador_fk`),
		CONSTRAINT `id_especialidad_entrenador_fk` FOREIGN KEY (`id_especialidad_entrenador_fk`) REFERENCES `especialidades_entrenador` (`id_especialidad_entrenador_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_usuario_entrenador_fk` FOREIGN KEY (`id_usuario_entrenador_fk`) REFERENCES `usuarios` (`id_usuario_pk`) ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `administradores` (
		`id_administrador_pk` int(11) NOT NULL AUTO_INCREMENT,
		`id_usuario_administrador_fk` int(11) NOT NULL,
		`id_nivel_acceso_administrador_fk` int(11) NOT NULL,
		`estado_administrador` tinyint(1) NOT NULL,
		PRIMARY KEY (`id_administrador_pk`),
		KEY `id_usuario_administrador_fk` (`id_usuario_administrador_fk`),
		KEY `id_nivel_acceso_administrador_pk` (`id_nivel_acceso_administrador_fk`),
		CONSTRAINT `id_nivel_acceso_administrador_pk` FOREIGN KEY (`id_nivel_acceso_administrador_fk`) REFERENCES `niveles_administrador` (`id_nivel_administrador_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_usuario_administrador_fk` FOREIGN KEY (`id_usuario_administrador_fk`) REFERENCES `usuarios` (`id_usuario_pk`) ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `funcionarios` (
		`id_funcionario_pk` int(11) NOT NULL AUTO_INCREMENT,
		`id_usuario_funcionario_fk` int(11) NOT NULL,
		`id_dependencia_funcionario_fk` int(11) NOT NULL,
		`id_estado_funcionario_fk` int(11) NOT NULL,
		PRIMARY KEY (`id_funcionario_pk`),
		KEY `id_usuario_funcionario_fk` (`id_usuario_funcionario_fk`),
		KEY `id_dependencia_funcionario_fk` (`id_dependencia_funcionario_fk`),
		KEY `id_estado_funcionario_fk` (`id_estado_funcionario_fk`),
		CONSTRAINT `id_dependencia_funcionario_fk` FOREIGN KEY (`id_dependencia_funcionario_fk`) REFERENCES `dependencias_funcionario` (`id_dependencia_funcionario_pk`) ON UPDATE CASCADE,
		CONSTRAINT `id_estado_funcionario_fk` FOREIGN KEY (`id_estado_funcionario_fk`) REFERENCES `estados_funcionario` (`id_estado_funcionario_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_usuario_funcionario_fk` FOREIGN KEY (`id_usuario_funcionario_fk`) REFERENCES `usuarios` (`id_usuario_pk`) ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `programas_formacion` (
		`id_programa_pk` int(11) NOT NULL AUTO_INCREMENT,
		`cod_programa` char(6) NOT NULL,
		`nombre_programa` varchar(200) NOT NULL,
		`id_requisito_programa_fk` int(11) NOT NULL,
		`duracion_programa` int(4) NOT NULL,
		`id_centro_formacion_programa_fk` int(11) NOT NULL,
		`id_nivel_formacion_programa_fk` int(11) NOT NULL,
		`estado_programa` tinyint(1) NOT NULL,
		PRIMARY KEY (`id_programa_pk`),
        UNIQUE KEY `cod_programa` (`cod_programa`),
		KEY `id_requisito_programa_fk` (`id_requisito_programa_fk`),
		KEY `id_nivel_formacion_programa_fk` (`id_nivel_formacion_programa_fk`),
		KEY `id_centro_formacion_programa_fk` (`id_centro_formacion_programa_fk`),
		CONSTRAINT `id_centro_formacion_programa_fk` FOREIGN KEY (`id_centro_formacion_programa_fk`) REFERENCES `centros_formacion` (`id_centro_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_nivel_formacion_programa_fk` FOREIGN KEY (`id_nivel_formacion_programa_fk`) REFERENCES `niveles_formacion_programa` (`id_niveles_formacion_programa_pk`) ON UPDATE CASCADE,
		CONSTRAINT `id_requisito_programa_fk` FOREIGN KEY (`id_requisito_programa_fk`) REFERENCES `requisitos_programa` (`id_requisito_programa_pk`) ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `fichas_formacion` (
		`id_ficha_formacion_pk` int(11) NOT NULL AUTO_INCREMENT,
		`numero_ficha` varchar(7) NOT NULL,
		`id_programa_ficha_fk` int(11) NOT NULL,
		`id_jornada_ficha_fk` int(11) NOT NULL,
		`id_sede_ficha_fk` int(11) NOT NULL,
		`fecha_inicio_ficha` date NOT NULL,
		`fecha_fin_ficha` date NOT NULL,
		`estado_ficha` tinyint(1) NOT NULL,
		`id_modalidad_ficha_fk` int(11) NOT NULL,
		`id_instructor_lider_ficha_fk` int(11) NOT NULL,
		PRIMARY KEY (`id_ficha_formacion_pk`),
		UNIQUE KEY `numero_ficha` (`numero_ficha`),
		KEY `id_programa_ficha_fk` (`id_programa_ficha_fk`),
		KEY `id_jornada_ficha_fk` (`id_jornada_ficha_fk`),
		KEY `id_modalidad_ficha_fk` (`id_modalidad_ficha_fk`),
		KEY `id_instructor_lider_ficha_fk` (`id_instructor_lider_ficha_fk`),
		KEY `id_sede_ficha_fk` (`id_sede_ficha_fk`),
		CONSTRAINT `id_instructor_lider_ficha_fk` FOREIGN KEY (`id_instructor_lider_ficha_fk`) REFERENCES `funcionarios` (`id_funcionario_pk`) ON UPDATE CASCADE,
		CONSTRAINT `id_jornada_ficha_fk` FOREIGN KEY (`id_jornada_ficha_fk`) REFERENCES `jornadas` (`id_jornada_pk`) ON UPDATE CASCADE,
		CONSTRAINT `id_modalidad_ficha_fk` FOREIGN KEY (`id_modalidad_ficha_fk`) REFERENCES `modalidades` (`id_modalidad_pk`) ON UPDATE CASCADE,
		CONSTRAINT `id_programa_ficha_fk` FOREIGN KEY (`id_programa_ficha_fk`) REFERENCES `programas_formacion` (`id_programa_pk`) ON UPDATE CASCADE,
		CONSTRAINT `id_sede_ficha_fk` FOREIGN KEY (`id_sede_ficha_fk`) REFERENCES `sedes` (`id_sede_pk`) ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `aprendices` (
		`id_aprendiz_pk` int(11) NOT NULL AUTO_INCREMENT,
		`id_usuario_aprendiz_fk` int(11) NOT NULL,
        `id_estado_aprendiz_fk` int(11) NOT NULL,
		PRIMARY KEY (`id_aprendiz_pk`),
		KEY `id_usuario_aprendiz_fk` (`id_usuario_aprendiz_fk`),
        KEY `id_estado_aprendiz_fk` (`id_estado_aprendiz_fk`),
		CONSTRAINT `id_estado_aprendiz_fk` FOREIGN KEY (`id_estado_aprendiz_fk`) REFERENCES `estados_aprendiz` (`id_estado_aprendiz_pk`) ON UPDATE CASCADE,
		CONSTRAINT `id_usuario_aprendiz_fk` FOREIGN KEY (`id_usuario_aprendiz_fk`) REFERENCES `usuarios` (`id_Usuario_pk`) ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `fichas_usuarios` (
		`id_ficha_usuario_pk` INT(11) NOT NULL AUTO_INCREMENT,
		`id_ficha_fk` INT(11) NOT NULL,
		`id_usuario_ficha_fk` INT(11) NOT NULL,
		`fecha_inscripcion` DATE NOT NULL,
		PRIMARY KEY (`id_ficha_usuario_pk`),
		KEY `id_ficha_fk` (`id_ficha_fk`),
		KEY `id_usuario_ficha_fk` (`id_usuario_ficha_fk`),
		CONSTRAINT `id_ficha_fk` FOREIGN KEY (`id_ficha_fk`) REFERENCES `fichas_formacion` (`id_ficha_formacion_pk`) ON UPDATE CASCADE ON DELETE NO ACTION,
		CONSTRAINT `id_usuario_ficha_fk` FOREIGN KEY (`id_usuario_ficha_fk`) REFERENCES `usuarios` (`id_usuario_pk`) ON UPDATE CASCADE ON DELETE NO ACTION
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;
	
	CREATE TABLE IF NOT EXISTS `estados_maquina` (
		`id_estado_maquina_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_estado_maquina` varchar(100) NOT NULL,
		PRIMARY KEY (`id_estado_maquina_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;
	
	CREATE TABLE IF NOT EXISTS `maquinas` (
		`id_maquina_pk` int(11) NOT NULL AUTO_INCREMENT,
		`cod_inventario` char(6) NOT NULL,
		`nombre_maquina` varchar(100) NOT NULL,
		`id_estado_maquina_fk` int(11) NOT NULL,
		`id_tipo_maquina_fk` int(11) NOT NULL,
		`descripcion_maquina` text DEFAULT NULL,
		PRIMARY KEY (`id_maquina_pk`),
        UNIQUE KEY `cod_inventario` (`cod_inventario`),
		KEY `id_tipo_maquina_fk` (`id_tipo_maquina_fk`),
		KEY `id_estado_maquina_fk` (`id_estado_maquina_fk`),
		CONSTRAINT `id_tipo_maquina_fk` FOREIGN KEY (`id_tipo_maquina_fk`) REFERENCES `tipos_maquina` (`id_tipo_maquina_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_estado_maquina_fk` FOREIGN KEY (`id_estado_maquina_fk`) REFERENCES `estados_maquina` (`id_estado_maquina_pk`) ON DELETE NO ACTION ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `musculos` (
		`id_musculo_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_musculo` varchar(80) NOT NULL,
		`decripcion_musculo` text DEFAULT NULL,
		`id_parte_cuerpo_musculo_fk` int(11) NOT NULL,
		PRIMARY KEY (`id_musculo_pk`),
		KEY `id_parte_cuerpo_musculo_fk` (`id_parte_cuerpo_musculo_fk`),
		CONSTRAINT `id_parte_cuerpo_musculo_fk` FOREIGN KEY (`id_parte_cuerpo_musculo_fk`) REFERENCES `partes_cuerpo` (`id_parte_cuerpo_pk`) ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `ejercicios` (
		`id_ejercicio_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_ejercicio` varchar(100) NOT NULL,
		`descripcion_ejercicio` text DEFAULT NULL,
		`url_video_demo_ejercicio` varchar(150) NOT NULL,
		`id_maquina_ejercicio_fk` int(11) DEFAULT NULL,
		`id_musculo_ejercicio_fk` int(11) NOT NULL,
		PRIMARY KEY (`id_ejercicio_pk`),
		KEY `id_maquina_ejercicio_fk` (`id_maquina_ejercicio_fk`),
		KEY `id_musculo_ejercicio_fk` (`id_musculo_ejercicio_fk`),
		CONSTRAINT `id_maquina_ejercicio_fk` FOREIGN KEY (`id_maquina_ejercicio_fk`) REFERENCES `maquinas` (`id_maquina_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_musculo_ejercicio_fk` FOREIGN KEY (`id_musculo_ejercicio_fk`) REFERENCES `musculos` (`id_musculo_pk`) ON DELETE NO ACTION ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;


	CREATE TABLE IF NOT EXISTS `ejercicios_musculo` (
		`id_ejercicio_musculo_pk` int(11) NOT NULL AUTO_INCREMENT,
		`id_ejercicio_fk` int(11) NOT NULL,
		`id_musculo_fk` int(11) NOT NULL,
		`id_tipo_participacion_musculo_fk` int(11) NOT NULL,
		PRIMARY KEY (`id_ejercicio_musculo_pk`),
		KEY `id_ejercicio_fk` (`id_ejercicio_fk`),
		KEY `id_musculo_fk` (`id_musculo_fk`),
		KEY `id_tipo_participacion_musculo_fk` (`id_tipo_participacion_musculo_fk`),
		CONSTRAINT `id_ejercicio_fk` FOREIGN KEY (`id_ejercicio_fk`) REFERENCES `ejercicios` (`id_ejercicio_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_musculo_fk` FOREIGN KEY (`id_musculo_fk`) REFERENCES `musculos` (`id_musculo_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_tipo_participacion_musculo_fk` FOREIGN KEY (`id_tipo_participacion_musculo_fk`) REFERENCES `tipos_participacion_musculo` (`id_tipo_participacion_musculo_pk`) ON DELETE NO ACTION ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `rutinas` (
		`id_rutina_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_rutina` varchar(100) NOT NULL,
		`id_objetivo_rutina_fk` int(11) NOT NULL,
		`id_nivel_rutina_fk` int(11) NOT NULL,
		`id_estado_rutina_fk` int(11) NOT NULL,
		PRIMARY KEY (`id_rutina_pk`),
		KEY `id_objeti_rutina_fk` (`id_objetivo_rutina_fk`),
		KEY `id_niv_rutina_fk` (`id_nivel_rutina_fk`),
		KEY `id_estado_rutina_fk` (`id_estado_rutina_fk`),
		CONSTRAINT `id_estado_rutina_fk` FOREIGN KEY (`id_estado_rutina_fk`) REFERENCES `estados_rutina` (`id_estado_rutina_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_niv_rutina_fk` FOREIGN KEY (`id_nivel_rutina_fk`) REFERENCES `niveles_rutina` (`id_nivel_rutina_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_objeti_rutina_fk` FOREIGN KEY (`id_objetivo_rutina_fk`) REFERENCES `objetivos_rutina` (`id_objetivo_rutina_pk`) ON DELETE NO ACTION ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `detalles_rutina` (
		`id_detalle_rutina_pk` int(11) NOT NULL AUTO_INCREMENT,
        `id_rutina_fk` int(11) NOT NULL,
		`id_ejercicio_rutina_fk` int(11) NOT NULL,
		`series_rutina` int(2) NOT NULL,
		`repeticiones_rutina` int(2) NOT NULL,
        `carga_rutina` decimal(5, 2) DEFAULT NULL,
		`descanso_segundos` int(3) NOT NULL,
		PRIMARY KEY (`id_detalle_rutina_pk`),
		KEY `id_rutina_per_fk` (`id_rutina_fk`),
		KEY `id_ejercicio_rutina_fk` (`id_ejercicio_rutina_fk`),
		CONSTRAINT `id_ejercicio_rutina_fk` FOREIGN KEY (`id_ejercicio_rutina_fk`) REFERENCES `ejercicios` (`id_ejercicio_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_rutina_per_fk` FOREIGN KEY (`id_rutina_fk`) REFERENCES `rutinas` (`id_rutina_pk`) ON DELETE NO ACTION ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `horarios` (
		`id_horario_pk` int(11) NOT NULL AUTO_INCREMENT,
		`id_jornada_horario_fk` int(11) NOT NULL,
		`hora_inicio_horario` time NOT NULL,
		`hora_fin_horario` time NOT NULL,
		`cupo_maximo_horario` int(2) NOT NULL,
		`id_entrenador_horario_fk` int(11) NOT NULL,
		`estado_horario` tinyint(1) NOT NULL,
		PRIMARY KEY (`id_horario_pk`),
		KEY `id_jornada_horario_fk` (`id_jornada_horario_fk`),
		KEY `id_entrenador_horario_fk` (`id_entrenador_horario_fk`),
		CONSTRAINT `id_entrenador_horario_fk` FOREIGN KEY (`id_entrenador_horario_fk`) REFERENCES `entrenadores` (`id_entrenador_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_jornada_horario_fk` FOREIGN KEY (`id_jornada_horario_fk`) REFERENCES `jornadas` (`id_jornada_pk`) ON DELETE NO ACTION ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `estados_asignacion` (
		`id_estado_asignacion_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_estado_asignacion` varchar(100) NOT NULL,
		PRIMARY KEY (`id_estado_asignacion_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;
	
	CREATE TABLE IF NOT EXISTS `asignaciones_rutina_usuario` (
		`id_asignacion_rutina_usuario_pk` int(11) NOT NULL AUTO_INCREMENT,
		`id_rutina_fk` int(11) NOT NULL,
		`id_usuario_fk` int(11) NOT NULL,
		`fecha_hora_inicio_asignacion_rutina` datetime NOT NULL,
		`fecha_hora_fin_asignacion_rutina` datetime NOT NULL,
		`id_estado_asignacion_rutina_fk` int(11) NOT NULL,
		`id_entrenador_asigna_rutina_fk` int(11) NOT NULL,
		PRIMARY KEY (`id_asignacion_rutina_usuario_pk`),
		KEY `id_rutina_fk` (`id_rutina_fk`),
		KEY `id_usuario_fk` (`id_usuario_fk`),
		KEY `id_entrenador_asigna_rutina_fk` (`id_entrenador_asigna_rutina_fk`),
		KEY `id_estado_asignacion_rutina_fk` (`id_estado_asignacion_rutina_fk`),
		CONSTRAINT `id_entrenador_asigna_rutina_fk` FOREIGN KEY (`id_entrenador_asigna_rutina_fk`) REFERENCES `entrenadores` (`id_entrenador_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_rutina_fk` FOREIGN KEY (`id_rutina_fk`) REFERENCES `rutinas` (`id_rutina_pk`) ON UPDATE CASCADE,
		CONSTRAINT `id_usuario_fk` FOREIGN KEY (`id_usuario_fk`) REFERENCES `aprendices` (`id_aprendiz_pk`) ON UPDATE CASCADE,
		CONSTRAINT `id_estado_asignacion_rutina_fk` FOREIGN KEY (`id_estado_asignacion_rutina_fk`) REFERENCES `estados_asignacion` (`id_estado_asignacion_pk`) ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `asistencias` (
		`id_asistencia_pk` int(11) NOT NULL AUTO_INCREMENT,
		`id_aprendiz_asistencia_fk` int(11) NOT NULL,
		`id_entrenador_asistencia_fk` int(11) NOT NULL,
		`id_rutina_asistencia_fk` int(11) NOT NULL,
		`fecha_asistencia` datetime NOT NULL,
		`estado_asistencia` tinyint(1) NOT NULL,
		PRIMARY KEY (`id_asistencia_pk`),
		KEY `id_aprendiz_asistencia_fk` (`id_aprendiz_asistencia_fk`),
		KEY `id_entrenador_asistencia_fk` (`id_entrenador_asistencia_fk`),
		KEY `id_rutina_asistencia_fk` (`id_rutina_asistencia_fk`),
		CONSTRAINT `id_aprendiz_asistencia_fk` FOREIGN KEY (`id_aprendiz_asistencia_fk`) REFERENCES `aprendices` (`id_aprendiz_pk`) ON UPDATE CASCADE,
		CONSTRAINT `id_entrenador_asistencia_fk` FOREIGN KEY (`id_entrenador_asistencia_fk`) REFERENCES `entrenadores` (`id_entrenador_pk`) ON UPDATE CASCADE,
		CONSTRAINT `id_rutina_asistencia_fk` FOREIGN KEY (`id_rutina_asistencia_fk`) REFERENCES `rutinas` (`id_rutina_pk`) ON DELETE NO ACTION ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `evaluaciones_fisicas` (
		`id_evaluacion_fisica_pk` int(11) NOT NULL AUTO_INCREMENT,
		`peso_evaluacion` decimal(5, 2) NOT NULL,
		`id_nivel_actividad_fisica_evaluacion_fk` int(11) NOT NULL,
		`id_antecedente_medico_evaluacion_fk` int(11) NOT NULL,
		`fecha_evaluacion` datetime NOT NULL,
		`grasa_corporal_evaluacion` decimal(4, 2) NOT NULL,
		`grasa_muscular_evaluacion` decimal(5, 2) NOT NULL,
		`altura_evaluacion` decimal(3, 2) NOT NULL,
		`observacion_evaluacion` text DEFAULT NULL,
		`id_usuario_evaluacion_fk` int(11) NOT NULL,
		`id_entrenador_encargado_evaluacion_fk` int(11) NOT NULL,
		`id_complexion_fisica_evaluacion_fk` int(11) NOT NULL,
		`presion_sistolica` SMALLINT NOT NULL,
        `presion_diastolica` SMALLINT NOT NULL,
		`imc_evaluacion` decimal(4, 2) NOT NULL,
		`medida_cintura` decimal(5, 2) NOT NULL,  
		`medida_cadera` decimal(5, 2) NOT NULL,
		PRIMARY KEY (`id_evaluacion_fisica_pk`),
		KEY `id_nivel_actividad_fisica_evaluacion_fk` (`id_nivel_actividad_fisica_evaluacion_fk`),
		KEY `id_usuario_evaluacion_fk` (`id_usuario_evaluacion_fk`),
		KEY `id_entrenador_encargado_evaluacion_fk` (`id_entrenador_encargado_evaluacion_fk`),
		KEY `id_antecedente_medico_evaluacion_fk` (`id_antecedente_medico_evaluacion_fk`),
		KEY `id_complexion_fisica_evaluacion_fk` (`id_complexion_fisica_evaluacion_fk`),
		CONSTRAINT `id_antecedente_medico_evaluacion_fk` FOREIGN KEY (`id_antecedente_medico_evaluacion_fk`) REFERENCES `antecedentes_medicos` (`id_antecedente_medico_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_complexion_fisica_evaluacion_fk` FOREIGN KEY (`id_complexion_fisica_evaluacion_fk`) REFERENCES `complexiones_fisicas` (`id_complexion_fisica_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_usuario_evaluacion_fk` FOREIGN KEY (`id_usuario_evaluacion_fk`) REFERENCES `usuarios` (`id_usuario_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_entrenador_encargado_evaluacion_fk` FOREIGN KEY (`id_entrenador_encargado_evaluacion_fk`) REFERENCES `entrenadores` (`id_entrenador_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_nivel_actividad_fisica_evaluacion_fk` FOREIGN KEY (`id_nivel_actividad_fisica_evaluacion_fk`) REFERENCES `niveles_actividad_fisica` (`id_nivel_actividad_fisica_pk`) ON DELETE NO ACTION ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

	CREATE TABLE IF NOT EXISTS `estados_seguimiento` (
		`id_estado_seguimiento_pk` int(11) NOT NULL AUTO_INCREMENT,
		`nombre_estado_seguimiento` varchar(100) NOT NULL,
		PRIMARY KEY (`id_estado_seguimiento_pk`)
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;
	
	CREATE TABLE IF NOT EXISTS `seguimientos_progreso_usuario` (
		`id_seguimiento_progreso_usuario_pk` int(11) NOT NULL AUTO_INCREMENT,
		`horas_ludicas` int(2) NOT NULL,
		`rutinas_completadas` int(3) NOT NULL,
		`fecha_registro_progreso` datetime NOT NULL,
		`id_estado_seguimiento_fk` int(11) NOT NULL,
		`id_evaluacion_fisica_fk` int(11) NOT NULL,
		`observacion_progreso_usuario` text DEFAULT NULL,
		`id_objetivo_actual_fk` int(11) NOT NULL,
		`logros_avances` text DEFAULT NULL,
		`aspectos_a_mejorar` text DEFAULT NULL,
		PRIMARY KEY (`id_seguimiento_progreso_usuario_pk`),
		KEY `id_estado_seguimiento_fk` (`id_estado_seguimiento_fk`),
		KEY `id_objetivo_actual_fk` (`id_objetivo_actual_fk`),
		KEY `id_evaluacion_fisica_fk` (`id_evaluacion_fisica_fk`),
		CONSTRAINT `id_estado_seguimiento_fk` FOREIGN KEY (`id_estado_seguimiento_fk`) REFERENCES `estados_seguimiento` (`id_estado_seguimiento_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_objetivo_actual_fk` FOREIGN KEY (`id_objetivo_actual_fk`) REFERENCES `objetivos_rutina` (`id_objetivo_rutina_pk`) ON DELETE NO ACTION ON UPDATE CASCADE,
		CONSTRAINT `id_evaluacion_fisica_fk` FOREIGN KEY (`id_evaluacion_fisica_fk`) REFERENCES `evaluaciones_fisicas` (`id_evaluacion_fisica_pk`) ON DELETE NO ACTION ON UPDATE CASCADE
	) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

