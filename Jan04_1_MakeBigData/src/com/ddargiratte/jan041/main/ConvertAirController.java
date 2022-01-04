package com.ddargiratte.jan041.main;

import java.util.ArrayList;

public class ConvertAirController {
	public static void main(String[] args) {
		ArrayList<Air> airs = AirDAO.getMyAir();
		AirDAO.writeAriToFile(airs);
		System.out.println("end!");
	}
}
