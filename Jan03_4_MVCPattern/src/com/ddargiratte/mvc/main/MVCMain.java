// ���� 3
package com.ddargiratte.mvc.main;

import java.util.Scanner;

// ���α׷� ����
//	���������� ����,,
//	������ ����,,

// �����ϱ� ���� ������Ʈ
//	��
//	PM (Project Manager)
//	PL (Project Leader)
//	������A - back-end
//	������B - front-end
//	�����̳�A
//	�����̳�B

// MVC����
//	������ ������ �۾�, � ���� �ϳ��� �ϳ��� ���Ҹ�!
//	M - Model : ���� ���� ����Ͻ����� (���, ...)
//	V - View : ������ ����ڰ� ���� ����(�Է� / ���)
//	C - Controller : ��Ȳ�Ǵ��� �ؼ� M or V ��ȯ

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
