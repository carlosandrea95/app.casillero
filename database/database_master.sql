/*
 Navicat Premium Data Transfer

 Source Server         : SysPayme
 Source Server Type    : MariaDB
 Source Server Version : 100135
 Source Host           : localhost:3306
 Source Schema         : syspayme_db

 Target Server Type    : MariaDB
 Target Server Version : 100135
 File Encoding         : 65001

 Date: 12/11/2018 09:24:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_empresas
-- ----------------------------
DROP TABLE IF EXISTS `sys_empresas`;
CREATE TABLE `sys_empresas`  (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_documento` int(11) NOT NULL,
  `n_documento` int(11) NOT NULL,
  `razon_social` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nu_telefono` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_correo` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_estado` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `co_postal` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_direccion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `img_logo` longblob NOT NULL,
  `es_principal` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_empresa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_empresas
-- ----------------------------
INSERT INTO `sys_empresas` VALUES (1, 0, 293751640, 'Capreluz', '', '', '', '', '', '', 0);

-- ----------------------------
-- Table structure for sys_licensed
-- ----------------------------
DROP TABLE IF EXISTS `sys_licensed`;
CREATE TABLE `sys_licensed`  (
  `id_licence` int(11) NOT NULL AUTO_INCREMENT,
  `intalled` int(11) NOT NULL,
  `license` varchar(65) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `key_serial` varchar(65) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fe_activacion` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fe_vencimiento` varchar(65) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_licence`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_licensed
-- ----------------------------
INSERT INTO `sys_licensed` VALUES (1, 0, '', '', '', '24/09/2018');

-- ----------------------------
-- Table structure for sys_modulos
-- ----------------------------
DROP TABLE IF EXISTS `sys_modulos`;
CREATE TABLE `sys_modulos`  (
  `id_plugin` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `codigo` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_plugin`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_modulos
-- ----------------------------
INSERT INTO `sys_modulos` VALUES (00000000001, 'dashboard');
INSERT INTO `sys_modulos` VALUES (00000000002, 'admin');

-- ----------------------------
-- Table structure for sys_permisos
-- ----------------------------
DROP TABLE IF EXISTS `sys_permisos`;
CREATE TABLE `sys_permisos`  (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `llave` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_permiso`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_permisos_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_permisos_roles`;
CREATE TABLE `sys_permisos_roles`  (
  `id_rol` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `valor` tinyint(4) NULL DEFAULT NULL,
  UNIQUE INDEX `id_rol`(`id_rol`, `id_permiso`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_permisos_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `sys_permisos_usuarios`;
CREATE TABLE `sys_permisos_usuarios`  (
  `id_usuario` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `valor` tinyint(4) NOT NULL,
  UNIQUE INDEX `id_usuario`(`id_usuario`, `id_permiso`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles`  (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_rol`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES (1, 'Programador');
INSERT INTO `sys_roles` VALUES (2, 'Administrador');

-- ----------------------------
-- Table structure for sys_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `sys_usuarios`;
CREATE TABLE `sys_usuarios`  (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NULL DEFAULT NULL,
  `dni` int(11) NOT NULL,
  `nombres` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `apellidos` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `usuario` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `clave` varchar(65) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `forzar_cambio_clave` tinyint(1) NULL DEFAULT NULL,
  `ultimo_ingreso` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ultima_ip` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fecha_creado` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `intentos` tinyint(1) NULL DEFAULT NULL,
  `estatus` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `img_profile` longblob NULL,
  PRIMARY KEY (`id_usuario`) USING BTREE,
  INDEX `id_rol`(`id_rol`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_usuarios
-- ----------------------------
INSERT INTO `sys_usuarios` VALUES (1, 1, 25778113, 'Carlos Jose', 'Sandrea Arellano', 'carlos.sandrea', '9dfedee73167538674c48ac753f73c278f383c22d82182a0e8683d256afbe091', 0, NULL, NULL, '19/09/2018', NULL, 'A', NULL);

-- ----------------------------
-- Table structure for tab_bancos
-- ----------------------------
DROP TABLE IF EXISTS `tab_bancos`;
CREATE TABLE `tab_bancos`  (
  `id_banco` int(11) NOT NULL AUTO_INCREMENT,
  `da_banco` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_banco`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_bancos
-- ----------------------------
INSERT INTO `tab_bancos` VALUES (1, 'BOD');

-- ----------------------------
-- Table structure for tab_cargos
-- ----------------------------
DROP TABLE IF EXISTS `tab_cargos`;
CREATE TABLE `tab_cargos`  (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `da_cargo` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_cargo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_cargos
-- ----------------------------
INSERT INTO `tab_cargos` VALUES (1, 'Analista de Programación');
INSERT INTO `tab_cargos` VALUES (2, 'Soporte Tecnico');
INSERT INTO `tab_cargos` VALUES (3, 'Aseadora');

-- ----------------------------
-- Table structure for tab_concepto_empleados
-- ----------------------------
DROP TABLE IF EXISTS `tab_concepto_empleados`;
CREATE TABLE `tab_concepto_empleados`  (
  `id_concepto_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `id_concepto` int(11) NULL DEFAULT NULL,
  `id_empleado` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_concepto_empleado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_concepto_empleados
-- ----------------------------
INSERT INTO `tab_concepto_empleados` VALUES (1, 1, 1);
INSERT INTO `tab_concepto_empleados` VALUES (2, 1, 2);
INSERT INTO `tab_concepto_empleados` VALUES (3, 2, 1);
INSERT INTO `tab_concepto_empleados` VALUES (4, 1, 3);

-- ----------------------------
-- Table structure for tab_conceptos
-- ----------------------------
DROP TABLE IF EXISTS `tab_conceptos`;
CREATE TABLE `tab_conceptos`  (
  `id_concepto` int(255) NOT NULL AUTO_INCREMENT,
  `co_concepto` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `da_concepto` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_tipo_concepto` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_tipo` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_concepto`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_conceptos
-- ----------------------------
INSERT INTO `tab_conceptos` VALUES (1, 'X800', 'APORTE CAJA DE AHORRO', 'F', 'D');
INSERT INTO `tab_conceptos` VALUES (5, NULL, 'PRIMA PROFECIONAL', 'F', 'A');
INSERT INTO `tab_conceptos` VALUES (6, 'Y997', 'BOUTIQUE CAPRELUZ', 'V', 'D');
INSERT INTO `tab_conceptos` VALUES (7, 'Y857', 'NEREIDA PARRA', 'V', 'D');
INSERT INTO `tab_conceptos` VALUES (9, '', 'PRIMA ANTIGUEDAD', 'F', 'A');
INSERT INTO `tab_conceptos` VALUES (11, 'Y854', 'EMERGENCIA SALUB', 'V', 'D');
INSERT INTO `tab_conceptos` VALUES (12, '', 'PRIMA DEDICACION', 'F', 'A');
INSERT INTO `tab_conceptos` VALUES (13, 'X802', 'EMERGENCIA', 'V', 'D');
INSERT INTO `tab_conceptos` VALUES (14, 'Y811', 'OPTICA', 'V', 'D');
INSERT INTO `tab_conceptos` VALUES (15, 'Y814', 'AUXILIO MUTUO', 'F', 'D');
INSERT INTO `tab_conceptos` VALUES (17, 'X852', 'MELASME', 'F', 'A');
INSERT INTO `tab_conceptos` VALUES (18, 'DDAS', 'ASDDAD', 'F', 'D');
INSERT INTO `tab_conceptos` VALUES (20, 'x805', 'xs848515ad', 'f', 'v');
INSERT INTO `tab_conceptos` VALUES (23, 'dad', 'asd', 'e', 'e');
INSERT INTO `tab_conceptos` VALUES (24, 'asd', 'sad', 's', 'a');

-- ----------------------------
-- Table structure for tab_contratos
-- ----------------------------
DROP TABLE IF EXISTS `tab_contratos`;
CREATE TABLE `tab_contratos`  (
  `id_contrato` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_contato` int(11) NOT NULL,
  `da_descripcion` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fe_firma_contrato` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_contrato`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tab_departamentos
-- ----------------------------
DROP TABLE IF EXISTS `tab_departamentos`;
CREATE TABLE `tab_departamentos`  (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `da_departamento` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_codigo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_departamento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_departamentos
-- ----------------------------
INSERT INTO `tab_departamentos` VALUES (1, 'Computación', 'PCA02122');
INSERT INTO `tab_departamentos` VALUES (2, 'Mantenimiento', 'PCA02122');

-- ----------------------------
-- Table structure for tab_empleados
-- ----------------------------
DROP TABLE IF EXISTS `tab_empleados`;
CREATE TABLE `tab_empleados`  (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `da_tipo_documento` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nu_documento` int(11) NOT NULL,
  `da_nombres` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_apellidos` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_sexo` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_estado_civil` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fe_nacimiento` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_nacionalidad` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_estatus` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_nivel_estudios` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `img_empleado` longblob NOT NULL,
  `id_tipo_contrato` int(11) NOT NULL,
  `id_contrato` int(11) NOT NULL,
  `fe_ingreso` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_turno` int(11) NOT NULL,
  `id_tipo_sueldo` int(11) NOT NULL,
  `id_nivel_salarial` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_supervisor` int(11) NOT NULL,
  `id_banco` int(11) NOT NULL,
  `nu_cuenta` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nu_fijo` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nu_celular` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_correo` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_pais` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_estado` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_ciudad` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_municipio` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_parroquia` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_direccion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_empleado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_empleados
-- ----------------------------
INSERT INTO `tab_empleados` VALUES (1, 'V', 25778113, 'Carlos', 'Sandrea', '', '', '', '', '', '', '', 0, 0, '08/01/2018', 0, 0, 6, 1, 1, 0, 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_empleados` VALUES (2, 'V', 26753719, 'Nick', 'Arellano', '', '', '', '', '', '', '', 0, 0, '', 0, 0, 1, 1, 2, 0, 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_empleados` VALUES (3, 'V', 5, 'Daisy', 'Rivas', '', '', '', '', '', '', '', 0, 0, '', 0, 0, 1, 2, 3, 0, 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `tab_empleados` VALUES (4, 'V', 11282654, 'Irene', 'Vera', 'F', '', '', '', '', '', '', 0, 0, '', 0, 0, 1, 2, 3, 0, 0, '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for tab_familiares
-- ----------------------------
DROP TABLE IF EXISTS `tab_familiares`;
CREATE TABLE `tab_familiares`  (
  `id_familiar` int(11) NOT NULL AUTO_INCREMENT,
  `id_emplado` int(11) NOT NULL,
  `da_tipo_documento` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nu_documento` int(11) NOT NULL,
  `da_nombre_completo` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_parentesco` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_familiar`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tab_formulas
-- ----------------------------
DROP TABLE IF EXISTS `tab_formulas`;
CREATE TABLE `tab_formulas`  (
  `id_formula` int(11) NOT NULL AUTO_INCREMENT,
  `id_concepto` int(11) NULL DEFAULT NULL,
  `da_formula` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_formula`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_formulas
-- ----------------------------
INSERT INTO `tab_formulas` VALUES (1, 1, 'round(mo_sueldo_base * calc_porcentaje(8),2)');

-- ----------------------------
-- Table structure for tab_hoja_tiempo
-- ----------------------------
DROP TABLE IF EXISTS `tab_hoja_tiempo`;
CREATE TABLE `tab_hoja_tiempo`  (
  `id_hoja_tiempo` int(11) NOT NULL AUTO_INCREMENT,
  `id_nomina` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fe_hoja` date NOT NULL,
  `ho_entrada` time(6) NOT NULL,
  `ho_salida` time(6) NOT NULL,
  PRIMARY KEY (`id_hoja_tiempo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_hoja_tiempo
-- ----------------------------
INSERT INTO `tab_hoja_tiempo` VALUES (1, 3, 1, '2018-11-08', '08:00:00.000000', '16:00:00.000000');

-- ----------------------------
-- Table structure for tab_imagenes_relacion
-- ----------------------------
DROP TABLE IF EXISTS `tab_imagenes_relacion`;
CREATE TABLE `tab_imagenes_relacion`  (
  `id_imagen_relacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_imagen` int(11) NOT NULL,
  `id_contrato` int(11) NOT NULL,
  PRIMARY KEY (`id_imagen_relacion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tab_imgenes_subidas
-- ----------------------------
DROP TABLE IF EXISTS `tab_imgenes_subidas`;
CREATE TABLE `tab_imgenes_subidas`  (
  `id_imagen` int(11) NOT NULL AUTO_INCREMENT,
  `da_nombre` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_img` longblob NOT NULL,
  PRIMARY KEY (`id_imagen`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tab_niveles_salariales
-- ----------------------------
DROP TABLE IF EXISTS `tab_niveles_salariales`;
CREATE TABLE `tab_niveles_salariales`  (
  `id_nivel_salarial` int(11) NOT NULL AUTO_INCREMENT,
  `da_nivel` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_porcentaje_diferencial` float NOT NULL,
  PRIMARY KEY (`id_nivel_salarial`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_niveles_salariales
-- ----------------------------
INSERT INTO `tab_niveles_salariales` VALUES (1, 'NIVEL UNO', 0);
INSERT INTO `tab_niveles_salariales` VALUES (2, 'NIVEL DOS', 0.0381);
INSERT INTO `tab_niveles_salariales` VALUES (3, 'NIVEL TRES', 0.0122);
INSERT INTO `tab_niveles_salariales` VALUES (4, 'NIVEL CUATRO', 0.0282);
INSERT INTO `tab_niveles_salariales` VALUES (5, 'NIVEL CINCO', 0.0394);
INSERT INTO `tab_niveles_salariales` VALUES (6, 'NIVEL SEIS', 0.0376);
INSERT INTO `tab_niveles_salariales` VALUES (7, 'NIVEL SIETE', 0.0365);
INSERT INTO `tab_niveles_salariales` VALUES (8, 'NIVEL OCHO', 0.0525);

-- ----------------------------
-- Table structure for tab_sueldos
-- ----------------------------
DROP TABLE IF EXISTS `tab_sueldos`;
CREATE TABLE `tab_sueldos`  (
  `id_sueldo` int(11) NOT NULL AUTO_INCREMENT,
  `id_nivel_salarial` int(11) NOT NULL,
  `id_tipo_sueldo` int(11) NOT NULL,
  `mo_sueldo_base` float NOT NULL,
  `mo_cesta_ticket` float NOT NULL,
  PRIMARY KEY (`id_sueldo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_sueldos
-- ----------------------------
INSERT INTO `tab_sueldos` VALUES (1, 1, 1, 1800, 180);
INSERT INTO `tab_sueldos` VALUES (2, 6, 1, 2097.26, 180);
INSERT INTO `tab_sueldos` VALUES (3, 1, 1, 2000, 200);
INSERT INTO `tab_sueldos` VALUES (4, 6, 1, 3054, 500);

-- ----------------------------
-- Table structure for tab_tipo_contrato
-- ----------------------------
DROP TABLE IF EXISTS `tab_tipo_contrato`;
CREATE TABLE `tab_tipo_contrato`  (
  `id_tipo_contrato` int(11) NOT NULL AUTO_INCREMENT,
  `da_tipo_contrato` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_tipo_contrato`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tab_tipo_distribucion
-- ----------------------------
DROP TABLE IF EXISTS `tab_tipo_distribucion`;
CREATE TABLE `tab_tipo_distribucion`  (
  `id_tipo_distribucion` int(11) NOT NULL AUTO_INCREMENT,
  `da_distribucion` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_dias` int(11) NOT NULL,
  PRIMARY KEY (`id_tipo_distribucion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_tipo_distribucion
-- ----------------------------
INSERT INTO `tab_tipo_distribucion` VALUES (1, 'QUINCENAL', 15);
INSERT INTO `tab_tipo_distribucion` VALUES (2, 'SEMANAL', 7);
INSERT INTO `tab_tipo_distribucion` VALUES (3, 'MENSUAL', 30);

-- ----------------------------
-- Table structure for tab_tipo_nominas
-- ----------------------------
DROP TABLE IF EXISTS `tab_tipo_nominas`;
CREATE TABLE `tab_tipo_nominas`  (
  `id_tipo_nomina` int(11) NOT NULL AUTO_INCREMENT,
  `da_tipo_nomina` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_tipo_nomina`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_tipo_nominas
-- ----------------------------
INSERT INTO `tab_tipo_nominas` VALUES (1, 'NOMINA ORDINARIA');
INSERT INTO `tab_tipo_nominas` VALUES (2, 'BONO VACACIONAL');

-- ----------------------------
-- Table structure for tab_tipo_sueldos
-- ----------------------------
DROP TABLE IF EXISTS `tab_tipo_sueldos`;
CREATE TABLE `tab_tipo_sueldos`  (
  `id_tipo_sueldo` int(11) NOT NULL AUTO_INCREMENT,
  `da_tipo_sueldo` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_tipo_sueldo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tab_turnos
-- ----------------------------
DROP TABLE IF EXISTS `tab_turnos`;
CREATE TABLE `tab_turnos`  (
  `id_turno` int(11) NOT NULL AUTO_INCREMENT,
  `da_turno` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ho_entrada` time(6) NOT NULL,
  `ho_salida` time(6) NOT NULL,
  PRIMARY KEY (`id_turno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tab_turnos
-- ----------------------------
INSERT INTO `tab_turnos` VALUES (1, 'HORARRIO NORMAL', '08:00:00.000000', '16:00:00.000000');

-- ----------------------------
-- Table structure for tra_concepto_detalles
-- ----------------------------
DROP TABLE IF EXISTS `tra_concepto_detalles`;
CREATE TABLE `tra_concepto_detalles`  (
  `id_concepto_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_nomina` int(11) NOT NULL,
  `id_concepto_empleado` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `da_ano` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_mes` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mo_concepto` float(12, 2) NOT NULL,
  PRIMARY KEY (`id_concepto_detalle`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tra_concepto_detalles
-- ----------------------------
INSERT INTO `tra_concepto_detalles` VALUES (1, 3, 2, 1, '2018', '12', 150.00);

-- ----------------------------
-- Table structure for tra_nomina
-- ----------------------------
DROP TABLE IF EXISTS `tra_nomina`;
CREATE TABLE `tra_nomina`  (
  `id_nomina` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_nomina` int(11) NOT NULL,
  `id_tipo_distribucion` int(11) NOT NULL,
  `da_ano` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_mes` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fe_inicio` date NOT NULL,
  `fe_fin` date NOT NULL,
  `fe_pago` date NOT NULL,
  `da_estatus` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_nomina`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tra_nomina
-- ----------------------------
INSERT INTO `tra_nomina` VALUES (1, 1, 1, '2018', '10', '0000-00-00', '0000-00-00', '2018-10-31', 'C');
INSERT INTO `tra_nomina` VALUES (2, 1, 1, '2018', '11', '0000-00-00', '0000-00-00', '2018-11-01', 'C');
INSERT INTO `tra_nomina` VALUES (3, 1, 3, '2018', '12', '0000-00-00', '0000-00-00', '2018-12-14', 'A');

-- ----------------------------
-- Table structure for tra_nomina_detalle
-- ----------------------------
DROP TABLE IF EXISTS `tra_nomina_detalle`;
CREATE TABLE `tra_nomina_detalle`  (
  `id_nomina_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_nomina` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_sueldo` int(11) NOT NULL,
  `da_ano` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `da_mes` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mo_sueldo` float(12, 2) NOT NULL,
  `mo_cesta_ticket` float(12, 2) NOT NULL,
  `mo_variantes_a` float(12, 2) NOT NULL,
  `mo_variantes_d` float(12, 2) NOT NULL,
  `mo_ho_extras` float(12, 2) NOT NULL,
  `mo_cancelacion` float(12, 2) NOT NULL,
  PRIMARY KEY (`id_nomina_detalle`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tra_nomina_detalle
-- ----------------------------
INSERT INTO `tra_nomina_detalle` VALUES (1, 1, 1, 0, '2018', '10', 1527.00, 0.00, 274.86, 0.00, 0.00, 1554.61);
INSERT INTO `tra_nomina_detalle` VALUES (2, 1, 2, 0, '2018', '10', 1000.00, 0.00, 80.00, 0.00, 0.00, 918.07);
INSERT INTO `tra_nomina_detalle` VALUES (3, 1, 3, 0, '2018', '10', 1000.00, 0.00, 80.00, 0.00, 0.00, 918.07);
INSERT INTO `tra_nomina_detalle` VALUES (4, 2, 1, 0, '2018', '11', 1527.00, 0.00, 349.86, 0.00, 0.00, 1645.46);
INSERT INTO `tra_nomina_detalle` VALUES (5, 2, 2, 0, '2018', '11', 1000.00, 0.00, 80.00, 0.00, 0.00, 928.46);
INSERT INTO `tra_nomina_detalle` VALUES (6, 2, 3, 0, '2018', '11', 1000.00, 0.00, 80.00, 0.00, 0.00, 928.46);
INSERT INTO `tra_nomina_detalle` VALUES (7, 3, 1, 0, '2018', '12', 3054.00, 500.00, 549.72, 0.00, 0.00, 3609.21);
INSERT INTO `tra_nomina_detalle` VALUES (8, 3, 2, 0, '2018', '12', 2000.00, 200.00, 160.00, 0.00, 0.00, 2036.15);
INSERT INTO `tra_nomina_detalle` VALUES (9, 3, 3, 3, '2018', '12', 1000.00, 200.00, 160.00, 0.00, 0.00, 2036.15);

-- ----------------------------
-- View structure for rpt_detalle_pago_conceptos_a
-- ----------------------------
DROP VIEW IF EXISTS `rpt_detalle_pago_conceptos_a`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `rpt_detalle_pago_conceptos_a` AS SELECT
tra_concepto_detalles.id_nomina,
tra_concepto_detalles.id_empleado,
tab_conceptos.da_concepto,
tra_concepto_detalles.mo_concepto,
tab_conceptos.da_tipo_concepto,
tab_conceptos.da_tipo
FROM
tra_concepto_detalles
INNER JOIN tab_concepto_empleados ON tra_concepto_detalles.id_concepto_empleado = tab_concepto_empleados.id_concepto_empleado
INNER JOIN tab_conceptos ON tab_concepto_empleados.id_concepto = tab_conceptos.id_concepto
WHERE da_tipo='A' ;

-- ----------------------------
-- View structure for rpt_detalle_pago_conceptos_d
-- ----------------------------
DROP VIEW IF EXISTS `rpt_detalle_pago_conceptos_d`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `rpt_detalle_pago_conceptos_d` AS SELECT
tra_concepto_detalles.id_nomina,
tra_concepto_detalles.id_empleado,
tab_conceptos.da_concepto,
tra_concepto_detalles.mo_concepto,
tab_conceptos.da_tipo_concepto,
tab_conceptos.da_tipo
FROM
tra_concepto_detalles
INNER JOIN tab_concepto_empleados ON tra_concepto_detalles.id_concepto_empleado = tab_concepto_empleados.id_concepto_empleado
INNER JOIN tab_conceptos ON tab_concepto_empleados.id_concepto = tab_conceptos.id_concepto
WHERE da_tipo='D' ;

-- ----------------------------
-- View structure for rpt_detalle_pago_empleado
-- ----------------------------
DROP VIEW IF EXISTS `rpt_detalle_pago_empleado`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `rpt_detalle_pago_empleado` AS SELECT
tab_empleados.id_empleado,
tab_empleados.nu_documento,
nombre_empleado(tab_empleados.id_empleado) AS nombre_empleado,
tab_empleados.fe_ingreso,
tab_sueldos.mo_sueldo_base,
tab_departamentos.da_departamento,
tab_departamentos.da_codigo,
tab_niveles_salariales.da_nivel,
tab_cargos.da_cargo,
tab_tipo_distribucion.da_distribucion,
tra_nomina_detalle.mo_sueldo AS mo_sueldo_distribido,
tra_nomina.id_nomina,
tra_nomina_detalle.mo_cesta_ticket
FROM
tra_nomina_detalle
INNER JOIN tab_empleados ON tra_nomina_detalle.id_empleado = tab_empleados.id_empleado
INNER JOIN tab_sueldos ON tra_nomina_detalle.id_sueldo = tab_sueldos.id_sueldo
INNER JOIN tab_departamentos ON tab_empleados.id_departamento = tab_departamentos.id_departamento
INNER JOIN tab_niveles_salariales ON tab_sueldos.id_nivel_salarial = tab_niveles_salariales.id_nivel_salarial
INNER JOIN tab_cargos ON tab_empleados.id_cargo = tab_cargos.id_cargo
INNER JOIN tra_nomina ON tra_nomina_detalle.id_nomina = tra_nomina.id_nomina
INNER JOIN tab_tipo_distribucion ON tra_nomina.id_tipo_distribucion = tab_tipo_distribucion.id_tipo_distribucion ;

-- ----------------------------
-- View structure for vw_conceptos
-- ----------------------------
DROP VIEW IF EXISTS `vw_conceptos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_conceptos` AS SELECT
	tab_conceptos.id_concepto,
	tab_conceptos.co_concepto,
	tab_conceptos.da_concepto,
	tab_conceptos.da_tipo_concepto,
	tab_conceptos.da_tipo 
FROM
	tab_conceptos 
/*GROUP BY
	tab_conceptos.da_tipo ASC,
	tab_conceptos.da_tipo_concepto DESC,
	tab_conceptos.co_concepto ASC,	
	tab_conceptos.da_concepto ASC */ ; ;

-- ----------------------------
-- View structure for vw_concepto_variantes
-- ----------------------------
DROP VIEW IF EXISTS `vw_concepto_variantes`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_concepto_variantes` AS SELECT
tra_concepto_detalles.id_concepto_detalle,
tab_empleados.nu_documento,
nombre_empleado(tab_empleados.id_empleado) as nombre_empleado,
tab_conceptos.co_concepto,
tab_conceptos.da_concepto,
tab_conceptos.da_tipo,
tra_concepto_detalles.da_ano,
tra_concepto_detalles.da_mes,
tra_concepto_detalles.mo_concepto
FROM
tra_concepto_detalles
INNER JOIN tra_nomina ON tra_concepto_detalles.id_nomina = tra_nomina.id_nomina
INNER JOIN tab_conceptos ON tra_concepto_detalles.id_concepto = tab_conceptos.id_concepto
INNER JOIN tab_empleados ON tra_concepto_detalles.id_empleado = tab_empleados.id_empleado
WHERE tra_nomina.id_nomina=(SELECT MAX(id_nomina) FROM tra_nomina WHERE da_estatus='A')
AND tab_conceptos.da_tipo_concepto='V' ; ;

-- ----------------------------
-- View structure for vw_formulas_conceptos
-- ----------------------------
DROP VIEW IF EXISTS `vw_formulas_conceptos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_formulas_conceptos` AS SELECT
conceptos.id_concepto,
nombre_empleado(concepto_empleado.id_empleado),
conceptos.da_concepto,
niveles.da_nivel,
formulas.da_formula,
sueldos.mo_sueldo_base
FROM
tab_formulas AS formulas
INNER JOIN tab_conceptos AS conceptos ON formulas.id_concepto = conceptos.id_concepto
INNER JOIN tab_concepto_empleados AS concepto_empleado ON conceptos.id_concepto = concepto_empleado.id_concepto
INNER JOIN tab_empleados AS empleados ON concepto_empleado.id_empleado = empleados.id_empleado
INNER JOIN tab_niveles_salariales AS niveles ON empleados.id_nivel_salarial = niveles.id_nivel_salarial
INNER JOIN tab_sueldos AS sueldos ON niveles.id_nivel_salarial = sueldos.id_nivel_salarial
WHERE sueldos.id_sueldo=(SELECT MAX(tab_sueldos.id_sueldo) FROM tab_sueldos WHERE (tab_sueldos.id_nivel_salarial = niveles.id_nivel_salarial)) ; ;

-- ----------------------------
-- View structure for vw_hoja_tiempo_empleados
-- ----------------------------
DROP VIEW IF EXISTS `vw_hoja_tiempo_empleados`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_hoja_tiempo_empleados` AS SELECT
tab_hoja_tiempo.id_hoja_tiempo,
tab_empleados.id_empleado,
tab_empleados.nu_documento,
nombre_empleado(tab_empleados.id_empleado) as nombre_empleado,
CAST(tab_hoja_tiempo.fe_hoja as DATE) as fe_hoja,
tab_hoja_tiempo.ho_entrada,
tab_hoja_tiempo.ho_salida

FROM
tab_hoja_tiempo
INNER JOIN tab_empleados ON tab_hoja_tiempo.id_empleado = tab_empleados.id_empleado
WHERE
tab_hoja_tiempo.id_nomina = (SELECT MAX(id_nomina) FROM tra_nomina) ; ;

-- ----------------------------
-- View structure for vw_mo_sueldo_base
-- ----------------------------
DROP VIEW IF EXISTS `vw_mo_sueldo_base`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_mo_sueldo_base` AS SELECT
tab_empleados.id_empleado,
lvl.id_nivel_salarial,
lvl.da_nivel,
sld.id_sueldo,
sld.mo_sueldo_base,
sld.mo_cesta_ticket,
tra_nomina.da_ano,
tra_nomina.da_mes,
tab_tipo_distribucion.da_dias
FROM
tab_niveles_salariales AS lvl
INNER JOIN tab_sueldos AS sld ON lvl.id_nivel_salarial = sld.id_nivel_salarial
INNER JOIN tab_empleados ON tab_empleados.id_nivel_salarial = lvl.id_nivel_salarial ,
tra_nomina
INNER JOIN tab_tipo_distribucion ON tra_nomina.id_tipo_distribucion = tab_tipo_distribucion.id_tipo_distribucion
WHERE
sld.id_sueldo = (SELECT max(id_sueldo) FROM tab_sueldos WHERE id_nivel_salarial =lvl.id_nivel_salarial) and tra_nomina.id_nomina=(SELECT max(id_nomina) FROM tra_nomina) ;

-- ----------------------------
-- Function structure for calc_lunes_x_mes
-- ----------------------------
DROP FUNCTION IF EXISTS `calc_lunes_x_mes`;
delimiter ;;
CREATE FUNCTION `calc_lunes_x_mes`(`in_fecha` date)
 RETURNS int(11)
BEGIN
DECLARE dias int;
	SET dias=(SELECT count(DATE_ADD(calc_mes_anterior(DATE_FORMAT(in_fecha, '%Y-%m-%d')), INTERVAL row DAY)) AS count_lunes
		FROM (
			SELECT @row := @row+1 AS row
			FROM INFORMATION_SCHEMA.COLUMNS, (SELECT @row := 0) t
		) T
		WHERE DATE_ADD(calc_mes_anterior(DATE_FORMAT(in_fecha, '%Y-%m-%d')), INTERVAL row DAY) BETWEEN calc_mes_anterior(DATE_FORMAT(in_fecha, '%Y-%m-%d')) AND LAST_DAY(DATE_FORMAT(in_fecha, '%Y-%m-%d'))
		AND DAYOFWEEK(DATE_ADD(calc_mes_anterior(DATE_FORMAT(in_fecha, '%Y-%m-%d')), INTERVAL row DAY)) = 2);
    RETURN dias;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for calc_mes_anterior
-- ----------------------------
DROP FUNCTION IF EXISTS `calc_mes_anterior`;
delimiter ;;
CREATE FUNCTION `calc_mes_anterior`(`date` date)
 RETURNS date
BEGIN
	declare mes_pasado date;
	set mes_pasado=DATE_FORMAT(LAST_DAY(date - INTERVAL 1 MONTH), '%Y-%m-%d');
	RETURN mes_pasado;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for calc_monto_diario
-- ----------------------------
DROP FUNCTION IF EXISTS `calc_monto_diario`;
delimiter ;;
CREATE FUNCTION `calc_monto_diario`(`monto` FLOAT)
 RETURNS float
  NO SQL 
RETURN COALESCE(monto/30,0)
;
;;
delimiter ;

-- ----------------------------
-- Function structure for calc_monto_total_especial
-- ----------------------------
DROP FUNCTION IF EXISTS `calc_monto_total_especial`;
delimiter ;;
CREATE FUNCTION `calc_monto_total_especial`(`mo_sueldo` FLOAT, `mo_cesta_ticket` FLOAT, `mo_asignado` FLOAT, `mo_deducido` FLOAT)
 RETURNS float
  NO SQL 
RETURN COALESCE((mo_sueldo)+(mo_cesta_ticket)+(mo_asignado)-(mo_deducido),0)
;
;;
delimiter ;

-- ----------------------------
-- Function structure for calc_monto_total_ordinario
-- ----------------------------
DROP FUNCTION IF EXISTS `calc_monto_total_ordinario`;
delimiter ;;
CREATE FUNCTION `calc_monto_total_ordinario`(`mo_sueldo` FLOAT, `mo_asignado` FLOAT, `mo_deducido` FLOAT)
 RETURNS float
  NO SQL 
RETURN COALESCE((mo_sueldo)+(mo_asignado)-(mo_deducido),0)
;
;;
delimiter ;

-- ----------------------------
-- Function structure for calc_monto_x_dias
-- ----------------------------
DROP FUNCTION IF EXISTS `calc_monto_x_dias`;
delimiter ;;
CREATE FUNCTION `calc_monto_x_dias`(`monto` FLOAT, `dias` INT)
 RETURNS float
  NO SQL 
RETURN COALESCE((monto)*(dias),0)
;
;;
delimiter ;

-- ----------------------------
-- Function structure for calc_porcentaje
-- ----------------------------
DROP FUNCTION IF EXISTS `calc_porcentaje`;
delimiter ;;
CREATE FUNCTION `calc_porcentaje`(`porcentaje` float)
 RETURNS float
BEGIN
	RETURN ROUND((porcentaje/100),2);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_nu_dias_distribucion_nominas
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_nu_dias_distribucion_nominas`;
delimiter ;;
CREATE PROCEDURE `get_nu_dias_distribucion_nominas`(IN `in_id_distribucion` INT)
  NO SQL 
SELECT `da_dias` FROM `tab_tipo_distribucion` WHERE `id_tipo_distribucion`=in_id_distribucion
;
;;
delimiter ;

-- ----------------------------
-- Function structure for nombre_empleado
-- ----------------------------
DROP FUNCTION IF EXISTS `nombre_empleado`;
delimiter ;;
CREATE FUNCTION `nombre_empleado`(`in_id` INT)
 RETURNS varchar(60) CHARSET latin1
  NO SQL 
return (SELECT concat_ws(' ',tab_empleados.da_nombres,tab_empleados.da_apellidos) FROM tab_empleados WHERE tab_empleados.id_empleado=in_id)
;
;;
delimiter ;

-- ----------------------------
-- Function structure for op_formula
-- ----------------------------
DROP FUNCTION IF EXISTS `op_formula`;
delimiter ;;
CREATE FUNCTION `op_formula`(in_id int)
 RETURNS longtext CHARSET latin1
  NO SQL 
return (SELECT
tab_formulas.da_formula
FROM
tab_formulas
WHERE id_devengo=in_id)
;;
delimiter ;

-- ----------------------------
-- Procedure structure for rpt_detalle_pago_asignaciones
-- ----------------------------
DROP PROCEDURE IF EXISTS `rpt_detalle_pago_asignaciones`;
delimiter ;;
CREATE PROCEDURE `rpt_detalle_pago_asignaciones`(IN `in_id_nomina` INT, IN `in_id_empleado` INT)
  NO SQL 
SELECT tab_asignaciones.da_asignacion,round(calc_monto_x_dias(calc_monto_diario(tab_asignaciones_empleados.mo_asignado),tab_tipo_distribucion.da_dias),2) as mo_asignado FROM tab_asignaciones,tab_asignaciones_empleados,tra_nomina,tab_tipo_distribucion,tra_nomina_detalle
    WHERE tab_asignaciones.id_asignacion=tab_asignaciones_empleados.id_asignacion AND tab_asignaciones_empleados.da_ano=tra_nomina_detalle.da_ano AND
    tra_nomina_detalle.da_mes=tab_asignaciones_empleados.da_mes AND tab_asignaciones_empleados.id_empleado=tra_nomina_detalle.id_empleado AND
    tab_tipo_distribucion.id_tipo_distribucion=tra_nomina.id_tipo_distribucion AND
    tra_nomina.id_nomina=tra_nomina_detalle.id_nomina AND
    tra_nomina_detalle.id_nomina=in_id_nomina AND tra_nomina_detalle.id_empleado=in_id_empleado ORDER BY tab_asignaciones.da_asignacion ASC
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for rpt_detalle_pago_deducciones
-- ----------------------------
DROP PROCEDURE IF EXISTS `rpt_detalle_pago_deducciones`;
delimiter ;;
CREATE PROCEDURE `rpt_detalle_pago_deducciones`(IN `in_id_nomina` INT, IN `in_id_empleado` INT)
SELECT tab_deducciones.da_deduccion,round(calc_monto_x_dias(calc_monto_diario(tab_deducciones_empleados.mo_deducido),tab_tipo_distribucion.da_dias),2) as mo_deducido FROM tab_deducciones,tab_deducciones_empleados,tra_nomina_detalle,tra_nomina,tab_tipo_distribucion
WHERE tab_deducciones.id_deduccion=tab_deducciones_empleados.id_deduccion AND tab_deducciones_empleados.da_ano=tra_nomina_detalle.da_ano AND
tra_nomina_detalle.da_mes=tab_deducciones_empleados.da_mes AND tab_deducciones_empleados.id_empleado=tra_nomina_detalle.id_empleado AND
tab_tipo_distribucion.id_tipo_distribucion=tra_nomina.id_tipo_distribucion AND tra_nomina.id_nomina=tra_nomina_detalle.id_nomina AND
tra_nomina_detalle.id_nomina=in_id_nomina AND tra_nomina_detalle.id_empleado=in_id_empleado ORDER BY tab_deducciones.da_deduccion ASC
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for rpt_detalle_pago_empleado
-- ----------------------------
DROP PROCEDURE IF EXISTS `rpt_detalle_pago_empleado`;
delimiter ;;
CREATE PROCEDURE `rpt_detalle_pago_empleado`(IN `in_id_empleado` INT, IN `in_id_nomina` INT)
  NO SQL 
SELECT
	tab_empleados.nu_documento,
	concat_ws( ' ', tab_empleados.da_nombres, tab_empleados.da_apellidos ) AS nombre_empleado,
	tab_cargos.da_cargo,
	tab_empleados.fe_ingreso,
	vw_mo_sueldo_base.mo_sueldo_base,
	tab_departamentos.da_departamento,
	tab_departamentos.da_codigo,
	vw_mo_sueldo_base.id_sueldo,
	tab_tipo_distribucion.da_distribucion,
	COALESCE ( round( tra_nomina_detalle.mo_sueldo_base, 2 ), 0 ) AS mo_sueldo_distribido,
	COALESCE ( ( tra_nomina_detalle.mo_cesta_ticket ), 0 ) AS mo_cesta_ticket 
FROM
	tab_empleados,
	tab_departamentos,
	tab_cargos,
	vw_mo_sueldo_base,
	tra_nomina_detalle,
	tab_tipo_distribucion,
	tra_nomina 
WHERE
	tab_empleados.id_nivel_salarial = vw_mo_sueldo_base.id_nivel_salarial 
	AND tab_empleados.id_departamento = tab_departamentos.id_departamento 
	AND tab_tipo_distribucion.id_tipo_distribucion = tra_nomina.id_tipo_distribucion 
	AND tab_cargos.id_cargo = tab_empleados.id_cargo 
	AND tra_nomina_detalle.id_empleado = tab_empleados.id_empleado 
	AND tra_nomina_detalle.id_nomina = tra_nomina.id_nomina 
	AND tab_empleados.id_empleado = in_id_empleado
	AND tra_nomina.id_nomina = in_id_nomina
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for set_detalle_nomina_especial
-- ----------------------------
DROP PROCEDURE IF EXISTS `set_detalle_nomina_especial`;
delimiter ;;
CREATE PROCEDURE `set_detalle_nomina_especial`(IN `in_id_empleado` INT, IN `in_da_ano` INT, IN `in_da_mes` INT)
  NO SQL 
INSERT INTO `tra_nomina_detalle`(`id_nomina`, `id_empleado`, `da_ano`, `da_mes`, `mo_sueldo_base`,`mo_cesta_ticket`, `mo_total_asignacion`, `mo_total_deduccion`, `mo_sueldo_total`) VALUES(
(SELECT MAX(id_nomina) FROM tra_nomina),
in_id_empleado,
in_da_ano,
in_da_mes,
(SELECT round(calc_monto_x_dias(calc_monto_diario(mo_sueldo_base), da_dias),2) FROM vw_mo_sueldo_base WHERE id_empleado=in_id_empleado),
(SELECT COALESCE(mo_cesta_ticket) FROM vw_mo_sueldo_base WHERE id_empleado=in_id_empleado),
(SELECT round(calc_monto_x_dias(SUM(calc_monto_diario(mo_asignado)), da_dias),2) as mo_asignado FROM vw_mo_asignado WHERE id_empleado=in_id_empleado),
(SELECT round(calc_monto_x_dias(SUM(calc_monto_diario(mo_deducido)),da_dias),2) as mo_deducido  FROM vw_mo_deducido WHERE id_empleado=in_id_empleado),
(SELECT round(calc_monto_total_especial((SELECT round(calc_monto_x_dias(calc_monto_diario(mo_sueldo_base), da_dias),2) FROM vw_mo_sueldo_base WHERE id_empleado=in_id_empleado),(SELECT COALESCE(mo_cesta_ticket) FROM vw_mo_sueldo_base WHERE id_empleado=in_id_empleado),(SELECT round(calc_monto_x_dias(SUM(calc_monto_diario(mo_asignado)), da_dias),2) as mo_asignado FROM vw_mo_asignado WHERE id_empleado=in_id_empleado),(SELECT round(calc_monto_x_dias(SUM(calc_monto_diario(mo_deducido)),da_dias),2) as mo_deducido  FROM vw_mo_deducido WHERE id_empleado=in_id_empleado)),2) as mo_total)
)
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for set_detalle_nomina_ordinaria
-- ----------------------------
DROP PROCEDURE IF EXISTS `set_detalle_nomina_ordinaria`;
delimiter ;;
CREATE PROCEDURE `set_detalle_nomina_ordinaria`(IN `in_id_empleado` INT, IN `in_da_ano` INT, IN `in_da_mes` INT)
  NO SQL 
INSERT INTO `tra_nomina_detalle`(`id_nomina`, `id_empleado`, `da_ano`, `da_mes`, `mo_sueldo_base`, `mo_total_asignacion`, `mo_total_deduccion`, `mo_sueldo_total`) VALUES(
(SELECT MAX(id_nomina) FROM tra_nomina),
in_id_empleado,
in_da_ano,
in_da_mes,
(SELECT round(calc_monto_x_dias(calc_monto_diario(mo_sueldo_base), da_dias),2) FROM vw_mo_sueldo_base WHERE id_empleado=in_id_empleado),
(SELECT round(calc_monto_x_dias(SUM(calc_monto_diario(mo_asignado)), da_dias),2) as mo_asignado FROM vw_mo_asignado WHERE id_empleado=in_id_empleado),
(SELECT round(calc_monto_x_dias(SUM(calc_monto_diario(mo_deducido)),da_dias),2) as mo_deducido  FROM vw_mo_deducido WHERE id_empleado=in_id_empleado),
(SELECT round(calc_monto_total_ordinario((SELECT round(calc_monto_x_dias(calc_monto_diario(mo_sueldo_base), da_dias),2) FROM vw_mo_sueldo_base WHERE id_empleado=in_id_empleado),(SELECT round(calc_monto_x_dias(SUM(calc_monto_diario(mo_asignado)), da_dias),2) as mo_asignado FROM vw_mo_asignado WHERE id_empleado=in_id_empleado),(SELECT round(calc_monto_x_dias(SUM(calc_monto_diario(mo_deducido)),da_dias),2) as mo_deducido  FROM vw_mo_deducido WHERE id_empleado=in_id_empleado)),2) as mo_total)
)
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for set_mo_asignacion_fija
-- ----------------------------
DROP PROCEDURE IF EXISTS `set_mo_asignacion_fija`;
delimiter ;;
CREATE PROCEDURE `set_mo_asignacion_fija`()
  NO SQL 
INSERT INTO tab_asignaciones_empleados (tab_asignaciones_empleados.id_asignacion,tab_asignaciones_empleados.id_empleado,tab_asignaciones_empleados.da_tipo_asignacion,tab_asignaciones_empleados.da_ano,tab_asignaciones_empleados.da_mes,tab_asignaciones_empleados.mo_asignado)
SELECT
	vw_mo_asignaciones_fijas.id_asignacion,
	vw_mo_asignaciones_fijas.id_empleado,
	vw_mo_asignaciones_fijas.da_tipo_asignacion,
	vw_mo_asignaciones_fijas.da_ano,
	vw_mo_asignaciones_fijas.da_mes,
	COALESCE ( round( vw_mo_asignaciones_fijas.mo_sueldo_base * vw_mo_asignaciones_fijas.da_porcentaje_diferencial, 2 ) ) AS mo_asignado 
FROM
	vw_mo_asignaciones_fijas
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for set_mo_deduccion_especial
-- ----------------------------
DROP PROCEDURE IF EXISTS `set_mo_deduccion_especial`;
delimiter ;;
CREATE PROCEDURE `set_mo_deduccion_especial`()
  NO SQL 
INSERT INTO tab_deducciones_empleados (tab_deducciones_empleados.id_deduccion,tab_deducciones_empleados.id_empleado,tab_deducciones_empleados.da_tipo_deduccion,tab_deducciones_empleados.da_ano,tab_deducciones_empleados.da_mes,tab_deducciones_empleados.mo_deducido)
SELECT
	id_deduccion,
	id_empleado,
	da_tipo_deduccion,
	da_ano,
	da_mes,
	round( ( mo_sueldo_base * 12 / 52 ) * da_porcentaje_diferencial * calc_lunes_x_mes ( fe_pago ), 2 ) AS mo_deducido 
FROM
	vw_mo_decucciones_especiales 
WHERE
	id_nomina = ( SELECT MAX( id_nomina ) FROM tra_nomina )
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for set_mo_deduccion_fija
-- ----------------------------
DROP PROCEDURE IF EXISTS `set_mo_deduccion_fija`;
delimiter ;;
CREATE PROCEDURE `set_mo_deduccion_fija`()
  NO SQL 
INSERT INTO tab_deducciones_empleados (tab_deducciones_empleados.id_deduccion,tab_deducciones_empleados.id_empleado,tab_deducciones_empleados.da_tipo_deduccion,tab_deducciones_empleados.da_ano,tab_deducciones_empleados.da_mes,tab_deducciones_empleados.mo_deducido)
SELECT
	vw_mo_deducciones_fijas.id_deduccion,
	vw_mo_deducciones_fijas.id_empleado,
	vw_mo_deducciones_fijas.da_tipo_deduccion,
	vw_mo_deducciones_fijas.da_ano,
	vw_mo_deducciones_fijas.da_mes,
	COALESCE ( round( vw_mo_deducciones_fijas.mo_sueldo_base * vw_mo_deducciones_fijas.da_porcentaje_diferencial, 2 ) ) AS mo_deducido 
FROM
	vw_mo_deducciones_fijas
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for set_nomina
-- ----------------------------
DROP PROCEDURE IF EXISTS `set_nomina`;
delimiter ;;
CREATE PROCEDURE `set_nomina`(IN `in_tipo_nomina` INT, IN `in_tipo_dist` INT, IN `in_ano` INT, IN `in_mes` INT, IN `fe_pago` VARCHAR(15))
  NO SQL 
INSERT INTO `tra_nomina`(`id_tipo_nomina`, `id_tipo_distribucion`, `da_ano`, `da_mes`, `fe_pago`) VALUES (in_tipo_nomina,in_tipo_dist,in_ano,in_mes,fe_pago)
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for verificar_acceso
-- ----------------------------
DROP PROCEDURE IF EXISTS `verificar_acceso`;
delimiter ;;
CREATE PROCEDURE `verificar_acceso`(IN `in_user` VARCHAR(50), IN `in_pass` VARCHAR(155))
  NO SQL 
SELECT * from sys_usuarios where sys_usuarios.usuario=in_user AND sys_usuarios.clave=in_pass
;
;;
delimiter ;

-- ----------------------------
-- Procedure structure for vista_nomina_detalles
-- ----------------------------
DROP PROCEDURE IF EXISTS `vista_nomina_detalles`;
delimiter ;;
CREATE PROCEDURE `vista_nomina_detalles`(IN `in_id_nomina` INT)
  NO SQL 
SELECT tra_nomina_detalle.id_nomina_detalle as id, concat_ws(' ',tab_empleados.da_nombres,tab_empleados.da_apellidos) as nombre_empleado, tra_nomina_detalle.da_ano as ano, tra_nomina_detalle.da_mes as mes, tra_nomina_detalle.mo_total_asignacion as mo_asignado, tra_nomina_detalle.mo_total_deduccion as mo_deducido,tra_nomina_detalle.mo_sueldo_total as mo_total FROM tra_nomina_detalle,tab_empleados WHERE tab_empleados.id_empleado=tra_nomina_detalle.id_empleado AND tra_nomina_detalle.id_nomina=in_id_nomina ORDER by tra_nomina_detalle.id_nomina_detalle DESC
;
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
