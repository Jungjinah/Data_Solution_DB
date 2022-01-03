package com.ddargiratte.noodles.main;

import com.ddargiratte.noodles.booking.booking;
import com.ddargiratte.noodles.owners.owners;

//DAO / DTO 패턴
//	MVC패턴
//	DAO (Data Acceess Object)
//		M중에서 DB관련한 작업을 전담하는 클래스
//		DTO (Data Transfer / Temp Object)
//			DAO의 작업결과를 표현하는 클래스

public class Controller {
	public static void main(String[] args) {
		int menu = 0;
		booking b = null;
		owners o = null;
		String result = null;
		
		while (true) {
			try {
				menu = ConsoleScreen.showMainMenu();
				if (menu == 9) {
					System.out.println("종료합니다");
					break;
				}else if (menu == 1) {
					b = ConsoleScreen.showRsvMenu();
					result = DAO.book(b);
					ConsoleScreen.printResult(result);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}