#主键原则：
#UUID全局唯一，缺点是占用空间，去掉中划线后，剩余32个字节；大表1000万数据，按照一行多出100Byte计算，则多出1G数据；
#若是InnoDB引擎，因为其是索引组织表，创建的每个非簇索引，都会带上主键，这样占用存储空间更大，需要消耗更多内存和IO；
#自增，是可以手工指定值的，而且对于任何修改自增列的情况会导致自增列的计数器增长，可能会因为这些问题在主备、主从机制产生破坏性影响，优点是：空间和性能略高；
#自定义主键，比如订单号，商品编号，用程序保证唯一性，比如每次增加一个随机数；
#故我们的规则是：常被使用的基础数据表，比如品牌、分类等，就用自增ID，对于业务表，比如商品、订单，就用升序生成的编号、单据号
#参考：
#http://www.cnblogs.com/chutianyao/archive/2012/11/04/2753995.html
#http://blog.chinaunix.net/uid-20639775-id-3154234.html

#BEGIN*************************表单列表***************************BEGIN
#. cs_worksheet ：工单表
#. cs_worksheet_log ：工单日志表
#. cs_frequent_word ：常用语表
#. cs_email_service ：咨询问题类邮件导入及回复(暂缓)
#. cs_dictionary ： 字典表，状态类型等字典数据都要存储于此，方便使用
#END***************************表单列表***************************END

#工单表
DROP TABLE IF EXISTS `cs_worksheet`;
CREATE TABLE `cs_worksheet` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`type_id`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '工单类型ID' ,
`ref_code`  varchar(15) NOT NULL DEFAULT 0 COMMENT '相关单据号' ,
`member_id`  int(11) NOT NULL DEFAULT 0 COMMENT '会员ID' ,
`title`  varchar(50) NOT NULL DEFAULT '' COMMENT '标题' ,
`content`  varchar(50) NOT NULL DEFAULT '' COMMENT '内容' ,
`level`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '重要级别' ,
`executor`  varchar(30) NOT NULL DEFAULT '' COMMENT '当前执行人' ,
`times`  smallint(6) NOT NULL DEFAULT 0 COMMENT '处理次数' ,
`status`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_worksheet_ref_code` (`ref_code`) USING BTREE ,
INDEX `idx_worksheet_member_id` (`member_id`) USING BTREE 
)
COMMENT='工单表'
;

#工单日志表
DROP TABLE IF EXISTS `cs_worksheet_log`;
CREATE TABLE `cs_worksheet_log` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`worksheet_id`  int(11) NOT NULL COMMENT '工单号' ,
`type_id`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '日志类型ID' ,
`content`  varchar(200) NOT NULL DEFAULT '' COMMENT '日志内容' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`create_ip`  varchar(20) NOT NULL COMMENT '记录生成IP' ,
PRIMARY KEY (`id`) ,
INDEX `idx_worksheet_log_worksheet_id` (`worksheet_id`) USING BTREE 
)
COMMENT='工单日志表'
;

#常用语表
DROP TABLE IF EXISTS `cs_frequent_word`;
CREATE TABLE `cs_frequent_word` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`type_id`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '类型ID' ,
`content`  varchar(200) NOT NULL DEFAULT '' COMMENT '常用语内容' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
`update_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '更新人' ,
`update_date`  datetime NOT NULL COMMENT '更新时间' ,
PRIMARY KEY (`id`) 
)
COMMENT='常用语表'
;


#类型状态字典表
DROP TABLE IF EXISTS `cs_dictionary`;
CREATE TABLE `cs_dictionary` (
`id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键' ,
`group`  varchar(50) NOT NULL COMMENT '状态分组' ,
`code`  tinyint(4) NOT NULL COMMENT '状态代码' ,
`name`  varchar(100) NOT NULL COMMENT '状态名称' ,
`sort_no`  tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序号' ,
`create_person`  varchar(30) NOT NULL DEFAULT '' COMMENT '记录生成人' ,
`create_date`  datetime NOT NULL COMMENT '记录生成时间' ,
PRIMARY KEY (`id`) ,
INDEX `idx_dictionary_group` (`group`) USING BTREE 
)
COMMENT='类型状态字典表'
;