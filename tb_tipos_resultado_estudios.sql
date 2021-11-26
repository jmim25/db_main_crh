CREATE TABLE `tb_tipos_resultado_estudios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_corto` varchar(200) NOT NULL COMMENT 'Nombre para presentación de los datos',
  `descripcion` text NULL COMMENT 'Describir su uso',
  `activo` tinyint(1) DEFAULT '1' COMMENT 'bandera para sober si esta o no activo',
  `fecha_auto` datetime DEFAULT NULL COMMENT 'fecha y hora de creacion',
  `fecha_update` datetime DEFAULT NULL COMMENT 'fecha y hora en la que se realizo el ultimo cambio'
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='datos para que los clientes tengan acceso al portal en la version ci4';
