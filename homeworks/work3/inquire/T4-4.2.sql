SELECT JNO FROM J 
	WHERE JNO IN (
			SELECT JNO
			FROM SPJ,P
			WHERE SPJ.PNO=P.PNO AND P.COLOR='红' and SNO IN (
				SELECT SNO from S
					WHERE S.CITY!='天津'
			)
);