package com.ddargiratte.jan041.main;

import java.sql.Date;

public class Air {
	private int a_no;
	private Date a_msrdt;
	private String a_msrste_nm;
	private int a_pm10;
	private int a_pm25;
	private double a_03;
	private String a_index_nm;

	public Air() {
		// TODO Auto-generated constructor stub
	}

	public Air(int a_no, Date a_msrdt, String a_msrste_nm, int a_pm10, int a_pm25, double a_03, String a_index_nm) {
		super();
		this.a_no = a_no;
		this.a_msrdt = a_msrdt;
		this.a_msrste_nm = a_msrste_nm;
		this.a_pm10 = a_pm10;
		this.a_pm25 = a_pm25;
		this.a_03 = a_03;
		this.a_index_nm = a_index_nm;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public Date getA_msrdt() {
		return a_msrdt;
	}

	public void setA_msrdt(Date a_msrdt) {
		this.a_msrdt = a_msrdt;
	}

	public String getA_msrste_nm() {
		return a_msrste_nm;
	}

	public void setA_msrste_nm(String a_msrste_nm) {
		this.a_msrste_nm = a_msrste_nm;
	}

	public int getA_pm10() {
		return a_pm10;
	}

	public void setA_pm10(int a_pm10) {
		this.a_pm10 = a_pm10;
	}

	public int getA_pm25() {
		return a_pm25;
	}

	public void setA_pm25(int a_pm25) {
		this.a_pm25 = a_pm25;
	}

	public double getA_03() {
		return a_03;
	}

	public void setA_03(double a_03) {
		this.a_03 = a_03;
	}

	public String getA_index_nm() {
		return a_index_nm;
	}

	public void setA_index_nm(String a_index_nm) {
		this.a_index_nm = a_index_nm;
	}

	

}
