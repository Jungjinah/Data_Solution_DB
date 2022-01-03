// 2
package com.ddargiratte.jan031.main1;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class insertMain {
	public static void main(String[] args) {
		// SQL문을 사용해서
		//	-> 서버로 전송
		//	-> DB서버에서 실행햇
		//	-> 그 결과를 받아올 수 있어야!
	Connection con = null;
	try {
		String addr = "jdbc:oracle:thin:@192.168.1.42:1521:xe";
		con = DriverManager.getConnection(addr, "jangel", "0801");
		
		String sql = "insert into PRODUCT "		// 여기 띄어쓰기 꼭 해줘여해!
				+ "values(PRODUCT_SEQ.NEXTVAL,"	// 띄어쓰기 안하면 sql문이 productvalues 이렇게 돼버림,,
														// 구분을 못해서 에러가 발생하니 '띄어쓰기' 주의!
				+ "'테스트', 10, 10, 3)";				// 괄호 ) 뒤에 ; 쓰지말것 주의!
		
		// 서버에 전송/실행/결과 받아오는 작어 총괄 매니저
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.executeUpdate();	// 서버에 전송/실행/결과받기
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	try {
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	}
	
}
