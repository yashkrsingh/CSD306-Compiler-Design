/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Recognizing Valid Comments
*/


import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Comments {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.print("Enter the string: ");
		String s = input.nextLine();
		input.close();
		Pattern p = Pattern.compile("/\\*([^\"]*|\".*\")\\*/");
		Matcher m = p.matcher(s);
		
		if(m.matches())
			System.out.print("Matched");
		else
			System.out.print("Not Matched");
	}
	
}
