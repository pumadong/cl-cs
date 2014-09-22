cl-cs
==================

客服管理系统


一、前置项目依赖

配置中心：https://github.com/pumadong/cl-privilege

订单中心：https://github.com/pumadong/cl-order

会员中心：https://github.com/pumadong/cl-member

二、项目说明

客服中心，这个系统，主要是调用订单完成订单的售后服务，比如受理单、退换货单；调用会员接口查询会员信息，并通过工单记录客服的工作流程。

客服中心一般不需要提供对外的接口服务。

客服中心，可能会有一些需要定时处理的任务，比如：订单把客户的咨询邮件导入系统中供客服处理。

三、mybatis-generator

ORM框架采用MyBatis，为了提高开发效率，先根据数据库表单结构自动生成Model和MyBatis相关类，生成命令如下：

java -jar mybatis-generator-core-1.3.1.jar -configfile config_cs.xml -overwrite

生成时需要把mybatis-generator-core-1.3.1.jar、mysql-connector-java-5.1.24-bin.jar、config_cs.xml放到一个目录下，生成的相关类和XML会放置到CreateResult文件夹下面。

jar下载地址：http://pan.baidu.com/s/1qW98L0C