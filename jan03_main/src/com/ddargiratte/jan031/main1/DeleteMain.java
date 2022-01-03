// 5
package com.ddargiratte.jan031.main1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class DeleteMain {
	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			String addr = "jdbc:oracle:thin:@192.168.1.42:1521:xe";
			con = DriverManager.getConnection(addr, "jangel", "0801");
			
			// ��ǰ���Է� -> �� ��ǰ�� ���� ����
			Scanner key = new Scanner(System.in);
			System.out.print("��ǰ�� : ");
			String name = key.next();
			
			// ������ : ����� �ڹ��� �����̹Ƿ� %����! -> %?% (x)
			String sql = "delete from PRODUCT where P_NAME LIKE '%'||?||'%'";	// �ڹٿ��� %�� �������� �ν� -> ���ڷ� �ν��ϰ� ''�ȿ� �־������
																				// sql���� %?%�� ���°� ����
			
			pstmt = con.prepareStatement(sql);		// �Ѱ��Ŵ���
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
