/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Recognizing strings with ascending lexicography
*/


import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AscendingLexicographic {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.print("Enter the string: ");
		String s = input.nextLine();
		input.close();
		Pattern p = Pattern.compile("a*b*c*d*e*f*g*h*i*j*k*l*m*n*o*p*q*r*s*t*u*v*w*x*y*z*");
		Matcher m = p.matcher(s);
		
		if(m.matches())
			System.out.print("Matched");
		else
			System.out.print("Not Matched");
	}
	
}
