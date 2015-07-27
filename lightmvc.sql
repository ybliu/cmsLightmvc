/*
Navicat MySQL Data Transfer

Source Server         : local1
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : lightmvc

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2015-07-17 16:44:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` bigint(20) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `banner_box_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK762A6B4CCE698D42` (`banner_box_id`),
  CONSTRAINT `banner_ibfk_1` FOREIGN KEY (`banner_box_id`) REFERENCES `bannerbox` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------

-- ----------------------------
-- Table structure for bannerbox
-- ----------------------------
DROP TABLE IF EXISTS `bannerbox`;
CREATE TABLE `bannerbox` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9AEB26FF69072567` (`id`),
  CONSTRAINT `bannerbox_ibfk_1` FOREIGN KEY (`id`) REFERENCES `box` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bannerbox
-- ----------------------------

-- ----------------------------
-- Table structure for box
-- ----------------------------
DROP TABLE IF EXISTS `box`;
CREATE TABLE `box` (
  `id` bigint(20) NOT NULL,
  `boxId` varchar(255) DEFAULT NULL,
  `site_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK105AB350F0DF9` (`site_id`),
  CONSTRAINT `box_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of box
-- ----------------------------

-- ----------------------------
-- Table structure for city_city
-- ----------------------------
DROP TABLE IF EXISTS `city_city`;
CREATE TABLE `city_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cityName` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `ProvienceID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hym48hjupqcwdq1b7nc16pk3w` (`ProvienceID`),
  CONSTRAINT `FK_hym48hjupqcwdq1b7nc16pk3w` FOREIGN KEY (`ProvienceID`) REFERENCES `city_provience` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city_city
-- ----------------------------

-- ----------------------------
-- Table structure for city_city_city_district
-- ----------------------------
DROP TABLE IF EXISTS `city_city_city_district`;
CREATE TABLE `city_city_city_district` (
  `city_city_id` bigint(20) NOT NULL,
  `districts_id` bigint(20) NOT NULL,
  PRIMARY KEY (`city_city_id`,`districts_id`),
  UNIQUE KEY `UK_smef7j4903e9nsc1j5lgb84ea` (`districts_id`),
  KEY `FK_smef7j4903e9nsc1j5lgb84ea` (`districts_id`),
  KEY `FK_b6y5w7o8a7u3oqinvuqp90jqa` (`city_city_id`),
  CONSTRAINT `FK_b6y5w7o8a7u3oqinvuqp90jqa` FOREIGN KEY (`city_city_id`) REFERENCES `city_city` (`id`),
  CONSTRAINT `FK_smef7j4903e9nsc1j5lgb84ea` FOREIGN KEY (`districts_id`) REFERENCES `city_district` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city_city_city_district
-- ----------------------------

-- ----------------------------
-- Table structure for city_district
-- ----------------------------
DROP TABLE IF EXISTS `city_district`;
CREATE TABLE `city_district` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `districtname` varchar(255) DEFAULT NULL,
  `CityID` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_p1bsol9c2m9st7yniayq7vcpa` (`CityID`),
  CONSTRAINT `FK_p1bsol9c2m9st7yniayq7vcpa` FOREIGN KEY (`CityID`) REFERENCES `city_city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city_district
-- ----------------------------

-- ----------------------------
-- Table structure for city_provience
-- ----------------------------
DROP TABLE IF EXISTS `city_provience`;
CREATE TABLE `city_provience` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `provienceName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city_provience
-- ----------------------------

-- ----------------------------
-- Table structure for city_provience_city_city
-- ----------------------------
DROP TABLE IF EXISTS `city_provience_city_city`;
CREATE TABLE `city_provience_city_city` (
  `city_provience_id` bigint(20) NOT NULL,
  `citys_id` bigint(20) NOT NULL,
  PRIMARY KEY (`city_provience_id`,`citys_id`),
  UNIQUE KEY `UK_59tfogxjsjr80k18squas6udr` (`citys_id`),
  KEY `FK_59tfogxjsjr80k18squas6udr` (`citys_id`),
  KEY `FK_p9e5u86sh22rghve3ljp7vrjg` (`city_provience_id`),
  CONSTRAINT `FK_59tfogxjsjr80k18squas6udr` FOREIGN KEY (`citys_id`) REFERENCES `city_city` (`id`),
  CONSTRAINT `FK_p9e5u86sh22rghve3ljp7vrjg` FOREIGN KEY (`city_provience_id`) REFERENCES `city_provience` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city_provience_city_city
-- ----------------------------

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES ('1');

-- ----------------------------
-- Table structure for imagebox
-- ----------------------------
DROP TABLE IF EXISTS `imagebox`;
CREATE TABLE `imagebox` (
  `id` bigint(20) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCCC31A7069072567` (`id`),
  CONSTRAINT `imagebox_ibfk_1` FOREIGN KEY (`id`) REFERENCES `box` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imagebox
-- ----------------------------

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `adate` datetime DEFAULT NULL,
  `broswer` varchar(15) DEFAULT NULL,
  `user` varchar(10) DEFAULT NULL,
  `note` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for mb_mbgroup
-- ----------------------------
DROP TABLE IF EXISTS `mb_mbgroup`;
CREATE TABLE `mb_mbgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `credit` int(10) NOT NULL,
  `discount` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mb_mbgroup
-- ----------------------------

-- ----------------------------
-- Table structure for mb_member
-- ----------------------------
DROP TABLE IF EXISTS `mb_member`;
CREATE TABLE `mb_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membercardid` varchar(16) NOT NULL,
  `realname` varchar(32) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `mobile` varchar(16) NOT NULL,
  `email` varchar(32) NOT NULL,
  `prov_id` int(10) NOT NULL,
  `prov_name` varchar(32) NOT NULL,
  `city_id` int(10) NOT NULL,
  `city_name` varchar(32) NOT NULL,
  `address` varchar(200) NOT NULL,
  `zipcode` int(7) NOT NULL,
  `cardid` varchar(18) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `grade` tinyint(1) NOT NULL DEFAULT '1',
  `credit` int(10) NOT NULL DEFAULT '0',
  `regdateymd` date NOT NULL,
  `lastdateline` date NOT NULL,
  `mbgroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `membercardid` (`membercardid`),
  KEY `FK_atvhgpo1gkf68l47vxpsuvx2j` (`mbgroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mb_member
-- ----------------------------

-- ----------------------------
-- Table structure for rubric
-- ----------------------------
DROP TABLE IF EXISTS `rubric`;
CREATE TABLE `rubric` (
  `id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `title` longtext,
  `mode` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `abstr` longtext,
  `body` longtext,
  `online` bit(1) DEFAULT NULL,
  `adate` varchar(255) DEFAULT NULL,
  `visibleForever` bit(1) DEFAULT NULL,
  `visibleFrom` datetime DEFAULT NULL,
  `visibleTo` datetime DEFAULT NULL,
  `leaf` bit(1) DEFAULT NULL,
  `orderno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK928C664DC7A4F4DC` (`parent_id`),
  CONSTRAINT `rubric_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rubric
-- ----------------------------

-- ----------------------------
-- Table structure for rubricbox
-- ----------------------------
DROP TABLE IF EXISTS `rubricbox`;
CREATE TABLE `rubricbox` (
  `id` bigint(20) NOT NULL,
  `rubric_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8903C05ED5427079` (`rubric_id`),
  KEY `FK8903C05E69072567` (`id`),
  CONSTRAINT `rubricbox_ibfk_1` FOREIGN KEY (`id`) REFERENCES `box` (`id`),
  CONSTRAINT `rubricbox_ibfk_2` FOREIGN KEY (`rubric_id`) REFERENCES `rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rubricbox
-- ----------------------------

-- ----------------------------
-- Table structure for sale_category
-- ----------------------------
DROP TABLE IF EXISTS `sale_category`;
CREATE TABLE `sale_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `pid` int(10) NOT NULL DEFAULT '0',
  `seq` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_n9tkype9nwgi7kacmtp5i2eem` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_category
-- ----------------------------

-- ----------------------------
-- Table structure for sale_goods
-- ----------------------------
DROP TABLE IF EXISTS `sale_goods`;
CREATE TABLE `sale_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(32) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `stock` float NOT NULL DEFAULT '0',
  `warn_stock` tinyint(3) NOT NULL DEFAULT '1',
  `weight` varchar(32) NOT NULL,
  `unit` varchar(32) NOT NULL,
  `out_price` decimal(8,2) NOT NULL,
  `in_price` decimal(8,2) NOT NULL,
  `market_price` decimal(8,2) NOT NULL,
  `promote_price` decimal(8,2) NOT NULL,
  `ispromote` tinyint(1) NOT NULL DEFAULT '0',
  `promote_start_date` date NOT NULL,
  `promote_end_date` date NOT NULL,
  `ismemberprice` tinyint(1) NOT NULL DEFAULT '1',
  `creatymd` date NOT NULL,
  `lastinymd` date NOT NULL,
  `goods_desc` varchar(200) NOT NULL,
  `countamount` float(10,2) unsigned NOT NULL,
  `salesamount` float(10,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_dck24rbx40x2pnenchsue8lly` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_goods
-- ----------------------------

-- ----------------------------
-- Table structure for sale_log
-- ----------------------------
DROP TABLE IF EXISTS `sale_log`;
CREATE TABLE `sale_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(10) NOT NULL,
  `username` varchar(32) NOT NULL,
  `dateymd` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_log
-- ----------------------------

-- ----------------------------
-- Table structure for sale_purchase
-- ----------------------------
DROP TABLE IF EXISTS `sale_purchase`;
CREATE TABLE `sale_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) NOT NULL,
  `goods_sn` varchar(32) NOT NULL,
  `goods_name` varchar(100) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `in_num` float NOT NULL,
  `out_num` float NOT NULL DEFAULT '0',
  `in_price` decimal(8,2) NOT NULL,
  `dateymd` date NOT NULL,
  `dateline` int(10) NOT NULL,
  `isdel` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_purchase
-- ----------------------------

-- ----------------------------
-- Table structure for sale_sales
-- ----------------------------
DROP TABLE IF EXISTS `sale_sales`;
CREATE TABLE `sale_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) NOT NULL,
  `goods_sn` varchar(16) NOT NULL,
  `goods_name` varchar(100) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `order_id` varchar(14) NOT NULL,
  `mid` int(10) NOT NULL,
  `membercardid` varchar(16) NOT NULL,
  `realname` varchar(32) NOT NULL,
  `num` float NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `out_price` decimal(8,2) NOT NULL,
  `in_price` decimal(8,2) NOT NULL,
  `dateymd` date NOT NULL,
  `dateline` int(10) NOT NULL,
  `m_discount` float(10,2) unsigned NOT NULL DEFAULT '0.00',
  `p_discount` float(10,2) unsigned NOT NULL DEFAULT '0.00',
  `refund_type` tinyint(1) NOT NULL DEFAULT '0',
  `refund_num` float NOT NULL DEFAULT '0',
  `refund_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `sales_type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_sales
-- ----------------------------

-- ----------------------------
-- Table structure for site
-- ----------------------------
DROP TABLE IF EXISTS `site`;
CREATE TABLE `site` (
  `id` bigint(20) NOT NULL,
  `root_rubric_id` bigint(20) NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `hostAliases` longtext,
  `title` varchar(255) DEFAULT NULL,
  `restricted` bit(1) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `root_rubric_id` (`root_rubric_id`),
  KEY `FK27536749BEB95C` (`root_rubric_id`),
  CONSTRAINT `site_ibfk_1` FOREIGN KEY (`root_rubric_id`) REFERENCES `rubric` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of site
-- ----------------------------

-- ----------------------------
-- Table structure for slide
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide` (
  `id` bigint(20) NOT NULL,
  `title` longtext,
  `body` longtext,
  `orderno` int(11) DEFAULT NULL,
  `slideshow_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4C44D91E60E4028` (`slideshow_id`),
  CONSTRAINT `slide_ibfk_1` FOREIGN KEY (`slideshow_id`) REFERENCES `slideshowbox` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slide
-- ----------------------------

-- ----------------------------
-- Table structure for slideshowbox
-- ----------------------------
DROP TABLE IF EXISTS `slideshowbox`;
CREATE TABLE `slideshowbox` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD93216BD69072567` (`id`),
  CONSTRAINT `slideshowbox_ibfk_1` FOREIGN KEY (`id`) REFERENCES `box` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slideshowbox
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `text` varchar(64) NOT NULL,
  `dictionarytype_id` int(11) NOT NULL,
  `seq` tinyint(1) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_51htkeif203365pkc74w3388d` (`dictionarytype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES ('1', '0', '管理员', '2', '0', '0', '0');
INSERT INTO `sys_dictionary` VALUES ('2', '1', '用户', '2', '0', '0', '1');

-- ----------------------------
-- Table structure for sys_dictionarytype
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionarytype`;
CREATE TABLE `sys_dictionarytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `seq` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pw36d8tecu9ljc326r141ewqe` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='字典分类';

-- ----------------------------
-- Records of sys_dictionarytype
-- ----------------------------
INSERT INTO `sys_dictionarytype` VALUES ('1', 'base', '基础设置', '0', '基础设置', null);
INSERT INTO `sys_dictionarytype` VALUES ('2', 'usertype', '用户类型', '0', '用户类型', '1');

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `code` varchar(64) NOT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `seq` tinyint(1) NOT NULL DEFAULT '0',
  `createdatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_7fssu67fw54bf6fbo1iwr756b` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES ('1', 'XXX有限公司', '地址', '01', 'icon_company', null, '0', '2014-02-19 01:00:00');
INSERT INTO `sys_organization` VALUES ('2', '33', '3', '3', 'icon_folder', null, '1', '2015-07-08 16:36:52');

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `seq` tinyint(1) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `resourcetype` tinyint(1) NOT NULL DEFAULT '0',
  `createdatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_lhcrxhwf9hilx0lwhwxigxxqg` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1', '系统管理', '', '系统管理', 'icon_sys', null, '7', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('2', '资源管理', '/resource/manager', '资源管理', 'icon_resource', '1', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('5', '资源列表', '/resource/treeGrid', '资源列表', 'icon_resource', '2', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('6', '添加', '/resource/add', '资源添加', 'icon_resource', '2', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('7', '编辑', '/resource/edit', '资源编辑', 'icon_resource', '2', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('8', '删除', '/resource/delete', '资源删除', 'icon_resource', '2', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('3', '角色管理', '/role/manager', '角色管理', 'icon_role', '1', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('10', '角色列表', '/role/dataGrid', '角色列表', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('11', '添加', '/role/add', '角色添加', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('12', '编辑', '/role/edit', '角色编辑', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('13', '删除', '/role/delete', '角色删除', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('14', '授权', '/role/grant', '角色授权', 'icon_role', '3', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('4', '用户管理', '/user/manager', '用户管理', 'icon_user', '1', '3', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('15', '用户列表', '/user/dataGrid', '用户列表', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('16', '添加', '/user/add', '用户添加', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('17', '编辑', '/user/edit', '用户编辑', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('18', '删除', '/user/delete', '用户删除', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('19', '查看', '/user/view', '用户查看', 'icon_user', '4', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('20', '部门管理', '/organization/manager', '部门管理', 'icon_org', '1', '4', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('21', '部门列表', '/organization/treeGrid', '用户列表', 'icon_org', '20', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('22', '添加', '/organization/add', '部门添加', 'icon_org', '20', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('23', '编辑', '/organization/edit', '部门编辑', 'icon_org', '20', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('24', '删除', '/organization/delete', '部门删除', 'icon_org', '20', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('25', '查看', '/organization/view', '部门查看', 'icon_org', '20', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('26', '数据字典', '/dictionary/manager', '数据字典', 'icon_dic', '1', '5', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('27', '字典列表', '/dictionary/dataGrid', '字典列表', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('28', '字典类别列表', '/dictionarytype/dataGrid', '字典类别列表', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('29', '添加', '/dictionary/add', '字典添加', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('30', '编辑', '/dictionary/edit', '字典编辑', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('31', '删除', '/dictionary/delete', '字典删除', 'icon_dic', '26', '0', '0', '1', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('32', '商品管理', '', '商品管理', 'icon_sys', null, '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('38', '类别管理', '/category/manager', '类别管理', 'icon_dic', '32', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('39', '商品管理', '/goods/manager', '商品管理', 'icon_dic', '32', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('33', '进货管理', '', '进货管理', 'icon_sys', null, '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('40', '供应商管理', '/supplier/manager', '供应商管理', 'icon_dic', '33', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('41', '采购入库单', '/purchase/warehousing', '采购入库单', 'icon_dic', '33', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('42', '采购退货单', '/purchase/return', '采购退货单', 'icon_dic', '33', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('34', '销售管理', '', '销售管理', 'icon_sys', null, '3', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('43', '客户管理', '/customer/manager', '客户管理', 'icon_dic', '34', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('44', '销售单', '/sales/sale', '销售单', 'icon_dic', '34', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('45', '销售退货单', '/sales/return', '销售退货单', 'icon_dic', '34', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('35', '仓库管理', '', '仓库管理', 'icon_sys', null, '4', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('46', '仓库设置', '', '仓库设置', 'icon_dic', '35', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('47', '库存明细', '', '库存明细', 'icon_dic', '35', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('48', '库存盘点', '', '库存盘点', 'icon_dic', '35', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('36', '会员管理', '', '会员管理', 'icon_sys', null, '5', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('49', '分组管理', '', '会员分组', 'icon_dic', '36', '1', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('50', '会员管理', '', '会员管理', 'icon_dic', '36', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('37', '统计管理', '', '统计管理', 'icon_sys', null, '6', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('51', '销售统计', '', '销售统计', 'icon_dic', '37', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('52', '退货统计', '', '退货统计', 'icon_dic', '37', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('53', '进货统计', '', '进货统计', 'icon_dic', '37', '2', '0', '0', '2014-02-19 01:00:00');
INSERT INTO `sys_resource` VALUES ('54', 'dsdf', 'sdf', '', '', '42', '0', '0', '0', '2015-07-08 15:36:29');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `seq` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '0', '超级管理员，拥有全部权限', '0');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `role_id` smallint(5) NOT NULL,
  `resource_id` smallint(5) NOT NULL,
  PRIMARY KEY (`role_id`,`resource_id`),
  KEY `FK_p16r4t8uf973ru6yrcbb7r1ku` (`resource_id`),
  KEY `FK_10rpk2k4gddcfy7bnnmqgap3s` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('1', '1');
INSERT INTO `sys_role_resource` VALUES ('1', '2');
INSERT INTO `sys_role_resource` VALUES ('1', '3');
INSERT INTO `sys_role_resource` VALUES ('1', '4');
INSERT INTO `sys_role_resource` VALUES ('1', '5');
INSERT INTO `sys_role_resource` VALUES ('1', '6');
INSERT INTO `sys_role_resource` VALUES ('1', '7');
INSERT INTO `sys_role_resource` VALUES ('1', '8');
INSERT INTO `sys_role_resource` VALUES ('1', '9');
INSERT INTO `sys_role_resource` VALUES ('1', '10');
INSERT INTO `sys_role_resource` VALUES ('1', '11');
INSERT INTO `sys_role_resource` VALUES ('1', '12');
INSERT INTO `sys_role_resource` VALUES ('1', '13');
INSERT INTO `sys_role_resource` VALUES ('1', '14');
INSERT INTO `sys_role_resource` VALUES ('1', '15');
INSERT INTO `sys_role_resource` VALUES ('1', '16');
INSERT INTO `sys_role_resource` VALUES ('1', '17');
INSERT INTO `sys_role_resource` VALUES ('1', '18');
INSERT INTO `sys_role_resource` VALUES ('1', '19');
INSERT INTO `sys_role_resource` VALUES ('1', '20');
INSERT INTO `sys_role_resource` VALUES ('1', '21');
INSERT INTO `sys_role_resource` VALUES ('1', '22');
INSERT INTO `sys_role_resource` VALUES ('1', '23');
INSERT INTO `sys_role_resource` VALUES ('1', '24');
INSERT INTO `sys_role_resource` VALUES ('1', '25');
INSERT INTO `sys_role_resource` VALUES ('1', '26');
INSERT INTO `sys_role_resource` VALUES ('1', '27');
INSERT INTO `sys_role_resource` VALUES ('1', '28');
INSERT INTO `sys_role_resource` VALUES ('1', '29');
INSERT INTO `sys_role_resource` VALUES ('1', '30');
INSERT INTO `sys_role_resource` VALUES ('1', '31');
INSERT INTO `sys_role_resource` VALUES ('1', '32');
INSERT INTO `sys_role_resource` VALUES ('1', '33');
INSERT INTO `sys_role_resource` VALUES ('1', '34');
INSERT INTO `sys_role_resource` VALUES ('1', '35');
INSERT INTO `sys_role_resource` VALUES ('1', '36');
INSERT INTO `sys_role_resource` VALUES ('1', '37');
INSERT INTO `sys_role_resource` VALUES ('1', '38');
INSERT INTO `sys_role_resource` VALUES ('1', '39');
INSERT INTO `sys_role_resource` VALUES ('1', '40');
INSERT INTO `sys_role_resource` VALUES ('1', '41');
INSERT INTO `sys_role_resource` VALUES ('1', '42');
INSERT INTO `sys_role_resource` VALUES ('1', '43');
INSERT INTO `sys_role_resource` VALUES ('1', '44');
INSERT INTO `sys_role_resource` VALUES ('1', '45');
INSERT INTO `sys_role_resource` VALUES ('1', '46');
INSERT INTO `sys_role_resource` VALUES ('1', '47');
INSERT INTO `sys_role_resource` VALUES ('1', '48');
INSERT INTO `sys_role_resource` VALUES ('1', '49');
INSERT INTO `sys_role_resource` VALUES ('1', '50');
INSERT INTO `sys_role_resource` VALUES ('1', '51');
INSERT INTO `sys_role_resource` VALUES ('1', '52');
INSERT INTO `sys_role_resource` VALUES ('1', '53');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `age` tinyint(1) NOT NULL DEFAULT '0',
  `usertype` tinyint(1) NOT NULL DEFAULT '0',
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `organization_id` int(11) NOT NULL DEFAULT '0',
  `createdatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginname` (`loginname`),
  KEY `FK_jl2srlt2cvxyiudt0fjly6m7n` (`organization_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '超级管理员', '21232f297a57a5a743894a0e4a801fc3', '0', '18', '1', '0', '0', '1', '2012-06-04 01:00:00');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` smallint(5) NOT NULL,
  `role_id` smallint(5) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_fxu3td9m5o7qov1kbdvmn0g0x` (`role_id`),
  KEY `FK_fethvr269t6stivlddbo5pxry` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');

-- ----------------------------
-- Table structure for textbox
-- ----------------------------
DROP TABLE IF EXISTS `textbox`;
CREATE TABLE `textbox` (
  `id` bigint(20) NOT NULL,
  `title` longtext,
  `body` longtext,
  PRIMARY KEY (`id`),
  KEY `FKAB7D155E69072567` (`id`),
  CONSTRAINT `textbox_ibfk_1` FOREIGN KEY (`id`) REFERENCES `box` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of textbox
-- ----------------------------

-- ----------------------------
-- Table structure for t_attachment
-- ----------------------------
DROP TABLE IF EXISTS `t_attachment`;
CREATE TABLE `t_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_attach` int(11) DEFAULT NULL,
  `is_img` int(11) DEFAULT NULL,
  `is_index_pic` int(11) DEFAULT NULL,
  `new_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `old_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `size` bigint(20) NOT NULL,
  `suffix` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK48549DCEEFDD7FD5` (`tid`),
  CONSTRAINT `t_attachment_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `t_topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_attachment
-- ----------------------------
INSERT INTO `t_attachment` VALUES ('1', '0', '1', '1', '1381632936871.png', '003', '907508', 'png', 'application/octet-stream', '1');
INSERT INTO `t_attachment` VALUES ('3', '0', '1', '1', '1382350880548.png', '001', '660288', 'png', 'application/octet-stream', '3');
INSERT INTO `t_attachment` VALUES ('4', '0', '1', '1', '1382350882247.png', '002', '1269090', 'png', 'application/octet-stream', '3');
INSERT INTO `t_attachment` VALUES ('5', '1', '1', '0', '1435653448217.jpg', '小树苗05(2)', '51148', 'jpg', 'application/octet-stream', '37');
INSERT INTO `t_attachment` VALUES ('6', '1', '0', '0', '1435653520666.doc', 'hibernate系统学习文档', '1200688', 'doc', 'application/octet-stream', '37');
INSERT INTO `t_attachment` VALUES ('7', '1', '1', '0', '1435653582405.png', '100012', '14630', 'png', 'application/octet-stream', '13');

-- ----------------------------
-- Table structure for t_channel
-- ----------------------------
DROP TABLE IF EXISTS `t_channel`;
CREATE TABLE `t_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_link` int(11) DEFAULT NULL,
  `custom_link_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `is_index` int(11) DEFAULT '0',
  `is_top_nav` int(11) DEFAULT '0',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `orders` int(11) NOT NULL,
  `recommend` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `show_index` int(11) DEFAULT NULL,
  `nav_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE79D7038D7DDF6E5` (`pid`),
  CONSTRAINT `t_channel_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `t_channel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_channel
-- ----------------------------
INSERT INTO `t_channel` VALUES ('1', '0', '', '0', '0', '公司概况', '1', '0', '0', '0', null, null, '10');
INSERT INTO `t_channel` VALUES ('2', '0', '', '0', '0', '行业动态', '2', '0', '0', '0', null, null, '20');
INSERT INTO `t_channel` VALUES ('4', '0', '', '0', '0', '互动专栏', '4', '0', '0', '0', null, null, '40');
INSERT INTO `t_channel` VALUES ('6', '0', '', '1', '1', '公司简介', '1', '0', '0', '1', '1', null, '0');
INSERT INTO `t_channel` VALUES ('7', '0', '', '1', '1', '旗下产品', '2', '0', '0', '2', '1', null, '5');
INSERT INTO `t_channel` VALUES ('8', '0', '', '0', '1', '安全知识', '3', '1', '0', '1', '1', null, '4');
INSERT INTO `t_channel` VALUES ('10', '0', '', '1', '1', '通知公告', '1', '1', '0', '1', '2', null, '2');
INSERT INTO `t_channel` VALUES ('11', '0', '', '1', '1', '安全新闻', '2', '0', '0', '1', '2', null, '1');
INSERT INTO `t_channel` VALUES ('12', '0', '', '1', '1', '政策法规', '3', '0', '0', '1', '2', null, '3');
INSERT INTO `t_channel` VALUES ('19', '0', '', '1', '1', '体验中心', '1', '0', '0', '3', '4', null, '6');
INSERT INTO `t_channel` VALUES ('20', '0', 'sd', '1', '1', '活动专区', '2', '0', '0', '1', '4', null, '8');
INSERT INTO `t_channel` VALUES ('21', '0', '', '1', '1', '案例分享', '3', '0', '0', '1', '4', null, '7');
INSERT INTO `t_channel` VALUES ('22', '0', '', '0', '0', '技术支持', '5', '0', '0', '1', null, null, '0');
INSERT INTO `t_channel` VALUES ('23', '0', '', '0', '0', '客户服务', '1', '0', '0', '2', '22', null, '0');

-- ----------------------------
-- Table structure for t_cms_link
-- ----------------------------
DROP TABLE IF EXISTS `t_cms_link`;
CREATE TABLE `t_cms_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `new_win` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `link_clz` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pos` int(11) NOT NULL,
  `url_class` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_cms_link
-- ----------------------------

-- ----------------------------
-- Table structure for t_group
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_group
-- ----------------------------
INSERT INTO `t_group` VALUES ('1', '', '校办');
INSERT INTO `t_group` VALUES ('2', '', '教务处');
INSERT INTO `t_group` VALUES ('3', '', '总务处');
INSERT INTO `t_group` VALUES ('4', '', '教研室');
INSERT INTO `t_group` VALUES ('5', '', '教科室');
INSERT INTO `t_group` VALUES ('6', '', '政教处');
INSERT INTO `t_group` VALUES ('7', '', '文学社');
INSERT INTO `t_group` VALUES ('8', '333', '3333');

-- ----------------------------
-- Table structure for t_group_channel
-- ----------------------------
DROP TABLE IF EXISTS `t_group_channel`;
CREATE TABLE `t_group_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `g_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB7D322B8D80AB7D1` (`c_id`),
  KEY `FKB7D322B8EF562C89` (`g_id`),
  CONSTRAINT `t_group_channel_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `t_channel` (`id`),
  CONSTRAINT `t_group_channel_ibfk_2` FOREIGN KEY (`g_id`) REFERENCES `t_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_group_channel
-- ----------------------------
INSERT INTO `t_group_channel` VALUES ('1', '1', '1');
INSERT INTO `t_group_channel` VALUES ('2', '6', '1');
INSERT INTO `t_group_channel` VALUES ('3', '7', '1');
INSERT INTO `t_group_channel` VALUES ('4', '8', '1');
INSERT INTO `t_group_channel` VALUES ('6', '2', '1');
INSERT INTO `t_group_channel` VALUES ('7', '10', '1');
INSERT INTO `t_group_channel` VALUES ('8', '11', '1');
INSERT INTO `t_group_channel` VALUES ('9', '12', '1');
INSERT INTO `t_group_channel` VALUES ('12', '2', '2');
INSERT INTO `t_group_channel` VALUES ('13', '11', '2');
INSERT INTO `t_group_channel` VALUES ('14', '2', '3');
INSERT INTO `t_group_channel` VALUES ('15', '11', '3');
INSERT INTO `t_group_channel` VALUES ('17', '2', '4');
INSERT INTO `t_group_channel` VALUES ('18', '12', '4');
INSERT INTO `t_group_channel` VALUES ('23', '2', '6');
INSERT INTO `t_group_channel` VALUES ('25', '4', '6');
INSERT INTO `t_group_channel` VALUES ('26', '19', '6');
INSERT INTO `t_group_channel` VALUES ('27', '20', '6');
INSERT INTO `t_group_channel` VALUES ('28', '21', '6');

-- ----------------------------
-- Table structure for t_index_pic
-- ----------------------------
DROP TABLE IF EXISTS `t_index_pic`;
CREATE TABLE `t_index_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `link_type` int(11) DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pic` longblob,
  `status` int(11) NOT NULL,
  `sub_title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `thumbnail_pic` longblob,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `new_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `old_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_index_pic
-- ----------------------------
INSERT INTO `t_index_pic` VALUES ('3', '2015-07-01 10:35:13', '0', '', null, '1', '火灾逃险', null, '火灾逃险', '1435743670635.png', null, '4');
INSERT INTO `t_index_pic` VALUES ('4', '2015-07-01 17:29:22', '0', '', null, '1', '333', null, '宣教系统', '1435743238152.jpg', null, '3');
INSERT INTO `t_index_pic` VALUES ('13', '2015-07-02 14:10:16', '0', '', null, '1', '333', null, '333', '1435817395104.png', null, '2');
INSERT INTO `t_index_pic` VALUES ('14', '2015-07-08 17:30:25', '0', '', null, '1', '444444444', null, '4', '1436347811682.png', null, '1');

-- ----------------------------
-- Table structure for t_keyword
-- ----------------------------
DROP TABLE IF EXISTS `t_keyword`;
CREATE TABLE `t_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name_full_py` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name_short_py` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `times` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_keyword
-- ----------------------------
INSERT INTO `t_keyword` VALUES ('1', '阿斯达啊 阿斯达', 'asidaaasida', 'asdaasd', '1');
INSERT INTO `t_keyword` VALUES ('2', '测试测试测试', 'ceshiceshiceshi', 'cscscs', '1');
INSERT INTO `t_keyword` VALUES ('3', 'KeywordService', 'KeywordService', '', '1');
INSERT INTO `t_keyword` VALUES ('4', 'KeywordService啊', 'KeywordServicea', 'a', '1');
INSERT INTO `t_keyword` VALUES ('5', '阿斯达', 'asida', 'asd', '2');
INSERT INTO `t_keyword` VALUES ('6', '阿斯达阿斯达', 'asidaasida', 'asdasd', '1');
INSERT INTO `t_keyword` VALUES ('7', '阿斯达爱上', 'asidaaishang', 'asdas', '1');
INSERT INTO `t_keyword` VALUES ('8', '案例', 'anli', 'al', '5');
INSERT INTO `t_keyword` VALUES ('9', '技术支持', 'jishuzhichi', 'jszc', '3');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `author` varchar(10) DEFAULT NULL,
  `address` varchar(10) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `qqnum` varchar(15) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('1', '水电费', '水电费', null, null, null, null, '2015-07-03 12:30:19', null);
INSERT INTO `t_message` VALUES ('2', '44444444423', '232222222222222222222222222222222222222222232222222222222222222222222222222222222222232222222222222222222222222222222222222222232222222222222222222222222222222222222222232222222222222222222222222222222222222222232222222222222222222222222222222222222222232222222222222222222222222222222222222222232222222222222222222222222222222222222222232222222222222222222222222222222222222222232222222222222222222222222222222222222222232222222222222222222222222222222222222222', null, null, null, null, '2015-07-03 12:32:17', null);
INSERT INTO `t_message` VALUES ('3', '多少', '第三方', null, null, null, null, '2015-07-03 12:40:10', null);
INSERT INTO `t_message` VALUES ('4', '3453532', '213424', null, null, null, null, '2015-07-03 12:40:43', null);
INSERT INTO `t_message` VALUES ('5', '3453532', '213424', null, null, null, null, '2015-07-03 12:41:13', null);
INSERT INTO `t_message` VALUES ('6', '水电费', '水电费', null, null, null, null, '2015-07-03 13:35:02', null);
INSERT INTO `t_message` VALUES ('7', '水电费', '水电费', null, null, null, null, '2015-07-03 13:36:06', null);
INSERT INTO `t_message` VALUES ('8', '33', '33333333', null, null, null, null, '2015-07-03 13:36:19', null);
INSERT INTO `t_message` VALUES ('10', '33', '33333333', null, null, null, null, '2015-07-03 13:36:21', null);
INSERT INTO `t_message` VALUES ('12', '33', '33333333', null, null, null, null, '2015-07-03 13:36:21', null);
INSERT INTO `t_message` VALUES ('16', '4', '44', null, null, null, null, '2015-07-03 13:41:44', null);
INSERT INTO `t_message` VALUES ('17', '4444444444444444', '4444444444444444444444', null, null, null, null, '2015-07-03 13:44:13', null);
INSERT INTO `t_message` VALUES ('18', '2342', '234', null, null, null, null, '2015-07-03 13:48:41', null);
INSERT INTO `t_message` VALUES ('19', '3232', '33', null, null, null, null, '2015-07-03 13:57:02', null);
INSERT INTO `t_message` VALUES ('20', '恩恩', '额额', null, null, null, null, '2015-07-03 13:58:45', null);
INSERT INTO `t_message` VALUES ('21', '3', '33', '333333', null, null, null, '2015-07-03 14:03:29', null);
INSERT INTO `t_message` VALUES ('22', '3', '3', '3', null, null, null, '2015-07-03 14:06:49', null);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `role_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员', 'ROLE_ADMIN');
INSERT INTO `t_role` VALUES ('2', '文章审核人员', 'ROLE_AUDIT');
INSERT INTO `t_role` VALUES ('3', '文章发布人员', 'ROLE_PUBLISH');
INSERT INTO `t_role` VALUES ('4', '33', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for t_topic
-- ----------------------------
DROP TABLE IF EXISTS `t_topic`;
CREATE TABLE `t_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `channel_pic_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `create_date` datetime DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `recommend` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `summary` text COLLATE utf8_bin,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `cname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA10609A4D7DDC618` (`cid`),
  KEY `FKA10609A452119F24` (`uid`),
  CONSTRAINT `t_topic_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_topic_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `t_channel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_topic
-- ----------------------------
INSERT INTO `t_topic` VALUES ('1', '超级管理员', '0', 0xE5ADA6E6A0A1E6A682E586B5E6B58BE8AF95E69687E7ABA03C696D67207372633D222F636D732F7265736F75726365732F75706C6F61642F313338313633323933363837312E706E67222069643D226174746163685F312220616C743D2222202F3E, '2013-10-13 10:55:48', '', '2013-10-13 10:55:48', '0', '1', 0xE5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5E5ADA6E6A0A1E6A682E586B5, '测试文章', '7', '3', '学校概况');
INSERT INTO `t_topic` VALUES ('2', '超级管理员', '0', 0xE69292E697A6E58F91E69292E697A6E58F91E7949FE5A4A7E6B395E58D81E5A4A7, '2013-10-18 18:07:59', '', '2013-10-18 18:07:59', '0', '1', 0xE69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91, '撒他是否撒旦发撒旦发撒旦发生的发', '10', '3', '校园快讯');
INSERT INTO `t_topic` VALUES ('3', '超级管理员', '0', 0xE890A8E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE5A4A7E6B395, '2013-10-21 18:21:29', '', '2013-10-21 18:21:29', '0', '1', 0xE69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91E69292E697A6E58F91E69292E697A6E58F91E69292E697A6E58F91E7949FE79A84E58F91, '测试图片', '10', '3', '校园快讯');
INSERT INTO `t_topic` VALUES ('4', '超级管理员', '0', 0x343434343434343434343434343434343434343434343434343434343434343434343434, '2015-06-23 09:53:09', '', '2015-06-23 09:53:09', '0', '0', 0x343434343434343434343434343434, '44', '10', '3', '校园快讯');
INSERT INTO `t_topic` VALUES ('5', '超级管理员', '0', 0x343434343434343434343434, '2015-06-23 09:53:41', '', '2015-06-23 10:52:13', '1', '0', 0xE4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0E4BDA0, '4444444444444', '10', '3', '校园快讯');
INSERT INTO `t_topic` VALUES ('6', '超级管理员', '0', 0x34343434343434, '2015-06-23 10:14:47', '', '2015-06-23 10:14:47', '1', '0', 0x3434343434343434, '4', '8', '3', '师生风采');
INSERT INTO `t_topic` VALUES ('8', '超级管理员', '0', 0xE6B283E5B094E6B283E5B094E6B283E5B094E89A8A72E6B283E5B094E6B283E5B094E6B283E5B094E89A8A72E6B283E5B094E6B283E5B094E6B283E5B094E89A8A72E6B283E5B094E6B283E5B094E6B283E5B094E89A8A72, '2015-06-23 10:28:18', '', '2015-06-23 10:28:18', '0', '0', 0xE6B283E5B094E6B283E5B094E6B283E5B094E89A8A7261E6B283E5B094E6B283E5B094E6B283E5B094E89A8A7261E6B283E5B094E6B283E5B094E6B283E5B094E89A8A7261E6B283E5B094E6B283E5B094E6B283E5B094E89A8A7261, '33333', '7', '3', '学校概况');
INSERT INTO `t_topic` VALUES ('12', '超级管理员', '0', 0x33333333, '2015-06-29 13:51:25', '', '2015-06-29 13:51:25', '0', '0', 0xE4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388E4BDA0E59388, '3', '10', '3', '通知公告');
INSERT INTO `t_topic` VALUES ('13', '超级管理员', '0', 0xE68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7, '2015-06-29 14:00:11', '', '2015-06-29 16:39:48', '0', '1', 0xE68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7E68C89E697B6E5A4A7E5A4A7, '按时大大', '10', '3', '通知公告');
INSERT INTO `t_topic` VALUES ('14', '超级管理员', '0', 0xE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBE, '2015-06-29 15:37:02', '', '2015-06-29 15:37:02', '1', '0', 0xE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BF, '阿斯达', '10', '3', '通知公告');
INSERT INTO `t_topic` VALUES ('15', '超级管理员', '0', 0xE998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84, '2015-06-29 15:44:36', '', '2015-06-29 15:44:36', '0', '0', 0xE998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84, '阿斯达', '11', '3', '安全新闻');
INSERT INTO `t_topic` VALUES ('16', '超级管理员', '0', 0xE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84, '2015-06-29 15:49:17', '', '2015-06-29 15:49:17', '0', '0', 0xE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84, '啊飒飒的', '11', '3', '安全新闻');
INSERT INTO `t_topic` VALUES ('17', '超级管理员', '0', 0xE6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9, '2015-06-29 16:08:30', '', '2015-06-29 16:10:05', '1', '0', 0xE794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9E6B0B4E794B5E8B4B9, '水电费', '11', '3', '安全新闻');
INSERT INTO `t_topic` VALUES ('18', '超级管理员', '0', 0x3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE788B1E4B88A, '2015-06-29 16:10:54', '', '2015-06-29 15:06:43', '1', '1', 0xEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A0D0AEFBBBFEFBBBF0D0AE998BFE696AFE8BEBEE788B1E4B88A, '阿斯达阿斯达', '11', '3', '安全新闻');
INSERT INTO `t_topic` VALUES ('19', '超级管理员', '0', 0x3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3893C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389, '2015-06-29 16:11:34', '', '2015-06-29 16:11:34', '1', '0', 0xE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3890D0AEFBBBFEFBBBF0D0AE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3890D0AEFBBBFEFBBBF0D0AE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3890D0AEFBBBFEFBBBF0D0AE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3890D0AEFBBBFEFBBBF0D0AE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3890D0AEFBBBFEFBBBF0D0AE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3890D0AEFBBBFEFBBBF0D0AE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3890D0AEFBBBFEFBBBF0D0AE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3890D0AEFBBBFEFBBBF0D0AE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3890D0AEFBBBFEFBBBF0D0AE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3890D0AEFBBBFEFBBBF0D0AE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3890D0AEFBBBFEFBBBF0D0AE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B3890D0AEFBBBFEFBBBF0D0AE6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389E6B8A9E6B389, '温泉温泉温泉温泉温泉温泉', '11', '3', '安全新闻');
INSERT INTO `t_topic` VALUES ('20', '超级管理员', '0', 0x3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB23C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2, '2015-06-29 16:12:04', '', '2015-06-29 10:43:10', '1', '0', 0xEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB20D0AEFBBBFEFBBBF0D0AE58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2E58E86E58FB2, '历史历史历史', '11', '3', '安全新闻');
INSERT INTO `t_topic` VALUES ('21', '超级管理员', '0', 0xE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBE, '2015-06-29 17:04:45', '', '2015-06-29 17:04:45', '1', '1', 0xE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBE, '大发', '20', '3', '活动专区');
INSERT INTO `t_topic` VALUES ('22', '超级管理员', '0', 0xE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8D, '2015-06-29 17:05:49', '', '2015-06-29 17:18:48', '0', '0', 0xE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8DE68C89E697B6E588B0E4BD8D, '阿斯达', '20', '3', '活动专区');
INSERT INTO `t_topic` VALUES ('23', '超级管理员', '0', 0xE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BF76E696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBE, '2015-06-29 17:07:25', '', '2015-06-29 17:07:25', '1', '0', 0xE8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BF76E696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BF76E696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBE, '问', '12', '3', '政策法规');
INSERT INTO `t_topic` VALUES ('24', '超级管理员', '0', 0xE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BF76E696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBE, '2015-06-29 17:07:29', '', '2015-06-29 17:07:29', '1', '1', 0xE8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BF76E696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BF76E696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBE, '问', '12', '3', '政策法规');
INSERT INTO `t_topic` VALUES ('25', '超级管理员', '0', 0xE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BF76E696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBE, '2015-06-29 17:07:36', '', '2015-06-29 17:07:36', '1', '0', 0xE8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BF76E696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BF76E696AFE8BEBEE788B1E79A84E8AFB7E997AEE998BFE696AFE8BEBE, '问', '12', '3', '政策法规');
INSERT INTO `t_topic` VALUES ('26', '超级管理员', '0', 0x3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763EE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBE, '2015-06-29 17:18:21', '', '2015-06-29 17:18:21', '0', '0', 0xE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBEE998BFE696AFE8BEBE, '阿斯达', '12', '3', '政策法规');
INSERT INTO `t_topic` VALUES ('27', '超级管理员', '0', 0xE8AFB7E997AE, '2015-06-29 17:45:51', '', '2015-06-29 17:45:51', '0', '0', 0xE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AEE8AFB7E997AE, '3', '7', '3', '旗下产品');
INSERT INTO `t_topic` VALUES ('28', '超级管理员', '0', 0xE8AFB7E997AE, '2015-06-29 17:46:39', '', '2015-06-29 17:46:39', '0', '0', 0xE8AFB7E997AE, '请问', '21', '3', '案例分享');
INSERT INTO `t_topic` VALUES ('29', '超级管理员', '0', 0x3C703EE998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A843C2F703E3C703EE998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A843C2F703E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E3C646976207374796C653D22746F703A203070783B223EEFBBBFEFBBBF3C2F6469763E, '2015-06-29 17:47:21', '阿斯达啊 阿斯达|', '2015-06-29 17:47:21', '0', '0', 0xE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84E998BFE696AFE8BEBEE788B1E79A84E5958AE788B1E79A84, '爱的阿斯达', '11', '3', '安全新闻');
INSERT INTO `t_topic` VALUES ('30', '超级管理员', '0', 0xE6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95, '2015-06-30 09:19:30', '测试测试测试|', '2015-06-30 09:19:30', '1', '1', 0xE6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95, '测试', '7', '3', '旗下产品');
INSERT INTO `t_topic` VALUES ('32', '超级管理员', '0', 0x3C7072653E4B6579776F7264536572766963653C2F7072653E3C7072653E4B6579776F7264536572766963653C2F7072653E3C7072653E4B6579776F7264536572766963653C2F7072653E3C7072653E4B6579776F7264536572766963653C2F7072653E3C7072653E4B6579776F7264536572766963653C2F7072653E, '2015-06-30 09:21:11', 'KeywordService|', '2015-06-30 09:21:11', '0', '0', 0x4B6579776F7264536572766963654B6579776F7264536572766963654B6579776F7264536572766963654B6579776F726453657276696365, 'KeywordService', '20', '3', '活动专区');
INSERT INTO `t_topic` VALUES ('33', '超级管理员', '0', 0x4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A, '2015-06-30 09:21:36', 'KeywordService啊|', '2015-06-30 09:21:35', '0', '0', 0x4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A4B6579776F726453657276696365E5958A, 'KeywordService啊', '21', '3', '案例分享');
INSERT INTO `t_topic` VALUES ('34', '超级管理员', '0', 0x3C703EE998BFE696AFE8BEBE3C2F703E3C703E3C6272202F3E3C2F703E, '2015-06-30 10:41:24', '阿斯达|', '2015-06-30 14:59:00', '1', '1', 0xE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACACE7ACAC, '说的啊', '19', '3', '体验中心');
INSERT INTO `t_topic` VALUES ('35', '超级管理员', '0', 0xE998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84, '2015-06-30 10:57:47', '阿斯达阿斯达|', '2015-06-30 10:57:47', '1', '0', 0xE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84E998BFE696AFE8BEBEE998BFE696AFE8BEBEE788B1E79A84, '啊爱上', '11', '3', '安全新闻');
INSERT INTO `t_topic` VALUES ('36', '超级管理员', '0', 0xE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88A, '2015-06-30 11:38:04', '阿斯达爱上|', '2015-06-30 11:38:04', '1', '1', 0xE9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88AE5958AE9A392E9A392E69292E788B1E4B88A, '啊飒飒撒爱上', '7', '3', '旗下产品');
INSERT INTO `t_topic` VALUES ('37', '超级管理员', '0', 0x3C696D67207372633D22687474703A2F2F6C6F63616C686F73743A383838382F636D732F7265736F75726365732F75706C6F61642F7468756D626E61696C2F313433353635333434383231372E6A70672220616C743D2222202F3EE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A1883C696D6720616C743D22E59090E8888CE5A4B422207372633D222F636D732F7265736F75726365732F7868656469746F722F7868656469746F725F656D6F742F64656661756C742F746F6E6775652E67696622202F3EE4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8B433A5C55736572735C41646D696E6973747261746F725C4465736B746F70, '2015-06-30 11:48:48', '案例|', '2015-06-30 16:48:46', '0', '1', 0xE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8BE6A188E4BE8B, '阿斯达', '21', '3', '案例分享');
INSERT INTO `t_topic` VALUES ('38', '超级管理员', '0', 0x3C7370616E207374796C653D22666F6E742D73697A653A323470783B223EE5B9BFE4B89CE8939DE79BBEE4B990E5BA9AE4BFA1E681AFE68A80E69CAFE69C89E99990E585ACE58FB8E5AFB9E887AAE69C89E8BDAFE4BBB6E4BAA7E59381E995BFE69C9FE68F90E4BE9BE69C8DE58AA1E5928CE68A80E69CAFE694AFE68C81EFBC9A3C6272202F3E203C2F7370616E3E3C703E3C7370616E207374796C653D22666F6E742D73697A653A323470783B223E3C7370616E207374796C653D2277686974652D73706163653A707265223E093C2F7370616E3EE68A80E69CAFE694AFE68C81EFBC9AE8BF9CE7A88BE58D8FE58AA9E68896E794B5E8AF9DE8A7A3E7AD943C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D22666F6E742D73697A653A323470783B223E3C7370616E207374796C653D2277686974652D73706163653A707265223E093C2F7370616E3EE88194E7B3BBE59CB0E59D80EFBC9AE5B9BFE5B79EE5B882E5A4A9E6B2B3E58CBAE9BB84E59F94E5A4A7E98193E4B8ADE8B7AF333336E58FB7E5BEA1E58F91E59586E58AA1E4B8ADE5BF8336E6A5BC3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D22666F6E742D73697A653A323470783B223E3C7370616E207374796C653D2277686974652D73706163653A707265223E093C2F7370616E3EE982AEE694BFE7BC96E7A081EFBC9A3531303636353C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D22666F6E742D73697A653A323470783B223E3C7370616E207374796C653D2277686974652D73706163653A707265223E093C2F7370616E3EE69C8DE58AA15151E58FB7EFBC9A323831333737363936393C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D22666F6E742D73697A653A323470783B223E3C7370616E207374796C653D2277686974652D73706163653A707265223E093C2F7370616E3EE68A80E69CAFE783ADE7BABFEFBC9A3430302D3631382D363035383C2F7370616E3E3C2F703E3C7370616E207374796C653D22666F6E742D73697A653A323470783B223E203C7370616E207374796C653D2277686974652D73706163653A707265223E093C2F7370616E3EE794B5E5AD90E982AEE4BBB6EFBC9A737570706F72745F62646C6F67616E406368696E61626C7565646F6E2E636E3C2F7370616E3E, '2015-07-01 16:23:04', '技术支持|', '2015-07-01 16:44:47', '0', '1', 0xE5B9BFE4B89CE8939DE79BBEE4B990E5BA9AE4BFA1E681AFE68A80E69CAFE69C89E99990E585ACE58FB8E5AFB9E887AAE69C89E8BDAFE4BBB6E4BAA7E59381E995BFE69C9FE68F90E4BE9BE69C8DE58AA1E5928CE68A80E69CAFE694AFE68C81, '技术支持', '23', '3', '客户服务');
INSERT INTO `t_topic` VALUES ('39', '超级管理员', '0', 0x617364616461, '2015-07-08 16:09:28', '', '2015-07-08 16:11:14', '1', '1', 0x61736473616433333333333333333333333333333333333333333333333333333333333333, 'e33333333333333333', '11', '3', '安全新闻');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('3', '2013-06-03 13:39:13', '', '超级管理员', 'a66abb5684c45962d887564f08346e8d', '123', '1', 'admin');
INSERT INTO `t_user` VALUES ('4', '2015-07-01 14:14:50', '', '学生', '37f6225c3087ccbb6fea891d03bd2e4f', '', '1', 'student');
INSERT INTO `t_user` VALUES ('5', '2015-07-08 13:43:01', '', '试试', '47ec2dd791e31e2ef2076caf64ed9b3d', '', '1', 'test');

-- ----------------------------
-- Table structure for t_user_group
-- ----------------------------
DROP TABLE IF EXISTS `t_user_group`;
CREATE TABLE `t_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK300645B6EF562C89` (`g_id`),
  KEY `FK300645B652467BF9` (`u_id`),
  CONSTRAINT `t_user_group_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_user_group_ibfk_2` FOREIGN KEY (`g_id`) REFERENCES `t_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user_group
-- ----------------------------
INSERT INTO `t_user_group` VALUES ('1', '7', '4');
INSERT INTO `t_user_group` VALUES ('2', '2', '5');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `r_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK331DEE5F5243B387` (`r_id`),
  KEY `FK331DEE5F52467BF9` (`u_id`),
  CONSTRAINT `t_user_role_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `t_user_role_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1', '3');
INSERT INTO `t_user_role` VALUES ('2', '3', '4');
INSERT INTO `t_user_role` VALUES ('3', '4', '5');
