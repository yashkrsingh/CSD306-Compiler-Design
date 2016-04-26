/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Recognizing if vowels occur in order
*/

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class OrderVowels {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.print("Enter the string: ");
		String s = input.nextLine();
		input.close();
		Pattern p = Pattern.compile("[bcdfghjklmnpqrstvwxyz]*a([bcdfghjklmnpqrstvwxyz]|a)*e([bcdfghjklmnpqrstvwxyz]|e)*i([bcdfghjklmnpqrstvwxyz]|i)*o([bcdfghjklmnpqrstvwxyz]|o)*u([bcdfghjklmnpqrstvwxyz]|u)*");
		Matcher m = p.matcher(s);
		
		if(m.matches())
			System.out.print("Matched");
		else
			System.out.print("Not Matched");
	}
	
}
