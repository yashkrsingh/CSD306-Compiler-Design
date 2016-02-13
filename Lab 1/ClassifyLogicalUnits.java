/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Classifying logical units
*/

import java.util.Scanner;
import java.util.regex.*;

public class ClassifyLogicalUnits {
	
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.print("Enter the C statement: ");
		String s = input.nextLine();
		input.close();
		
		int count=1;
		String IDENTIFIER = "_*[a-zA-Z][a-zA-Z0-9]*";
		String OPERATOR = "[+-/^=\\*]";
		String DELIMITER = ";";
		String NUMBER = "[0-9]+";
		
		Pattern id = Pattern.compile(IDENTIFIER);
		Pattern op = Pattern.compile(OPERATOR);
		Pattern del = Pattern.compile(DELIMITER);
		Pattern num = Pattern.compile(NUMBER);
		Matcher mid = id.matcher(s);
		Matcher mop = op.matcher(s);
		Matcher mdel = del.matcher(s);
		Matcher mnum = num.matcher(s);
		
		while(mid.find()){
			System.out.print("\nlu"+count+"\t"+mid.group()+"\tidentifier");
			count++;
		}
		while(mop.find()){
			System.out.print("\nlu"+count+"\t"+mop.group()+"\toperator");
			count++;
		}
		while(mnum.find()){
			System.out.print("\nlu"+count+"\t"+mnum.group()+"\tnumber");
			count++;
		}
		while(mdel.find()){
			System.out.print("\nlu"+count+"\t"+mdel.group()+"\tdelimiter");
			count++;
		}
	}
	
}
