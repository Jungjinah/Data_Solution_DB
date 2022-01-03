// 1
package com.ddargiratte.jan031.main1;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

// ���� : cmd ��� sqlplus��� ���α׷����� OracleDB����
//		 cmd ��� ����
// ����ǰ : orange, toad, eclipse
//		  sqldeveloper

// Socket���
// HTTP���

// DB������ ��� : Java�� ����Ǿ� ����(�̿ϼ� ����)
// 	DB ����Ŀ�� ���� ������... -> ������ ���� ����� ���ݾ� �޶�..
//	������ DB�� ���缭 ���ݾ� ��ġ�� �����!

// OracleDB �����!  -> ���⿡ ���缭 ��ġ�� �ؾ�!
//	-> �� ����� ojdbc8.jar�� �� ����

// ojdbc8.jar�� �ֱ⸸ �ϸ� �˾Ƽ� ���

public class connectionMain {
	
	public static void main(String[] args) {
		Connection con = null;
		try {
			// ������ DB���� �ּ� (����Ŀ���� ������ �ٸ���!)
			// Data Source Explorer - ������ ���콺 Ŭ�� - Properties
			// -Driver Properties - Connection URL ����
			String addr = "jdbc:oracle:thin:@192.168.1.42:1521:xe";
			
			// ojdbc8.jar�� �ֱ⸸ �ϸ� �˾Ƽ� ���
			// con = DriverManager.getConnection(addr, "jangel", "0801");
			con = DriverManager.getConnection(addr, "jangel", "0801");
			System.out.println("Success");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();			// close ö���� �ϼ���!
		} catch (SQLException e) {		// ���� �ȴ����� �ٸ������ �����..
			e.printStackTrace();
		}
	}
	
}
