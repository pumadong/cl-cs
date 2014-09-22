delete from `p_module` where name='客服中心';
INSERT INTO `p_module`(id,name,flag,url,sort_no,create_person,create_date,update_person,update_date) 
VALUES
(7,'客服中心','cs','http://127.0.0.1:10014/cs-server',70,'system',NOW(),'system',NOW())
;


delete from `p_resource` where module_flag='cs';
INSERT INTO `p_resource`(id,name,url,remark,parent_id,structure,sort_no,module_flag,create_person,create_date,update_person,update_date) 
VALUES
(400,'基础数据','','',0,'s-1',1,'cs','system',NOW(),'system',NOW()),
(401,'工单管理','','',0,'s-2',2,'cs-server','system',NOW(),'system',NOW()),
(402,'商品点评管理','','',0,'s-3',3,'cs','system',NOW(),'system',NOW()),
(403,'咨询邮件管理','','',0,'s-4',4,'cs','system',NOW(),'system',NOW()),

(411,'数据字典','/controller/dictionary/list.do','',400,'s-1-1',1,'cs','system',NOW(),'system',NOW()),
(412,'常用语管理','/controller/frequentword/list.do','',400,'s-1-2',2,'cs','system',NOW(),'system',NOW()),

(421,'添加工单','/controller/worksheet/add.do','',401,'s-2-1',1,'cs','system',NOW(),'system',NOW()),
(422,'工单列表','/controller/worksheet/list.do','',401,'s-2-2',2,'cs','system',NOW(),'system',NOW()),

(431,'点评列表','/controller/comment/list.do','',402,'s-3-1',1,'cs','system',NOW(),'system',NOW()),

(441,'邮件同步','/controller/email/sync.do','',403,'s-4-1',1,'cs','system',NOW(),'system',NOW()),
(442,'邮件列表','/controller/email/list.do','',403,'s-4-2',2,'cs','system',NOW(),'system',NOW())

;