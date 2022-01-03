// 1
package com.ddargiratte.jan031.main1;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

// 원래 : cmd 기반 sqlplus라는 프로그램으로 OracleDB제어
//		 cmd 기반 불편
// 사제품 : orange, toad, eclipse
//		  sqldeveloper

// Socket통신
// HTTP통신

// DB서버와 통신 : Java에 내장되어 있음(미완성 상태)
// 	DB 메이커가 많기 때문에... -> 메이터 별로 통신이 조금씩 달라서..
//	연결할 DB에 맞춰서 조금씩 터치를 해줘야!

// OracleDB 사용중!  -> 여기에 맞춰서 터치를 해야!
//	-> 그 기능은 ojdbc8.jar에 다 있음

// ojdbc8.jar에 넣기만 하면 알아서 사용

public class connectionMain {
	
	public static void main(String[] args) {
		Connection con = null;
		try {
			// 연결할 DB서버 주소 (메이커별로 형식이 다르다!)
			// Data Source Explorer - 오른쪽 마우스 클릭 - Properties
			// -Driver Properties - Connection URL 복사
			String addr = "jdbc:oracle:thin:@192.168.1.42:1521:xe";
			
			// ojdbc8.jar를 넣기만 하면 알아서 사용
			// con = DriverManager.getConnection(addr, "jangel", "0801");
			con = DriverManager.getConnection(addr, "jangel", "0801");
			System.out.println("Success");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();			// close 철저히 하세요!
		} catch (SQLException e) {		// 내가 안닫으면 다른사람이 못써용..
			e.printStackTrace();
		}
	}
	
}
