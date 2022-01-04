package com.ddargiratte.jan041.main;

import java.util.ArrayList;

public class GetAirController {
	public static void main(String[] args) {
		ArrayList<Air> a = new ArrayList<Air>();
		a = AirDAO.getAir();
		for (Air air : a) {
			System.out.println(air);
		}
		for (Air air : a) {
			AirDAO.writeAir(air);
		}
		
	}
		
}