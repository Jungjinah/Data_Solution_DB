package com.ddargiratte.noodles.main;

import com.ddargiratte.noodles.booking.booking;
import com.ddargiratte.noodles.owners.owners;

//DAO / DTO ����
//	MVC����
//	DAO (Data Acceess Object)
//		M�߿��� DB������ �۾��� �����ϴ� Ŭ����
//		DTO (Data Transfer / Temp Object)
//			DAO�� �۾������ ǥ���ϴ� Ŭ����

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
					System.out.println("�����մϴ�");
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