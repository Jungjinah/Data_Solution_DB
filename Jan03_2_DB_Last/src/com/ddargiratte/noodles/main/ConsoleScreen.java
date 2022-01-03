package com.ddargiratte.noodles.main;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import com.ddargiratte.noodles.booking.booking;




public class ConsoleScreen {
	public static void printResult(String result) {
		System.out.println(result);
	}
	
	
	
	
	public static int showMainMenu() {
		Scanner k = new Scanner(System.in);
		System.out.println("------------------");
		System.out.println("1. �����ϱ�");
		System.out.println("2. ������");
		System.out.println("3. ��ü������ȸ");
		System.out.println("4. ��ü������ȸ");
		System.out.println("5. ����ã��");
		System.out.println("6. ����ã��");
		System.out.println("7. ������������");
		System.out.println("8. �������");
		System.out.println("9. ����");
		System.out.println("------------------");
		System.out.println("��ȣ�Է� >");
		return k.nextInt();
		
	}
	// 1. �����ϱ�
	public static booking showRsvMenu() throws ParseException {
		Scanner k = new Scanner(System.in);
		
		System.out.print("������ : ");
		String name = k.next();
		
		System.out.print("��¥(YYYY-MM-DD/HH:MM) : ");
		String when = k.next();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-dd-mm/hh:mm");
		Date when2 = sdf.parse(when);
		
		System.out.print("����ó : ");
		String phoneNum = k.next();
		
		System.out.println("������ : ");
		String location = k.next();
		
		booking b = new booking(0, name, when2, phoneNum, location);
		return b;
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
