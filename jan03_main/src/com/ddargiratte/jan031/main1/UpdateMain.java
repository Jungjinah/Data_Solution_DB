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
			System.out.print("매장명 : ");
			String name = k.next();
			
			// 단어를 포함하는 모든 매장의 상품을 20% 할인된 가격으로 !!
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
				System.out.println("성공!");
			}else {
				System.out.println("그런거 업음!");
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
