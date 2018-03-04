SET NAMES UTF8;
DROP DATABASE IF EXISTS mi;
CREATE DATABASE mi CHARSET=UTF8;
USE mi;

CREATE TABLE mi_user (
  uid int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  uname varchar(32) NOT NULL,
  upwd varchar(32) NOT NULL,
  email varchar(64) DEFAULT NULL,
  phone varchar(16) NOT NULL,
  avatar varchar(128) DEFAULT NULL,
  user_name varchar(32) DEFAULT NULL,
  gender enum('1','0') DEFAULT NULL,
  regtime datetime DEFAULT CURRENT_TIMESTAMP,
  expire enum('1','0') DEFAULT '0'
);

INSERT INTO mi_user VALUES
(1, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1', DEFAULT, '0'),
(2, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1', DEFAULT, '0'),
(3, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1', DEFAULT, '0'),
(4, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0', DEFAULT, '0');

CREATE TABLE mi_shopping_cart (
  sid int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  uid int(11) DEFAULT NULL COMMENT '用户ID',
  sku varchar(120) DEFAULT NULL,
  count int(11) DEFAULT NULL COMMENT '购买数量',
  is_checked tinyint(1) DEFAULT NULL COMMENT '是否已勾选，确定购买'
);
INSERT INTO mi_shopping_cart VALUES(3, 1, '2_4_4', 1, 0);
INSERT INTO mi_shopping_cart VALUES(4, 1, '1_1_1', 1, 0);

CREATE TABLE mi_receiver_address (
  adr_id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  uid int(11) DEFAULT NULL COMMENT '用户id',
  receiver varchar(16) DEFAULT NULL COMMENT '接收人姓名',
  province varchar(16) DEFAULT NULL COMMENT '省',
  city varchar(16) DEFAULT NULL COMMENT '市',
  country varchar(16) DEFAULT NULL COMMENT '县',
  address varchar(128) DEFAULT NULL COMMENT '详细地址',
  cellphone varchar(11) DEFAULT NULL COMMENT '手机号',
  fixedphone varchar(16) DEFAULT NULL COMMENT '固定电话',
  postcode char(6) DEFAULT NULL COMMENT '邮编',
  tag varchar(16) DEFAULT NULL COMMENT '标签名',
  is_default tinyint(1) DEFAULT NULL COMMENT '是否默认地址'
);

INSERT INTO mi_receiver_address VALUES
(1, 1, 'mimi', '湖北', '武汉', '武昌', '关山大道101号', '13001231111', '027-10000', '030020', '', 1);

CREATE TABLE mi_top_nav (
  top_nav_id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nav_name varchar(60) NOT NULL DEFAULT ''
);

INSERT INTO mi_top_nav (top_nav_id, nav_name) VALUES
(1, '小米手机'),
(2, '红米'),
(3, '笔记本'),
(4, '电视'),
(5, '盒子'),
(6, '路由器'),
(7, '智能硬件');

CREATE TABLE mi_brand (
  brand_id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  brand_name varchar(60) DEFAULT '',
  is_show enum('1','0') NOT NULL DEFAULT '0'
);

INSERT INTO mi_brand (brand_id, brand_name, is_show) VALUES
(1, '小米', '0'),
(2, '飞利浦', '0'),
(3, '第三方品牌', '0'),
(4, 'ZMI', '0'),
(5, '小蚁', '0'),
(6, '90分', '0'),
(7, '1MORE', '0'),
(8, '米家', '0'),
(9, '华米', '0'),
(10, '智米', '0'),
(11, '小方', '0'),
(12, '闪迪', '0'),
(13, '悦米', '0');

CREATE TABLE mi_category (
  cat_id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  cat_name varchar(60) NOT NULL DEFAULT '',
  cat_pid int(11) DEFAULT NULL,
  thumb varchar(255) DEFAULT ''
);

INSERT INTO mi_category (cat_id, cat_name, cat_pid, thumb) VALUES
(1, '手机 电话卡', 0, ''),
(2, '小米Note 3', 1, 'img/cat/note3-140-2.png'),
(3, '小米MIX 2', 1, 'img/cat/mix2-140.png'),
(4, '小米6', 1, 'img/cat/xm6_140.png'),
(5, '小米5X', 1, 'img/cat/140pc-5x.png'),
(6, '小米MAX 2', 1, 'img/cat/max2_140!70x70.jpg'),
(7, '红米5A', 1, 'img/cat/140-5a.png'),
(8, '红米Note 5A', 1, 'img/cat/805a.png'),
(9, '红米Note 4X', 1, 'img/cat/hmn4x140.png'),
(10, '红米4A', 1, 'img/cat/140-4a.png'),
(11, '红米5', 1, 'img/cat/redmi5-140-140.png'),
(12, '红米5 Plus', 1, 'img/cat/redmi5P-140-140.png'),
(13, '移动4G+专区', 1, 'img/cat/4G140!70x70.jpg'),
(14, '对比手机', 1, 'img/cat/compare!70x70.jpg'),
(15, '米粉卡 日租卡', 1, 'img/cat/mifenka-1!70x70.jpg'),
(16, '小米移动 电话卡', 1, 'img/cat/mimobile!70x70.jpg'),
(17, '手机上门维修服务', 1, 'img/cat/weixiu140-140.png'),
(18, '笔记本', 0, ''),
(19, '笔记本Air 12.5"', 18, 'img/cat/bijiben140!70x70.jpg'),
(20, '笔记本Air 13.3" 独显', 18, 'img/cat/bijiben140!70x70.jpg'),
(21, '笔记本Air 13.3" 集显', 18, 'img/cat/bijiben140!70x70.jpg'),
(22, '笔记本Pro 15.6"', 18, 'img/cat/WechatIMG605.png'),
(23, 'USB-C电源适配器', 18, 'img/cat/bjbcdq140!70x70.jpg'),
(24, 'HDMI转接器', 18, 'img/cat/usbzjqggg140!70x70.jpg'),
(25, 'VGA 千兆网口转接器', 18, 'img/cat/vga.png'),
(26, '小米笔记本内胆包', 18, 'img/cat/meidanbao140!70x70.jpg'),
(27, '悦米机械键盘', 18, 'img/cat/ymjp140!70x70.jpg'),
(28, '小米便携鼠标', 18, 'img/cat/shubiao140!70x70.jpg'),
(29, '小米无线鼠标', 18, 'img/cat/wxsb140.png'),
(30, '鼠标垫', 18, 'img/cat/xmsbd140!70x70.jpg'),
(31, 'DisplayPort转接器', 18, 'img/cat/USBC140!70x70.jpg'),
(32, '电视 盒子', 0, ''),
(33, '小米电视4C 43英寸', 32, 'img/cat/xin55.png'),
(34, '小米电视4C 55英寸', 32, 'img/cat/xin43.png'),
(35, '小米电视4 55英寸', 32, 'img/cat/4A5080!70x70.jpg'),
(36, '小米电视4 65英寸', 32, 'img/cat/4A5080!70x70.jpg'),
(37, '小米电视4A 32英寸', 32, 'img/cat/80_8055tv!70x70.jpg'),
(38, '小米电视4A 43英寸', 32, 'img/cat/tiyu4380_80!70x70.jpg'),
(39, '小米电视4A 49英寸', 32, 'img/cat/xmds4_49_140!70x70.jpg'),
(40, '小米电视4A 55英寸', 32, 'img/cat/xmds4_55_140!70x70.jpg'),
(41, '小米电视4A 65英寸', 32, 'img/cat/xmds4_65_140!70x70.jpg'),
(42, '小米电视3s 65英寸 曲面', 32, 'img/cat/65140list!70x70.jpg'),
(43, '小米盒子3s', 32, 'img/cat/140-140!70x70.jpg'),
(44, '小米盒子3c', 32, 'img/cat/140-140!70x70.jpg'),
(45, '小米盒子3 增强版', 32, 'img/cat/hezi3zenqiang!70x70.jpg'),
(46, '小米盒子4', 32, 'img/cat/hezibai480_80!70x70.jpg'),
(47, '安装服务', 32, 'img/cat/icon.png'),
(48, '电视盒子配件', 32, 'img/cat/dianshipeijian!70x70.jpg'),
(49, '小米影视会员', 32, 'img/cat/huiyuan.png'),
(50, '小米儿童会员', 32, 'img/cat/ertong1.png'),
(51, '路由器 手机配件', 0, ''),
(52, '小米路由器3', 51, 'img/cat/miwifi3-140!70x70.jpg'),
(53, '小米路由器3C', 51, 'img/cat/miwifi3c-140!70x70.jpg'),
(54, '小米路由器3G', 51, 'img/cat/miwifi3g-140!70x70.jpg'),
(55, '小米路由器3A', 51, 'img/cat/miwifi3a-140!70x70.jpg'),
(56, '小米路由器Pro', 51, 'img/cat/luyouqiPro-140!70x70.jpg'),
(57, '小米路由器HD', 51, 'img/cat/luyouqiHD-140!70x70.jpg'),
(58, 'WiFi放大器2', 51, 'img/cat/WiFifangdaqi2-140!70x70.jpg'),
(59, 'WiFi放大器Pro', 51, 'img/cat/WiFifangdaqiPro-140!70x70.jpg'),
(60, 'WiFi电力猫', 51, 'img/cat/plc-140!70x70.jpg'),
(61, '小米VR眼镜', 51, 'img/cat/VRPLAY3.png'),
(62, '随身WIFI', 51, 'img/cat/miniwifi-140!70x70.jpg'),
(63, '千兆网线', 51, 'img/cat/qianzhaowangxian-140!70x70.jpg'),
(64, '手机保护套', 51, 'img/cat/baohutao!70x70.jpg'),
(65, '手机贴膜', 51, 'img/cat/tiemo!70x70.jpg'),
(66, '手机支架', 51, 'img/cat/zhijia160x160!70x70.jpg'),
(67, '数据线', 51, 'img/cat/shujuxian-140!70x70.jpg'),
(68, '存储卡', 51, 'img/cat/cunchu160x160!70x70.jpg'),
(76, '移动电源 插线板', 0, ''),
(77, '新小米移动电源2', 76, 'img/cat/dianyuan2.1000-140!70x70.jpg'),
(78, '小米移动电源2C', 76, 'img/cat/yidongdian2c-140!70x70.jpg'),
(79, '小米移动电源2', 76, 'img/cat/yidongdian2c-140!70x70.jpg'),
(80, '小米随身手电筒', 76, 'img/cat/shoudiantong140140!70x70.jpg'),
(81, '移动电源保护套', 76, 'img/cat/baohutao140!70x70.jpg'),
(82, '彩虹5号电池（10粒装）', 76, 'img/cat/5Battery2!70x70.jpg'),
(83, '彩虹7号电池', 76, 'img/cat/7Battery2!70x70.jpg'),
(84, 'USB充电器', 76, 'img/cat/chongdianqi-140!70x70.jpg'),
(85, '耳机 音箱', 0, ''),
(86, '小米头戴式耳机', 85, 'img/cat/toudai140!70x70.jpg'),
(87, '头戴式耳机轻松版', 85, 'img/cat/toudai140!70x70.jpg'),
(88, '小米降噪耳机', 85, 'img/cat/xmjzej140!70x70.jpg'),
(89, '小米活塞耳机 清新版', 85, 'img/cat/huosai!70x70.jpg'),
(90, '小米圈铁耳机 Pro', 85, 'img/cat/qtpro140!70x70.jpg'),
(91, '小米圈铁耳机', 85, 'img/cat/quantie!70x70.jpg'),
(92, '智能 家电', 0, ''),
(93, '空气净化器2', 92, 'img/cat/jinghuaqi2-140!70x70.jpg'),
(94, '空气净化器Pro', 92, 'img/cat/jinghuaqiPro-140!70x70.jpg'),
(95, '净化器2S', 92, 'img/cat/jinghuaqi2S-140!70x70.jpg'),
(96, '净化器MAX', 92, 'img/cat/jinghuaqiMAX-140!70x70.jpg'),
(97, '车载空气净化器', 92, 'img/cat/czjhq140!70x70.jpg'),
(98, '空净滤芯', 92, 'img/cat/kongjinlvxin-140!70x70.jpg'),
(99, '净水器(厨下式)', 92, 'img/cat/jingshuicxs-140!70x70.jpg'),
(100, '米家恒温电水壶', 92, 'img/cat/shuihu140!70x70.jpg'),
(101, 'PM2.5检测仪', 92, 'img/cat/jianceyi-140!70x70.jpg'),
(73, '米家扫地机器人', 92, 'img/cat/jiqiren!70x70.jpg'),
(102, '健康 家居', 0, ''),
(103, '小米手环2', 102, 'img/cat/shouhuan2140!70x70.jpg'),
(104, '手环腕带', 102, 'img/cat/wandai-140!70x70.jpg'),
(105, '手环充电器', 102, 'img/cat/shouhuanchongdainqi-140!70x70.jpg'),
(106, '运动手表', 102, 'img/cat/yundongshoubiao-140!70x70.jpg'),
(107, '小米体脂秤', 102, 'img/cat/tizhicheng-140!70x70.jpg'),
(108, '小米体重秤', 102, 'img/cat/scale!70x70.jpg'),
(109, '米家体温计', 102, 'img/cat/tiwenji-140!70x70.jpg'),
(110, '米家血压计', 102, 'img/cat/xueyaji-140!70x70.jpg'),
(111, '米家电动牙刷', 102, 'img/cat/yashua140!70x70.jpg'),
(112, '智能家庭组合', 102, 'img/cat/zhinengjiatingtaozhuang-140!70x70.jpg'),
(113, '米家智能插座', 102, 'img/cat/zhinengchazuo-140!70x70.jpg'),
(114, '出行 儿童', 0, ''),
(115, '九号平衡车', 114, 'img/cat/scooter-140!70x70.jpg'),
(116, '九号平衡车Plus', 114, 'img/cat/phcplus140!70x70.jpg'),
(117, '米家电动滑板车', 114, 'img/cat/scooter2-140!70x70.jpg'),
(118, '电助力折叠自行车', 114, 'img/cat/zxc140-140!70x70.jpg'),
(119, '米兔智能积木', 114, 'img/cat/toyblock2-140!70x70.jpg'),
(72, '小米无人机', 114, 'img/cat/wurenji140!70x70.jpg'),
(120, '生活 米兔', 0, ''),
(121, '米兔玩偶', 120, 'img/cat/mitu-140!70x70.jpg'),
(122, '旅行箱', 120, 'img/cat/lvxingxiang!70x70.jpg'),
(123, '双肩包', 120, 'img/cat/xiangbao-80!70x70.jpg'),
(124, '运动鞋', 120, 'img/cat/ydx140!70x70.jpg'),
(125, '米家 wiha 精修螺丝刀套装', 120, 'img/cat/luosidao-140!70x70.jpg');

CREATE TABLE mi_product (
  pid int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  cat_id int(11) DEFAULT NULL,
  brand_id int(11) DEFAULT NULL,
  phone_model varchar(32) DEFAULT '',
  keywords varchar(64) DEFAULT NULL,
  top_nav_id int(11) DEFAULT '0',
  product_sn varchar(60) DEFAULT NULL,
  pname varchar(120) NOT NULL DEFAULT '',
  ptitle varchar(120) NOT NULL DEFAULT '',
  subtitle varchar(120) DEFAULT '',
  promote_detail varchar(120) DEFAULT '',
  is_on_sale enum('1','0') DEFAULT '0',
  is_new enum('1','0') DEFAULT '0',
  is_free_shipping enum('1','0') DEFAULT '0',
  add_time datetime DEFAULT CURRENT_TIMESTAMP,
  expire enum('1','0') DEFAULT '0',
  thumb_img varchar(128) DEFAULT NULL,
  discount varchar(64) DEFAULT '',
  gift varchar(128) DEFAULT NULL,
  short_desc varchar(228) DEFAULT NULL,
  href varchar(128) DEFAULT '#',
  detail_img varchar(228) DEFAULT NULL
);

INSERT INTO mi_product (pid, cat_id, brand_id, phone_model, keywords, top_nav_id, product_sn, pname, ptitle, subtitle, promote_detail, is_on_sale, is_new, is_free_shipping, add_time, expire, thumb_img, discount, gift, short_desc, href, detail_img) VALUES
(1, 1, 1, '小米Note 2', '手机', 0, '1174400001', '小米Note 2', '小米Note 2', '5.7" 双曲面柔性屏 / 3D曲面玻璃 / 骁龙 821 性能版 / 2256万超高像素相机 / 4070mAh 超长续航', '64GB 直降700元，128GB 下单立减600元。全系列享小米分期3/6期免息', '0', '0', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/xmad_15030636132779_UImNJ.png', '', '', '最高减600元', '#', 'img/detail_img/beb93b2f8a369c4acc1f084e3a347108.jpg'),
(2, 3, 1, '小米MIX 2', '手机', 1, '1174400002', '小米MIX 2', '小米MIX 2 全面屏2.0', '全面屏2.0，5.99"大屏 / 骁龙835旗舰处理器 / 4轴光学防抖 / 6模43频，全球频段 。注意：手机退货，则赠品也需全部退回', '赠价值299元小米AI音箱(不含斯塔克限量版）', '0', '1', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/mix2320-220.png', '', '', '全面屏2.0，5.99"大屏', '#', 'img/detail_img/beb93b2f8a369c4acc1f084e3a347108.jpg'),
(3, 2, 1, '小米Note 3', '手机', 1, '1174400003', '小米Note 3', '小米Note 3 人脸解锁', '1600万美颜自拍 / 2倍变焦双摄，四轴光学防抖 / 5.5"护眼屏 / 超轻四曲面，7系铝金属边框 。注意：手机退货，则赠品也需全部退回', '128GB赠价值299元小米AI音箱；6+64GB下单立减100元（小米闪购下单不参与买赠和免息活动）', '0', '1', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/note2320x220.png', '', '', '光学防抖，5.5"护眼屏', '#', 'img/detail_img/beb93b2f8a369c4acc1f084e3a347108.jpg'),
(4, 7, 1, '红米5', '手机', 2, '1174400004', '红米5', '红米5', '千元全面屏 / 超长续航 / 前置柔光自拍 / 骁龙处理器', '2GB+16GB、3GB+32GB版本赠耳机', '0', '1', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/5-320-220.png', '', '', '千元全面屏，超长续航', '#', 'img/detail_img/beb93b2f8a369c4acc1f084e3a347108.jpg'),
(5, 19, 1, '', '笔记本', 3, '1174400005', '小米笔记本Air 12.5英寸', '小米笔记本Air 12.5英寸', '轻薄全金属机身 / 超长续航，支持1C快充 / FHD 全贴合屏幕 / 高能量密度电池', '', '0', '1', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/bijiben32012.5.jpg', '', '', '轻薄全金属机身', '#', 'img/detail_img/2c788dec7e3dbfc552bba08a1850adff.jpg'),
(6, 35, 1, '', '电视', 4, '1174400006', '小米电视4 55英寸', '小米电视4 55英寸', '4.9mm 极超薄机身 / 无边框式设计 / 2GB+8GB大内存', '小米电视跨年特惠，12月29日-1月2日直降600元，限量抢购！', '0', '1', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/xmds_55.png', '', '', '4.9mm 极超薄机身', '#', 'img/detail_img/05fa88c99df813a714c5ab5ba989c48a.jpg'),
(7, 43, 1, '', '小米盒子', 5, '1174400007', '小米盒子3s', '小米盒子3s', '4K HDR 人工智能机顶盒 / PatchWall人工智能系统', '', '0', '0', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/mihezi.png', '', '', '4K HDR 人工智能机顶盒', '#', 'img/detail_img/6e681bf93e0c30beb02cfb651eed4dba.jpg'),
(8, 55, 1, '', '小米路由器', 6, '1174400008', '小米路由器3A', '小米路由器3A', '高增益4天线 / 64MB超大内存 / 专属APP控制 / 安全防蹭网', '', '0', '0', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/320X220.jpg', '', '', ' 64MB超大内存，专属APP控制', '#', 'img/detail_img/50d6a136411909d346d9d35b644da625.png'),
(9, 72, 1, '', '小米无人机', 7, '1174400009', '小米无人机', '小米无人机4K版套装', '易上手 / 高品质影像 / 安全 / 小巧便携', '', '0', '0', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/123321.jpg', '', '', '高品质影像', '#', ''),
(10, 1, 1, '小米MIX 4', '手机', NULL, '11744000010', '小米MIX 4', '小米MIX 4全面屏', '1600万美颜自拍 / 2倍变焦双摄，四轴光学防抖 / 5.5"护眼屏 / 超轻四曲面', '跨年特惠，12月29日-1月2日直降600元，限量抢购！', '0', '0', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/xmad_14926862610682_UhkfS.png', '', '', '最高下单立减500元', '#', 'img/detail_img/beb93b2f8a369c4acc1f084e3a347108.jpg'),
(11, 1, 1, '小米MIX', '手机', NULL, '11744000011', '小米MIX', '小米MIX全面屏', '1600万美颜自拍 / 2倍变焦双摄，四轴光学防抖 / 5.5"护眼屏 / 超轻四曲面', '跨年特惠，12月29日-1月2日直降600元，限量抢购！', '0', '0', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/xmad_14926862610682_UhkfS.png', '', '', '最高下单立减500元', '#', 'img/detail_img/beb93b2f8a369c4acc1f084e3a347108.jpg'),
(12, 9, 1, '红米4X', '手机', NULL, '11744000012', '红米4X', '红米4X全面屏', '1600万美颜自拍 / 2倍变焦双摄，四轴光学防抖 / 5.5"护眼屏 / 超轻四曲面', '跨年特惠，12月29日-1月2日直降600元，限量抢购！', '0', '0', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/xmad_14966625747867_qcTyh.png', '', '', '4100mAh超长续航，8核处理器', '#', 'img/detail_img/beb93b2f8a369c4acc1f084e3a347108.jpg'),
(13, 38, 1, '', '电视', NULL, '11744000013', '小米电视4A 43英寸', '小米电视4A 43英寸', '1600万美颜自拍 / 2倍变焦双摄，四轴光学防抖 / 5.5"护眼屏 / 超轻四曲面', '跨年特惠，12月29日-1月2日直降600元，限量抢购！', '0', '0', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/xmad_14938805670516_eryYQ.png', '', '', '全高清HDR，智能语音', '#', 'img/detail_img/05fa88c99df813a714c5ab5ba989c48a.jpg'),
(14, 103, 1, '', '小米手环及配件', NULL, '11744000014', '小米手环2', '小米手环2', 'OLED显示屏，时间、步数、心率，触手可及 / 全新腕带设计，升级计步算法 / 精准心率监测，科学运动自主掌握', '小米手环2一件包邮', '0', '0', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/6ef55907-bbed-49be-a2bb-be0821b5f7b8.png', '', '', 'OLED 显示屏幕，升级计步算法', '#', ''),
(15, 99, 1, '', '净水器', NULL, '11744000015', '小米净水器 厨下式', '小米净水器（厨下式）', '含上门安装服务费 / 400加仑大流量 / RO反渗透直出纯净水 / 隐藏安装 / 健康家庭必备', '', '0', '0', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/T14iKgBXZv1RXrhCrK.jpg', '', '', '直出纯净水，隐藏式安装', '#', 'img/detail_img/832d044c859fe63f9eb875a8ec0ae94e.jpg'),
(16, 90, 1, '', '耳机', NULL, '11744000016', '小米圈铁耳机Pro', '小米圈铁耳机Pro', '独创双动圈 + 动铁 三单元发声 / 均衡自然声音 / 高保真石墨烯振膜 / 25 道工序打磨 / 弹力磨砂线材', '', '0', '0', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/302f2608-655a-489c-a0c5-a3b9172defd1.png', '', '', '独创双动圈+动铁，三单元发声', '#', ''),
(17, 73, 1, '', '米家扫地机器人及配件', NULL, '11744000017', '米家扫地机器人', '米家扫地机器人', '高精度激光测距，智能规划路径 / 1800Pa 大风压澎湃吸力 / 远程智能控制 ，定时清扫 / 大电池持久清扫', '', '0', '0', '0', '2018-01-14 12:22:58', '0', 'img/thumb_img/d70bc596-524b-4a05-996b-ceccc072fc5e.png', '', '', '爱干净，高效完成清扫任务', '#', 'img/detail_img/a9bd14bd3c92cf7fb03c26555184c6b4.png');


CREATE TABLE mi_index_carousel (
  cars_id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  pid int(11) DEFAULT NULL,
  img varchar(128) DEFAULT NULL,
  title varchar(64) DEFAULT NULL,
  href varchar(128) DEFAULT NULL
);

INSERT INTO mi_index_carousel (cars_id, pid, img, title, href) VALUES
(1, 1, 'img/index_carousel/xmad_15054825415749_jLtbi.jpg', '轮播广告商品1', '#'),
(2, 2, 'img/index_carousel/xmad_15052198121545_TBdgt.jpg', '轮播广告商品2', '#'),
(3, 3, 'img/index_carousel/xmad_15054791604213_WiHcg.jpg', '轮播广告商品3', '#'),
(4, 4, 'img/index_carousel/xmad_15035620106491_CroBK.jpg', '轮播广告商品4', '#'),
(5, 5, 'img/index_carousel/xmad_15054814218564_lntBU.jpg', '轮播广告商品5', '#'),
(6, 6, 'img/index_carousel/xmad_15054905232826_hpOZT.jpg', '轮播广告商品6', '#');

CREATE TABLE mi_index_product (
  index_id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  pid int(11) DEFAULT NULL,
  pname varchar(120) NOT NULL DEFAULT '',
  thumb_img varchar(128) DEFAULT NULL,
  short_desc varchar(228) DEFAULT NULL,
  price int(11) DEFAULT NULL,
  ad_img varchar(128) DEFAULT '',
  star_product tinyint(4) DEFAULT NULL,
  jiadian tinyint(4) DEFAULT NULL,
  jiadian_1 tinyint(4) DEFAULT NULL,
  jiadian_2 tinyint(4) DEFAULT NULL,
  jiadian_3 tinyint(4) DEFAULT NULL,
  jiadian_4 tinyint(4) DEFAULT NULL,
  zhineng tinyint(4) DEFAULT NULL,
  zhineng_1 tinyint(4) DEFAULT NULL,
  zhineng_2 tinyint(4) DEFAULT NULL,
  zhineng_3 tinyint(4) DEFAULT NULL,
  zhineng_4 tinyint(4) DEFAULT NULL,
  zhineng_5 tinyint(4) DEFAULT NULL,
  dapei tinyint(4) DEFAULT NULL,
  dapei_1 tinyint(4) DEFAULT NULL,
  dapei_2 tinyint(4) DEFAULT NULL,
  dapei_3 tinyint(4) DEFAULT NULL,
  dapei_4 tinyint(4) DEFAULT NULL,
  peijian tinyint(4) DEFAULT NULL,
  peijian_1 tinyint(4) DEFAULT NULL,
  peijian_2 tinyint(4) DEFAULT NULL,
  peijian_3 tinyint(4) DEFAULT NULL,
  peijian_4 tinyint(4) DEFAULT NULL,
  zhoubian tinyint(4) DEFAULT NULL,
  zhoubian_1 tinyint(4) DEFAULT NULL,
  zhoubian_2 tinyint(4) DEFAULT NULL,
  zhoubian_3 tinyint(4) DEFAULT NULL,
  zhoubian_4 tinyint(4) DEFAULT NULL,
  zhoubian_5 tinyint(4) DEFAULT NULL,
  recommend tinyint(4) DEFAULT NULL,
  hot_view tinyint(4) DEFAULT NULL,
  expire enum('1','0') DEFAULT '0',
  href varchar(128) DEFAULT '#'
);

INSERT INTO mi_index_product (index_id, pid, pname, thumb_img, short_desc, price, ad_img, star_product, jiadian, jiadian_1, jiadian_2, jiadian_3, jiadian_4, zhineng, zhineng_1, zhineng_2, zhineng_3, zhineng_4, zhineng_5, dapei, dapei_1, dapei_2, dapei_3, dapei_4, peijian, peijian_1, peijian_2, peijian_3, peijian_4, zhoubian, zhoubian_1, zhoubian_2, zhoubian_3, zhoubian_4, zhoubian_5, recommend, hot_view, expire, href) VALUES
(1, 1, '小米Note 2', 'img/thumb_img/xmad_15030636132779_UImNJ.png', '最高减600元', 2799, '', 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, '0', '#'),
(2, 2, '小米MIX 2', 'img/thumb_img/mix2320-220.png', '全面屏2.0，5.99"大屏', 3599, '', 2, 0, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 0, 0, 2, 0, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 2, 0, '0', '#'),
(3, 3, '小米Note 3', 'img/thumb_img/note2320x220.png', '光学防抖，5.5"护眼屏', 1999, '', 3, 0, 0, 3, 0, 3, 0, 3, 3, 3, 3, 3, 0, 0, 0, 3, 0, 0, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 3, 0, '0', '#'),
(4, 4, '红米5', 'img/thumb_img/5-320-220.png', '千元全面屏，超长续航', 2599, '', 4, 0, 0, 4, 0, 4, 0, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 4, 0, '0', '#'),
(5, 5, '小米笔记本Air 12.5英寸', 'img/thumb_img/bijiben32012.5.jpg', '轻薄全金属机身', 3599, '', 5, 0, 0, 5, 0, 5, 0, 5, 5, 5, 5, 5, 0, 0, 0, 4, 0, 0, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 5, 0, '0', '#'),
(6, 6, '小米电视4 55英寸', 'img/thumb_img/xmds_55.png', '4.9mm 极超薄机身', 3899, '', 6, 0, 0, 6, 0, 6, 0, 6, 6, 6, 6, 6, 0, 0, 0, 5, 0, 0, 6, 6, 6, 6, 0, 8, 8, 8, 8, 8, 6, 0, '0', '#'),
(7, 7, '小米盒子3s', 'img/thumb_img/mihezi.png', '4K HDR 人工智能机顶盒', 349, '', 7, 0, 0, 7, 0, 7, 0, 7, 7, 7, 7, 7, 0, 0, 0, 6, 0, 0, 7, 7, 7, 7, 0, 7, 7, 7, 7, 7, 7, 0, '0', '#'),
(8, 8, '小米路由器', 'img/thumb_img/320X220.jpg', ' 64MB超大内存，专属APP控制', 139, '', 8, 0, 0, 8, 0, 8, 0, 8, 8, 8, 8, 8, 0, 2, 7, 7, 0, 0, 8, 8, 8, 8, 0, 6, 6, 6, 6, 6, 8, 0, '0', '#'),
(9, 9, '小米无人机', 'img/thumb_img/123321.jpg', '高品质影像', 2999, '', 9, 0, 8, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 8, 1, 8, 1, 0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 9, 0, '0', '#'),
(10, 10, '小米MIX 2', 'img/thumb_img/xmad_14926862610682_UhkfS.png', '最高下单立减500元', 1999, '', 10, 0, 7, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 7, 2, 0, 2, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 10, 0, '0', '#'),
(11, 11, '小米MIX', 'img/thumb_img/xmad_14926862610682_UhkfS.png', '最高下单立减500元', 3299, '', 0, 0, 6, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, 0, 3, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3, 0, 0, '0', '#'),
(12, 12, '红米4X', 'img/thumb_img/xmad_14966625747867_qcTyh.png', '4100mAh超长续航，8核处理器', 3299, '', 0, 0, 5, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 5, 4, 0, 4, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 0, 0, '0', '#'),
(13, 13, '小米电视4A 43英寸', 'img/thumb_img/xmad_14938805670516_eryYQ.png', '全高清HDR，智能语音', 3899, '', 0, 0, 4, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 0, 5, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, '0', '#'),
(14, 14, '小米手环2', 'img/thumb_img/6ef55907-bbed-49be-a2bb-be0821b5f7b8.png', 'OLED 显示屏幕，升级计步算法', 149, 'img/ad_img/xmad_15033634845604_MHJpV.jpg', 0, 0, 3, 0, 3, 0, 2, 0, 0, 0, 0, 0, 1, 3, 6, 0, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, '0', '#'),
(15, 15, '小米净水器 厨下式', 'img/thumb_img/T14iKgBXZv1RXrhCrK.jpg', '直出纯净水，隐藏式安装', 1999, 'img/ad_img/xmad_151964783126_oMgmq.jpg', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, '0', '#'),
(16, 16, '小米圈铁耳机Pro', 'img/thumb_img/302f2608-655a-489c-a0c5-a3b9172defd1.png', '独创双动圈+动铁，三单元发声', 199, 'img/ad_img/xmad_15034816547397_TKBOF.jpg', 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 8, 0, 8, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, '0', '#'),
(17, 17, '米家扫地机器人', 'img/thumb_img/d70bc596-524b-4a05-996b-ceccc072fc5e.png', '爱干净，高效完成清扫任务', 1699, 'img/ad_img/xmad_15021010132973_BOkcp.jpg', 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, '0', '#');

CREATE TABLE mi_attr_type (
  attr_type_id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  attr_type_name varchar(64) DEFAULT NULL
);

INSERT INTO mi_attr_type (attr_type_id, attr_type_name) VALUES
(1, '选择版本'),
(2, '选择颜色'),
(3, '价格');

CREATE TABLE mi_attr_version (
  ver_id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  ver_name varchar(64) DEFAULT NULL,
  ver_desc varchar(228) DEFAULT NULL,
  attr_type_id int(11) DEFAULT NULL
);

INSERT INTO mi_attr_version (ver_id, ver_name, ver_desc, attr_type_id) VALUES
(1, '4GB内存+64GB', '骁龙821 性能版，最高主频 2.35GHz，Adreno 530 图形处理器', 1),
(2, '6GB内存+128GB', '骁龙821 性能版，最高主频 2.35GHz，Adreno 530 图形处理器', 1),
(3, '全球版 6GB内存+128GB ', '4G+ 全球频段，骁龙821 性能版，最高主频 2.35GHz，Adreno 530 图形处理器', 1),
(4, '6GB+64GB', '', 1),
(5, '6GB+128GB', '', 1),
(6, '6GB+256GB', '', 1),
(7, '全陶瓷尊享版', '', 1),
(8, '4GB+64GB', '', 1),
(9, '6GB+64GB', '', 1),
(10, '6GB+128GB', '', 1),
(11, '4GB+32GB', '', 1),
(12, '3GB+32GB', '', 1),
(13, '2GB+16GB', '', 1),
(14, '12.5英寸 M3 4G 128G ', '', 1),
(15, '12.5英寸 M3 4G 256G ', '', 1),
(16, '55英寸', '', 1),
(17, '默认版本', '', 1);

CREATE TABLE mi_attr_color (
  color_id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  color_name varchar(64) DEFAULT NULL,
  color_img varchar(228) DEFAULT NULL,
  attr_type_id int(11) DEFAULT NULL
);

INSERT INTO mi_attr_color (color_id, color_name, color_img, attr_type_id) VALUES
(1, '亮黑色', 'img/attr/63e11017-bfe1-3264-1725-f5d7890e744b.png', 2),
(2, '亮银黑', 'img/attr/956dce80-b937-4e88-bee2-d8084511cae0.png', 2),
(3, '冰川银', 'img/attr/aefa4ae5-bf69-2a60-a37f-6ab0d920a365.png', 2),
(4, '黑色陶瓷', 'img/attr/bc99af80103f531296be0be09811bd7f.png', 2),
(5, '皓月白', 'img/attr/3215be39ab4b7fe8d8492d889572d213.png', 2),
(6, '亮蓝色', 'img/attr/30ad61e2bbafa9ce7aa3488baa14081f.png', 2),
(7, '黑色', 'img/attr/pms_1512614849.04971208!38x38.jpg', 2),
(8, '金色', 'img/attr/pms_1512614854.43176101!38x38.jpg', 2),
(9, '玫瑰金', 'img/attr/pms_1512614857.21692205!38x38.jpg', 2),
(10, '浅蓝色', 'img/attr/pms_1512614861.85876259!38x38.jpg', 2),
(11, '银色', 'img/attr/aefa4ae5-bf69-2a60-a37f-6ab0d920a365.png', 2),
(12, '金色', 'img/attr/e922b93b-a709-84a7-3c06-c39c010c62c0.png', 2),
(13, '黑色', '', 2),
(14, '黑色', 'img/attr/2ba96ac5-dff1-4ee3-663a-3ae893fb73b9.jpg', 2),
(15, '白色', 'img/attr/427c48d7-07cd-d14a-37af-f232b810c1dc.jpg', 2),
(16, '白色', 'img/attr/3b77fa3b-2452-a267-2214-9dfcb2c4e1f4.jpg', 2),
(17, '金色', 'img/attr/1c84f395fb5da4bfbb1c01f860440a77.png', 2);

CREATE TABLE mi_attr (
  attr_id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  pid int(11) DEFAULT NULL,
  ver_id int(11) DEFAULT NULL,
  color_id int(11) DEFAULT NULL,
  market_price int(11) DEFAULT NULL,
  special_price int(11) DEFAULT NULL,
  count int(11) DEFAULT '99999',
  sku varchar(120) DEFAULT NULL,
  expire enum('1','0') DEFAULT '0'
);

INSERT INTO mi_attr (attr_id, pid, ver_id, color_id, market_price, special_price, count, sku, expire) VALUES
(1, 1, 1, 1, NULL, 2799, 99999, '1_1_1', '0'),
(2, 1, 1, 2, NULL, 2799, 99999, '1_1_2', '0'),
(3, 1, 1, 3, NULL, 2799, 99999, '1_1_3', '0'),
(4, 1, 2, 1, NULL, 3299, 99999, '1_2_1', '0'),
(5, 1, 2, 3, NULL, 3299, 99999, '1_2_3', '0'),
(6, 1, 3, 1, NULL, 3299, 99999, '1_3_1', '0'),
(7, 2, 4, 4, NULL, 3299, 99999, '2_4_4', '0'),
(8, 2, 5, 4, NULL, 3599, 99999, '2_5_4', '0'),
(9, 2, 6, 4, NULL, 3999, 99999, '2_6_4', '0'),
(10, 2, 7, 4, NULL, 4699, 99999, '2_7_4', '0'),
(11, 2, 7, 5, NULL, 4699, 99999, '2_7_5', '0'),
(12, 3, 8, 1, NULL, 1999, 99999, '3_8_1', '0'),
(13, 3, 8, 6, NULL, 1999, 99999, '3_8_6', '0'),
(14, 3, 9, 1, NULL, 2299, 99999, '3_9_1', '0'),
(15, 3, 9, 6, NULL, 2299, 99999, '3_9_6', '0'),
(16, 3, 10, 1, NULL, 2599, 99999, '3_10_1', '0'),
(17, 3, 10, 6, NULL, 2599, 99999, '3_10_6', '0'),
(18, 4, 8, 7, NULL, 2599, 99999, '4_8_7', '0'),
(19, 4, 9, 8, NULL, 2999, 99999, '4_9_8', '0'),
(20, 5, 14, 11, NULL, 3599, 99999, '5_14_11', '0'),
(21, 5, 15, 12, NULL, 3999, 99999, '5_15_12', '0'),
(22, 6, 16, 13, NULL, 3899, 99999, '6_16_13', '0'),
(23, 7, 17, 14, NULL, 349, 99999, '7_17_14', '0'),
(24, 8, 17, 15, NULL, 139, 99999, '8_17_15', '0'),
(25, 9, 17, 16, NULL, 2999, 99999, '9_17_16', '0'),
(26, 10, 17, 17, NULL, 1999, 99999, '10_17_17', '0'),
(27, 11, 4, 4, NULL, 3299, 99999, '11_4_4', '0'),
(28, 11, 5, 4, NULL, 3599, 99999, '11_5_4', '0'),
(29, 11, 6, 4, NULL, 3999, 99999, '11_6_4', '0'),
(30, 11, 7, 4, NULL, 4699, 99999, '11_7_4', '0'),
(31, 12, 4, 4, NULL, 3299, 99999, '12_4_4', '0'),
(32, 12, 5, 4, NULL, 3599, 99999, '12_5_4', '0'),
(33, 12, 6, 4, NULL, 3999, 99999, '12_6_4', '0'),
(34, 12, 7, 4, NULL, 4699, 99999, '12_7_4', '0'),
(35, 13, 16, 13, NULL, 3899, 99999, '13_16_13', '0'),
(36, 14, 17, 12, NULL, 149, 99999, '14_17_12', '0'),
(37, 15, 17, 5, NULL, 1999, 99999, '15_17_5', '0'),
(38, 16, 17, 11, NULL, 199, 99999, '16_17_11', '0'),
(39, 17, 17, 5, NULL, 1699, 99999, '17_17_5', '0');

CREATE TABLE mi_product_img (
  iid int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  pid int(11) DEFAULT NULL,
  sku varchar(120) DEFAULT NULL,
  img varchar(128) DEFAULT NULL
);

INSERT INTO mi_product_img (iid, pid, sku, img) VALUES
(1, 1, '1_1_1', 'img/pimg/pms_1490088805.69334485!560x560.jpg'),
(2, 1, '1_1_1', 'img/pimg/pms_1490088806.17485108!560x560.jpg'),
(3, 1, '1_1_1', 'img/pimg/pms_1490088806.45872557!560x560.jpg'),
(4, 1, '1_1_2', 'img/pimg/pms_1490088826.31869499!560x560.jpg'),
(5, 1, '1_1_2', 'img/pimg/pms_1490088825.9269802!560x560.jpg'),
(6, 1, '1_1_3', 'img/pimg/pms_1490088807.06365406!560x560.jpg'),
(7, 1, '1_1_3', 'img/pimg/pms_1490088807.06365406!560x560.jpg'),
(8, 1, '1_1_3', 'img/pimg/pms_1490088807.51052937!560x560.jpg'),
(9, 1, '1_2_1', 'img/pimg/pms_1490088808.15771543!560x560.jpg'),
(10, 1, '1_2_1', 'img/pimg/pms_1490088809.28331373!560x560.jpg'),
(11, 1, '1_2_1', 'img/pimg/pms_1490088809.59719934!560x560.jpg'),
(12, 1, '1_2_3', 'img/pimg/pms_1487145681.4556418!560x560.jpg'),
(13, 1, '1_3_1', 'img/pimg/pms_1487145639.576173!560x560.jpg'),
(14, 2, '2_4_4', 'img/pimg/pms_1505401464.03824312!560x560.jpg'),
(15, 2, '2_4_4', 'img/pimg/pms_1505099100.23362193!560x560.jpg'),
(16, 2, '2_4_4', 'img/pimg/pms_1505099100.24999966!560x560.jpg'),
(17, 2, '2_5_4', 'img/pimg/pms_1505098777.56193375!560x560.jpg'),
(18, 2, '2_5_4', 'img/pimg/pms_1505401551.09912910!560x560.jpg'),
(19, 2, '2_5_4', 'img/pimg/pms_1505098761.26126570!560x560.jpg'),
(20, 2, '2_6_4', 'img/pimg/pms_1505401532.11813681!560x560.jpg'),
(21, 2, '2_6_4', 'img/pimg/pms_1505098907.34272805!560x560.jpg'),
(22, 2, '2_6_4', 'img/pimg/pms_1505098907.18923766!560x560.jpg'),
(23, 2, '2_7_4', 'img/pimg/pms_1509723483.31416776!560x560.jpg'),
(24, 2, '2_7_4', 'img/pimg/pms_1509723483.37429436!560x560.jpg'),
(25, 2, '2_7_5', 'img/pimg/pms_1509723338.05097112!560x560.jpg'),
(26, 2, '2_7_5', 'img/pimg/pms_1509723337.94273713!560x560.jpg'),
(27, 3, '3_8_1', 'img/pimg/pms_1511228654.33099308!560x560.jpg'),
(28, 3, '3_8_6', 'img/pimg/pms_1511228659.82086527!560x560.jpg'),
(29, 3, '3_9_1', 'img/pimg/pms_1505110879.90398489!560x560.jpg'),
(30, 3, '3_9_6', 'img/pimg/pms_1505903266.08411470!560x560.jpg'),
(31, 3, '3_10_1', 'img/pimg/pms_1505110830.02596280!560x560.jpg'),
(32, 3, '3_10_6', 'img/pimg/pms_1505110828.06928608!560x560.jpg'),
(33, 4, '4_8_7', 'img/pimg/pms_1514544268.95932754!560x560.jpg'),
(34, 4, '4_9_8', 'img/pimg/pms_1514544276.06795798!560x560.jpg'),
(35, 5, '5_14_11', 'img/pimg/pms_1514387870.88251945!560x560.jpg'),
(36, 5, '5_15_12', 'img/pimg/pms_1514392647.20391761!560x560.jpg'),
(37, 6, '6_16_13', 'img/pimg/pms_1510111508.21042890!560x560.jpg'),
(38, 6, '6_16_13', 'img/pimg/pms_1510111508.48654957!560x560.jpg'),
(39, 6, '6_16_13', 'img/pimg/pms_1510111588.69169839!560x560.jpg'),
(40, 7, '7_17_14', 'img/pimg/pms_1479190789.95594557!560x560.jpg'),
(41, 8, '8_17_15', 'img/pimg/pms_1506406655.96865174!560x560.jpg'),
(42, 9, '9_17_16', 'img/pimg/pms_1487824962.01314237!560x560.jpg'),
(43, 10, '10_17_17', 'img/pimg/pms_1505401464.03824312!560x560.jpg'),
(44, 11, '11_4_4', 'img/pimg/pms_1505401464.03824312!560x560.jpg'),
(45, 11, '11_5_4', 'img/pimg/pms_1505401464.03824312!560x560.jpg'),
(46, 11, '11_6_4', 'img/pimg/pms_1505401464.03824312!560x560.jpg'),
(47, 11, '11_7_4', 'img/pimg/pms_1505401464.03824312!560x560.jpg'),
(48, 12, '12_4_4', 'img/pimg/pms_1505401464.03824312!560x560.jpg'),
(49, 12, '12_5_4', 'img/pimg/pms_1505401464.03824312!560x560.jpg'),
(50, 12, '12_6_4', 'img/pimg/pms_1505401464.03824312!560x560.jpg'),
(51, 12, '12_7_4', 'img/pimg/pms_1505401464.03824312!560x560.jpg'),
(52, 13, '13_16_13', 'img/pimg/pms_1510111508.21042890!560x560.jpg'),
(53, 14, '14_17_12', 'img/pimg/pms_1474859997.10825620!560x560.jpg'),
(54, 15, '15_17_5', 'img/pimg/T1hMK_BjEv1RXrhCrK!560x560.jpg'),
(55, 16, '16_17_11', 'img/pimg/pms_1478510064.36397738!560x560.jpg'),
(56, 17, '17_17_5', 'img/pimg/pms_1472609961.95298675!560x560.jpg');

CREATE TABLE mi_comment (
  comment_id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  uid int(11) DEFAULT NULL,
  pid int(11) DEFAULT NULL,
  sku varchar(120) DEFAULT NULL,
  oid int(11) DEFAULT NULL,
  content text,
  comment_time datetime DEFAULT CURRENT_TIMESTAMP,
  comment_img varchar(255) DEFAULT NULL,
  expire enum('1','0') DEFAULT '0'
);

INSERT INTO mi_comment (comment_id, uid, pid, sku, oid, content, comment_time, comment_img, expire) VALUES
(1, 1, 1, '1_1_1', 1, '用了很久才来评论 手机不错', '2018-01-14 12:23:08', '', '0'),
(2, 2, 2, '2_4_4', 2, '手机不错', '2018-01-14 12:23:08', '', '0'),
(3, 3, 3, '3_10_1', 3, '使用很好', '2018-01-14 12:23:08', '', '0'),
(4, 4, 4, '4_8_7', 4, '用了很久才来评论 手机不错', '2018-01-14 12:23:09', '', '0'),
(5, 1, 5, '5_14_11', 5, '非常推荐，值得信赖', '2018-01-14 12:23:09', '', '0'),
(6, 2, 6, '6_16_13', 6, '挺好的 质量不错', '2018-01-14 12:23:09', '', '0'),
(7, 3, 7, '7_17_14', 7, '不错，不错', '2018-01-14 12:23:09', '', '0'),
(8, 4, 8, '8_17_15', 8, '跟女朋友一人一件，之前的用了很久', '2018-01-14 12:23:09', '', '0'),
(9, 1, 9, '9_17_16', 9, '快递很快，用着不错', '2018-01-14 12:23:09', '', '0'),
(10, 2, 10, '10_17_17', 10, '快递很快，用着不错', '2018-01-14 12:23:09', '', '0'),
(11, 3, 11, '11_4_4', 11, '等了好长时间了，终于拿到了，非常满意，棒棒哒！！！', '2018-01-14 12:23:09', '', '0'),
(12, 4, 12, '12_7_4', 12, '快递很快，用着不错', '2018-01-14 12:23:09', '', '0'),
(13, 1, 13, '13_16_13', 13, '刚收到，外观很漂亮，颜色也很喜欢', '2018-01-14 12:23:09', '', '0'),
(14, 1, 14, '14_17_12', 14, '这箱子很好，外观漂亮，实用性强。很轻，有点软但不影响它的坚固。', '2018-01-14 12:23:09', '', '0'),
(15, 2, 15, '15_17_5', 15, '很小巧 像不喜欢戴活塞的人可以试试这种~很舒服包装还是一如既往的简洁 要是有盒子就好了=￣ω￣=', '2018-01-14 12:23:10', '', '0'),
(16, 3, 16, '16_17_11', 16, '外形简洁大方，大爱小米！全家人都在用小米的产品，真心不错，最主要的是性价比高。附图，给客服妹子一个大...', '2018-01-14 12:23:10', '', '0'),
(17, 4, 17, '17_17_5', 17, '东西真心不错，用过最好用的插线板，做工外观没得挑剔，3个USB接口很实用，充电快，建议不包邮的应该在...', '2018-01-14 12:23:10', '', '0'),
(18, 4, 1, '1_2_1', 18, '东西真心不错，用过最好用的插线板，做工外观没得挑剔，3个USB接口很实用，充电快，建议不包邮的应该在...', '2018-01-14 12:23:10', '', '0');


CREATE TABLE mi_order (
  oid int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  uid int(11) DEFAULT NULL COMMENT '用户ID',
  adr_id int(11) DEFAULT NULL COMMENT '收货地址id',
  status int(11) DEFAULT NULL COMMENT '订单状态',
  order_time bigint(20) DEFAULT NULL COMMENT '下单时间',
  pay_time bigint(20) DEFAULT NULL COMMENT '付款时间',
  deliver_time bigint(20) DEFAULT NULL COMMENT '发货时间',
  received_time bigint(20) DEFAULT NULL COMMENT '签收时间'
);

CREATE TABLE mi_order_detail (
  did int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  oid int(11) DEFAULT NULL COMMENT '订单id',
  sku varchar(120) DEFAULT NULL,
  count int(11) DEFAULT NULL COMMENT '购买数量'
);

INSERT INTO mi_order_detail (did, oid, sku, count) VALUES
(1, 1000001, '1_1_1', 2),
(2, 1000002, '2_4_4', 1),
(3, 1000003, '3_9_1', 1);


UPDATE mi_user SET upwd=md5(upwd);