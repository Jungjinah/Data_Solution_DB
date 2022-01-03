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
			
			// 상품명입력 -> 그 상품명 정보 삭제
			Scanner key = new Scanner(System.in);
			System.out.print("상품명 : ");
			String name = key.next();
			
			// 문제점 : 여기는 자바의 공간이므로 %주의! -> %?% (x)
			String sql = "delete from PRODUCT where P_NAME LIKE '%'||?||'%'";	// 자바에선 %를 패턴으로 인식 -> 문자로 인식하게 ''안에 넣어줘야해
																				// sql에선 %?%를 쓰는거 맞음
			
			pstmt = con.prepareStatement(sql);		// 총괄매니저
			pstmt.setString(1, name);
			if (pstmt.executeUpdate() >= 1) {
				System.out.println("성공!");
			}else {
				System.out.println("그런거 없음!");
				
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
