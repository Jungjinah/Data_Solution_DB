package com.ddargiratte.noodles.main;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import com.ddargiratte.db.manager.DdargiratteDBManager;
import com.ddargiratte.noodles.booking.booking;

// java.util.Date - 주력(Spring에서는 이걸 원함)
// java.sql.Date - JDBC에서는 이걸 원함

// -이거 알아둬야해
// java.util.Date -> java.sql.Date
//		: new Date(b.getWhen().getTime());

// java.sql.Date -> java.util.Date : 알아서 바꿔줌

public class DAO {
	public static String book(booking b) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DdargiratteDBManager.connect();	// 이게 보물
			String sql = "insert into booking "
					+ "values(BOOKING_SEQ.NEXTVAL, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b.getName());
			pstmt.setDate(2, new Date(b.getWhen().getTime()));
			pstmt.setString(3, b.getPhone());
			pstmt.setString(4, b.getLocation());
			
			if (pstmt.executeUpdate() == 1) {
				return "예약성공";
			}
			return "";	// 에러막기 (Java문법상 필요해서 억지로 넣은거!)
			
		} catch (Exception e) {
			e.printStackTrace();
			return "예약실패";
		}finally {
			DdargiratteDBManager.close(con, pstmt, null);
		}
		
	}
}
