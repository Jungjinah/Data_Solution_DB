// 4
package com.ddargiratte.jan031.main1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import oracle.jdbc.proxy.annotation.Pre;

public class SelectMain {
	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;		// �̰� ���� ���Ѿ���!
		ResultSet rs = null;				// select�� ���� �ʿ���! ����� ��ƾ��ϴ� �׸��̾�
		
			// ����ִ� �ڵ�
			try {
			String addr = "jdbc:oracle:thin:@192.168.1.42:1521:xe";
			con = DriverManager.getConnection(addr, "jangel", "0801");	// DB�� ������
			
			String sql = "select * from PRODUCT order by + P_NAME";		// DB�� �����Ͽ� ���� ���
			
			pstmt = con.prepareStatement(sql);							// SQL���� �����ϱ� ���� �۾�
			
			// pstmt.executeUpdate() : ��� ���� �޾Ҵ°� (C, U, O)		// �������� ����
			// pstmt.executeQeury() : ������(R)
			
			// select�� ������ ��� : ResultSet
			//				List�� ����� ����!
			
			rs = pstmt.executeQuery();									// ?�� ������ ��������
			// rs.next() : ���� �����ͷ� �Ѿ, xml����
			//			   ���� �����Ͱ� ������ true
			//			   ���� �����Ͱ� ������ false�� ����
			
			while (rs.next()) {											// ����ϰ� ������ (����, �÷��� �� ���� ���� ����Ʈ����)
				// rs.getXXX("�÷���") : ������ġ�� �÷� �б�					// RESULT�� ��Ƽ� ���
				// rs.getXXX(�ε���)	 : ����! ( �������� �˱� �ٸ������ �𸣱� ������ ����!)
				System.out.println(rs.getString(2));
				System.out.println(rs.getInt("p_weight"));
				System.out.println(rs.getInt("p_price"));
				System.out.println("--------------------");
			}
			try {
				rs.close();				// close ���� �� ��Ű��!
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			} catch (Exception e) {
				e.printStackTrace();
			
			}
	
	}
	

}
