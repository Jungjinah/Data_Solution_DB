package com.ddargiratte.noodles.owners;

public class owners {
	private String name;
	private String location;
	private int seat;
	
	public owners() {
		// TODO Auto-generated constructor stub
	}

	public owners(String name, String location, int seat) {
		super();
		this.name = name;
		this.location = location;
		this.seat = seat;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getSeat() {
		return seat;
	}

	public void setSeat(int seat) {
		this.seat = seat;
	}
	
}
