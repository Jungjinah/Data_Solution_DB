package com.ddargiratte.jan041.main;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import com.ddargiratte.db.manager.DdargiratteDBManager;
import com.ddargiratte.dec2244.HttpClient.DdargiratteHttpClient;

import oracle.security.o3logon.a;

public class AirDAO {
	// "http://openapi.seoul.go.kr:8088/4f626857416f6c6c3632586a416843/xml/RealtimeCityAir/1/25/";
	// ���� �����͸� �޾Ƽ� -> �츮�� ���ϴ� ���� -> DB�� �־
	//		-> ���Ͽ� �Ű� ��� ����..!

	// 1. �Ľ��ϴ°�! (�غ� ���� o / Library)

	public static ArrayList<Air> getAir() {
		try {
			String address = "http://openapi.seoul.go.kr:8088/4f626857416f6c6c3632586a416843/xml/RealtimeCityAir/1/25/";
			InputStream is = DdargiratteHttpClient.download(address);
			XmlPullParserFactory xppf = XmlPullParserFactory.newInstance();
			XmlPullParser xpp = xppf.newPullParser();
			xpp.setInput(is, "utf-8");
			int type = xpp.getEventType();
			String tagName = null;

			Air a = null;
			ArrayList<Air> airs = new ArrayList<Air>();

			while (type != XmlPullParser.END_DOCUMENT) {
				if (type == XmlPullParser.START_TAG) {
					tagName = xpp.getName();
					if(tagName.equals("row")) {
						a = new Air();
					}

				}else if (type == XmlPullParser.TEXT) {
					if (tagName.equals("MSRSTE_NM")) {
						System.out.println(xpp.getText());
						a.setA_msrste_nm(xpp.getText());
					}else if (tagName.equals("PM10")) {
						System.out.println(xpp.getText());
						a.setA_pm10(Integer.parseInt(xpp.getText()));
					}else if (tagName.equals("PM25")) {
						System.out.println(xpp.getText());
						a.setA_pm25(Integer.parseInt(xpp.getText()));
					}else if (tagName.equals("03")) {
						System.out.println(xpp.getText());
						a.setA_03(Double.parseDouble(xpp.getText()));
					}else if (tagName.equals("IDEX_NM")) {
						System.out.println(xpp.getText());
						a.setA_index_nm(xpp.getText());
					}
					airs.add(a);
					
				}else if (type == XmlPullParser.END_TAG) {
					tagName ="";
				}
				xpp.next();
				type = xpp.getEventType();
			}
			return airs;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 2. DB�� ���� ���ϴ� ���� insert (sql, class)
	public static String writeAir(Air a) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DdargiratteDBManager.connect();

			String sql = "insert into AIR "
					+ "values(air_seq.nextval, sysdate, "
					+ "?, ?, ?, ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, a.getA_msrste_nm());
			pstmt.setInt(2, a.getA_pm10());
			pstmt.setInt(3, a.getA_pm25());
			pstmt.setDouble(4, a.getA_03());
			pstmt.setString(5, a.getA_index_nm());

			if (pstmt.executeUpdate() >= 1) {
				return "����";
			}
			return "";
		} catch (Exception e) {
			return "����";
		}
	}
	
	// 3. DB�� ���� ������ �ҷ�����
	public static ArrayList<Air> getMyAir() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DdargiratteDBManager.connect();
			String sql = "select * from air order by a_msrdt";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ArrayList<Air> airs = new ArrayList<Air>();
			Air a = null;
			while (rs.next()) {
				a= new Air();
				a.setA_no(rs.getInt("a_no"));
				a.setA_msrdt(rs.getDate("a_msrdt"));
				a.setA_msrste_nm(rs.getString("a_msrste_nm"));
				a.setA_pm10(rs.getInt("a_pm10"));
				a.setA_pm25(rs.getInt("a_pm25"));
				a.setA_03(rs.getDouble("a_o3"));
				a.setA_index_nm(rs.getString("a_index_nm"));
				airs.add(a);
			}
			return airs;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}finally {
			DdargiratteDBManager.close(con, pstmt, rs);
		}
	}
	// 4. ���Ͽ� �ø���
	// ���ϸ�.Ȯ����
	// Ȯ���� - MS���� �ִ� ����
	// ������� ���� ���ϰ� �Ѱͻ�
	// ������������ Ȯ���ڰ� ����
	
	// air.poll.txt
	// �ؽ�Ʈ ����
	// �޸����̶�� ���α׷����� �� ������ ����
	
	// csv(Comma Seperated Value)
	// �� ������ ,�� ���еǾ� ����
	public static void writeAriToFile(ArrayList<Air> Airs) {
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream("C:\\Users\\wtime\\Desktop\\jan04_air", true);
			OutputStreamWriter osw = new OutputStreamWriter(fos, "utf-8");
			BufferedWriter bw = new BufferedWriter(osw);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy,MM,dd,kk,mm");
			for (Air air : Airs) {
				bw.write(sdf.format(air.getA_msrdt()) + ",");
				bw.write(air.getA_msrste_nm() + ",");
				bw.write(air.getA_pm10() + ",");
				bw.write(air.getA_pm25() + ",");
				bw.write(air.getA_03() + ",");
				bw.write(air.getA_index_nm() + "\r\n");
				bw.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			fos.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}