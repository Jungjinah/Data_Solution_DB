// 7
package com.ddargiratte.db.manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DdargiratteDBManager {
	public static Connection connect() throws SQLException {
		String addr = "jdbc:oracle:thin:@192.168.1.42:1521:xe";
		return DriverManager.getConnection(addr, "jangel", "0801");
	}
	
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			rs.close();					// e.printStackTrace 안쓰는 이유 : C, U, D때는 필요 없고, R 때만 필요
		} catch (Exception e) {			// insert하게 되면 NullPointerException이 발생
			// TODO: handle exception	// 모든 Exception이 잡히도록 할건데
		}								// 메시지는 안보려고!
		
		try {
			pstmt.close();
		} catch (Exception e) {
			
		}
		
		try {
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	
}
