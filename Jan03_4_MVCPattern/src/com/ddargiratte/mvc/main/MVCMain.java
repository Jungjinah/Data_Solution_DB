// 오후 3
package com.ddargiratte.mvc.main;

import java.util.Scanner;

// 프로그램 개발
//	유지보수를 위해,,
//	협업을 통해,,

// 개발하기 위해 프로젝트
//	고객
//	PM (Project Manager)
//	PL (Project Leader)
//	개발자A - back-end
//	개발자B - front-end
//	디자이너A
//	디자이너B

// MVC패턴
//	파일을 나눠서 작업, 어떤 파일 하나는 하나의 역할만!
//	M - Model : 실제 업무 비즈니스로직 (계산, ...)
//	V - View : 실제로 사용자가 보는 파일(입력 / 출력)
//	C - Controller : 상황판단을 해서 M or V 소환

public class MVCMain {
	public static void main(String[] args) {
		Scanner k = new Scanner(System.in);
		
		System.out.print("x : ");
		int x = k.nextInt();
		
		System.out.print("y : ");
		int y = k.nextInt();
		System.out.println("---------------------");
		int z = x + y;
		System.out.println(z);
	
		
		
	}
}
