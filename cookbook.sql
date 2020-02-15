SET NAMES UTF8;
DROP DATABASE IF EXISTS cookbook;
CREATE DATABASE cookbook CHARSET=UTF8;
USE cookbook;


/**用户信息**/
DROP TABLE IF EXISTS cb_user;
CREATE TABLE cb_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  avatar VARCHAR(128),        #头像图片路径
  nackname VARCHAR(32),      #昵称，如王小明
  gender INT,                 #性别  0-女  1-男
  say VARCHAR(128),           #个性签名
  birthday DATE,
  hometown VARCHAR(64),
  addr VARCHAR(64),
  profession VARCHAR(32)
);

INSERT INTO cb_user VALUES
(NULL,'dingding',md5('123456'), 'ding@qq.com', '13501234567', 'img/user/pic_01.jpg', '丁伟', '1','正在通往美食达人的路上...',NULL,NULL,NULL,NULL),
(NULL,'dangdang',md5('123456'), 'dang@qq.com', '13501234568', 'img/user/pic_02.jpg', '林当', '1','正在通往美食达人的路上...',NULL,NULL,NULL,NULL),
(NULL,'doudou',md5('123456'), 'dou@qq.com', '13501234569', 'img/user/pic_03.jpg', '窦志强', '1','正在通往美食达人的路上...',NULL,NULL,NULL,NULL),
(NULL,'yaya',md5('123456'), 'ya@qq.com', '13501234560', 'img/user/pic_04.jpg', '秦小雅', '0','正在通往美食达人的路上...',NULL,NULL,NULL,NULL);

/****首页轮播广告菜谱***/
DROP TABLE IF EXISTS cb_index_carousel;
CREATE TABLE cb_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  class_id INT,
  img VARCHAR(128),
  title VARCHAR(64), 
  subtitle VARCHAR(128), 
  href VARCHAR(128)
);

INSERT INTO cb_index_carousel VALUES
(NULL,1,'img/index/carousel/banner01.jpg','紫薯双色馒头','香甜喧软，全家喜欢',NULL),
(NULL,1,'img/index/carousel/banner02.jpg','月亮饼','美味快捷，适合上班族',NULL),
(NULL,1,'img/index/carousel/banner03.jpg','咸葱叶','清香爽口，3分钟轻松搞定',NULL),
(NULL,2,'img/index/carousel/banner04.jpg','砂锅五花肉','肉质软烂，味道醇香',NULL),
(NULL,2,'img/index/carousel/banner05.jpg','手撕包菜','清爽开胃，最佳减肥菜',NULL),
(NULL,2,'img/index/carousel/banner06.jpg','虾仁金针菇','做法简单，好吃不胖',NULL),
(NULL,3,'img/index/carousel/banner07.jpg','芒果西米露','甜腻爽滑，营养美味',NULL),
(NULL,3,'img/index/carousel/banner08.jpg','绿豆凉糕','清凉爽口，超级消暑',NULL),
(NULL,3,'img/index/carousel/banner09.jpg','燕麦饼干','口感酥脆，香得掉渣',NULL),
(NULL,4,'img/index/carousel/banner10.jpg','清蒸黄花鱼','肉质细嫩，健康低卡',NULL),
(NULL,4,'img/index/carousel/banner11.jpg','魔芋木耳','简单快捷，美味又减肥',NULL),
(NULL,4,'img/index/carousel/banner12.jpg','咖喱鸡肉饭','浓浓咖喱香，超级下饭',NULL),
(NULL,5,'img/index/carousel/banner13.jpg','酸辣凉拌面','筋道爽弹，酸辣开胃',NULL),
(NULL,5,'img/index/carousel/banner14.jpg','香卤小龙虾','香卤入味，美味解馋',NULL),
(NULL,5,'img/index/carousel/banner15.jpg','萝卜丝汤','清爽可口，增进食欲',NULL);

/****首页广告菜谱****/
DROP TABLE IF EXISTS cb_index_banner;
CREATE TABLE cb_index_banner(
  bid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128), 
  href VARCHAR(128)
);

INSERT INTO cb_index_banner VALUES
(NULL,'img/index/banner/banner01.jpg',NULL),
(NULL,'img/index/banner/banner02.jpg',NULL),
(NULL,'img/index/banner/banner03.jpg',NULL);

/****首页菜谱****/
CREATE TABLE cb_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  href VARCHAR(128)
);

INSERT INTO cb_index_product VALUES
(1,'瘦身果蔬汁',NULL,'img/index/pic_01.jpg',NULL),
(2,'猕猴桃黄瓜汁',NULL,'img/index/pic_02.jpg',NULL),
(3,'食美粥-蔬菜粥系列|“冬瓜大米粥”清淡菜谱饮食营养早餐 冬瓜肉末粥宝宝辅食 冬瓜肉糜粥',NULL,'img/index/pic_03.jpg',NULL),
(4,'香辣卤鸭掌',NULL,'img/index/pic_04.jpg',NULL),
(5,'清炒藕丁',NULL,'img/index/pic_05.jpg',NULL),
(6,'最爱这一碗，一分钟学会做凉皮',NULL,'img/index/pic_06.jpg',NULL),
(7,'青豆蒸蛋',NULL,'img/index/pic_07.jpg',NULL),
(8,'辣椒这样做，你家老公多吃2碗米饭',NULL,'img/index/pic_08.jpg',NULL),
(9,'无油鸡米花',NULL,'img/index/pic_09.jpg',NULL),
(10,'番茄牛腩',NULL,'img/index/pic_10.jpg',NULL),
(11,'酸辣金针菇',NULL,'img/index/pic_11.jpg',NULL),
(12,'黑枸杞养生鸡汤',NULL,'img/index/pic_12.jpg',NULL),
(13,'鱼香茄条',NULL,'img/index/pic_13.jpg',NULL),
(14,'酱蒸五花肉',NULL,'img/index/pic_14.jpg',NULL),
(15,'广式蛋黄莲蓉月饼',NULL,'img/index/pic_15.jpg',NULL),
(16,'清蒸虾丸',NULL,'img/index/pic_16.jpg',NULL),
(17,'大盘鸡',NULL,'img/index/pic_17.jpg',NULL),
(18,'XO酱烧豆腐',NULL,'img/index/pic_18.jpg',NULL),
(19,'花开富贵卷',NULL,'img/index/pic_19.jpg',NULL),
(20,'奶香土豆泥',NULL,'img/index/pic_20.jpg',NULL),
(21,'南瓜花卷',NULL,'img/index/pic_21.jpg',NULL),
(22,'粉丝蒸贵妃螺',NULL,'img/index/pic_22.jpg',NULL),
(23,'蛋香小馒头',NULL,'img/index/pic_23.jpg',NULL),
(24,'蛇皮黄瓜',NULL,'img/index/pic_24.jpg',NULL),
(25,'糖醋藕片',NULL,'img/index/pic_25.jpg',NULL),
(26,'叉烧肉',NULL,'img/index/pic_26.jpg',NULL),
(27,'清炒红薯叶',NULL,'img/index/pic_27.jpg',NULL),
(28,'片儿川',NULL,'img/index/pic_28.jpg',NULL),
(29,'咸菜',NULL,'img/index/pic_29.jpg',NULL),
(30,'椒盐酥炸杏鲍菇',NULL,'img/index/pic_30.jpg',NULL);

/**菜谱一级分类**/
DROP TABLE IF EXISTS cb_primary_family;
CREATE TABLE cb_primary_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  fname VARCHAR(32)
);

INSERT INTO cb_primary_family VALUES
(NULL,'img/class/icon/ms_icon_1.png','实用分类'),
(NULL,'img/class/icon/ms_icon_2.png','每日三餐'),
(NULL,'img/class/icon/ms_icon_3.png','主食'),
(NULL,'img/class/icon/ms_icon_4.png','家常菜谱'),
(NULL,'img/class/icon/ms_icon_5.png','中华菜系'),
(NULL,'img/class/icon/ms_icon_6.png','各地小吃'),
(NULL,'img/class/icon/ms_icon_7.png','外国菜谱'),
(NULL,'img/class/icon/ms_icon_8.png','烘焙'),
(NULL,'img/class/icon/ms_icon_9.png','人群'),
(NULL,'img/class/icon/ms_icon_10.png','食材'),
(NULL,'img/class/icon/ms_icon_11.png','厨具'),
(NULL,'img/class/icon/ms_icon_12.png','场景'),
(NULL,'img/class/icon/ms_icon_13.png','疾病调理'),
(NULL,'img/class/icon/ms_icon_14.png','脏腑调理'),
(NULL,'img/class/icon/ms_icon_15.png','功能性调理'),
(NULL,'img/class/icon/ms_icon_16.png','工艺'),
(NULL,'img/class/icon/ms_icon_17.png','时间'),
(NULL,'img/class/icon/ms_icon_18.png','口味');

/**菜谱二级分类**/
DROP TABLE IF EXISTS cb_secondary;
CREATE TABLE cb_secondary(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT, 
  img VARCHAR(128),
  sname VARCHAR(64)
);

INSERT INTO cb_secondary VALUES
(NULL,1,'img/class/practical/fl_practical_1.png','快手菜'),
(NULL,1,'img/class/practical/fl_practical_2.png','下饭菜'),
(NULL,1,'img/class/practical/fl_practical_3.png','应季时蔬'),
(NULL,1,'img/class/practical/fl_practical_4.png','素食'),
(NULL,1,'img/class/practical/fl_practical_5.png','肉食'),
(NULL,1,'img/class/practical/fl_practical_6.png','汤'),
(NULL,1,'img/class/practical/fl_practical_7.png','家常菜'),

(NULL,2,'img/class/meals/fl_meals_1.png','早餐'),
(NULL,2,'img/class/meals/fl_meals_2.png','午餐'),
(NULL,2,'img/class/meals/fl_meals_3.png','下午茶'),
(NULL,2,'img/class/meals/fl_meals_4.png','晚餐'),
(NULL,2,'img/class/meals/fl_meals_5.png','宵夜'),

(NULL,3,'img/class/food/fl_food_1.png','炒饭'),
(NULL,3,'img/class/food/fl_food_2.png','焖饭'),
(NULL,3,'img/class/food/fl_food_3.png','烩饭'),
(NULL,3,'img/class/food/fl_food_4.png','饭'),
(NULL,3,'img/class/food/fl_food_5.png','方便面'),
(NULL,3,'img/class/food/fl_food_6.png','焖面'),
(NULL,3,'img/class/food/fl_food_7.png','拌面'),
(NULL,3,'img/class/food/fl_food_8.png','面'),
(NULL,3,'img/class/food/fl_food_9.png','饼'),
(NULL,3,'img/class/food/fl_food_10.png','包子'),
(NULL,3,'img/class/food/fl_food_11.png','饺子'),
(NULL,3,'img/class/food/fl_food_12.png','馄饨'),
(NULL,3,'img/class/food/fl_food_13.png','粥'),

(NULL,4,'img/class/homely/fl_homely_1.png','热菜'),
(NULL,4,'img/class/homely/fl_homely_2.png','凉菜'),
(NULL,4,'img/class/homely/fl_homely_3.png','素菜'),
(NULL,4,'img/class/homely/fl_homely_4.png','靓汤'),
(NULL,4,'img/class/homely/fl_homely_5.png','粥品'),
(NULL,4,'img/class/homely/fl_homely_6.png','主食'),
(NULL,4,'img/class/homely/fl_homely_7.png','点心'),
(NULL,4,'img/class/homely/fl_homely_8.png','卤味'),
(NULL,4,'img/class/homely/fl_homely_9.png','微波炉'),
(NULL,4,'img/class/homely/fl_homely_10.png','海鲜'),
(NULL,4,'img/class/homely/fl_homely_11.png','火锅'),
(NULL,4,'img/class/homely/fl_homely_12.png','酱料蘸料'),
(NULL,4,'img/class/homely/fl_homely_13.png','干果零食'),
(NULL,4,'img/class/homely/fl_homely_14.png','饮品'),
(NULL,4,'img/class/homely/fl_homely_15.png','孕妇'),
(NULL,4,'img/class/homely/fl_homely_16.png','产妇'),
(NULL,4,'img/class/homely/fl_homely_17.png','宝宝'),
(NULL,4,'img/class/homely/fl_homely_18.png','老人'),
(NULL,4,'img/class/homely/fl_homely_19.png','美容'),
(NULL,4,'img/class/homely/fl_homely_20.png','瘦身'),

(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_1.png','川菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_2.png','鲁菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_3.png','粤菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_4.png','湘菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_5.png','闽菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_6.png','浙菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_7.png','苏菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_8.png','徽菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_9.png','京菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_10.png','沪菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_11.png','豫菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_12.png','湖北菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_13.png','东北菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_14.png','西北菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_15.png','云贵菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_16.png','清真菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_17.png','山西菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_18.png','江西菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_19.png','广西菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_20.png','港台菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_21.png','云南菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_22.png','贵州菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_23.png','淮扬菜'),
(NULL,5,'img/class/cuisine/fl_zhonghuacaixi_24.png','其他菜'),

(NULL,6,'img/class/snack/snack_01.png','北京小吃'),
(NULL,6,'img/class/snack/snack_02.png','天津小吃'),
(NULL,6,'img/class/snack/snack_03.png','河北小吃'),
(NULL,6,'img/class/snack/snack_04.png','山西小吃'),
(NULL,6,'img/class/snack/snack_05.png','蒙古小吃'),
(NULL,6,'img/class/snack/snack_06.png','上海小吃'),
(NULL,6,'img/class/snack/snack_07.png','山东小吃'),
(NULL,6,'img/class/snack/snack_08.png','江苏小吃'),
(NULL,6,'img/class/snack/snack_09.png','浙江小吃'),
(NULL,6,'img/class/snack/snack_10.png','安徽小吃'),
(NULL,6,'img/class/snack/snack_11.png','吉林小吃'),
(NULL,6,'img/class/snack/snack_12.png','辽宁小吃'),
(NULL,6,'img/class/snack/snack_13.png','陕西小吃'),
(NULL,6,'img/class/snack/snack_14.png','新疆小吃'),
(NULL,6,'img/class/snack/snack_15.png','宁夏小吃'),
(NULL,6,'img/class/snack/snack_16.png','甘肃小吃'),
(NULL,6,'img/class/snack/snack_17.png','青海小吃'),
(NULL,6,'img/class/snack/snack_18.png','湖北小吃'),
(NULL,6,'img/class/snack/snack_19.png','湖南小吃'),
(NULL,6,'img/class/snack/snack_20.png','河南小吃'),
(NULL,6,'img/class/snack/snack_21.png','江西小吃'),
(NULL,6,'img/class/snack/snack_22.png','重庆小吃'),
(NULL,6,'img/class/snack/snack_23.png','四川小吃'),
(NULL,6,'img/class/snack/snack_24.png','云南小吃'),
(NULL,6,'img/class/snack/snack_25.png','贵州小吃'),
(NULL,6,'img/class/snack/snack_26.png','西藏小吃'),
(NULL,6,'img/class/snack/snack_27.png','广东小吃'),
(NULL,6,'img/class/snack/snack_28.png','福建小吃'),
(NULL,6,'img/class/snack/snack_29.png','广西小吃'),
(NULL,6,'img/class/snack/snack_30.png','海南小吃'),
(NULL,6,'img/class/snack/snack_31.png','香港小吃'),
(NULL,6,'img/class/snack/snack_32.png','台湾小吃'),
(NULL,6,'img/class/snack/snack_33.png','成都小吃'),
(NULL,6,'img/class/snack/snack_34.png','特色小吃');

/**文章**/
CREATE TABLE cb_article(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  theme VARCHAR(128),         #主题
  view_data VARCHAR(64),      #副标题
  release_date DATE,
  img VARCHAR(128)
);

INSERT INTO cb_article VALUES
(NULL,'鸡的什么部位不能吃，有小孩的要注意，不懂的人请收藏！',499951,'2019-6-13','img/article/pic_01.jpg'),
(NULL,'夏天吃这菜正好，简单一炒，解暑防感冒，再贵也要做给儿子吃',499010,'2019-6-13','img/article/pic_02.jpg'),
(NULL,'它是“天然止咳水”，每天来1杯，润肺止咳化痰，感冒可能远离你',4957327,'2019-6-13','img/article/pic_03.jpg'),
(NULL,'清蒸鲈鱼的最牛做法，注意这些细节，你能比大厨还专业！',119072,'2019-6-13','img/article/pic_04.jpg'),
(NULL,'春天早餐吃这个，手不沾面做法简单，只要10分钟就好，家人爱吃',643274,'2019-6-13','img/article/pic_05.jpg'),
(NULL,'清明后要给孩子吃“这菜”，常吃头脑聪明眼睛好，比牛奶补钙！',425797,'2019-6-13','img/article/pic_06.jpg'),
(NULL,'清明后要给孩子吃“这菜”，常吃头脑聪明眼睛好，比牛奶补钙！',425797,'2019-6-13','img/article/pic_07.jpg');

/* 当季食材分类 */
DROP TABLE IF EXISTS cb_seasonal_family;
CREATE TABLE cb_seasonal_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

INSERT INTO cb_seasonal_family VALUES
(NULL,'蔬菜'),
(NULL,'水果'),
(NULL,'肉类'),
(NULL,'五谷');

/* 当季食材 */
DROP TABLE IF EXISTS cb_seasonal_food;
CREATE TABLE cb_seasonal_food(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,
  img VARCHAR(128),
  fname VARCHAR(32),
  effect VARCHAR(128),
  energy VARCHAR(32)
);

INSERT INTO cb_seasonal_food VALUES
(NULL,1,'img/seasonal/vegetable/pic_01.jpg','藕','强健胃粘膜','较低热量'),
(NULL,1,'img/seasonal/vegetable/pic_02.jpg','白萝卜','强健胃粘膜','较低热量'),
(NULL,1,'img/seasonal/vegetable/pic_03.jpg','土豆','强健胃粘膜','中等热量'),
(NULL,1,'img/seasonal/vegetable/pic_04.jpg','南瓜','强健胃粘膜','较低热量'),
(NULL,1,'img/seasonal/vegetable/pic_05.jpg','四季豆','强健胃粘膜','较低热量'),
(NULL,1,'img/seasonal/vegetable/pic_06.jpg','山药','强健胃粘膜','较低热量'),
(NULL,1,'img/seasonal/vegetable/pic_07.jpg','大白菜','强健胃粘膜','较低热量'),
(NULL,1,'img/seasonal/vegetable/pic_08.jpg','尖椒','强健胃粘膜','较低热量'),
(NULL,1,'img/seasonal/vegetable/pic_09.jpg','西红柿','强健胃粘膜','较低热量'),
(NULL,1,'img/seasonal/vegetable/pic_10.jpg','空心菜','强健胃粘膜','较低热量'),
(NULL,1,'img/seasonal/vegetable/pic_11.jpg','杏鲍菇','强健胃粘膜','较低热量'),
(NULL,1,'img/seasonal/vegetable/pic_12.jpg','丝瓜','强健胃粘膜','较低热量'),
(NULL,1,'img/seasonal/vegetable/pic_13.jpg','冬瓜','强健胃粘膜','较低热量'),
(NULL,1,'img/seasonal/vegetable/pic_14.jpg','黄瓜','强健胃粘膜','较低热量'),
(NULL,1,'img/seasonal/vegetable/pic_15.jpg','莴笋','强健胃粘膜','较低热量'),

(NULL,2,'img/seasonal/fruit/pic_01.jpg','柚子','促进伤口愈合','较低热量'),
(NULL,2,'img/seasonal/fruit/pic_02.jpg','猕猴桃','降低胆固醇','较低热量'),
(NULL,2,'img/seasonal/fruit/pic_03.jpg','梨','强健胃粘膜','较低热量'),
(NULL,2,'img/seasonal/fruit/pic_04.jpg','柿子','强健胃粘膜','较低热量'),
(NULL,2,'img/seasonal/fruit/pic_05.jpg','甘蔗','强健胃粘膜','较低热量'),
(NULL,2,'img/seasonal/fruit/pic_06.jpg','火龙果','强健胃粘膜','较低热量'),
(NULL,2,'img/seasonal/fruit/pic_07.jpg','橘子','强健胃粘膜','较低热量'),
(NULL,2,'img/seasonal/fruit/pic_08.jpg','山楂','强健胃粘膜','中等热量'),
(NULL,2,'img/seasonal/fruit/pic_09.jpg','香蕉','强健胃粘膜','中等热量'),
(NULL,2,'img/seasonal/fruit/pic_10.jpg','木瓜','强健胃粘膜','较低热量'),
(NULL,2,'img/seasonal/fruit/pic_11.jpg','苹果','强健胃粘膜','较低热量'),
(NULL,2,'img/seasonal/fruit/pic_12.jpg','葡萄','强健胃粘膜','较低热量'),
(NULL,2,'img/seasonal/fruit/pic_13.jpg','橙','强健胃粘膜','较低热量'),
(NULL,2,'img/seasonal/fruit/pic_14.jpg','榴莲','强健胃粘膜','中等热量'),
(NULL,2,'img/seasonal/fruit/pic_15.jpg','芒果','强健胃粘膜','较低热量'),

(NULL,3,'img/seasonal/meat/pic_01.jpg','大闸蟹','促进伤口愈合','中等热量'),
(NULL,3,'img/seasonal/meat/pic_02.jpg','鲈鱼','降低胆固醇','中等热量'),
(NULL,3,'img/seasonal/meat/pic_03.jpg','皮皮虾','强健胃粘膜','中等热量'),
(NULL,3,'img/seasonal/meat/pic_04.jpg','鸭','强健胃粘膜','较高热量'),
(NULL,3,'img/seasonal/meat/pic_05.jpg','虾','强健胃粘膜','中等热量'),
(NULL,3,'img/seasonal/meat/pic_06.jpg','扇贝','强健胃粘膜','较低热量'),
(NULL,3,'img/seasonal/meat/pic_07.jpg','海参','强健胃粘膜','中等热量'),
(NULL,3,'img/seasonal/meat/pic_08.jpg','牛肉','强健胃粘膜','中等热量'),
(NULL,3,'img/seasonal/meat/pic_09.jpg','鱿鱼','强健胃粘膜','中等热量'),
(NULL,3,'img/seasonal/meat/pic_10.jpg','草鱼','强健胃粘膜','中等热量'),
(NULL,3,'img/seasonal/meat/pic_11.jpg','鸡腿','强健胃粘膜','较高热量'),
(NULL,3,'img/seasonal/meat/pic_12.jpg','鲍鱼','强健胃粘膜','中等热量'),
(NULL,3,'img/seasonal/meat/pic_13.jpg','武昌鱼','强健胃粘膜','较高热量'),
(NULL,3,'img/seasonal/meat/pic_14.jpg','带鱼','强健胃粘膜','中等热量'),
(NULL,3,'img/seasonal/meat/pic_15.jpg','羊肉','强健胃粘膜','较高热量'),

(NULL,4,'img/seasonal/corn/pic_01.jpg','板栗','促进伤口愈合','较高热量'),
(NULL,4,'img/seasonal/corn/pic_02.jpg','核桃(鲜)','降低胆固醇','较高热量'),
(NULL,4,'img/seasonal/corn/pic_03.jpg','毛豆','强健胃粘膜','中等热量'),
(NULL,4,'img/seasonal/corn/pic_04.jpg','花生','强健胃粘膜','较高热量'),
(NULL,4,'img/seasonal/corn/pic_05.jpg','玉米(鲜)','强健胃粘膜','中等热量'),
(NULL,4,'img/seasonal/corn/pic_06.jpg','冬枣','强健胃粘膜','中等热量'),
(NULL,4,'img/seasonal/corn/pic_07.jpg','薏米','强健胃粘膜','较高热量'),
(NULL,4,'img/seasonal/corn/pic_08.jpg','燕麦','强健胃粘膜','较高热量'),
(NULL,4,'img/seasonal/corn/pic_09.jpg','小米','强健胃粘膜','较高热量'),
(NULL,4,'img/seasonal/corn/pic_10.jpg','赤小豆','强健胃粘膜','较高热量'),
(NULL,4,'img/seasonal/corn/pic_11.jpg','黑豆','强健胃粘膜','较高热量'),
(NULL,4,'img/seasonal/corn/pic_12.jpg','绿豆','强健胃粘膜','较高热量'),
(NULL,4,'img/seasonal/corn/pic_13.jpg','大米','强健胃粘膜','较高热量'),
(NULL,4,'img/seasonal/corn/pic_14.jpg','黄豆','强健胃粘膜','较高热量'),
(NULL,4,'img/seasonal/corn/pic_15.jpg','糯米','强健胃粘膜','较高热量');

INSERT INTO cb_seasonal_food VALUES
(NULL,'蔬菜'),
(NULL,'水果'),
(NULL,'肉类'),
(NULL,'五谷');

/** 视频 **/
CREATE TABLE cb_video(
  vid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),      
  img VARCHAR(128),         
  duration VARCHAR(32),
  release_date DATE,
  clicks VARCHAR(64),
  video VARCHAR(128)
);

INSERT INTO cb_video VALUES
(NULL,'左宗棠鸡的做法','img/video/pic_01.jpg','01:23','2019-6-13',11,'video/video.mp4'),
(NULL,'紫薯山药糕的做法','img/video/pic_02.jpg','01:23','2019-6-13',11,'video/video.mp4'),
(NULL,'猪油拌饭的做法','img/video/pic_03.jpg','01:23','2019-6-13',11,'video/video.mp4'),
(NULL,'猪血汤的做法','img/video/pic_04.jpg','01:23','2019-6-13',11,'video/video.mp4'),
(NULL,'猪心汤的做法','img/video/pic_05.jpg','01:23','2019-6-13',11,'video/video.mp4'),
(NULL,'猪皮冻的做法','img/video/pic_06.jpg','01:23','2019-6-13',11,'video/video.mp4'),
(NULL,'猪肝粥的做法','img/video/pic_07.jpg','01:23','2019-6-13',11,'video/video.mp4'),
(NULL,'猪肝面的做法','img/video/pic_08.jpg','01:23','2019-6-13',11,'video/video.mp4'),
(NULL,'珍珠翡翠白玉汤的做法','img/video/pic_09.jpg','01:23','2019-6-13',11,'video/video.mp4'),
(NULL,'蒸肉丸的做法','img/video/pic_10.jpg','01:23','2019-6-13',11,'video/video.mp4'),
(NULL,'炸鱼薯条的做法','img/video/pic_11.jpg','01:23','2019-6-13',11,'video/video.mp4'),
(NULL,'炸鱼块的做法','img/video/pic_12.jpg','01:23','2019-6-13',11,'video/video.mp4'),
(NULL,'炸年糕的做法','img/video/pic_13.jpg','01:23','2019-6-13',11,'video/video.mp4'),
(NULL,'榨菜肉丝汤的做法','img/video/pic_14.jpg','01:23','2019-6-13',11,'video/video.mp4'),
(NULL,'醪糟汤圆的做法','img/video/pic_15.jpg','01:23','2019-6-13',11,'video/video.mp4');


/**菜谱详情**/
DROP TABLE IF EXISTS cb_detail;
CREATE TABLE cb_detail(
  id INT PRIMARY KEY AUTO_INCREMENT,
  classid INT,
  title VARCHAR(64),
  peoplenum VARCHAR(32),
  cookingtime VARCHAR(32),
  content VARCHAR(128),
  pic VARCHAR(128),
  tag VARCHAR(64),
  material VARCHAR(128)
);

INSERT INTO cb_detail VALUES
(NULL,1,'翡翠彩蔬卷','1-2人','10分钟内',"春天是为夏天做准备的刮油季，为了夏天能够美美的穿上漂亮的花裙子，让我们一起来狠狠的刮油吧。这个色彩缤纷的彩蔬卷，低热量，高营养，是一道秀色可餐的减肥餐~",'http://api.jisuapi.com/recipe/upload/20160719/115138_19423.jpg',"减肥,咸香,宴请,抗氧化,抗衰老,私房菜,聚会","大白菜"),
(NULL,1,'开心土豆泥', '3-4人', '10分钟内', '粉粉绵绵的土豆泥，加入玉米粒、青豆点缀，色彩亮丽清新，而火腿肠更是增加了口感，造型圆圆的，十分的可爱哦！', 'http://api.jisuapi.com/recipe/upload/20160719/115137_58878.jpg', '下午茶,减肥,家常菜,春季,甜,甜品,私房菜,素菜,蒸','土豆'),
(NULL,1,'虾仁娃娃菜', '1-2人', '10-20分钟', '娃娃菜鲜中带甜，虾仁鲜香可口，一道营养丰富，味道清新的虾仁娃娃菜，可是老少皆宜的哦!', 'http://api.jisuapi.com/recipe/upload/20160719/115137_43195.jpg', '减肥,宴请,家常菜,排毒,春季,滋阴润燥,热菜,白领,私房菜,美白','娃娃菜'),
(NULL,1,'苦瓜炒蛋', '1-2人', '10分钟内', '苦瓜营养丰富，所含蛋白质、脂肪、碳水化合物等在瓜类蔬菜中较高，特别是维生素C含量，每百克高达84毫克，约为冬瓜的5倍，黄瓜的14倍，南瓜的21倍，居瓜类之冠。苦瓜还含有粗纤维、胡萝卜素、苦瓜甙、磷、铁和多种矿物质、氨基酸等；苦瓜还含有较多的脂蛋白，可促进人体免疫系统抵抗癌细胞，经常食用可以增强人体免疫功能。苦瓜的苦味，是由于它含有抗疟疾的喹宁，喹宁能抑制过度兴奋的体温中枢。因此，苦瓜具有清热解毒功效。 苦瓜因其味苦而清香可口。被人们视为难得的食疗佳蔬。我国民间自古就有“苦味能清热”、“苦味能健胃”之说。中医认为：苦瓜味苦，性寒冷，能清热泻火。苦瓜的微苦滋味，吃后能刺激人体唾液，胃液分泌，令人食欲大增，清热防暑。因此，夏吃苦瓜最相宜。 利于减肥的佳品。炎热的夏季，容易造成食欲不振，没胃口，还经常上火。苦瓜炒鸡蛋，带有淡淡的苦味，清香可口，最适合出现在炎炎夏日的饭桌上。苦瓜炒鸡蛋，口感脆爽。既清火，又不失营养。苦瓜0.85元，香菇0.35元，鸡蛋0.48元，大葱0.10元，洋葱0.10元，红椒0.15元。', 'http://api.jisuapi.com/recipe/upload/20160719/115138_20728.jpg', '减肥,夏季,家常菜,抗疲劳,清热解暑,炒,炒锅,牙痛','苦瓜,鸡蛋'),
(NULL, 2, '冬瓜排骨汤', '1-2人', '30分钟-1小时', '从今天起鱼鱼发的菜菜都是鱼鱼的减肥菜菜:)俗话说，四月不减肥，夏天徒伤悲鱼鱼其实也算不得胖但是比起之前的体重，已经飙升30斤了而之前鱼鱼看起来也算不得瘦所以呢，只能说，鱼鱼这个人胖瘦皆宜，在视觉上不会产生强烈的反差:D但是鱼鱼知道自己有小肚腩了，已经姑息了它一年了现在终于决定不再姑息，减肥开始咯！不过鱼鱼的减肥餐还是很丰富很美味很营养的，所以减的速度也不快据说鱼鱼这样微胖的人一个月减个一两斤就行了呵呵，这个目标还是比较好实现了只不过鱼鱼家里没有秤，也不知道自己能减多少但是小肚肚上的肉肉确实在慢慢减少，要加油咯！', 'http://api.jisuapi.com/recipe/upload/20160719/115138_26193.jpg', '减肥,利尿,利水消肿,夏季,汤,湿热质,煲','冬瓜,排骨'),
(NULL, 2, '凉拌黑木耳', '1-2人', '10-20分钟', '每个人做菜的方法和技巧是不同的，同样的菜蔬在每个人的手里做出来的味道都是不同的，且口感和味道相差很多。每个人菜具都有属性和性格，但更多的是风格。我的菜的属性就是家常的、简单的、自己爱吃的，仅此而已。当然有时候也是有点小小的想法和创意，但以失败居多，总能把简单的搞得复杂繁琐，但最终做出的菜只能是“家常”。说说木耳吧：木耳味甘、性平，具有益气、润肺、凉血、止血、涩肠、活血、养容等功效；木耳中的胶质可把残留在人体消化系统内的灰尘、杂质吸附集中起来排出体外，从而起到清胃涤肠的作用。特别适合缺铁的人士、矿工、冶金工人、纺织工、理发师食用。 我这里是矿区粉尘多，环境差，木耳可以常有。做个清淡点的，清新点的，那就用酱油、醋来做，拒绝辛辣。为了点缀还是放了点青红椒碎，不过这都是甜椒，不辣。', 'http://api.jisuapi.com/recipe/upload/20160719/115138_22062.jpg', '减肥,家常菜,排毒,补铁','黑木耳'),
(NULL, 2, '醋溜白菜', '1-2人', '10-20分钟', '醋溜白菜，是北方人经常吃的一道菜，尤其是在多年前的冬天。那时，没有大棚菜，冬天，家家每天佐餐的基本上都是冬储大白菜，聪明的家庭主妇总是想方设法将这单调的菜变成多种菜式，于是，醋溜白菜被频繁的端上餐桌。美食不分贵贱，用最平凡的原料、最简单的调料和最普通的手法做出美味的菜肴来才是美食的真谛。 这次，我做的醋溜白菜，近似鲁菜的做法，使个这道菜酸甜浓郁、开胃下饭、老少咸宜。', 'http://api.jisuapi.com/recipe/upload/20160719/115138_46688.jpg', '减肥,家常菜,排毒,补钙','白菜'),
(NULL, 2, '胭脂冬瓜', '1-2人', '1-2小时', '准备学做广式月饼，昨天熬了转化糖浆，结果熬过头了，冷却之后都硬了，失败。。。本来买了些冬瓜准备做月饼馅的，糖浆失败之后受打击了，不想做了，直接把冬瓜焯水，用苋菜汁腌制在冰箱里面了，当甜点来吃还不错的呵呵。。等什么时候有信心了再次尝试月饼之路。。', 'http://api.jisuapi.com/recipe/upload/20160719/115138_68771.jpg', '冰箱,感冒,湿热质,脂肪肝,夏季,煮,凉菜,素菜,甜品,减肥,瘦身,去湿气,解暑,利尿,利水消肿,清热解暑,肥胖,水肿,痛风,子宫肌瘤,发烧','冬瓜'),
(NULL, 2, '海带豆腐减肥汤', '1-2人', '10分钟内', '几乎家家会做的海带豆腐汤，虽然简单，功效却不可小觑，它可以使排毒减肥变得事半功倍。味道清淡的豆腐与滋味鲜美的海带可谓相得益彰的绝配，一向注重健康的日本人，视这道汤为长生不老的“妙药”。	豆腐含有丰富的蛋白质、卵磷脂、亚油酸、维生素B1、维生素E、钙、铁等，可以减缓过氧化脂质的产生，从而抑制脂肪吸收，同时促进脂肪的分解。海带出了富含碘，还具有排毒减脂的功效，所以常喝这碗汤，会使身体越来越轻盈，越来越健康。', 'http://api.jisuapi.com/recipe/upload/20160719/115138_81636.jpg', '"减肥','海带,豆腐'),
(NULL, 2, '香菇油菜', '1-2人', '10分钟内', '前些年去青岛，在一家不起眼的小店里吃过香菇油菜，做的香菇油菜很特别，先把油菜烫出来腌制一下，主要调料是大蒜和大姜，香菇和姜蒜均切成丁，用的老抽上色，勾芡后象酱汁一样放在油菜的旁边，那个蒜香味的香菇和油菜一起特别好吃，于是回家后也试着做这道菜，全家人都非常上口。     今天买回的油菜根茎特别大，所以就分成两份，把根部作成香菇油菜，把叶来个凉拌油菜叶，一菜变两。', 'http://api.jisuapi.com/recipe/upload/20160719/115139_99755.jpg', '脂肪肝,冬季,蒜香,家常菜,热菜,减肥,瘦身,提高免疫力,增强免疫力,润肠通便,抗癌,防癌,肥胖,便秘,冠心病,动脉硬化,中风,子宫肌瘤','香菇,油菜'),
(NULL, 2, '蜂蜜柠檬水', '1-2人', '2小时以上', '秋天来了，冬天还会远吗？从现在起，每天早晨空腹喝一杯蜂蜜柠檬水，不仅有效改善便秘，还能美容养颜，祛斑美白。而且秋冬季节人容易受凉引起感冒发烧，多食用富含维C的水果也可以预防感冒的发生。', 'http://api.jisuapi.com/recipe/upload/20160719/115139_28149.jpg', '特禀质,过敏,晕车,美容,酸甜,减肥,瘦身,美白,排毒,祛斑,润肠通便,祛痘,祛痘美白,保湿,补水,提神,促消化,生津止渴,开胃,抗疲劳,肥胖,消化不良,便秘,内分泌失调,肺结核','蜂蜜,柠檬'),
(NULL, 2, '金针菇海带汤', '1-2人', '10分钟内', '春季随着气温的升高，人体血液循环加快，动脉血压升高容易引起心脑血管疾病，尤其是家中老人要多注意。平常适度的运动的同时，可以用食疗的养生方法进行食疗，可起到预防的作用。这道养生食疗汤，非常适合春季老人的养生食疗，可降压减脂，醒脑强身，同时还是减肥人士的减肥佳肴。', 'http://api.jisuapi.com/recipe/upload/20160719/115139_61045.jpg', '特禀质,冬季,私房菜,减肥,瘦身,排毒,肥胖,冠心病,动脉硬化,子宫肌瘤','金针菇,海带'),
(NULL, 2, '白灼菜心', '1-2人', '10分钟内', '白灼菜心是一道常见的粤菜。灼乃为焯，意为将食材在滚水中略煮再捞起。广东人偏爱蒸煮焯的烹饪方式，较之煎炸炒要少了许多“热气”，清淡营养，原滋原味。白灼菜心色泽碧绿，清淡少油，脆嫩爽甜。由于灼的时间较短，菜心中的各类营养素流失较少。操作简便，是值得推荐的一道家常素菜。', 'http://api.jisuapi.com/recipe/upload/20160719/115139_84094.jpg', '减肥,家常菜,排毒','菜心'),
(NULL, 2, '减肥茶', '3-4人', '10-20分钟', '山楂可降低胆固醇及血压、帮助消化；洛神花温性，含有丰富的柠檬酸、苹果酸及维他命A及E，能解除身体的疲劳感，对消化不良及皮肤粗糙也有帮助；而普洱茶清热利水、化痰消食、温养脾胃、有很好瘦身功效，咖啡因能帮助增强身体燃烧脂肪的能力，而茶多酚则更有效的协助脂肪的分解和消化。家里正好还有瓶糖渍柠檬，也放了一片进去，柠檬含有丰富维他命C的柠檬，正是催促排便的催化剂，如果早上空腹饮用自制的柠檬水，不但可以解决便秘之苦，还可以排除肾，亦有美白肌肤的作用，所以这款减肥茶里内容丰富，效果也重重叠加，但一定要长期坚持饮用，才能看到明显效果。', 'http://api.jisuapi.com/recipe/upload/20160719/115139_66826.jpg', '白领,砂锅,感冒,煮,酸,减肥,瘦身,促消化,肥胖,消化不良,冠心病,动脉硬化','山楂'),
(NULL, 2, '素菜荤吃的红烧冬瓜', '1-2人', '10分钟内', '红烧冬瓜是浙菜中的家常菜，冬瓜是一种药食兼用的蔬菜，具有多种保健功效。中医认为，冬瓜味甘、淡、性凉，入肺、大肠、小肠、膀胱经；具有润肺生津，化痰止渴，利尿消肿，清热祛暑，解毒排脓的功效；可用于暑热口渴、痰热咳喘、水肿、脚气、胀满、消渴、痤疮、面斑、脱肛、痔疮等症的治疗，还能解鱼、酒毒。    用红烧的方法来烹制冬瓜其味道鲜美，入口即化，肉香浓郁。香菇的香味和冬瓜的味道融入在一起十分诱人。红烧冬瓜是一道素菜荤吃的健康菜。', 'http://api.jisuapi.com/recipe/upload/20160719/115139_16737.jpg', '减肥,利尿,夏季,家常菜,水肿,红烧,降血压,高血压','冬瓜'),
(NULL, 2, '蜂蜜金桔茶', '1-2人', '30分钟-1小时', '小小金橘是秋冬季的一种是食疗佳品。金桔不仅含有多种维生素、碳水化合物等，营养价值在柑桔果类中名列前茅，是人们喜爱吃的果品。金桔，它还有抗炎、去痰、抗溃疡、助消食、降血压、增强心脏功能和理气止咳等功效，冬季常喝金桔茶可增强机体抗寒能力，防治感冒，还有止咳化痰的功效。蜂蜜金橘茶，可以润喉、化痰、消食，没有感冒的还可以喝这个茶来预防感冒。这个茶泡起来甜甜的，不管是大人还是小孩都会喜欢它的味道，并且爱上这个，自己做无添加健康安全。秋冬季，都来做一瓶蜂蜜金橘茶，经常泡一杯，远离感冒。', 'http://api.jisuapi.com/recipe/upload/20160719/115139_86437.jpg', '减肥,女性养生,止咳,润肺止咳','蜂蜜金桔'),
(NULL, 2, '苹果酱', '6人以上','30分钟-1小时', '红红的大苹果人见人爱，吃苹果的好处也是众所周知：排毒减肥，养颜补血，健脑益智、强化骨骼、降脂护心、保养肌肤、清洁口腔 ……吃苹果养颜瘦身(来自网络）嫩苹果中含的多酚及黄酮类天然化学抗氧化物质，可改善呼吸系统和肺功能。苹果中的胶质和微量元素铬能保持血糖的稳定，还能有效地降低胆固醇。苹果中的粗纤维可促进肠胃蠕功，并富含铁、锌等微量元素，可使皮肤细润有光泽，起到美容瘦身的作用。清清楚楚地记得小时候跟着妈妈去参加了一个茶话会，得到了一只大大的香蕉苹果视为珍宝，天天看着、闻着，想着那些每天可以吃到一个苹果的人是多么的幸福啊！再以后长大了，结婚了，怀孕了，有人说每天一个苹果可以让胎儿有一张红润的小脸蛋，那时物质贫乏、又是春天，小地方很难寻到，借出差的机会从大上海背上一大旅行包回来。现在天天吃苹果已不是梦话，超市苹果还常常打折，有时会买上两公斤，除了空口吃以外，还会拿来做苹果酱。配上面包、酸奶都是不错的，有时也用苹果酱做点心的馅料。自己做的苹果酱，一来少糖或无糖，二来不添加防腐剂，洗得干净，吃得放心。而且融进了自己对制作的快乐，带着体温，不比那工厂只是加工生产。说来也怪，这食物的味道也是随你今天的心情而变化的。现最流行的不就是手工制造吗？感受那一份温暖之情！据说果酱中被活化后的果胶，预防癌症的能力更强。还有，俺的苹果酱只是简单地熬，全程不动锅。你、我、他人人都会，还不赶紧行动吗？', 'http://api.jisuapi.com/recipe/upload/20160719/115140_62739.jpg', '口臭,过敏,煮,减肥,瘦身,保湿,补水,抗过敏,消脂,肥胖','苹果'),
(NULL, 2, '苹果小米粥', '1-2人', '10-20分钟', '送给中高考孩子们的小米苹果粥-----健脾和胃、安神养心、益气减肥   又是一年临近中考、高考，孩子们学习紧张，压力可想而知，这道粥非常适合这类孩子食用，既可以健脾和胃，又可安神养心，且有助于睡眠。    最近体重上升比较快，夏天的衣服穿着都瘦了，晚上睡眠也不好。身边的人试了3日苹果减肥法，每天只吃苹果，的确是减了几斤。每天只吃苹果对我来说有点难，所以添加了安神益睡眠的小米一同煮粥，作为晚餐来食用。再加上每天去操场快走2-3公里，坚持2个月希望能剪掉一些体重。小米又名粟，古代叫禾，我国北方通称谷子，去壳后叫小米。小米的品种很多，按米粒的性质可分为糯性小米和粳性小米两类；按谷壳的颜色可分为黄包、白色、褐色等多种，其中红色、灰色者多为糯性，白色、黄色、褐色、青色者多为粳性。小米著名品种有山西沁县黄小米，山东章丘龙山小米、山东金乡的金米、河北桃花米等。小米粒小色淡黄或深黄，质地较硬，制成品有甜香味。我国北方许多妇女在生育后，都有用小米加红糖来调养身体的传统，小米熬粥营养丰富，有“代参汤”之美称。小米的营养价值极为丰富，因富含维生素B1、B12等，具有防止消化不良及口角生疮的功效；小米具有防止泛胃、呕吐的功效；还具有滋阴养血的功能，可以使产妇虚寒的体质得到调养，帮助她们恢复体力；小米具有减轻皱纹、色斑、色素沉着的功效。用小米煮粥，睡前服用，易使人安然入睡。苹果具有生津止渴、润肺除烦、健脾益胃、养心益气、润肠、止泻、解暑、醒酒等功效。苹果中的维生素C是心血管很有好处，经常吃苹果可以降低感冒的几率，还可以改善呼吸系统和肺功能，保护肺部免受污染和烟尘的影响。苹果中的胶质和向量元素铬能保持血糖的稳定，能有效地降低胆固醇，苹果还能防癌，预防铅中毒。糖尿病患者可以适量吃些苹果，准妈妈每天吃个苹果可以减轻孕期反应。经常闻一闻苹果的香气，可以缓解人的紧张、忧郁情绪，还有提神醒脑的功效。', 'http://api.jisuapi.com/recipe/upload/20160719/115140_61509.jpg', '口臭,过敏,减肥,瘦身,养胃,调理肠胃,润肠通便,抗过敏,肥胖,胃炎,便秘','苹果,小米'),
(NULL, 2, '红薯炒玉米', '1-2人', '10分钟内', '红薯能使人“长寿少疾”，且能益脾胃，强肾阴，是非常适合干燥寒冷的秋天食用，对身体非常有好处。 玉米在所有主食中，玉米的营养价值和保健作用是最高的，有调中开胃，益肺宁心，清湿热，利肝胆，延缓衰老等功能。此款菜肴为秋季养生美味，有健脾胃，养肾阴，去秋燥等功效，是老少皆宜的的营养佳肴。', 'http://api.jisuapi.com/recipe/upload/20160719/115140_45518.jpg', '便秘,健脾胃,减肥,排毒,秋季,老年人','红薯,玉米'),
(NULL, 2, '苹果莲子炖银耳', '3-4人', '2小时以上', '苹果有“智慧果”、“记忆果”的美称。人们早就发现，多吃苹果有增进记忆、提高智能的效果。苹果不仅含有丰富的糖、维生素和矿物质等大脑必需的营养素，而且更重要的是富含锌元素。据研究，锌是人体内许多重要酶的组成部分，是促进生长发育的关键元素。能够提高人体免疫力。苹果银耳羹，苹果有生津、润肺，除烦解暑、开胃醒酒、止泻的功效；银耳既有补脾开胃的功效，又有益气清肠的作用，还可以滋阴润肺、长期服用可以润肤，并有祛除脸部黄褐斑、雀斑的功效。', 'http://api.jisuapi.com/recipe/upload/20160719/115140_97489.jpg', '尿频,气虚质,腹泻,口臭,过敏,痰湿质,阴虚质,减肥,瘦身,保湿,补水,抗过敏,肥胖','苹果,莲子,银耳'),
(NULL, 2, '糖醋黄瓜', '1-2人', '10-20分钟', '很适合在夏天吃，酸酸的很开胃，带皮的黄瓜一起泡吃起来脆脆的，很喜欢。我儿子还能把醋也全都喝光光呢，真是个吃醋高手。', 'http://api.jisuapi.com/recipe/upload/20160719/115140_49784.jpg', '减肥,夏季,清热解暑,糖醋味,补水,阳盛质','黄瓜'),
(NULL, 2, '芹菜炒鸡蛋', '1-2人', '10-20分钟', '芹菜是常用蔬菜之一，既可热炒，又能凉拌，深受人们喜爱。芹菜含铁量较高，是缺铁性贫血患者的佳蔬。芹菜还有降血糖作用。经常吃些芹菜，可以中和尿酸及体内的酸性物质，对预防痛风有较好效果显著。特别适合高血压、动脉硬化、高血糖、缺铁性贫血、经期妇女食用；芹菜性凉质滑，脾胃虚寒、大便溏薄者不宜多食，芹菜有降血压作用，故血压偏低者慎用；计划生育的男性应注意适量少食。芹菜炒鸡蛋是很不错的一道菜，两个搭配营养价值是非常丰富的。', 'http://api.jisuapi.com/recipe/upload/20160719/115140_92696.jpg', '减肥,瘦身,降血压,高血压,肥胖','芹菜,鸡蛋'),
(NULL, 2, '柠檬茶', '1-2人', '10-20分钟', '柠檬茶上个月就打算做了，但自己一直懒，都没去买柠檬，星期天去菜市场时特意买了一个，刚好那天天气有点热，用来做这个柠檬茶特别合适，味道很不错，以后不要买外面的柠檬茶喝了。', 'http://api.jisuapi.com/recipe/upload/20160719/115141_86275.jpg', '白领,晕车,美容,饮品,下午茶,减肥,瘦身,美白,祛斑,保湿,补水,提神,促消化,生津止渴,开胃,抗疲劳,肥胖,消化不良,内分泌失调','柠檬'),
(NULL, 2, '姜汁腐竹拌芹菜', '1-2人', '10分钟内', '腐竹腐竹为低脂肪高蛋白保健食品，具有良好的健脑作用，能预防老年痴呆症的发生。还有防治高脂血症、动脉硬化的效果；生姜能驱寒活血。春寒料峭时节里来这样一道小菜，有利于身体抵御寒冷，还能祛风利湿，对心脏和血管都有刺激作用，能起到扩张血管促进血液循环的效果。这道小菜非常适合高血压和心脑血管症者食用。', 'http://api.jisuapi.com/recipe/upload/20160719/115141_78631.jpg', '便秘,减肥,家常菜,拌,排毒,祛痘美白,美白,肥胖,脂肪肝,降血压,高血压','腐竹,芹菜'),
(NULL, 2, '苦瓜甘蓝', '1-2人', '10分钟内', '在中国传统里，紫色是尊贵的颜色，紫色代表浪漫。紫色代表了永恒与纯洁的爱。在七夕之日我用紫色的心情做了一道紫色的佳肴，祝愿好豆的管管们，豆友们；七夕节快乐，愿我们都能够在爱的季节里有满满的收获！', 'http://api.jisuapi.com/recipe/upload/20160719/115141_56691.jpg', '七夕节,下火,便秘,减肥,去火,抗疲劳','苦瓜,甘蓝');


