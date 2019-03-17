/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2019-03-16 09:57:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 我的博客', '7', 'add_article');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 我的博客', '7', 'change_article');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 我的博客', '7', 'delete_article');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 我的博客', '7', 'view_article');
INSERT INTO `auth_permission` VALUES ('29', 'Can add 文章类别', '8', 'add_category');
INSERT INTO `auth_permission` VALUES ('30', 'Can change 文章类别', '8', 'change_category');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete 文章类别', '8', 'delete_category');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 文章类别', '8', 'view_category');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 文章标签', '9', 'add_tag');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 文章标签', '9', 'change_tag');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 文章标签', '9', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('36', 'Can view 文章标签', '9', 'view_tag');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 访问用户信息', '10', 'add_userip');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 访问用户信息', '10', 'change_userip');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 访问用户信息', '10', 'delete_userip');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 访问用户信息', '10', 'view_userip');
INSERT INTO `auth_permission` VALUES ('41', 'Can add 网站访问总次数', '11', 'add_visitnumber');
INSERT INTO `auth_permission` VALUES ('42', 'Can change 网站访问总次数', '11', 'change_visitnumber');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete 网站访问总次数', '11', 'delete_visitnumber');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 网站访问总次数', '11', 'view_visitnumber');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$120000$Z9gErcONSA6H$m1guGIlqMd+FVUxrX1DX2vIXqRtIjQC11eFj7jURV7o=', '2019-03-03 02:46:59.691531', '1', 'fatal', '', '', '1564649449@qq.com', '1', '1', '2019-03-03 02:46:33.868494');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2019-03-03 03:23:20.601745', '1', '回忆', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2019-03-03 03:23:31.035852', '2', 'python', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2019-03-03 03:23:37.963356', '3', 'django', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2019-03-03 03:28:16.478784', '1', '回忆', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2019-03-03 03:29:22.213439', '1', '少龙的回忆', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2019-03-03 08:22:59.779411', '2', '一路向北', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2019-03-03 08:24:06.760342', '3', '年少有为', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2019-03-03 08:26:10.229021', '4', '你，好不好', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2019-03-03 08:27:14.271082', '5', '三人游', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2019-03-03 17:02:22.407910', '2', 'aaa', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2019-03-03 17:02:32.617614', '2', 'python', '2', '[{\"changed\": {\"fields\": [\"cname\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2019-03-03 17:03:53.260092', '6', 'i believe', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2019-03-05 14:02:42.209454', '3', 'django', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2019-03-05 14:03:05.445306', '4', 'java', '1', '[{\"added\": {}}]', '8', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'person', 'article');
INSERT INTO `django_content_type` VALUES ('8', 'person', 'category');
INSERT INTO `django_content_type` VALUES ('9', 'person', 'tag');
INSERT INTO `django_content_type` VALUES ('10', 'person', 'userip');
INSERT INTO `django_content_type` VALUES ('11', 'person', 'visitnumber');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-03-03 02:42:49.873330');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2019-03-03 02:42:50.923522');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2019-03-03 02:42:51.174850');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2019-03-03 02:42:51.187816');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2019-03-03 02:42:51.200806');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2019-03-03 02:42:51.353373');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2019-03-03 02:42:51.443133');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2019-03-03 02:42:51.536881');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2019-03-03 02:42:51.547852');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2019-03-03 02:42:51.625643');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2019-03-03 02:42:51.631627');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2019-03-03 02:42:51.643596');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2019-03-03 02:42:51.730365');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2019-03-03 02:42:51.824115');
INSERT INTO `django_migrations` VALUES ('15', 'person', '0001_initial', '2019-03-03 02:42:52.460414');
INSERT INTO `django_migrations` VALUES ('16', 'sessions', '0001_initial', '2019-03-03 02:42:52.540199');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('6orwpg1es437xczp4s1e2wbdjciejqhe', 'MDg5MmVjMmRiZWIxODc4ZjEwOGY2ODRhYmI4YzFmNjAxOWQ0MzRjMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMWZiNjliNTg1NjI0ZTU4YjViMWZjOGVlYmUxMDg0ZmQzNjI5N2QwIn0=', '2019-03-17 02:46:59.697442');

-- ----------------------------
-- Table structure for person_article
-- ----------------------------
DROP TABLE IF EXISTS `person_article`;
CREATE TABLE `person_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` longtext NOT NULL,
  `createTime` datetime(6) NOT NULL,
  `modifyTime` datetime(6) NOT NULL,
  `clickNums` int(11) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `isShow` tinyint(1) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `person_article_category_id_3047ba20_fk_person_category_id` (`category_id`),
  CONSTRAINT `person_article_category_id_3047ba20_fk_person_category_id` FOREIGN KEY (`category_id`) REFERENCES `person_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person_article
-- ----------------------------
INSERT INTO `person_article` VALUES ('1', '少龙的回忆', '时间像奔跑的火车\r\n记忆它是乘客\r\n载着悲伤快乐\r\n再见了\r\n要各自安静生活了\r\n往事就化成断点零星飘荡回忆了\r\n一瞬间\r\n在电光火石之间\r\n又拼凑起昨天\r\n是否能再相见\r\n这思念\r\n交织缱绻了数年\r\n没说出的再见\r\n就这样跌跌撞撞再也不见\r\n一瞬间\r\n又记起你的脸\r\n一瞬间我又想起了说再见\r\n说再见\r\n要再见\r\n轨迹中缓缓的驶过\r\n阻隔了你和我\r\n有语却无从说\r\n再见了\r\n要各自安静生活了\r\n别隐藏却又凝望过去讽刺了执着\r\n我看见\r\n电光火石之间\r\n又拼凑起昨天\r\n是否能再相见\r\n这思念\r\n交织缱绻了数年\r\n没说出的再见\r\n就这样跌跌撞撞再也不见\r\n一瞬间\r\n又记起你的脸\r\n一瞬间我又想起了说再见\r\n说再见\r\n要再见', '2019-03-03 03:29:22.200482', '2019-03-03 03:29:22.200482', '0', 'pic_img/book.jpg', '1', '1');
INSERT INTO `person_article` VALUES ('2', '一路向北', '後视镜里的世界 越来越远的道别\r\n你转身向北 侧脸还是很美\r\n我用眼光去追 竟听见你的泪\r\n在车窗外面排徊 是我错失的机会\r\n你站的方位 跟我中间隔著泪\r\n街景一直在後退 你的崩溃在窗外零碎\r\n我一路向北 离开有你的季节\r\n你说你好累 已无法再爱上谁\r\n风在山路吹 过往的画面全都是我不对\r\n细数惭愧 我伤你几回\r\n後视镜里的世界 越来越远的道别\r\n你转身向北 侧脸还是很美\r\n我用眼光去追 竟听见你的泪\r\n在车窗外面排徊 是我错失的机会\r\n你站的方位 跟我中间隔著泪\r\n街景一直在後退 你的崩溃在窗外零碎\r\n我一路向北 离开有你的季节\r\n你说你好累 已无法再爱上谁\r\n风在山路吹 过往的画面全都是我不对\r\n细数惭愧 我伤你几回\r\n我一路向北 离开有你的季节\r\n方向盘周围 回转著我的後悔\r\n我加速超越 却甩不掉紧紧跟随的伤悲\r\n细数惭愧 我伤你几回\r\n停止狼狈 就让错纯粹', '2019-03-03 08:22:59.765447', '2019-03-03 08:22:59.765447', '0', 'pic_img/book.jpg', '1', '1');
INSERT INTO `person_article` VALUES ('3', '年少有为', '电视一直闪\r\n联络方式都还没删\r\n你待我的好\r\n我却错手毁掉\r\n也曾一起想\r\n有个地方睡觉吃饭\r\n可怎么去熬日夜颠倒\r\n连头款也凑不到\r\n墙板被我砸烂\r\n到现在还没修\r\n一碗热的粥\r\n你怕我没够\r\n都留一半带走\r\n给你形容美好\r\n今后你常常眼睛会红\r\n原来心疼我\r\n我那时候不懂\r\n假如我年少有为不自卑\r\n懂得什么是珍贵\r\n那些美梦\r\n没给你我一生有愧\r\n假如我年少有为知进退\r\n才不会让你替我受罪\r\n婚礼上多喝几杯\r\n和你现在那位\r\n也曾一起想\r\n有个地方睡觉吃饭\r\n可怎么去熬日夜颠倒\r\n连头款也凑不到\r\n墙板被我砸烂\r\n到现在还没修\r\n一碗热的粥\r\n你怕我没够\r\n都留一半带走\r\n给你形容美好\r\n今后你常常眼睛会红\r\n原来心疼我\r\n我那时候不懂\r\n假如我年少有为不自卑\r\n懂得什么是珍贵\r\n那些美梦\r\n没给你我一生有愧\r\n假如我年少有为知进退\r\n才不会让你替我受罪\r\n婚礼上多喝几杯\r\n和你现在那位\r\n假如我年少有为不自卑\r\n尝过后悔的滋味\r\n金钱地位\r\n搏到了却好想退回\r\n假如我年少有为知进退\r\n才不会让你替我受罪\r\n婚礼上多喝几杯\r\n和你现在那位\r\n在婚礼上多喝几杯\r\n祝我年少有为', '2019-03-03 08:24:06.747408', '2019-03-03 08:24:06.747408', '0', 'pic_img/book.jpg', '1', '4');
INSERT INTO `person_article` VALUES ('4', '你，好不好', '是不是 还那么爱迟到\r\n熬夜工作 又睡不好\r\n等你 完成你的目标\r\n要戒掉逞强的嗜好\r\n都怪我 把自尊放太高\r\n没有把你照顾好\r\n骄傲 是脆弱的外表\r\n最怕我的心 你不要\r\n能不能继续\r\n对我哭 对我笑 对我好\r\n继续让我\r\n为你想 为你疯 陪你老\r\n你好不好\r\n好想知道\r\n别急着把回忆都丢掉\r\n我只需要你在身边\r\n陪我吵 陪我闹\r\n用好的我 把过去坏的我 都换掉\r\n好想听到 你坚决说爱我\r\n可惜回不去那一秒\r\n你 好不好\r\n天知道 我快要受不了\r\n后悔钻进心里烧\r\n拥抱 再多一次就好\r\n你要的 我都做得到\r\n能不能继续\r\n对我哭 对我笑 对我好\r\n继续让我\r\n为你想 为你疯 陪你老\r\n给你的好\r\n还要不要\r\n答案我却不敢揭晓\r\n我只需要你在身边\r\n陪我吵 陪我闹\r\n别用离开教我\r\n失去的人最重要\r\n别说 你曾经爱过我\r\n让我们回到那一秒\r\n你 好不好\r\n能不能继续\r\n对我哭 对我笑 对我好\r\n继续让我\r\n为你想 为你疯 陪你老\r\n你好不好 我好想知道\r\n别急着把我的爱丢掉\r\n我只需要你在身边\r\n陪我吵 陪我闹\r\n别用离开教我\r\n失去的人最重要\r\n别说 你曾经爱过我\r\n让我们回到那一秒\r\n你 好不好', '2019-03-03 08:26:10.224034', '2019-03-03 08:26:10.225033', '0', 'pic_img/book.jpg', '1', '3');
INSERT INTO `person_article` VALUES ('5', '三人游', '有些话你选择不对他说\r\n\r\n你说某种脆弱 我才感同身受\r\n\r\n我永远都愿意当个听众 安慰你的痛\r\n\r\n保护着你从始至终\r\n\r\n就算你的爱 属于他了\r\n\r\n就算你的手 他还牵着\r\n\r\n就算你累了 我会在这\r\n\r\n一人留 两人疚 三人游\r\n\r\n悄悄的 远远的 或许舍不得\r\n\r\n默默地 静静地 或许很值得\r\n\r\n我还在某处守候着\r\n\r\n说不定这也是一种幸福的资格\r\n\r\n至少我们中还有人能快乐\r\n\r\n这样就已足够了\r\n\r\n有些话我选择保持沉默\r\n\r\n别把实话说破 隐藏我的寂寞\r\n\r\n你的情绪依然把我牵动\r\n\r\n躲在你心中 角落的心事我能懂\r\n\r\n就算你的爱 属于他了\r\n\r\n就算你的手 他还牵着\r\n\r\n就算你累了 我会在这\r\n\r\n一人留 两人疚 三人游\r\n\r\n悄悄的 远远的 或许舍不得\r\n\r\n默默地 静静地 或许很值得\r\n\r\n我还在某处守候着\r\n\r\n说不定这也是一种幸福的资格\r\n\r\n至少我们中还有人能快乐\r\n\r\n这样就已足够了\r\n\r\n不知道 不知道 不知道\r\n\r\n为什么 为什么 我的爱\r\n\r\n我的爱 还留不住你的离开\r\n\r\n却又总在等待着你回来\r\n\r\n一人留 两人疚 三人游\r\n\r\n悄悄的 远远的 或许舍不得\r\n\r\n默默地 静静地 或许很值得\r\n\r\n我还在某处守候着\r\n\r\n说不定 这也是一种 得不到的 却美好的\r\n\r\n至少我们中还有人能快乐\r\n\r\n这样就已足够了\r\n\r\n至少我们中还有人能快乐\r\n\r\n这样就已经够了', '2019-03-03 08:27:14.260086', '2019-03-05 12:28:37.624287', '10', 'pic_img/book.jpg', '1', '1');
INSERT INTO `person_article` VALUES ('6', 'i believe', 'I Believe 你还在那里等待\r\n\r\n爱的路 总是充满了祝福\r\n\r\nI Believe 你还在把爱深埋\r\n\r\n我在这里 为你整夜在徘徊\r\n\r\n看不到未来 却挡不住相爱\r\n\r\n就算短暂分开也不能把这缘分结束\r\n曾经走过漫漫长路 只要有爱默默的祈祷\r\n\r\n真心的让彼此更幸福\r\n\r\n曾经走过漫漫长路 泪水模糊了我和你\r\n\r\n那一刻我们俩 依偎在一起\r\n从此永远不再分离\r\nI Believe 你还在那里等待\r\n\r\n爱的路 总是充满了祝福\r\n\r\nI Believe 你还在把爱深埋\r\n\r\n我在这里 为你整夜在徘徊\r\n\r\n看不到未来 却挡不住相爱\r\n\r\n就算短暂分开也不能把这缘分结束\r\n\r\n曾经走过漫漫长路 只要有爱默默的祈祷\r\n\r\n真心的让彼此更幸福\r\n\r\n曾经走过漫漫长路 泪水模糊了我和你\r\n\r\n那一刻我们俩 依偎在一起 从此永远不再分离\r\n\r\n我相信那份爱 这份感动\r\n只要你拥有这勇气 真心付出自己\r\n\r\n一切都为爱人而牵挂 再长的等待也不怕\r\n\r\n曾经走过漫漫长路 只要有爱默默的祈祷\r\n\r\n真心的让彼此更幸福\r\n曾经走过漫漫长路 泪水模糊了我和你\r\n\r\n那一刻我们俩 依偎在一起\r\n从此永远不再分离 从此永远不再分离', '2019-03-03 17:03:53.246131', '2019-03-15 21:24:13.560771', '38', 'pic_img/book.jpg', '1', '2');

-- ----------------------------
-- Table structure for person_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `person_article_tag`;
CREATE TABLE `person_article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_article_tag_article_id_tag_id_7edebaec_uniq` (`article_id`,`tag_id`),
  KEY `person_article_tag_tag_id_00e3a582_fk_person_tag_id` (`tag_id`),
  CONSTRAINT `person_article_tag_article_id_625040cc_fk_person_article_id` FOREIGN KEY (`article_id`) REFERENCES `person_article` (`id`),
  CONSTRAINT `person_article_tag_tag_id_00e3a582_fk_person_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `person_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person_article_tag
-- ----------------------------
INSERT INTO `person_article_tag` VALUES ('1', '1', '1');
INSERT INTO `person_article_tag` VALUES ('2', '2', '1');
INSERT INTO `person_article_tag` VALUES ('3', '3', '1');
INSERT INTO `person_article_tag` VALUES ('4', '4', '1');
INSERT INTO `person_article_tag` VALUES ('5', '5', '1');
INSERT INTO `person_article_tag` VALUES ('6', '6', '2');

-- ----------------------------
-- Table structure for person_category
-- ----------------------------
DROP TABLE IF EXISTS `person_category`;
CREATE TABLE `person_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  `isShow` tinyint(1) NOT NULL,
  `lifeOrStudy` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cname` (`cname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person_category
-- ----------------------------
INSERT INTO `person_category` VALUES ('1', '回忆', '1', '慢生活');
INSERT INTO `person_category` VALUES ('2', 'python', '1', '学无止境');
INSERT INTO `person_category` VALUES ('3', 'django', '1', '学无止境');
INSERT INTO `person_category` VALUES ('4', 'java', '1', '学无止境');

-- ----------------------------
-- Table structure for person_tag
-- ----------------------------
DROP TABLE IF EXISTS `person_tag`;
CREATE TABLE `person_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(30) NOT NULL,
  `isShow` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tname` (`tname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person_tag
-- ----------------------------
INSERT INTO `person_tag` VALUES ('1', '回忆', '1');
INSERT INTO `person_tag` VALUES ('2', 'python', '1');
INSERT INTO `person_tag` VALUES ('3', 'django', '1');

-- ----------------------------
-- Table structure for person_userip
-- ----------------------------
DROP TABLE IF EXISTS `person_userip`;
CREATE TABLE `person_userip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(30) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person_userip
-- ----------------------------
INSERT INTO `person_userip` VALUES ('1', '127.0.0.1', '900');

-- ----------------------------
-- Table structure for person_visitnumber
-- ----------------------------
DROP TABLE IF EXISTS `person_visitnumber`;
CREATE TABLE `person_visitnumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person_visitnumber
-- ----------------------------
INSERT INTO `person_visitnumber` VALUES ('1', '902');
