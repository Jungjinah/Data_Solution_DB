// 6
package com.ddargiratte.jan031.main1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class UpdateMain {
	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			String addr = "jdbc:oracle:thin:@192.168.1.42:1521:xe";
			con = DriverManager.getConnection(addr, "jangel", "0801");
			
			Scanner k = new Scanner(System.in);
			System.out.print("����� : ");
			String name = k.next();
			
			// �ܾ �����ϴ� ��� ������ ��ǰ�� 20% ���ε� �������� !!
			String sql = "Update product "
					   + "set p_price = p_price * 0.8 "
					   + "where p_m_no in ("
					   		+ "select m_no "
					   		+ "from market "
					   		+ "where m_name like '%'||?||'%' "
					   		+ ")";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			if (pstmt.executeUpdate() >= 1) {
				System.out.println("����!");
			}else {
				System.out.println("�׷��� ����!");
			}
			
			
			
			
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
		
		
		
		
		
	}
	
}
