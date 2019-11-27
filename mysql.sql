--开启数据库
~:net start mysql

--关闭数据库
~:net stop mysql

--登录数据库
~:mysql -u root -p 100200300;

--查看所有数据库
mysql> show databases;

--切换数据库
mysql> use databaseName;

--在数据库服务器中创建数据库
mysql> create database databaseName;

--删除数据库
mysql> drop database databaseName;

--退出数据库
mysql> exit;

--查看数据库中所有数据表
mysql> show tables;

--创建数据表
mysql> CREATE TABLE student(
	id INT,
	name VARCHAR(60),
	sex CHAR(1),
	age INT,
	birthday DATE,
	register DATE);

mysql> show tables;
+----------------+
| Tables_in_test |
+----------------+
| student        |
+----------------+

--查看数据表结构
mysql> describe student;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| id       | int(11)     | YES  |     | NULL    |       |
| name     | varchar(60) | YES  |     | NULL    |       |
| sex      | varchar(10) | YES  |     | NULL    |       |
| age      | int(11)     | YES  |     | NULL    |       |
| birthday | date        | YES  |     | NULL    |       |
| register | date        | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

--向数据表中插入数据
mysql> INSERT INTO student
     ->VALUES(1,'lucy','female',18,'1995-7-18','2019-11-26');
     ->VALUES(2,'范冰冰','female',36,'1984-7-18','2019-11-26');
     ->VALUES(3,'lucia','female',28,'1982-3-16','2019-11-27');
     ->VALUES(4,'Lily','female',16,'1986-4-15','2019-11-27');

--查询插入的数据
mysql> select * from student;
+------+-----------+--------+------+------------+------------+
| id   | name      | sex    | age  | birthday   | register   |
+------+-----------+--------+------+------------+------------+
|    1 | lucy      | female |   18 | 1995-07-18 | 2019-11-26 |
|    2 | 范冰冰     | female |   36 | 1984-07-18 | 2019-11-26 |
+------+-----------+--------+------+------------+------------+     

--MySQL常用数据类型

--数值
类型			大小			范围（有符号）	范围（无符号）	用途
TINYINT		1 字节		(-128，127)	(0，255)	小整数值
SMALLINT	2 字节		(-32768，32767)	(0，65 535)	大整数值
MEDIUMINT	3 字节		(-8388608，8388607)	(0，16 777 215)	大整数值
INT或INTEGER	4 字节		(-2147483648，2147483647)	(0，4 294 967 295)	大整数值
BIGINT		8 字节		(-9,223,372,036,854,775,808，9 223 372 036 854 775 807)	(0，18 446 744 073 709 551 615)	极大整数值
FLOAT		4 字节		(-3.402 823 466 E+38，-1.175 494 351 E-38)，0，(1.175 494 351 E-38，3.402 823 466 351 E+38)	0，(1.175 494 351 E-38，3.402 823 466 E+38)	单精度
浮点数值
DOUBLE		8 字节			(-1.797 693 134 862 315 7 E+308，-2.225 073 858 507 201 4 E-308)，0，(2.225 073 858 507 201 4 E-308，1.797 693 134 862 315 7 E+308)	0，(2.225 073 858 507 201 4 E-308，1.797 693 134 862 315 7 E+308)	双精度
浮点数值
DECIMAL	对DECIMAL(M,D) ，如果M>D，为M+2否则为D+2	依赖于M和D的值	依赖于M和D的值	小数值


--时间/日期
类型			大小(字节)	范围	格式	用途
DATE		3			1000-01-01/9999-12-31	YYYY-MM-DD	日期值
TIME		3			'-838:59:59'/'838:59:59'	HH:MM:SS	时间值或持续时间
YEAR		1			1901/2155	YYYY	年份值
DATETIME	8			1000-01-01 00:00:00/9999-12-31 23:59:59	YYYY-MM-DD HH:MM:SS	混合日期和时间值
TIMESTAMP	4			1970-01-01 00:00:00/2038
						结束时间是第 2147483647 秒，北京时间 2038-1-19 11:14:07，格林尼治时间 2038年1月19日 凌晨 03:14:07
						YYYYMMDD HHMMSS	混合日期和时间值，时间戳

--字符串
类型			大小					用途
CHAR		0-255字节			定长字符串
VARCHAR		0-65535 字节			变长字符串
TINYBLOB	0-255字节			不超过 255 个字符的二进制字符串
TINYTEXT	0-255字节			短文本字符串
BLOB		0-65 535字节			二进制形式的长文本数据
TEXT		0-65 535字节			长文本数据
MEDIUMBLOB	0-16 777 215字节		二进制形式的中等长度文本数据
MEDIUMTEXT	0-16 777 215字节		中等长度文本数据
LONGBLOB	0-4 294 967 295字节	二进制形式的极大文本数据
LONGTEXT	0-4 294 967 295字节	极大文本数据

--删除数据表中的数据
mysql> delete from student where name="范冰冰";
+------+-------+------+------+------------+------------+
| id   | name  | sex  | age  | birthday   | register   |
+------+-------+------+------+------------+------------+
| 1    | lucia | f    |   18 | 1998-11-22 | 2019-11-27 |
+------+-------+------+------+------------+------------+

--修改数据表中的数据
mysql> update student set sex="female" where name="lucia";
       update student set name="lucy" where age="28";

--修改表字段长度
mysql> alter table student modify column sex CHAR(10);

--总结
	--增
	INSERT
	--删
	DELETE
	--改
	UPDATE
	--查
	SELECT