* [work3 P130 T 4、5、7](#work3 P130 T 4、5、7)
  * [T4](#T4)
  * [T5](#T5)
  * [T7](#T7)
# work3 P130 T 4、5、7
## T4

创建 __`J`__ 表

```mysql
DROP TABLE IF EXISTS `j`;
CREATE TABLE `j` (
  `JNO` char(3) DEFAULT NULL,
  `JNAME` char(10) DEFAULT NULL,
  `CITY` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `j` VALUES ('J1', '三建', '北京');
INSERT INTO `j` VALUES ('J2', '一汽', '长春');
INSERT INTO `j` VALUES ('J3', '弹簧厂', '天津');
INSERT INTO `j` VALUES ('J4', '造船厂', '天津');
INSERT INTO `j` VALUES ('J5', '机车厂', '天津');
INSERT INTO `j` VALUES ('J6', '无线电厂', '常州');
INSERT INTO `j` VALUES ('J7', '半导体厂', '南京');
```

创建 __`S`__ 表

```mysql
DROP TABLE IF EXISTS `s`;
CREATE TABLE `s` (
  `SNO` char(3) DEFAULT NULL,
  `SNAME` char(10) DEFAULT NULL,
  `STATUS` char(2) DEFAULT NULL,
  `CITY` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `s` VALUES ('S1', '精益', '20', '天津');
INSERT INTO `s` VALUES ('S2', '盛锡', '10', '北京');
INSERT INTO `s` VALUES ('S3', '东方红', '30', '北京');
INSERT INTO `s` VALUES ('S4', '丰盛泰', '20', '天津');
INSERT INTO `s` VALUES ('S5', '为民', '30', '上海');
```



创建 __`SPJ`__ 表

```mysql
DROP TABLE IF EXISTS `spj`;
CREATE TABLE `spj` (
  `SNO` char(3) DEFAULT NULL,
  `PNO` char(3) DEFAULT NULL,
  `JNO` char(3) DEFAULT NULL,
  `QTY` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `spj` VALUES ('S1', 'P1', 'J1', '200');
INSERT INTO `spj` VALUES ('S1', 'P1', 'J3', '100');
INSERT INTO `spj` VALUES ('S1', 'P1', 'J4', '700');
INSERT INTO `spj` VALUES ('S1', 'P2', 'J2', '100');
INSERT INTO `spj` VALUES ('S2', 'P3', 'J1', '400');
INSERT INTO `spj` VALUES ('S2', 'P3', 'J2', '200');
INSERT INTO `spj` VALUES ('S2', 'P3', 'J4', '500');
INSERT INTO `spj` VALUES ('S2', 'P3', 'J5', '400');
INSERT INTO `spj` VALUES ('S2', 'P5', 'J1', '400');
INSERT INTO `spj` VALUES ('S2', 'P5', 'J2', '100');
INSERT INTO `spj` VALUES ('S3', 'P1', 'J1', '200');
INSERT INTO `spj` VALUES ('S3', 'P3', 'J1', '200');
INSERT INTO `spj` VALUES ('S4', 'P5', 'J1', '100');
INSERT INTO `spj` VALUES ('S4', 'P6', 'J3', '300');
INSERT INTO `spj` VALUES ('S4', 'P6', 'J4', '200');
INSERT INTO `spj` VALUES ('S5', 'P2', 'J4', '100');
INSERT INTO `spj` VALUES ('S5', 'P2', 'J4', '100');
INSERT INTO `spj` VALUES ('S5', 'P6', 'J2', '200');
INSERT INTO `spj` VALUES ('S5', 'P6', 'J4', '500');
INSERT INTO `spj` VALUES ('S1', 'P1', 'J1', '200');
INSERT INTO `spj` VALUES ('S1', 'P1', 'J3', '100');
INSERT INTO `spj` VALUES ('S1', 'P1', 'J4', '700');
INSERT INTO `spj` VALUES ('S1', 'P2', 'J2', '100');
INSERT INTO `spj` VALUES ('S2', 'P3', 'J1', '400');
INSERT INTO `spj` VALUES ('S2', 'P3', 'J2', '200');
INSERT INTO `spj` VALUES ('S2', 'P3', 'J4', '500');
INSERT INTO `spj` VALUES ('S2', 'P3', 'J5', '400');
INSERT INTO `spj` VALUES ('S2', 'P5', 'J1', '400');
INSERT INTO `spj` VALUES ('S2', 'P5', 'J2', '100');
INSERT INTO `spj` VALUES ('S3', 'P1', 'J1', '200');
INSERT INTO `spj` VALUES ('S3', 'P3', 'J1', '200');
INSERT INTO `spj` VALUES ('S4', 'P5', 'J1', '100');
INSERT INTO `spj` VALUES ('S4', 'P6', 'J3', '300');
INSERT INTO `spj` VALUES ('S4', 'P6', 'J4', '200');
INSERT INTO `spj` VALUES ('S5', 'P2', 'J4', '100');
INSERT INTO `spj` VALUES ('S5', 'P2', 'J4', '100');
INSERT INTO `spj` VALUES ('S5', 'P6', 'J2', '200');
INSERT INTO `spj` VALUES ('S5', 'P6', 'J4', '500');
```



创建 __`P`__ 表

```mysql
DROP TABLE IF EXISTS `p`;
CREATE TABLE `p` (
  `PNO` char(3) DEFAULT NULL,
  `PNAME` char(10) DEFAULT NULL,
  `COLOR` char(4) DEFAULT NULL,
  `WEIGHT` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `p` VALUES ('P1', '螺母', '红', '12');
INSERT INTO `p` VALUES ('P2', '螺栓', '绿', '17');
INSERT INTO `p` VALUES ('P3', '螺丝刀', '蓝', '14');
INSERT INTO `p` VALUES ('P4', '螺丝刀', '红', '14');
INSERT INTO `p` VALUES ('P5', '凸轮', '蓝', '40');
INSERT INTO `p` VALUES ('P6', '齿轮', '红', '30');

```

建表后的数据库存储在[study.sql](./study.sql)中

（1）`J1`的`JNO`

```mysql
SELECT SNO FROM SPJ WHERE JNO='J1';
```

(2)

`J1`中的`P1`的`SNO`

```mysql
SELECT SNO FROM SPJ WHERE JNO='J1' AND PNO='P1';
```

(3)

`J1`为红色的`SNO`

```mysql
SELECT SNO FROM SPJ WHERE JNO='J1' AND PNO IN (
	SELECT PNO FROM P WHERE COLOR='红'
);
```

(4)

不是天津供应商红色的`JNO`

```mysql
SELECT JNO FROM J
	WHERE NOT EXISTS (
			SELECT *
			FROM SPJ,P,S
			WHERE SPJ.PNO=P.PNO AND P.COLOR='红' AND S.CITY='天津' AND S.SNO=spj.SNO
				AND spj.JNO=J.JNO
);
```



不是天津供应商的红色`JNO`

```mysql
SELECT JNO FROM J 
	WHERE JNO IN (
			SELECT JNO
			FROM SPJ,P
			WHERE SPJ.PNO=P.PNO AND P.COLOR='红' and SNO IN (
				SELECT SNO from S
					WHERE S.CITY!='天津'
			)
);
```



(5)

至少用了`S1`**全部零件**的`JNO`

```mysql
SELECT DISTINCT JNO FROM SPJ SPJ3 WHERE NOT EXISTS(
		SELECT *
		FROM SPJ SPJ1 WHERE SNO='S1' AND NOT EXISTS(
				SELECT *FROM SPJ SPJ2 WHERE SPJ2.PNO=SPJ1.PNO
				AND SPJ2.JNO=SPJ3.JNO
		)
);
```

## T5



```mysql
-- (1)找出所有供应商的姓名和城市
SELECT SNAME,CITY FROM S;
-- (2)所有零件的名称、颜色、重量
SELECT  PNAME,COLOR,WEIGHT FROM P;
-- (3)S1供应零件的工程
SELECT JNO FROM spj WHERE SNO='S1';
-- (4)使用J2使用的零件名称和数量
SELECT P.PNAME,spj.QTY FROM P,SPJ WHERE P.PNO=spj.PNO AND spj.JNO='J2';
-- (5)上海厂的所有零件号码
SELECT DISTINCT PNO FROM spj WHERE SNO IN(
		SELECT SNO FROM S WHERE CITY='上海'
);
-- (6)上海零件的工程
SELECT JNAME FROM J,SPJ,S WHERE J.JNO=spj.JNO and spj.SNO=S.SNO and S.CITY='上海';
-- (7)没有使用天津产零件的工程
SELECT JNO FROM J WHERE NOT EXISTS (
		SELECT * FROM SPJ,S WHERE spj.JNO=J.JNO AND spj.SNO=S.SNO AND S.CITY='天津'
);
-- (8)改红色零件为蓝色
-- SELECT * FROM P
UPDATE P SET COLOR='蓝' WHERE COLOR='红'
-- SELECT * FROM P;

-- (9)S5给J4的零件P6改为为P3给
-- SELECT * FROM SPJ
UPDATE spj SET SNO='S3' WHERE SNO='S5' AND JNO='J4' AND PNO='P6'
-- SELECT * FROM SPJ;
-- (10)删除供应商关系中S2的记录，然后从供应情况删除S2相关
DELETE FROM SPJ WHERE SNO='S2';
DELETE FROM S WHERE SNO='S2';
-- (11)插入一组元组
-- SELECT * FROM SPJ
INSERT INTO SPJ VALUES ('S2', 'P4', 'J6', '200')
-- SELECT * FROM SPJ;

 
```

修改后的数据库结构存储在[study(modify).sql](./study(modify).sql)中

以上题目中所有查询的相关代码和查询结果图都在[inquire](./inquire/)文件夹内

## T7

### 视图的优点

1. 视图简化的用户的操作

2. 视图使用户能以多角度去看待同一数据

3. 视图对重构数据库提供一定的逻辑独立性

4. 视图能对机密数据提供安全保护

5. 视图可以更清晰表达查询

   ------

   作业到此结束，希望老师审阅