--表删除
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS t_user


--表创建
CREATE TABLE IF NOT EXISTS t_user (
	id INT AUTO_INCREMENT PRIMARY KEY , 	--id
	username VARCHAR(50) NOT NULL UNIQUE , 	--用户名(注册)
	password VARCHAR(50) NOT NULL ,  		--密码(注册)
	email	 VARCHAR(50) NOT NULL, 			--邮箱(注册)
	phone VARCHAR(50) NOT NULL,				--电话(注册)
	
	image VARCHAR(50) ,				--图片
	gender INT(1) DEFAULT -1,				--性别
	
	create_user VARCHAR(50),				--创建用户
	create_time DATE,						--创建时间
	modified_user VARCHAR(50),				--修改用户
	modified_time DATE						--修改时间
) default charset=utf8


CREATE TABLE IF NOT EXISTS t_user (
	id INT AUTO_INCREMENT PRIMARY KEY , 		
	username VARCHAR(50) NOT NULL UNIQUE , 	
	password VARCHAR(50) NOT NULL ,  			
	email	 VARCHAR(50) NOT NULL, 			
	phone VARCHAR(50) NOT NULL,				
	
	image VARCHAR(50) ,				
	gender INT(1) DEFAULT -1,					
	
	create_user VARCHAR(50),					
	create_time DATE,						
	modified_user VARCHAR(50),				
	modified_time DATE							
) default charset=utf8


foreign key

DROP TABLE IF EXISTS t_address

create table if not exists t_address(
	id int auto_increment primary key,
	uid int  not null,
	recv_username varchar(50),
	recv_provinceCode varchar(6),
	recv_cityCode varchar(6),
	recv_areaCode varchar(6),
	recv_address varchar(100),
	recv_district varchar(100),
	recv_phone varchar(32),
	recv_tel varchar(32),
	recv_zip varchar(6),
	recv_tag varchar(6),
	is_default int(1),
	create_user VARCHAR(50),					
	create_time DATE,						
	modified_user VARCHAR(50),				
	modified_time DATE		
) default charset=utf8



create table if not exists t_dict_



