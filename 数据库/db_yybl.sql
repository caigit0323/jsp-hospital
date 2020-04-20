/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : db_yybl

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2018-05-26 15:14:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `pwd` varchar(50) default NULL,
  `status` varchar(50) default '管理员',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '111', '管理员');
INSERT INTO `admin` VALUES ('2', 'admin1', '111', '管理员');

-- ----------------------------
-- Table structure for `cases`
-- ----------------------------
DROP TABLE IF EXISTS `cases`;
CREATE TABLE `cases` (
  `id` int(11) NOT NULL auto_increment,
  `pathographyid` varchar(50) default NULL,
  `history` text,
  `allergy` text,
  `symptom` text,
  `analyzes` text,
  `userid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cases
-- ----------------------------
INSERT INTO `cases` VALUES ('5', '1000', '测试数据测试数据', '测试数据测试数据', '测试数据测试数据', '测试数据测试数据', '7');
INSERT INTO `cases` VALUES ('6', '1001', '测试数据测试数据', '测试数据测试数据', '测试数据测试数据', '测试数据测试数据', '7');
INSERT INTO `cases` VALUES ('7', '1002', '测试数据测试数据', '测试数据测试数据', '测试数据测试数据', '测试数据测试数据', '7');

-- ----------------------------
-- Table structure for `entry`
-- ----------------------------
DROP TABLE IF EXISTS `entry`;
CREATE TABLE `entry` (
  `id` int(11) NOT NULL auto_increment,
  `medicineid` int(11) default NULL,
  `sums` int(11) default NULL,
  `times` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entry
-- ----------------------------
INSERT INTO `entry` VALUES ('1', '5', '100', '2018-05-25 10:07:45');
INSERT INTO `entry` VALUES ('2', '4', '150', '2018-05-25 10:07:46');
INSERT INTO `entry` VALUES ('3', '5', '10', '2018-05-25 10:07:46');
INSERT INTO `entry` VALUES ('4', '5', '10', '2018-05-25 10:07:46');
INSERT INTO `entry` VALUES ('5', '4', '10', '2018-05-25 10:07:46');
INSERT INTO `entry` VALUES ('6', '4', '10', '2018-05-25 10:07:46');
INSERT INTO `entry` VALUES ('7', '5', '100', '2018-05-25 10:07:46');
INSERT INTO `entry` VALUES ('8', '5', '10', '2018-05-25 00:00:00');

-- ----------------------------
-- Table structure for `invalid`
-- ----------------------------
DROP TABLE IF EXISTS `invalid`;
CREATE TABLE `invalid` (
  `id` int(11) NOT NULL auto_increment,
  `pathographyid` varchar(50) default NULL,
  `name` varchar(50) default NULL,
  `sex` varchar(50) default NULL,
  `age` varchar(50) default NULL,
  `address` varchar(200) default NULL,
  `office` varchar(50) default NULL,
  `type` varchar(50) default NULL,
  `price` varchar(50) default NULL,
  `userid` int(11) default NULL,
  `times` datetime default NULL,
  `flag` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invalid
-- ----------------------------
INSERT INTO `invalid` VALUES ('2', '1000', '张三', '男', '22', '沈阳市皇姑区', '妇科', '专家', '30', '9', '2018-05-25 10:07:45', '0');
INSERT INTO `invalid` VALUES ('3', '1001', '李四', '女', '28', '沈阳东陵区', '眼科', '急诊', '10', '9', '2018-05-25 10:07:45', '0');
INSERT INTO `invalid` VALUES ('4', '1000', '张三', '男', '22', '沈阳市皇姑区', '眼科', '急诊', '10', '9', '2018-05-25 10:07:45', '0');
INSERT INTO `invalid` VALUES ('5', '1002', '王五', '男', '33', '沈阳市皇姑区', '眼科', '急诊', '10', '9', '2018-05-25 10:07:45', '0');
INSERT INTO `invalid` VALUES ('6', '1003', '赵一', '男', '35', '沈阳东陵区', '外科', '普通', '5', '9', '2018-05-25 10:07:45', '0');
INSERT INTO `invalid` VALUES ('8', '1004', '马云', '女', '34', '沈阳东陵区', '骨科', '急诊', '10', '9', '2018-05-25 10:07:45', '0');
INSERT INTO `invalid` VALUES ('9', '1005', 'abc', '男', '16', 'afdafaf', '妇科', '普通', '5', '9', '2018-05-25 10:07:45', '0');
INSERT INTO `invalid` VALUES ('10', '1006', '黎明', '男', '20', '大幅度', '妇科', '急诊', '10', '15', '2018-05-25 10:07:45', '0');
INSERT INTO `invalid` VALUES ('11', '1007', '张病人', '女', '20', '西安市和平路', '内科', '急诊', '10', '17', '2018-05-25 10:07:45', '0');
INSERT INTO `invalid` VALUES ('12', '1008', '张病人', '女', '50', '北京市海淀区1122号', '妇科', '普通', '5', '20', '2018-05-25 10:07:45', '0');
INSERT INTO `invalid` VALUES ('13', '1009', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '20', '2018-05-25 10:07:45', '1');
INSERT INTO `invalid` VALUES ('14', '1010', '张病人', '女', '50', '北京市海淀区1122号', '妇科', '急诊', '10', '20', '2018-05-25 10:07:45', '0');

-- ----------------------------
-- Table structure for `medicine`
-- ----------------------------
DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL,
  `spec` varchar(200) default NULL,
  `factory` varchar(200) default NULL,
  `price` varchar(50) default NULL,
  `stock` int(11) default '0',
  `sums` int(11) default '0',
  `caption` text,
  `flag` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medicine
-- ----------------------------
INSERT INTO `medicine` VALUES ('4', '注射用头孢尼西钠', '1.5g×10支/盒', '深圳九新药业有限公司', '120', '30', '140', '本品为广谱抗生素，见效快', '0');
INSERT INTO `medicine` VALUES ('5', '感冒胶囊(沈阳)', '10粒/板', '东北制药总厂', '1', '170', '60', '治疗感冒有非常好的效果', '0');

-- ----------------------------
-- Table structure for `office`
-- ----------------------------
DROP TABLE IF EXISTS `office`;
CREATE TABLE `office` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of office
-- ----------------------------
INSERT INTO `office` VALUES ('2', '骨科');
INSERT INTO `office` VALUES ('6', '外科');
INSERT INTO `office` VALUES ('7', '内科');
INSERT INTO `office` VALUES ('8', '眼科');
INSERT INTO `office` VALUES ('9', '儿科');
INSERT INTO `office` VALUES ('10', '妇科');

-- ----------------------------
-- Table structure for `prescription`
-- ----------------------------
DROP TABLE IF EXISTS `prescription`;
CREATE TABLE `prescription` (
  `id` int(11) NOT NULL auto_increment,
  `pathographyid` varchar(50) default NULL,
  `medicineid` int(11) default NULL,
  `sums` int(11) default NULL,
  `times` varchar(50) default NULL,
  `times1` varchar(50) default NULL,
  `userid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prescription
-- ----------------------------
INSERT INTO `prescription` VALUES ('2', '1000', '5', '10', '2018-05-18 10:04:45.107', '2018-05-18 10:04:45.107', '10');
INSERT INTO `prescription` VALUES ('3', '1000', '4', '20', '2018-05-18 10:04:45.107', '2018-05-18 10:04:45.107', '10');
INSERT INTO `prescription` VALUES ('5', '1001', '4', '15', '2018-05-18 10:04:45.107', '2018-05-18 10:04:45.107', '10');
INSERT INTO `prescription` VALUES ('6', '1001', '4', '10', '2018-05-18 10:04:45.107', '2018-05-18 10:04:45.107', '10');
INSERT INTO `prescription` VALUES ('8', '1002', '5', '20', '2018-05-18 10:04:45.107', '2018-05-18 10:04:45.107', '10');
INSERT INTO `prescription` VALUES ('9', '1002', '4', '30', '2018-05-18 10:04:45.107', '2018-05-18 10:04:45.107', '10');
INSERT INTO `prescription` VALUES ('12', '1008', '4', '10', '2018-05-18 10:04:45.107', '2018-05-18 10:04:45.107', '10');

-- ----------------------------
-- Table structure for `register_price`
-- ----------------------------
DROP TABLE IF EXISTS `register_price`;
CREATE TABLE `register_price` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `price` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of register_price
-- ----------------------------
INSERT INTO `register_price` VALUES ('1', '普通', '5');
INSERT INTO `register_price` VALUES ('2', '急诊', '10');
INSERT INTO `register_price` VALUES ('3', '专家', '30');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `pwd` varchar(50) default NULL,
  `realname` varchar(50) default NULL,
  `office` varchar(50) default NULL,
  `status` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('7', '222', '222', '李云', '眼科', '医护');
INSERT INTO `users` VALUES ('9', '111', '111', null, '', '挂号人员');
INSERT INTO `users` VALUES ('10', '333', '333', null, '', '药品库');
INSERT INTO `users` VALUES ('12', '555', '555', '张天', '骨科', '医护');
INSERT INTO `users` VALUES ('15', 'ccc', 'ccc', null, null, '挂号人员');
INSERT INTO `users` VALUES ('16', 'bbb', 'bbb', '王医生', '妇科', '医护');
INSERT INTO `users` VALUES ('17', 'ddd', 'ddd', null, null, '挂号人员');
INSERT INTO `users` VALUES ('18', 'doctor', 'doctor', '王医生', '内科', '医护');
INSERT INTO `users` VALUES ('20', 'guahao', '111', null, null, '挂号人员');
INSERT INTO `users` VALUES ('21', 'wang1', '111', null, null, '挂号人员');
INSERT INTO `users` VALUES ('22', 'zhang1', '111', '张三丰', '眼科', '医护');
INSERT INTO `users` VALUES ('23', 'yaopin11', '111', null, null, '药品库');
