--mysql建表约束.sql

-主键约束
唯一确定一张表中的一条记录，可以使该字段不重复且不为空;
 --创建表
	mysql> CREATE TABLE user(
		id INT primary key,
		username VARCHAR(30),
		gender VARCHAR(10),
		age INT(3),
		birthday DATE,
		register_date DATE);
--插入数据
	mysql> INSERT INTO user VALUES(1,'catalina','female',19,'1995-8-12','1997-7-28'); 
	+----+----------+--------+------+------------+---------------+
	| id | username | gender | age  | birthday   | register_date |
	+----+----------+--------+------+------------+---------------+
	|  1 | catalina | female |   19 | 1995-08-12 | 1997-07-28    |
	|  2 | lucia    | female |   19 | 1997-03-15 | 1998-06-12    |
	+----+----------+--------+------+------------+---------------+

--复合主键
mysql> CREATE TABLE user2(
		id INT ,
		username VARCHAR(30),
		gender VARCHAR(10),
		age INT(3),
		birthday DATE,
		register_date DATE,
		primary key(id,username)
		);

mysql> INSERT INTO user2 VALUES(1,'catalina','female',19,'1995-8-12','1997-7-28'); 
	   INSERT INTO user2 VALUES(2,'catalina','female',19,'1995-8-12','1997-7-28'); 
	   --只要复合主键加起来不重复就可以插入数据，相当于逻辑 "或"
		+----+----------+--------+------+------------+---------------+
		| id | username | gender | age  | birthday   | register_date |
		+----+----------+--------+------+------------+---------------+
		|  1 | catalina | female |   19 | 1995-08-12 | 1997-07-28    |
		|  2 | catalina | female |   19 | 1995-08-12 | 1997-07-28    |
		+----+----------+--------+------+------------+---------------+

-自增约束
mysql> CREATE TABLE user3(
		id INT primary key auto_increment,
		username VARCHAR(30)
		);

mysql> INSERT INTO user3 (username) VALUES("doleer");
	   INSERT INTO user3 (username) VALUES("ratel");

--id自增
	mysql> select * from user3;
	+----+----------+
	| id | username |
	+----+----------+
	|  1 | doleer   |
	|  2 | ratel    |
	+----+----------+


--如果创建表时忘记创建主键约束
	CREATE TABLE user4(
			id INT ,
			username VARCHAR(30)
			);

	mysql> desc user4;
	+----------+-------------+------+-----+---------+-------+
	| Field    | Type        | Null | Key | Default | Extra |
	+----------+-------------+------+-----+---------+-------+
	| id       | int(11)     | NO   |     | NULL    |       |
	| username | varchar(30) | YES  |     | NULL    |       |
	+----------+-------------+------+-----+---------+-------+

	alter TABLE user4 add primary key(id);
	mysql> desc user4;
	+----------+-------------+------+-----+---------+-------+
	| Field    | Type        | Null | Key | Default | Extra |
	+----------+-------------+------+-----+---------+-------+
	| id       | int(11)     | NO   | PRI | NULL    |       |
	| username | varchar(30) | YES  |     | NULL    |       |
	+----------+-------------+------+-----+---------+-------+

--删除主键约束
	alter TABLE user4 drop primary key(id);

--使用modify修改字段，添加约束
	alter TABLE user4 modify id int primary key;

-唯一约束
	--创建表
    CREATE TABLE user5(
    	id int,
    	name varchar(20)
    	);

    INSERT INTO user5 VALUES(1,'lucy');

    --添加唯一约束
    alter TABLE user5 add unique(name);
    INSERT INTO user5 VALUES(2,'lucy');





-外键约束

-非空约束

-默认约束