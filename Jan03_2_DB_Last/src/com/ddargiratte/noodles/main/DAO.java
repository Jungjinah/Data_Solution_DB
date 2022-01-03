package com.ddargiratte.noodles.main;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import com.ddargiratte.db.manager.DdargiratteDBManager;
import com.ddargiratte.noodles.booking.booking;

// java.util.Date - �ַ�(Spring������ �̰� ����)
// java.sql.Date - JDBC������ �̰� ����

// -�̰� �˾Ƶ־���
// java.util.Date -> java.sql.Date
//		: new Date(b.getWhen().getTime());

// java.sql.Date -> java.util.Date : �˾Ƽ� �ٲ���

public class DAO {
	public static String book(booking b) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DdargiratteDBManager.connect();	// �̰� ����
			String sql = "insert into booking "
					+ "values(BOOKING_SEQ.NEXTVAL, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b.getName());
			pstmt.setDate(2, new Date(b.getWhen().getTime()));
			pstmt.setString(3, b.getPhone());
			pstmt.setString(4, b.getLocation());
			
			if (pstmt.executeUpdate() == 1) {
				return "���༺��";
			}
			return "";	// �������� (Java������ �ʿ��ؼ� ������ ������!)
			
		} catch (Exception e) {
			e.printStackTrace();
			return "�������";
		}finally {
			DdargiratteDBManager.close(con, pstmt, null);
		}
		
	}
}
