/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Removing whitespaces and comments
*/

import java.util.Scanner;
import java.util.regex.*;

public class SpaceCommentRemoval {
	
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.print("Enter the C statement: ");
		String s = input.nextLine();
		input.close();
		
		Pattern p = Pattern.compile("/\\*(.*)\\*/|//(.*)|[ \t]");
		Matcher m = p.matcher(s);
		s = m.replaceAll("");
		
		System.out.print("\nOutput C statement: ");
		System.out.print(s);
	}

}
