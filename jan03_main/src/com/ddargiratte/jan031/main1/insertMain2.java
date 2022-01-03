// 3
package com.ddargiratte.jan031.main1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class insertMain2 {
	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// 연결
			String addr = "jdbc:oracle:thin:@192.168.1.42:1521:xe";
			con = DriverManager.getConnection(addr, "jangel", "0801");
			
			// 연결이 되면 입력받기
			Scanner key = new Scanner(System.in);

			System.out.print("마켓이름 : ");
			String name = key.next();
			
			System.out.print("지점명 : ");
			String location = key.next();
			
			System.out.print("매장 평수 : ");
			int land = key.nextInt();
			
			System.out.print("주차 가능한 대수 : ");
			int parking = key.nextInt();
			
			// SQL
			// Java변수에 있는 값 들어갈 자리에 '?'로
			String sql = "insert into MARKET "
						+ "values(MARKET_SEQ.NEXTVAL,"
						+ "?, ?, ?, ?)";			// 내가 입력한 것을 넣기 위해 개수만큼 '?' 넣어주기
			
			pstmt = con.prepareStatement(sql);
			
			// ?에 값 채우기 : pstmt.setXXX(물음표번호, 값)
			// XXX : 자료형, 물음표번호는 1부터 시작!
			
			pstmt.setString(1, name);
			pstmt.setString(2, location);
			pstmt.setInt(3, land);			// int쓸 때 대문자 I로 써야행!
			pstmt.setInt(4, parking);
			
			// 전송/실행/결과받기
			// 이 작업 때문에 영향을 받은 데이터의 수가 리턴
			int dataCount = pstmt.executeUpdate();	// 실행 시작
			if (dataCount == 1) {				// 영향받은 데이터 수가 한줄일때 성공 출력
				System.out.println("성공");
			}
			
//			if (pstmt.executeUpdate() == 1) {		// 위줄 if문보다 간단명료햔 문장
//				System.out.println("성공!");
//			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			pstmt.close();				// 닫는 순서 주의! (con.close()보다 먼저 채우기)
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
