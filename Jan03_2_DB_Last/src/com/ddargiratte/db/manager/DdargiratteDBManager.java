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
			rs.close();					// e.printStackTrace �Ⱦ��� ���� : C, U, D���� �ʿ� ����, R ���� �ʿ�
		} catch (Exception e) {			// insert�ϰ� �Ǹ� NullPointerException�� �߻�
			// TODO: handle exception	// ��� Exception�� �������� �Ұǵ�
		}								// �޽����� �Ⱥ�����!
		
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
