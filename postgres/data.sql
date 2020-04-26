CREATE TABLE public.admin_users (
  id serial NOT NULL PRIMARY KEY
,  name varchar(50) NOT NULL
,  password varchar(191) NOT NULL DEFAULT ''
,  status int NOT NULL DEFAULT '1'
,  remember_token varchar(100) DEFAULT NULL
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
,  UNIQUE (name)
);
INSERT INTO admin_users VALUES(1,'admin','$2y$10$ZkzIFfaDuvF3gqztzJ6VouT3ngYnpSqmYALwDpQw1SqWqLGiNi8C6',1,NULL,NULL,NULL);
CREATE TABLE public.categories (
  id serial NOT NULL PRIMARY KEY
,  name varchar(50) NOT NULL DEFAULT ''
,  pid int  NOT NULL DEFAULT '0'
,  model_id int  NOT NULL DEFAULT '0'
,  "order" int  NOT NULL DEFAULT '0'
,  title varchar(191) NOT NULL DEFAULT ''
,  keywords varchar(191) NOT NULL DEFAULT ''
,  description varchar(191) NOT NULL DEFAULT ''
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
,  UNIQUE (pid,name,model_id)
);
CREATE TABLE public.comment_operate_logs (
  id serial NOT NULL PRIMARY KEY
,  user_id int  NOT NULL DEFAULT '0'
,  comment_id int  NOT NULL DEFAULT '0'
,  operate varchar(20) NOT NULL DEFAULT ''
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE public.comments (
  id serial NOT NULL PRIMARY KEY
,  user_id int  NOT NULL DEFAULT '0'
,  is_admin int  NOT NULL DEFAULT '0'
,  entity_id int  NOT NULL DEFAULT '0'
,  content_id int  NOT NULL DEFAULT '0'
,  content varchar(1024) NOT NULL DEFAULT ''
,  "like" int  NOT NULL DEFAULT '0'
,  dislike int  NOT NULL DEFAULT '0'
,  grade int  NOT NULL DEFAULT '0'
,  pid int  NOT NULL DEFAULT '0'
,  rid int  NOT NULL DEFAULT '0'
,  status int  NOT NULL DEFAULT '0'
,  reply_count int  NOT NULL DEFAULT '0'
,  reply_user_id int  NOT NULL DEFAULT '0'
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE public.configs (
  id serial NOT NULL PRIMARY KEY
,  name varchar(50) NOT NULL DEFAULT ''
,  key varchar(100) NOT NULL DEFAULT ''
,  value varchar(2048) NOT NULL DEFAULT ''
,  type int NOT NULL DEFAULT '0'
,  "group" varchar(50) NOT NULL DEFAULT ''
,  remark varchar(191) NOT NULL DEFAULT ''
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
,  UNIQUE (key)
);
INSERT INTO configs VALUES(1,'富文本编辑器','RICH_TEXT_EDITOR','neditor',1,'系统','系统富文本编辑器类型。有效设置值：neditor、ueditor。','2019-09-16 10:02:46','2019-09-17 09:37:17');
INSERT INTO configs VALUES(2,'行内表单展示数','FORM_INLINE_NUM','5',0,'系统','','2019-09-16 10:19:01','2019-09-16 10:19:01');
CREATE TABLE public.content_tags (
  id serial NOT NULL PRIMARY KEY
,  entity_id int  NOT NULL
,  content_id int  NOT NULL
,  tag_id int  NOT NULL
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE public.courses (
  id serial NOT NULL PRIMARY KEY
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
,  title varchar(64) NOT NULL DEFAULT ''
,  teacher_id int NOT NULL DEFAULT '0'
,  image varchar(255) NOT NULL DEFAULT ''
,  "desc" varchar(255) NOT NULL DEFAULT ''
,  open_date date DEFAULT NULL
,  level varchar(255) NOT NULL DEFAULT ''
);
INSERT INTO courses VALUES(1,'2020-03-25 01:05:55','2020-03-30 22:12:50','测试课程名称标题字段只能是title',3,'http://localhost:8000/upload/image/202003/zMvM01C9AFS2SIxV43CEe8f1wZ0LnuQ2lBk9Typv.png','用来测试的课程，没有任何要求，谁都可以随便报。','2020-03-31','0');
CREATE TABLE public.entities (
  id serial NOT NULL PRIMARY KEY
,  name varchar(50) NOT NULL DEFAULT ''
,  table_name varchar(64) NOT NULL DEFAULT ''
,  description varchar(191) NOT NULL DEFAULT ''
,  is_internal int  NOT NULL DEFAULT '0'
,  enable_comment int  NOT NULL DEFAULT '0'
,  is_show_content_manage int  NOT NULL DEFAULT '1'
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
,  UNIQUE (table_name)
);
INSERT INTO entities VALUES(3,'课程安排','courses','课程表',0,0,1,'2020-03-24 23:45:56','2020-04-16 11:40:39');
INSERT INTO entities VALUES(7,'汉字手工','hanzi_video','汉字手工',0,0,1,'2020-04-16 22:26:34','2020-04-16 22:26:34');
INSERT INTO entities VALUES(8,'汉字闯关','hanzi_game','汉字闯关',0,0,1,'2020-04-16 22:26:54','2020-04-16 22:26:54');
INSERT INTO entities VALUES(9,'汉字读本','hanzi_book','汉字读本',0,0,1,'2020-04-16 22:27:11','2020-04-16 22:27:11');
CREATE TABLE public.entity_fields (
  id serial NOT NULL PRIMARY KEY
,  name varchar(64) NOT NULL DEFAULT ''
,  type varchar(191) NOT NULL DEFAULT ''
,  comment varchar(100) NOT NULL DEFAULT ''
,  default_value varchar(191) NOT NULL DEFAULT ''
,  form_name varchar(20) NOT NULL DEFAULT ''
,  form_type varchar(191) NOT NULL DEFAULT ''
,  form_comment varchar(100) NOT NULL DEFAULT ''
,  form_params varchar(1024) NOT NULL DEFAULT ''
,  is_show int  NOT NULL DEFAULT '1'
,  is_show_inline int  NOT NULL DEFAULT '0'
,  is_edit int  NOT NULL DEFAULT '1'
,  is_required int  NOT NULL DEFAULT '0'
,  entity_id int  NOT NULL DEFAULT '0'
,  "order" int  NOT NULL DEFAULT '77'
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
,  form_default_value varchar(191) NOT NULL DEFAULT ''
,  UNIQUE (entity_id,name)
);
INSERT INTO entity_fields VALUES(16,'title','string','','','课程名称','input','','',1,0,1,1,3,0,'2020-03-25 00:34:49','2020-03-25 00:34:49','');
INSERT INTO entity_fields VALUES(17,'teacher_id','tinyInteger','','','教师ID','reference_admin_user','','',1,1,1,1,3,1,'2020-03-25 00:36:42','2020-03-25 01:03:06','');
INSERT INTO entity_fields VALUES(18,'image','string','','','课程图片','upload','','',1,0,1,1,3,2,'2020-03-25 00:38:20','2020-03-25 00:38:20','');
INSERT INTO entity_fields VALUES(19,'desc','string','','','课程简介','textArea','','',1,0,1,1,3,3,'2020-03-25 00:39:40','2020-03-25 00:39:51','');
INSERT INTO entity_fields VALUES(20,'open_date','date','','','开课时间','date','','',1,1,1,1,3,4,'2020-03-25 00:40:53','2020-03-25 01:03:13','');
INSERT INTO entity_fields VALUES(21,'level','string','','','级别','option','','0=初级\n1=中级\n2=高级\n3=补充',1,1,1,1,3,5,'2020-03-25 00:43:02','2020-04-16 22:43:07','');
INSERT INTO entity_fields VALUES(22,'title','string','视频标题','','视频标题','input','','',1,0,1,1,7,1,'2020-04-16 22:28:09','2020-04-16 22:31:43','');
INSERT INTO entity_fields VALUES(23,'source','string','视频链接','','视频链接','input','','',1,0,1,1,7,2,'2020-04-16 22:30:30','2020-04-16 22:31:45','');
INSERT INTO entity_fields VALUES(24,'desc','string','视频描述','','视频描述','richText','','',1,0,1,1,7,4,'2020-04-16 22:31:09','2020-04-17 11:03:03','');
INSERT INTO entity_fields VALUES(25,'image','string','视频图片','','视频图片','upload','','',1,0,1,1,7,3,'2020-04-17 11:02:53','2020-04-17 11:03:04','');
INSERT INTO entity_fields VALUES(26,'title','string','游戏标题','','游戏标题','input','','',1,0,1,1,8,1,'2020-04-17 11:03:57','2020-04-17 11:03:57','');
INSERT INTO entity_fields VALUES(27,'image','string','游戏截图','','游戏截图','uploadMulti','','',1,0,1,1,8,3,'2020-04-17 11:04:40','2020-04-17 11:05:49','');
INSERT INTO entity_fields VALUES(28,'link','string','游戏链接','','游戏链接','input','','',1,0,1,1,8,2,'2020-04-17 11:05:03','2020-04-17 11:05:50','');
INSERT INTO entity_fields VALUES(29,'desc','string','游戏描述','','游戏描述','textArea','','',1,0,1,1,8,4,'2020-04-17 11:05:36','2020-04-17 11:05:36','');
INSERT INTO entity_fields VALUES(30,'title','string','读本名称','','读本名称','input','','',1,0,1,1,9,1,'2020-04-17 11:06:30','2020-04-17 11:06:30','');
INSERT INTO entity_fields VALUES(31,'link','string','资源链接','','资源链接','input','','',1,0,1,1,9,2,'2020-04-17 11:06:54','2020-04-17 11:06:54','');
INSERT INTO entity_fields VALUES(32,'image','string','封面截图','','封面截图','upload','','',1,0,1,1,9,3,'2020-04-17 11:07:19','2020-04-17 11:07:19','');
INSERT INTO entity_fields VALUES(33,'desc','string','读本简介','','读本简介','richText','','',1,0,1,1,9,4,'2020-04-17 11:07:49','2020-04-17 11:07:49','');
CREATE TABLE public.hanzi_book (
  id serial NOT NULL PRIMARY KEY
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
,  title varchar(255) NOT NULL DEFAULT ''
,  link varchar(255) NOT NULL DEFAULT ''
,  image varchar(255) NOT NULL DEFAULT ''
,  "desc" varchar(255) NOT NULL DEFAULT ''
);
CREATE TABLE public.hanzi_game (
  id serial NOT NULL PRIMARY KEY
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
,  title varchar(255) NOT NULL DEFAULT ''
,  image varchar(255) NOT NULL DEFAULT ''
,  link varchar(255) NOT NULL DEFAULT ''
,  "desc" varchar(255) NOT NULL DEFAULT ''
);
CREATE TABLE public.hanzi_video (
  id serial NOT NULL PRIMARY KEY
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
,  title varchar(255) NOT NULL DEFAULT ''
,  source varchar(255) NOT NULL DEFAULT ''
,  "desc" varchar(255) NOT NULL DEFAULT ''
,  image varchar(255) NOT NULL DEFAULT ''
);
CREATE TABLE public.logs (
  id serial NOT NULL PRIMARY KEY
,  user_id int  NOT NULL DEFAULT '0'
,  user_name varchar(50) NOT NULL DEFAULT ''
,  url varchar(191) NOT NULL DEFAULT ''
,  data text NOT NULL
,  ip varchar(15) NOT NULL DEFAULT ''
,  ua varchar(191) NOT NULL DEFAULT ''
,  type int NOT NULL DEFAULT '0'
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE public.menus (
  id serial NOT NULL PRIMARY KEY
,  name varchar(50) NOT NULL DEFAULT ''
,  pid int  NOT NULL DEFAULT '0'
,  status int NOT NULL DEFAULT '1'
,  is_lock_name int NOT NULL DEFAULT '0'
,  "order" int  NOT NULL DEFAULT '0'
,  route varchar(100) NOT NULL DEFAULT ''
,  url varchar(512) NOT NULL DEFAULT ''
,  "group" varchar(50) NOT NULL DEFAULT ''
,  guard_name varchar(50) NOT NULL DEFAULT 'admin'
,  remark varchar(191) NOT NULL DEFAULT ''
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
,  route_params varchar(191) NOT NULL DEFAULT ''
,  UNIQUE (name)
,  UNIQUE (route,route_params)
);
INSERT INTO menus VALUES(23,'用户登录页面',0,0,0,1,'admin::login.show','/admin/login','基础功能','admin','','2019-02-28 12:50:35','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(24,'用户登录',0,0,0,1,'admin::login','/admin/login','基础功能','admin','','2019-02-28 12:50:35','2019-03-08 10:35:50','');
INSERT INTO menus VALUES(26,'首页',0,1,0,1,'admin::index','/admin/index','','admin','','2019-02-28 12:50:35','2020-03-20 06:16:22','');
INSERT INTO menus VALUES(27,'管理员列表',40,1,0,1,'admin::adminUser.index','/admin/admin_users','管理员管理','admin','','2019-02-28 12:50:35','2020-03-20 05:14:18','');
INSERT INTO menus VALUES(28,'管理员列表数据',40,0,0,2,'admin::adminUser.list','/admin/admin_users/list','管理员管理','admin','','2019-02-28 12:50:35','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(29,'新增管理员',40,0,0,2,'admin::adminUser.create','/admin/admin_users/create','管理员管理','admin','','2019-02-28 12:50:35','2020-03-20 04:16:01','');
INSERT INTO menus VALUES(30,'保存管理员',40,0,0,1,'admin::adminUser.save','/admin/admin_users','管理员管理','admin','','2019-02-28 12:50:35','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(31,'编辑管理员',40,0,0,2,'admin::adminUser.edit','','管理员管理','admin','','2019-02-28 12:50:35','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(32,'更新管理员',40,0,0,2,'admin::adminUser.update','','管理员管理','admin','','2019-02-28 12:50:35','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(33,'菜单列表',40,1,0,1,'admin::menu.index','/admin/menus','菜单管理','admin','','2019-02-28 12:50:35','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(34,'菜单列表数据',40,0,0,1,'admin::menu.list','/admin/menus/list','菜单管理','admin','','2019-02-28 12:50:35','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(35,'新增菜单',40,0,0,2,'admin::menu.create','/admin/menus/create','菜单管理','admin','','2019-02-28 12:50:35','2020-03-20 04:15:59','');
INSERT INTO menus VALUES(36,'保存菜单',40,0,0,1,'admin::menu.save','/admin/menus','菜单管理','admin','','2019-02-28 12:50:35','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(37,'编辑菜单',40,0,0,2,'admin::menu.edit','','菜单管理','admin','','2019-02-28 12:50:35','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(38,'更新菜单',40,0,0,1,'admin::menu.update','','菜单管理','admin','','2019-02-28 12:50:35','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(40,'系统管理',0,1,1,2,'admin::config.index','/admin/configs','','admin','',NULL,'2020-03-20 04:58:06','');
INSERT INTO menus VALUES(41,'自动更新菜单',40,0,0,1,'admin::menu.discovery','/admin/menus/discovery','菜单管理','admin','','2019-02-28 15:36:34','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(43,'角色列表',40,1,0,1,'admin::role.index','/admin/roles','角色管理','admin','','2019-03-01 14:17:26','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(44,'角色列表数据接口',40,0,0,1,'admin::role.list','/admin/roles/list','角色管理','admin','','2019-03-01 14:17:26','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(45,'新增角色',40,0,0,2,'admin::role.create','/admin/roles/create','角色管理','admin','','2019-03-01 14:17:26','2020-03-20 04:51:38','');
INSERT INTO menus VALUES(46,'保存角色',40,0,0,1,'admin::role.save','/admin/roles','角色管理','admin','','2019-03-01 14:17:26','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(47,'编辑角色',40,0,0,1,'admin::role.edit','','角色管理','admin','','2019-03-01 14:17:26','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(48,'更新角色',40,0,0,1,'admin::role.update','','角色管理','admin','','2019-03-01 14:17:26','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(49,'分配角色',40,0,0,1,'admin::adminUser.role.edit','','管理员管理','admin','','2019-03-01 16:54:43','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(50,'更新用户角色',40,0,0,1,'admin::adminUser.role.update','','管理员管理','admin','','2019-03-01 16:54:43','2019-03-21 16:37:32','');
INSERT INTO menus VALUES(51,'分配权限',40,0,0,1,'admin::role.permission.edit','','角色管理','admin','','2019-03-02 12:04:28','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(52,'更新权限',40,0,0,1,'admin::role.permission.update','','角色管理','admin','','2019-03-02 12:04:28','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(53,'配置列表数据接口',40,0,0,1,'admin::config.list','/admin/configs/list','配置管理','admin','','2019-03-04 12:09:17','2020-04-20 01:27:03','');
INSERT INTO menus VALUES(54,'新增配置',40,0,0,7,'admin::config.create','/admin/configs/create','配置管理','admin','','2019-03-04 12:09:17','2020-03-20 04:15:54','');
INSERT INTO menus VALUES(55,'保存配置',40,0,0,1,'admin::config.save','/admin/configs','配置管理','admin','','2019-03-04 12:09:17','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(56,'编辑配置',40,0,0,1,'admin::config.edit','','配置管理','admin','','2019-03-04 12:09:17','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(57,'更新配置',40,0,0,1,'admin::config.update','','配置管理','admin','','2019-03-04 12:09:17','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(58,'日志列表',40,1,0,10,'admin::log.index','/admin/logs','日志管理','admin','','2019-03-06 09:53:46','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(59,'日志列表数据接口',40,0,0,1,'admin::log.list','/admin/logs/list','日志管理','admin','','2019-03-06 09:53:46','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(61,'批量操作',40,0,0,1,'admin::menu.batch','/admin/menus/batch','菜单管理','admin','','2019-03-06 16:03:14','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(64,'删除菜单',40,0,0,1,'admin::menu.delete','','菜单管理','admin','','2019-03-07 09:45:17','2019-03-07 16:52:51','');
INSERT INTO menus VALUES(79,'分类列表',26,1,0,20,'admin::category.index','/admin/categories','分类管理','admin','','2019-03-08 08:57:30','2019-03-15 10:30:40','');
INSERT INTO menus VALUES(80,'分类列表数据接口',26,0,0,1,'admin::category.list','/admin/categories/list','分类管理','admin','','2019-03-08 08:57:30','2019-03-08 09:07:41','');
INSERT INTO menus VALUES(81,'新增分类',26,0,0,21,'admin::category.create','/admin/categories/create','分类管理','admin','','2019-03-08 08:57:30','2020-03-20 04:15:05','');
INSERT INTO menus VALUES(82,'保存分类',26,0,0,1,'admin::category.save','/admin/categories','分类管理','admin','','2019-03-08 08:57:30','2019-03-08 09:07:11','');
INSERT INTO menus VALUES(83,'编辑分类',26,0,0,1,'admin::category.edit','','分类管理','admin','','2019-03-08 08:57:30','2019-03-08 09:07:11','');
INSERT INTO menus VALUES(84,'更新分类',26,0,0,1,'admin::category.update','','分类管理','admin','','2019-03-08 08:57:30','2019-03-08 09:07:11','');
INSERT INTO menus VALUES(85,'退出登录',0,0,0,1,'admin::logout','/admin/logout','基础功能','admin','','2019-03-08 10:50:34','2019-03-08 10:50:53','');
INSERT INTO menus VALUES(86,'模型列表',26,1,0,0,'admin::entity.index','/admin/entities','模型管理','admin','','2019-03-08 11:57:54','2019-03-08 14:24:23','');
INSERT INTO menus VALUES(87,'模型列表数据接口',26,0,0,1,'admin::entity.list','/admin/entities/list','模型管理','admin','','2019-03-08 11:57:54','2019-03-08 11:58:50','');
INSERT INTO menus VALUES(88,'新增模型',26,0,0,1,'admin::entity.create','/admin/entities/create','模型管理','admin','','2019-03-08 11:57:54','2020-03-20 04:15:09','');
INSERT INTO menus VALUES(89,'保存模型',26,0,0,1,'admin::entity.save','/admin/entities','模型管理','admin','','2019-03-08 11:57:54','2019-03-08 11:58:31','');
INSERT INTO menus VALUES(90,'编辑模型',26,0,0,1,'admin::entity.edit','','模型管理','admin','','2019-03-08 11:57:54','2019-03-08 11:58:31','');
INSERT INTO menus VALUES(91,'更新模型',26,0,0,1,'admin::entity.update','','模型管理','admin','','2019-03-08 11:57:54','2019-03-08 11:58:31','');
INSERT INTO menus VALUES(92,'删除模型',26,0,0,1,'admin::entity.delete','','模型管理','admin','','2019-03-08 11:57:54','2019-03-08 11:58:31','');
INSERT INTO menus VALUES(93,'模型字段列表',26,0,0,10,'admin::entityField.index','/admin/entityFields','模型字段管理','admin','','2019-03-08 14:10:31','2020-03-20 04:17:22','');
INSERT INTO menus VALUES(94,'模型字段列表数据接口',26,0,0,1,'admin::entityField.list','/admin/entityFields/list','模型字段管理','admin','','2019-03-08 14:10:31','2019-03-08 14:11:20','');
INSERT INTO menus VALUES(95,'新增模型字段',26,0,0,11,'admin::entityField.create','/admin/entityFields/create','模型字段管理','admin','','2019-03-08 14:10:31','2020-03-20 04:15:14','');
INSERT INTO menus VALUES(96,'保存模型字段',26,0,0,1,'admin::entityField.save','/admin/entityFields','模型字段管理','admin','','2019-03-08 14:10:31','2019-03-08 14:11:08','');
INSERT INTO menus VALUES(97,'编辑模型字段',26,0,0,1,'admin::entityField.edit','','模型字段管理','admin','','2019-03-08 14:10:31','2019-03-08 14:11:08','');
INSERT INTO menus VALUES(98,'更新模型字段',26,0,0,1,'admin::entityField.update','','模型字段管理','admin','','2019-03-08 14:10:31','2019-03-08 14:11:08','');
INSERT INTO menus VALUES(99,'删除模型字段',26,0,0,1,'admin::entityField.delete','','模型字段管理','admin','','2019-03-08 14:10:31','2019-03-08 14:11:08','');
INSERT INTO menus VALUES(103,'保存内容',0,0,0,1,'admin::content.save','','内容管理','admin','','2019-03-15 10:33:49','2019-03-15 10:33:49','');
INSERT INTO menus VALUES(104,'编辑内容',107,0,0,1,'admin::content.edit','','内容管理','admin','','2019-03-15 10:33:49','2019-03-15 10:33:49','');
INSERT INTO menus VALUES(105,'更新内容',0,0,0,1,'admin::content.update','','内容管理','admin','','2019-03-15 10:33:49','2019-03-15 10:33:49','');
INSERT INTO menus VALUES(106,'删除内容',0,0,0,1,'admin::content.delete','','内容管理','admin','','2019-03-15 10:33:49','2019-03-15 10:33:49','');
INSERT INTO menus VALUES(107,'内容管理',0,1,0,3,'admin::aggregation','/admin/aggregation','','admin','','2019-03-15 10:36:29','2020-03-20 06:16:33','');
INSERT INTO menus VALUES(108,'内容列表',107,0,0,1,'admin::content.index','','内容管理','admin','','2019-03-16 11:34:06','2019-03-16 11:34:06','');
INSERT INTO menus VALUES(109,'内容列表数据接口',0,0,0,1,'admin::content.list','','内容管理','admin','','2019-03-16 11:34:06','2019-03-16 11:34:06','');
INSERT INTO menus VALUES(110,'新增内容',107,0,0,1,'admin::content.create','','内容管理','admin','','2019-03-16 11:34:06','2019-03-16 11:34:06','');
INSERT INTO menus VALUES(111,'图片上传',0,0,0,1,'admin::neditor.serve','','基础功能','admin','','2019-03-21 16:37:32','2019-03-21 16:40:36','');
INSERT INTO menus VALUES(112,'模板列表',26,1,0,55,'admin::template.index','/admin/templates','模板管理','admin','','2019-03-27 14:00:59','2019-03-27 14:09:25','');
INSERT INTO menus VALUES(113,'模板列表数据接口',26,0,0,77,'admin::template.list','/admin/templates/list','模板管理','admin','','2019-03-27 14:00:59','2019-03-27 14:08:20','');
INSERT INTO menus VALUES(114,'新增模板',26,0,0,55,'admin::template.create','/admin/templates/create','模板管理','admin','','2019-03-27 14:00:59','2020-03-20 04:15:17','');
INSERT INTO menus VALUES(115,'保存模板',26,0,0,77,'admin::template.save','/admin/templates','模板管理','admin','','2019-03-27 14:00:59','2019-03-27 14:08:20','');
INSERT INTO menus VALUES(116,'编辑模板',26,0,0,77,'admin::template.edit','','模板管理','admin','','2019-03-27 14:00:59','2019-03-27 14:08:20','');
INSERT INTO menus VALUES(117,'更新模板',26,0,0,77,'admin::template.update','','模板管理','admin','','2019-03-27 14:00:59','2019-03-27 14:08:20','');
INSERT INTO menus VALUES(118,'删除模板',26,0,0,77,'admin::template.delete','','模板管理','admin','','2019-03-27 14:00:59','2019-03-27 14:08:20','');
INSERT INTO menus VALUES(119,'学生列表',26,1,0,100,'admin::user.index','/admin/users','学生管理','admin','','2019-04-04 09:04:35','2020-03-20 04:19:42','');
INSERT INTO menus VALUES(120,'学生列表数据接口',26,0,0,100,'admin::user.list','/admin/users/list','学生管理','admin','','2019-04-04 09:04:35','2019-04-08 14:07:28','');
INSERT INTO menus VALUES(121,'新增学生',26,0,0,100,'admin::user.create','/admin/users/create','学生管理','admin','','2019-04-04 09:04:35','2020-03-20 04:15:20','');
INSERT INTO menus VALUES(122,'保存学生',26,0,0,100,'admin::user.save','/admin/users','学生管理','admin','','2019-04-04 09:04:35','2019-04-04 09:06:41','');
INSERT INTO menus VALUES(123,'编辑学生',26,0,0,100,'admin::user.edit','','学生管理','admin','','2019-04-04 09:04:35','2019-04-04 09:06:41','');
INSERT INTO menus VALUES(124,'更新学生',26,0,0,100,'admin::user.update','','学生管理','admin','','2019-04-04 09:04:35','2019-04-04 09:06:41','');
INSERT INTO menus VALUES(125,'删除学生',26,0,0,100,'admin::user.delete','','学生管理','admin','','2019-04-04 09:04:35','2019-04-04 09:06:41','');
INSERT INTO menus VALUES(126,'ueditor后端服务',0,0,0,0,'admin::ueditor.serve','/admin/ueditor/serve','ueditor','admin','','2019-10-23 09:49:15','2019-10-23 09:51:28','');
INSERT INTO menus VALUES(127,'字段快捷更新接口',0,0,0,0,'admin::entityField.listUpdate','','模型字段管理','admin','','2019-10-23 09:49:15','2019-10-23 10:43:10','');
INSERT INTO menus VALUES(128,'内容批量操作',0,0,0,0,'admin::content.batch','','内容管理','admin','','2019-10-23 09:49:15','2019-10-23 09:49:15','');
INSERT INTO menus VALUES(129,'评论列表',26,1,0,90,'admin::comment.index','/admin/comments','评论管理','admin','','2019-10-23 09:49:15','2019-10-23 11:03:11','');
INSERT INTO menus VALUES(130,'评论列表数据接口',26,0,0,90,'admin::comment.list','/admin/comments/list','评论管理','admin','','2019-10-23 09:49:15','2019-10-23 11:03:11','');
INSERT INTO menus VALUES(131,'编辑评论',26,0,0,90,'admin::comment.edit','','评论管理','admin','','2019-10-23 09:49:15','2019-10-23 11:03:11','');
INSERT INTO menus VALUES(132,'更新评论',26,0,0,90,'admin::comment.update','','评论管理','admin','','2019-10-23 09:49:15','2019-10-23 11:03:11','');
INSERT INTO menus VALUES(133,'删除评论',26,0,0,90,'admin::comment.delete','','评论管理','admin','','2019-10-23 09:49:15','2019-10-23 11:03:11','');
INSERT INTO menus VALUES(134,'标签列表',26,1,0,29,'admin::tag.index','/admin/tags','标签管理','admin','','2019-10-23 09:49:15','2019-10-23 10:54:35','');
INSERT INTO menus VALUES(135,'标签列表数据接口',26,0,0,30,'admin::tag.list','/admin/tags/list','标签管理','admin','','2019-10-23 09:49:15','2019-10-23 10:54:23','');
INSERT INTO menus VALUES(136,'新增标签',26,0,0,30,'admin::tag.create','/admin/tags/create','标签管理','admin','','2019-10-23 09:49:15','2020-03-20 04:14:59','');
INSERT INTO menus VALUES(137,'保存标签',26,0,0,30,'admin::tag.save','/admin/tags','标签管理','admin','','2019-10-23 09:49:15','2019-10-23 10:54:23','');
INSERT INTO menus VALUES(138,'编辑标签',26,0,0,30,'admin::tag.edit','','标签管理','admin','','2019-10-23 09:49:15','2019-10-23 10:54:23','');
INSERT INTO menus VALUES(139,'更新标签',26,0,0,30,'admin::tag.update','','标签管理','admin','','2019-10-23 09:49:15','2019-10-23 10:54:23','');
INSERT INTO menus VALUES(140,'删除标签',26,0,0,30,'admin::tag.delete','','标签管理','admin','','2019-10-23 09:49:15','2019-10-23 10:54:23','');
INSERT INTO menus VALUES(141,'数据报告',0,1,0,4,'admin::report','/admin/reports','','admin','','2020-04-20 00:31:09','2020-04-20 00:43:59','');
INSERT INTO menus VALUES(142,'系统环境',141,1,0,1,'admin::report.index','/admin/reports','系统环境','admin','','2020-04-20 00:43:09','2020-04-20 00:43:28','');
CREATE TABLE public.migrations (
  id serial NOT NULL PRIMARY KEY
,  migration varchar(191) NOT NULL
,  batch int NOT NULL
);
CREATE TABLE public.model_has_permissions (
  permission_id int  NOT NULL
,  model_type varchar(191) NOT NULL
,  model_id int  NOT NULL
,  PRIMARY KEY (permission_id,model_id,model_type)
,  CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES menus (id) ON DELETE CASCADE
);
INSERT INTO model_has_permissions VALUES(85,'App\Model\Admin\AdminUser',2);
INSERT INTO model_has_permissions VALUES(85,'App\Model\Admin\AdminUser',3);
CREATE TABLE public.model_has_roles (
  role_id int  NOT NULL
,  model_type varchar(191) NOT NULL
,  model_id int  NOT NULL
,  PRIMARY KEY (role_id,model_id,model_type)
,  CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE
);
INSERT INTO model_has_roles VALUES(3,'App\Model\Admin\AdminUser',3);
CREATE TABLE public.role_has_permissions (
  permission_id int  NOT NULL
,  role_id int  NOT NULL
,  PRIMARY KEY (permission_id,role_id)
,  CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES menus (id) ON DELETE CASCADE
,  CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE
);
INSERT INTO role_has_permissions VALUES(23,3);
INSERT INTO role_has_permissions VALUES(24,3);
INSERT INTO role_has_permissions VALUES(26,3);
INSERT INTO role_has_permissions VALUES(30,3);
INSERT INTO role_has_permissions VALUES(31,3);
INSERT INTO role_has_permissions VALUES(32,3);
INSERT INTO role_has_permissions VALUES(58,3);
INSERT INTO role_has_permissions VALUES(59,3);
INSERT INTO role_has_permissions VALUES(79,3);
INSERT INTO role_has_permissions VALUES(80,3);
INSERT INTO role_has_permissions VALUES(81,3);
INSERT INTO role_has_permissions VALUES(82,3);
INSERT INTO role_has_permissions VALUES(83,3);
INSERT INTO role_has_permissions VALUES(84,3);
INSERT INTO role_has_permissions VALUES(85,3);
INSERT INTO role_has_permissions VALUES(103,3);
INSERT INTO role_has_permissions VALUES(104,3);
INSERT INTO role_has_permissions VALUES(105,3);
INSERT INTO role_has_permissions VALUES(106,3);
INSERT INTO role_has_permissions VALUES(107,3);
INSERT INTO role_has_permissions VALUES(108,3);
INSERT INTO role_has_permissions VALUES(109,3);
INSERT INTO role_has_permissions VALUES(110,3);
INSERT INTO role_has_permissions VALUES(111,3);
INSERT INTO role_has_permissions VALUES(119,3);
INSERT INTO role_has_permissions VALUES(120,3);
INSERT INTO role_has_permissions VALUES(121,3);
INSERT INTO role_has_permissions VALUES(122,3);
INSERT INTO role_has_permissions VALUES(128,3);
INSERT INTO role_has_permissions VALUES(129,3);
INSERT INTO role_has_permissions VALUES(130,3);
INSERT INTO role_has_permissions VALUES(134,3);
INSERT INTO role_has_permissions VALUES(135,3);
INSERT INTO role_has_permissions VALUES(136,3);
INSERT INTO role_has_permissions VALUES(137,3);
INSERT INTO role_has_permissions VALUES(138,3);
INSERT INTO role_has_permissions VALUES(139,3);
INSERT INTO role_has_permissions VALUES(140,3);
CREATE TABLE public.roles (
  id serial NOT NULL PRIMARY KEY
,  name varchar(191) NOT NULL
,  guard_name varchar(191) NOT NULL
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
);
INSERT INTO roles VALUES(3,'老师','admin','2020-03-30 21:57:47','2020-04-16 22:38:45');
CREATE TABLE public.sensitive_words (
  id serial NOT NULL PRIMARY KEY
,  type varchar(191) NOT NULL DEFAULT ''
,  noun varchar(191) NOT NULL DEFAULT ''
,  verb varchar(191) NOT NULL DEFAULT ''
,  exclusive varchar(191) NOT NULL DEFAULT ''
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE public.sys_config (
  id serial PRIMARY KEY
,  name varchar(128) NOT NULL
,  key varchar(64) NOT NULL
,  value varchar(4000) NOT NULL
,  code varchar(256) DEFAULT NULL
,  data_type int DEFAULT NULL
,  parent_id int NOT NULL DEFAULT '0'
,  parent_key varchar(64) DEFAULT NULL
,  sort int NOT NULL DEFAULT '10'
,  project_id int DEFAULT '1'
,  copy_status int NOT NULL DEFAULT '1'
,  change_status int NOT NULL DEFAULT '2'
,  enable int DEFAULT '1'
,  update_time varchar(24) DEFAULT NULL
,  update_id int DEFAULT '0'
,  create_time varchar(24) DEFAULT NULL
,  create_id int DEFAULT '0'
);
INSERT INTO sys_config VALUES(24,'系统参数','system','','',NULL,0,NULL,15,1,1,2,1,'2017-09-15 17:02:30',4,'2017-09-15 16:54:52',4);
INSERT INTO sys_config VALUES(46,'日志控制配置','system.debug','false','',NULL,24,'system',15,1,1,1,1,'2019-02-24 00:00:08',0,'2017-09-15 17:06:21',4);
INSERT INTO sys_config VALUES(47,'短信配置','sms','','',NULL,0,'',15,1,1,2,1,'2019-02-20 22:45:41',1,'2017-09-15 17:06:56',4);
INSERT INTO sys_config VALUES(50,'短信账号','sms.username','test','',NULL,47,'sms',10,1,1,2,1,'2019-02-20 22:26:29',1,'2019-02-18 01:07:47',1);
INSERT INTO sys_config VALUES(51,'短信密码','sms.passwd','111111','',NULL,47,'sms',10,1,1,2,1,'2019-02-18 01:08:16',1,'2019-02-18 01:08:16',1);
INSERT INTO sys_config VALUES(52,'短信类型','sms.type','阿里云','',NULL,47,'sms',10,1,1,2,1,'2019-02-20 22:26:21',1,'2019-02-20 22:26:21',1);
INSERT INTO sys_config VALUES(53,'性别','sex','','',NULL,0,NULL,90,1,1,2,1,'2019-02-20 23:35:18',1,'2019-02-20 23:35:18',1);
INSERT INTO sys_config VALUES(54,'性别男','sex.male','男','1',NULL,53,'sex',91,1,1,2,1,'2019-02-20 23:40:19',1,'2019-02-20 23:35:45',1);
INSERT INTO sys_config VALUES(55,'性别女','sex.female','女','2',NULL,53,'sex',92,1,1,2,1,'2019-02-20 23:40:24',1,'2019-02-20 23:36:12',1);
INSERT INTO sys_config VALUES(56,'性别未知','sex.unknown','未知','3',NULL,53,'sex',93,1,1,2,1,'2019-02-20 23:40:29',1,'2019-02-20 23:36:46',1);
CREATE TABLE public.sys_department (
  id serial PRIMARY KEY
,  parent_id int DEFAULT '0'
,  name varchar(32) NOT NULL
,  code varchar(128) DEFAULT NULL
,  sort int DEFAULT '0'
,  linkman varchar(64) DEFAULT NULL
,  linkman_no varchar(32) DEFAULT NULL
,  remark varchar(128) DEFAULT NULL
,  enable int DEFAULT '1'
,  update_time varchar(24) DEFAULT NULL
,  update_id int DEFAULT '0'
,  create_time varchar(24) DEFAULT NULL
,  create_id int DEFAULT '0'
,  UNIQUE (name)
);
INSERT INTO sys_department VALUES(10001,0,'FLY的狐狸','ABC000',100,'','','',1,'2017-04-28 01:16:43',1,'2016-07-31 18:12:30',1);
INSERT INTO sys_department VALUES(10002,10001,'开发组','ABC001',101,NULL,NULL,NULL,1,'2016-07-31 18:15:29',1,'2016-07-31 18:15:29',1);
INSERT INTO sys_department VALUES(10003,10001,'产品组','ABC003',103,'','','',1,'2017-04-28 00:58:41',1,'2016-07-31 18:16:06',1);
INSERT INTO sys_department VALUES(10004,10001,'运营组','ABC004',104,NULL,NULL,NULL,1,'2016-07-31 18:16:30',1,'2016-07-31 18:16:30',1);
INSERT INTO sys_department VALUES(10005,10001,'测试组','12323',10,'','','',0,'2019-06-30 22:33:44',1,'2017-10-18 18:13:09',1);
CREATE TABLE public.sys_log (
  id serial PRIMARY KEY
,  log_type int NOT NULL
,  oper_object varchar(64) DEFAULT NULL
,  oper_table varchar(64) NOT NULL
,  oper_id int DEFAULT '0'
,  oper_type varchar(64) DEFAULT NULL
,  oper_remark varchar(2000) DEFAULT NULL
,  enable int DEFAULT '1'
,  update_time varchar(24) DEFAULT NULL
,  update_id int DEFAULT '0'
,  create_time varchar(24) DEFAULT NULL
,  create_id int DEFAULT '0'
);
CREATE TABLE public.sys_menu (
  id serial PRIMARY KEY
,  parent_id int NOT NULL DEFAULT '0'
,  name varchar(200) NOT NULL DEFAULT ''
,  icon varchar(50) DEFAULT NULL
,  urlkey varchar(256) DEFAULT NULL
,  url varchar(256) DEFAULT NULL
,  perms varchar(500) DEFAULT NULL
,  status int DEFAULT '1'
,  type int DEFAULT '1'
,  sort int DEFAULT '1'
,  level int DEFAULT '1'
,  enable int DEFAULT '1'
,  update_time varchar(24) DEFAULT NULL
,  update_id int DEFAULT '0'
,  create_time varchar(24) DEFAULT NULL
,  create_id int DEFAULT '0'
);
INSERT INTO sys_menu VALUES(1,20,'系统首页','fa fa-home','home','/admin/welcome.html','',1,2,10,2,1,'2019-02-17 23:24:28',1,'2015-04-27 17:28:06',1);
INSERT INTO sys_menu VALUES(2,0,'系统管理','fa fa-institution','system_root',NULL,NULL,1,1,190,1,1,'2015-04-27 17:28:06',1,'2015-04-27 17:28:06',1);
INSERT INTO sys_menu VALUES(3,2,'组织机构','fa fa-users','department','/system/department/index',NULL,1,2,191,2,1,'2015-04-27 17:28:06',1,'2015-04-27 17:28:25',1);
INSERT INTO sys_menu VALUES(4,2,'用户管理','fa fa-user-o','user','/system/user/index',NULL,1,2,192,2,1,'2015-04-27 17:28:06',1,'2015-04-27 17:28:46',1);
INSERT INTO sys_menu VALUES(5,2,'角色管理','fa fa-address-book-o','role','/system/role/index',NULL,1,2,194,2,1,'2015-04-27 17:28:06',1,'2015-04-27 17:29:13',1);
INSERT INTO sys_menu VALUES(6,2,'菜单管理','fa fa-bars','menu','/system/menu/index',NULL,1,2,196,2,1,'2015-04-27 17:29:43',1,'2015-04-27 17:29:43',1);
INSERT INTO sys_menu VALUES(8,2,'参数配置','fa fa-file-text-o','config','/system/config/index','',1,2,198,2,1,'2017-09-15 14:53:36',1,'2016-12-17 23:34:13',1);
INSERT INTO sys_menu VALUES(9,2,'日志管理','fa fa-line-chart','log','/system/log/index',NULL,1,2,199,2,1,'2015-04-27 17:28:06',1,'2016-01-03 18:09:18',1);
INSERT INTO sys_menu VALUES(20,0,'业务处理','fa fa-home','home','','',1,1,10,1,1,'2019-02-17 23:24:08',1,'2019-02-17 23:24:08',1);
CREATE TABLE public.sys_role (
  id serial PRIMARY KEY
,  name varchar(200) NOT NULL DEFAULT ''
,  status int DEFAULT '1'
,  sort int DEFAULT '1'
,  remark text
,  enable int DEFAULT '1'
,  update_time varchar(24) DEFAULT NULL
,  update_id int DEFAULT '0'
,  create_time varchar(24) DEFAULT NULL
,  create_id int DEFAULT '0'
);
INSERT INTO sys_role VALUES(1,'测试角色',1,10,'',1,'2019-07-03 00:55:45',1,'2017-09-15 14:54:26',1);
CREATE TABLE public.sys_role_menu (
  id serial PRIMARY KEY
,  role_id int NOT NULL
,  menu_id int NOT NULL
);
INSERT INTO sys_role_menu VALUES(48,1,20);
INSERT INTO sys_role_menu VALUES(49,1,1);
CREATE TABLE public.sys_user (
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT
,  uuid varchar(32) DEFAULT NULL
,  username varchar(32) NOT NULL
,  password varchar(32) NOT NULL
,  salt varchar(16) NOT NULL DEFAULT '1111'
,  real_name varchar(32) DEFAULT NULL
,  depart_id int DEFAULT '0'
,  user_type int DEFAULT '2'
,  status int DEFAULT '10'
,  thirdid varchar(200) DEFAULT NULL
,  endtime varchar(32) DEFAULT NULL
,  email varchar(64) DEFAULT NULL
,  tel varchar(32) DEFAULT NULL
,  address varchar(32) DEFAULT NULL
,  title_url varchar(200) DEFAULT NULL
,  remark varchar(1000) DEFAULT NULL
,  theme varchar(64) DEFAULT 'default'
,  back_site_id int DEFAULT '0'
,  create_site_id int DEFAULT '1'
,  project_id int DEFAULT '0'
,  project_name varchar(100) DEFAULT NULL
,  enable int DEFAULT '1'
,  update_time varchar(24) DEFAULT NULL
,  update_id int DEFAULT '0'
,  create_time varchar(24) DEFAULT NULL
,  create_id int DEFAULT '0'
,  UNIQUE (username)
);
INSERT INTO sys_user VALUES(1,'94091b1fa6ac4a27a06c0b92155aea6a','admin','9fb3dc842c899aa63d6944a55080b795','1111','系统管理员',10001,1,10,'','','zcool321@sina.com','123','','','时间是最好的老师，但遗憾的是&mdash;&mdash;最后他把所有的学生都弄死了','flat',5,1,1,'test',1,'2019-07-08 18:12:28',1,'2017-03-19 20:41:25',1);
INSERT INTO sys_user VALUES(9,'xa5450ztN08S37tKj93ujhJ66069q92R','test','ea8207ee50ccf367e99c8444fda7da32','GM26Mq','test',10002,2,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',0,1,0,NULL,1,'2019-11-12 15:31:31',1,'2019-07-11 15:49:24',1);
INSERT INTO sys_user VALUES(12,'8609WdcTI1337Y7e5kQ94v872Z02mh24','testLogin','7f4d0d8db5546f395e87dfd294608b9b','3n7Ci8','testLogin',10002,2,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',0,1,0,NULL,1,'2019-11-12 15:31:08',1,'2019-11-12 15:31:08',1);
INSERT INTO sys_user VALUES(13,'PTMB2mcqk87n1x15K84E56T75SY11Q5w','testLogout','961c0645f7ae271d6e1fc1ff01e786d7','0X6509','testLogout',10002,2,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',0,1,0,NULL,1,'2019-11-12 15:31:19',1,'2019-11-12 15:31:19',1);
CREATE TABLE public.sys_user_role (
  id serial PRIMARY KEY
,  user_id int NOT NULL
,  role_id int NOT NULL
);
INSERT INTO sys_user_role VALUES(1,1,1);
CREATE TABLE public.tags (
  id serial NOT NULL PRIMARY KEY
,  name varchar(20) NOT NULL
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
,  UNIQUE (name)
);
CREATE TABLE public.templates (
  id serial NOT NULL PRIMARY KEY
,  name varchar(50) NOT NULL DEFAULT ''
,  "group" varchar(50) NOT NULL DEFAULT ''
,  content text NOT NULL
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
,  UNIQUE (name)
);
CREATE TABLE public.user_auths (
  id serial NOT NULL PRIMARY KEY
,  user_id int  NOT NULL DEFAULT '0'
,  type int  NOT NULL DEFAULT '0'
,  openid varchar(191) NOT NULL DEFAULT ''
,  avatar varchar(191) NOT NULL DEFAULT ''
,  username varchar(191) NOT NULL DEFAULT ''
,  nick_name varchar(191) NOT NULL DEFAULT ''
,  email varchar(191) NOT NULL DEFAULT ''
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE public.users (
  id serial NOT NULL PRIMARY KEY
,  name varchar(50) NOT NULL DEFAULT ''
,  avatar varchar(191) NOT NULL DEFAULT ''
,  email char(30) NOT NULL DEFAULT ''
,  password varchar(191) NOT NULL DEFAULT ''
,  status int  NOT NULL DEFAULT '1'
,  remember_token varchar(100) DEFAULT NULL
,  created_at timestamp NULL DEFAULT NULL
,  updated_at timestamp NULL DEFAULT NULL
,  UNIQUE (email)
);
INSERT INTO users VALUES(1,'Zhihui Tang','','info@xhanzi.com','$2y$10$7GIa6TN6R6vqDvZIjpNBieMeqahGFySqGBh3ewr.vrMrV9dWicF5.',1,NULL,'2020-03-20 06:18:52','2020-04-16 11:39:47');
