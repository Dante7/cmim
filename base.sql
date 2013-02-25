/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : cmim

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2013-02-25 03:54:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `name` (`name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`group_id`  int(11) NOT NULL ,
`permission_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `group_id` (`group_id`, `permission_id`) USING BTREE ,
INDEX `auth_group_permissions_425ae3c4` (`group_id`) USING BTREE ,
INDEX `auth_group_permissions_1e014c8f` (`permission_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content_type_id`  int(11) NOT NULL ,
`codename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `content_type_id` (`content_type_id`, `codename`) USING BTREE ,
INDEX `auth_permission_1bb8f392` (`content_type_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=73

;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES ('1', 'Can add permission', '1', 'add_permission'), ('2', 'Can change permission', '1', 'change_permission'), ('3', 'Can delete permission', '1', 'delete_permission'), ('4', 'Can add group', '2', 'add_group'), ('5', 'Can change group', '2', 'change_group'), ('6', 'Can delete group', '2', 'delete_group'), ('7', 'Can add user', '3', 'add_user'), ('8', 'Can change user', '3', 'change_user'), ('9', 'Can delete user', '3', 'delete_user'), ('10', 'Can add content type', '4', 'add_contenttype'), ('11', 'Can change content type', '4', 'change_contenttype'), ('12', 'Can delete content type', '4', 'delete_contenttype'), ('13', 'Can add session', '5', 'add_session'), ('14', 'Can change session', '5', 'change_session'), ('15', 'Can delete session', '5', 'delete_session'), ('16', 'Can add site', '6', 'add_site'), ('17', 'Can change site', '6', 'change_site'), ('18', 'Can delete site', '6', 'delete_site'), ('19', 'Can add log entry', '7', 'add_logentry'), ('20', 'Can change log entry', '7', 'change_logentry'), ('21', 'Can delete log entry', '7', 'delete_logentry'), ('22', 'Can add menu context', '8', 'add_menucontext'), ('23', 'Can change menu context', '8', 'change_menucontext'), ('24', 'Can delete menu context', '8', 'delete_menucontext'), ('25', 'Can add banco', '9', 'add_banco'), ('26', 'Can change banco', '9', 'change_banco'), ('27', 'Can delete banco', '9', 'delete_banco'), ('28', 'Can add ciudad', '10', 'add_ciudad'), ('29', 'Can change ciudad', '10', 'change_ciudad'), ('30', 'Can delete ciudad', '10', 'delete_ciudad'), ('31', 'Can add del mun', '11', 'add_delmun'), ('32', 'Can change del mun', '11', 'change_delmun'), ('33', 'Can delete del mun', '11', 'delete_delmun'), ('34', 'Can add estados', '12', 'add_estados'), ('35', 'Can change estados', '12', 'change_estados'), ('36', 'Can delete estados', '12', 'delete_estados'), ('37', 'Can add filial', '13', 'add_filial'), ('38', 'Can change filial', '13', 'change_filial'), ('39', 'Can delete filial', '13', 'delete_filial'), ('40', 'Can add tipo cursos', '14', 'add_tipocursos'), ('41', 'Can change tipo cursos', '14', 'change_tipocursos'), ('42', 'Can delete tipo cursos', '14', 'delete_tipocursos'), ('43', 'Can add tipo pago', '15', 'add_tipopago'), ('44', 'Can change tipo pago', '15', 'change_tipopago'), ('45', 'Can delete tipo pago', '15', 'delete_tipopago'), ('46', 'Can add permisos', '16', 'add_permisos'), ('47', 'Can change permisos', '16', 'change_permisos'), ('48', 'Can delete permisos', '16', 'delete_permisos'), ('52', 'Can add tbl2 certificaciones', '18', 'add_tbl2certificaciones'), ('53', 'Can change tbl2 certificaciones', '18', 'change_tbl2certificaciones'), ('54', 'Can delete tbl2 certificaciones', '18', 'delete_tbl2certificaciones'), ('55', 'Can add tbl3 pagos', '19', 'add_tbl3pagos'), ('56', 'Can change tbl3 pagos', '19', 'change_tbl3pagos'), ('57', 'Can delete tbl3 pagos', '19', 'delete_tbl3pagos'), ('58', 'Can add tbl4 cursos', '20', 'add_tbl4cursos'), ('59', 'Can change tbl4 cursos', '20', 'change_tbl4cursos'), ('60', 'Can delete tbl4 cursos', '20', 'delete_tbl4cursos'), ('61', 'Can add tbl1 datos generales', '21', 'add_tbl1datosgenerales'), ('62', 'Can change tbl1 datos generales', '21', 'change_tbl1datosgenerales'), ('63', 'Can delete tbl1 datos generales', '21', 'delete_tbl1datosgenerales'), ('64', 'Can add tbl1 datos domicilio', '22', 'add_tbl1datosdomicilio'), ('65', 'Can change tbl1 datos domicilio', '22', 'change_tbl1datosdomicilio'), ('66', 'Can delete tbl1 datos domicilio', '22', 'delete_tbl1datosdomicilio'), ('67', 'Can add tbl1 datos contacto', '23', 'add_tbl1datoscontacto'), ('68', 'Can change tbl1 datos contacto', '23', 'change_tbl1datoscontacto'), ('69', 'Can delete tbl1 datos contacto', '23', 'delete_tbl1datoscontacto'), ('70', 'Can add tbl1 datos especialidad', '24', 'add_tbl1datosespecialidad'), ('71', 'Can change tbl1 datos especialidad', '24', 'change_tbl1datosespecialidad'), ('72', 'Can delete tbl1 datos especialidad', '24', 'delete_tbl1datosespecialidad');
COMMIT;

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`username`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`first_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`last_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email`  varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`password`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`is_staff`  tinyint(1) NOT NULL ,
`is_active`  tinyint(1) NOT NULL ,
`is_superuser`  tinyint(1) NOT NULL ,
`last_login`  datetime NOT NULL ,
`date_joined`  datetime NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `username` (`username`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES ('1', 'dante', '', '', 'dante.arkade7@gmail.com', 'pbkdf2_sha256$10000$NqyOZt86ze10$jQj7TlOHefC7Yuw2MudDmeeiUoC0SkXForEEkq7Xk4c=', '1', '1', '1', '2013-02-17 22:18:57', '2013-02-17 22:18:57');
COMMIT;

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL ,
`group_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `user_id` (`user_id`, `group_id`) USING BTREE ,
INDEX `auth_user_groups_403f60f` (`user_id`) USING BTREE ,
INDEX `auth_user_groups_425ae3c4` (`group_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL ,
`permission_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `user_id` (`user_id`, `permission_id`) USING BTREE ,
INDEX `auth_user_user_permissions_403f60f` (`user_id`) USING BTREE ,
INDEX `auth_user_user_permissions_1e014c8f` (`permission_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `banco`
-- ----------------------------
DROP TABLE IF EXISTS `banco`;
CREATE TABLE `banco` (
`cod_banco`  int(11) NOT NULL ,
`nombre`  varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`cod_banco`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of banco
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `ciudad`
-- ----------------------------
DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE `ciudad` (
`cod_ciudad`  int(11) NOT NULL ,
`nombre`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`cod_ciudad`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of ciudad
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `del_mun`
-- ----------------------------
DROP TABLE IF EXISTS `del_mun`;
CREATE TABLE `del_mun` (
`cod_del_mun`  int(11) NOT NULL ,
`del_mun`  varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`cod_del_mun`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of del_mun
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`action_time`  datetime NOT NULL ,
`user_id`  int(11) NOT NULL ,
`content_type_id`  int(11) NULL DEFAULT NULL ,
`object_id`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`object_repr`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`action_flag`  smallint(5) UNSIGNED NOT NULL ,
`change_message`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `django_admin_log_403f60f` (`user_id`) USING BTREE ,
INDEX `django_admin_log_1bb8f392` (`content_type_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`app_label`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`model`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `app_label` (`app_label`, `model`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=25

;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES ('1', 'permission', 'auth', 'permission'), ('2', 'group', 'auth', 'group'), ('3', 'user', 'auth', 'user'), ('4', 'content type', 'contenttypes', 'contenttype'), ('5', 'session', 'sessions', 'session'), ('6', 'site', 'sites', 'site'), ('7', 'log entry', 'admin', 'logentry'), ('8', 'menu context', 'captura', 'menucontext'), ('9', 'banco', 'captura', 'banco'), ('10', 'ciudad', 'captura', 'ciudad'), ('11', 'del mun', 'captura', 'delmun'), ('12', 'estados', 'captura', 'estados'), ('13', 'filial', 'captura', 'filial'), ('14', 'tipo cursos', 'captura', 'tipocursos'), ('15', 'tipo pago', 'captura', 'tipopago'), ('16', 'permisos', 'captura', 'permisos'), ('18', 'tbl2 certificaciones', 'captura', 'tbl2certificaciones'), ('19', 'tbl3 pagos', 'captura', 'tbl3pagos'), ('20', 'tbl4 cursos', 'captura', 'tbl4cursos'), ('21', 'tbl1 datos generales', 'captura', 'tbl1datosgenerales'), ('22', 'tbl1 datos domicilio', 'captura', 'tbl1datosdomicilio'), ('23', 'tbl1 datos contacto', 'captura', 'tbl1datoscontacto'), ('24', 'tbl1 datos especialidad', 'captura', 'tbl1datosespecialidad');
COMMIT;

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
`session_key`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`session_data`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`expire_date`  datetime NOT NULL ,
PRIMARY KEY (`session_key`),
INDEX `django_session_3da3d3d8` (`expire_date`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('fb1733e786ba8a786c3856a77a5a5dca', 'ZDY4ZTlmNTZmZjM3NGU5ZTAzYTgyMGIzZDk4NzBlNTljOWZhM2RlYTqAAn1xAShVCWFwZWxsaWRv\nc1gGAAAAR2FyY2lhVQZub21icmVYCQAAAEpvc2UgSnVhblUKdGVzdGNvb2tpZVUGd29ya2VkVQJp\nZIoBBFUEbWFpbFgUAAAAYXJrYWRlXzdAbGl2ZS5jb20ubXh1Lg==\n', '2013-03-11 09:35:51');
COMMIT;

-- ----------------------------
-- Table structure for `django_site`
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`domain`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of django_site
-- ----------------------------
BEGIN;
INSERT INTO `django_site` VALUES ('1', 'example.com', 'example.com');
COMMIT;

-- ----------------------------
-- Table structure for `estados`
-- ----------------------------
DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados` (
`cod_estado`  int(11) NOT NULL ,
`estado`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`cod_estado`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of estados
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `filial`
-- ----------------------------
DROP TABLE IF EXISTS `filial`;
CREATE TABLE `filial` (
`cod_filial`  int(11) NOT NULL ,
`nombre`  varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`cod_ciudad`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`cod_filial`),
FOREIGN KEY (`cod_ciudad`) REFERENCES `ciudad` (`cod_ciudad`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `filial_19dc486c` (`cod_ciudad`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of filial
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `menu_context`
-- ----------------------------
DROP TABLE IF EXISTS `menu_context`;
CREATE TABLE `menu_context` (
`menu`  varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`submenu`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of menu_context
-- ----------------------------
BEGIN;
INSERT INTO `menu_context` VALUES ('perfil', 'generales'), ('perfil', 'academica'), ('perfil', 'profesional'), ('perfil', 'direccion'), ('perfil', 'contacto'), ('anualidades', 'suscripcion'), ('cursos', 'cursos');
COMMIT;

-- ----------------------------
-- Table structure for `permisos`
-- ----------------------------
DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`mail`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`password`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`nombre`  varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`apellidos`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`status`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'pendiente' ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=5

;

-- ----------------------------
-- Records of permisos
-- ----------------------------
BEGIN;
INSERT INTO `permisos` VALUES ('4', 'arkade_7@live.com.mx', '000004', 'Jose Juan', 'Garcia', 'pendiente');
COMMIT;

-- ----------------------------
-- Table structure for `tbl1_datos_contacto`
-- ----------------------------
DROP TABLE IF EXISTS `tbl1_datos_contacto`;
CREATE TABLE `tbl1_datos_contacto` (
`id_con`  int(11) NOT NULL DEFAULT 0 ,
`cod_socio`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`tel_casa`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`tel_oficina`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`fax`  varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`tel_celular`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`mail`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id_con`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tbl1_datos_contacto
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `tbl1_datos_domicilio`
-- ----------------------------
DROP TABLE IF EXISTS `tbl1_datos_domicilio`;
CREATE TABLE `tbl1_datos_domicilio` (
`id_dom`  int(11) NOT NULL ,
`cod_socio`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`cod_estado`  int(11) NULL DEFAULT NULL ,
`cod_del_mun`  int(11) NULL DEFAULT NULL ,
`colonia`  varchar(135) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`direccion`  varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`calle`  varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`num_int`  int(11) NULL DEFAULT NULL ,
`num_ext`  int(11) NULL DEFAULT NULL ,
`cp`  varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`pais`  varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id_dom`),
FOREIGN KEY (`cod_del_mun`) REFERENCES `del_mun` (`cod_del_mun`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`cod_estado`) REFERENCES `estados` (`cod_estado`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `tbl1_datos_domicilio_7fbcde1e` (`cod_estado`) USING BTREE ,
INDEX `tbl1_datos_domicilio_30ddccf7` (`cod_del_mun`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tbl1_datos_domicilio
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `tbl1_datos_especialidad`
-- ----------------------------
DROP TABLE IF EXISTS `tbl1_datos_especialidad`;
CREATE TABLE `tbl1_datos_especialidad` (
`id_esp`  int(11) NOT NULL ,
`cod_socio`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`espe`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`nivel_espe`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`univ`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`facultad`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`gradu_a`  date NULL DEFAULT NULL ,
`f_afiliacion`  date NULL DEFAULT NULL ,
`cod_filial`  int(11) NOT NULL ,
PRIMARY KEY (`id_esp`),
FOREIGN KEY (`cod_filial`) REFERENCES `filial` (`cod_filial`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `tbl1_datos_especialidad_4aa41829` (`cod_filial`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tbl1_datos_especialidad
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `tbl1_datos_generales`
-- ----------------------------
DROP TABLE IF EXISTS `tbl1_datos_generales`;
CREATE TABLE `tbl1_datos_generales` (
`id_gen`  int(11) NOT NULL ,
`cod_socio`  varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`cedula`  int(11) NULL DEFAULT NULL ,
`cedula_mi`  varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`en_tramite`  varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`nombre`  varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`apellidos`  varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`sexo`  int(11) NULL DEFAULT NULL ,
`fecha_nac`  date NULL DEFAULT NULL ,
PRIMARY KEY (`id_gen`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tbl1_datos_generales
-- ----------------------------
BEGIN;
INSERT INTO `tbl1_datos_generales` VALUES ('4', '', null, '', '', 'Jose Juan', 'Garcia', null, null);
COMMIT;

-- ----------------------------
-- Table structure for `tbl2_certificaciones`
-- ----------------------------
DROP TABLE IF EXISTS `tbl2_certificaciones`;
CREATE TABLE `tbl2_certificaciones` (
`cod_socio`  int(11) NULL DEFAULT NULL ,
`tbl2_id`  int(11) NOT NULL ,
`certificado`  varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`consejo`  varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`f_cert`  date NULL DEFAULT NULL ,
PRIMARY KEY (`tbl2_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tbl2_certificaciones
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `tbl3_pagos`
-- ----------------------------
DROP TABLE IF EXISTS `tbl3_pagos`;
CREATE TABLE `tbl3_pagos` (
`cod_socio`  int(11) NULL DEFAULT NULL ,
`tbl3_id`  int(11) NOT NULL ,
`a_pago`  int(11) NULL DEFAULT NULL ,
`cod_tpago`  int(11) NULL DEFAULT NULL ,
`folio_pago`  varchar(135) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`status_pago`  varchar(135) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`referencia`  varchar(135) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`f_pago`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`tbl3_id`),
FOREIGN KEY (`cod_tpago`) REFERENCES `tipo_pago` (`cod_tpago`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `tbl3_pagos_73b35da6` (`cod_tpago`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tbl3_pagos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `tbl4_cursos`
-- ----------------------------
DROP TABLE IF EXISTS `tbl4_cursos`;
CREATE TABLE `tbl4_cursos` (
`cod_socio`  int(11) NULL DEFAULT NULL ,
`tbl4_id`  int(11) NOT NULL ,
`fecha_a`  int(11) NULL DEFAULT NULL ,
`cod_curso`  int(11) NULL DEFAULT NULL ,
`asistencia`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`tbl4_id`),
FOREIGN KEY (`cod_curso`) REFERENCES `tipo_cursos` (`cod_curso`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `tbl4_cursos_4fe92bf3` (`cod_curso`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tbl4_cursos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `tipo_cursos`
-- ----------------------------
DROP TABLE IF EXISTS `tipo_cursos`;
CREATE TABLE `tipo_cursos` (
`cod_curso`  int(11) NOT NULL ,
`nombre_curso`  varchar(135) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`fecha_curso`  date NULL DEFAULT NULL ,
`tipo_curso`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`cod_curso`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tipo_cursos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `tipo_pago`
-- ----------------------------
DROP TABLE IF EXISTS `tipo_pago`;
CREATE TABLE `tipo_pago` (
`cod_tpago`  int(11) NOT NULL ,
`tipo_pago`  varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`cod_banco`  int(11) NOT NULL ,
PRIMARY KEY (`cod_tpago`),
FOREIGN KEY (`cod_banco`) REFERENCES `banco` (`cod_banco`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `tipo_pago_524faea4` (`cod_banco`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of tipo_pago
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Auto increment value for `auth_group`
-- ----------------------------
ALTER TABLE `auth_group` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `auth_group_permissions`
-- ----------------------------
ALTER TABLE `auth_group_permissions` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `auth_permission`
-- ----------------------------
ALTER TABLE `auth_permission` AUTO_INCREMENT=73;

-- ----------------------------
-- Auto increment value for `auth_user`
-- ----------------------------
ALTER TABLE `auth_user` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `auth_user_groups`
-- ----------------------------
ALTER TABLE `auth_user_groups` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `auth_user_user_permissions`
-- ----------------------------
ALTER TABLE `auth_user_user_permissions` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `django_admin_log`
-- ----------------------------
ALTER TABLE `django_admin_log` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for `django_content_type`
-- ----------------------------
ALTER TABLE `django_content_type` AUTO_INCREMENT=25;

-- ----------------------------
-- Auto increment value for `django_site`
-- ----------------------------
ALTER TABLE `django_site` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `permisos`
-- ----------------------------
ALTER TABLE `permisos` AUTO_INCREMENT=5;
