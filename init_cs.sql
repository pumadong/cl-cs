#数据初始化-客服字典表
truncate table cs_dictionary;

insert into `cs_dictionary`(`group`,`code`,`name`,sort_no,create_person,create_date)
values
('worksheet_type',1,'订单',1,'system',now()),

('worksheet_level',1,'普通',1,'system',now()),
('worksheet_level',2,'紧急',2,'system',now()),

('worksheet_status',0,'新建',0,'system',now()),
('worksheet_status',1,'处理中',1,'system',now()),
('worksheet_status',2,'已解决',2,'system',now()),
('worksheet_status',3,'已关闭',3,'system',now()),

('worksheet_log_type',1,'新建',1,'system',now()),
('worksheet_log_type',2,'处理',2,'system',now()),
('worksheet_log_type',3,'解决',3,'system',now()),
('worksheet_log_type',4,'关闭',4,'system',now()),

('frequent_word_type',1,'评论回复',1,'system',now()),
('frequent_word_type',2,'邮件回复',2,'system',now())

;