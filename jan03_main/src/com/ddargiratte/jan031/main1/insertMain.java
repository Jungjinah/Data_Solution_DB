// 2
package com.ddargiratte.jan031.main1;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class insertMain {
	public static void main(String[] args) {
		// SQL���� ����ؼ�
		//	-> ������ ����
		//	-> DB�������� ������
		//	-> �� ����� �޾ƿ� �� �־��!
	Connection con = null;
	try {
		String addr = "jdbc:oracle:thin:@192.168.1.42:1521:xe";
		con = DriverManager.getConnection(addr, "jangel", "0801");
		
		String sql = "insert into PRODUCT "		// ���� ���� �� ���࿩��!
				+ "values(PRODUCT_SEQ.NEXTVAL,"	// ���� ���ϸ� sql���� productvalues �̷��� �Ź���,,
														// ������ ���ؼ� ������ �߻��ϴ� '����' ����!
				+ "'�׽�Ʈ', 10, 10, 3)";				// ��ȣ ) �ڿ� ; �������� ����!
		
		// ������ ����/����/��� �޾ƿ��� �۾� �Ѱ� �Ŵ���
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.executeUpdate();	// ������ ����/����/����ޱ�
		
		
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
