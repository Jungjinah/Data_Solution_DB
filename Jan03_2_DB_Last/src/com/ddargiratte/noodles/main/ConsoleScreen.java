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
		System.out.println("1. 예약하기");
		System.out.println("2. 매장등록");
		System.out.println("3. 전체예약조회");
		System.out.println("4. 전체매장조회");
		System.out.println("5. 매장찾기");
		System.out.println("6. 예약찾기");
		System.out.println("7. 예약정보수정");
		System.out.println("8. 예약취소");
		System.out.println("9. 종료");
		System.out.println("------------------");
		System.out.println("번호입력 >");
		return k.nextInt();
		
	}
	// 1. 예약하기
	public static booking showRsvMenu() throws ParseException {
		Scanner k = new Scanner(System.in);
		
		System.out.print("예약자 : ");
		String name = k.next();
		
		System.out.print("날짜(YYYY-MM-DD/HH:MM) : ");
		String when = k.next();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-dd-mm/hh:mm");
		Date when2 = sdf.parse(when);
		
		System.out.print("연락처 : ");
		String phoneNum = k.next();
		
		System.out.println("지점명 : ");
		String location = k.next();
		
		booking b = new booking(0, name, when2, phoneNum, location);
		return b;
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
