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
		PreparedStatement pstmt = null;		// 이거 순서 지켜야해!
		ResultSet rs = null;				// select할 때만 필요함! 결과를 담아야하는 그릇이얌
		
			// 담아주는 코드
			try {
			String addr = "jdbc:oracle:thin:@192.168.1.42:1521:xe";
			con = DriverManager.getConnection(addr, "jangel", "0801");	// DB에 연결함
			
			String sql = "select * from PRODUCT order by + P_NAME";		// DB에 연결하여 내용 출력
			
			pstmt = con.prepareStatement(sql);							// SQL문을 실행하기 위한 작업
			
			// pstmt.executeUpdate() : 몇개나 영향 받았는가 (C, U, O)		// 변동개수 리턴
			// pstmt.executeQeury() : 데이터(R)
			
			// select을 수행한 결과 : ResultSet
			//				List와 비슷한 느낌!
			
			rs = pstmt.executeQuery();									// ?를 가지고 쿼리실행
			// rs.next() : 다음 데이터로 넘어감, xml느낌
			//			   다음 데이터가 있으면 true
			//			   다음 데이터가 없으면 false가 리턴
			
			while (rs.next()) {											// 출력하고 싶은거 (순서, 컬럼명 등 조정 가능 리스트느낌)
				// rs.getXXX("컬럼명") : 현재위치의 컬럼 읽기					// RESULT에 담아서 출력
				// rs.getXXX(인덱스)	 : 비추! ( 만든사람만 알구 다른사람은 모르기 때문에 비추!)
				System.out.println(rs.getString(2));
				System.out.println(rs.getInt("p_weight"));
				System.out.println(rs.getInt("p_price"));
				System.out.println("--------------------");
			}
			try {
				rs.close();				// close 순서 잘 지키기!
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
