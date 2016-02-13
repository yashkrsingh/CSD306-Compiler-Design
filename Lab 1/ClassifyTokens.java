/*
Name		  : Yash Kumar Singh
Roll Number   : 1310110373
Program Title : Classifying tokens
*/

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ClassifyTokens {
	
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.print("Enter the C statement: ");
		String s = input.nextLine();
		input.close();
		
		int cid=1,cop=1,cdel=1,cnum=1;
		String IDENTIFIER = "_*[a-zA-Z][a-zA-Z0-9]*";
		String OPERATOR = "[+-/^=\\*\\(\\)]";
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
			System.out.print("\nid"+cid+"\t"+mid.group()+"\tidentifier");
			cid++;
		}
		while(mop.find()){
			System.out.print("\nop"+cop+"\t"+mop.group()+"\toperator");
			cop++;
		}
		while(mnum.find()){
			System.out.print("\nnum"+cnum+"\t"+mnum.group()+"\tnumber");
			cnum++;
		}
		while(mdel.find()){
			System.out.print("\ndelim"+cdel+"\t"+mdel.group()+"\tdelimiter");
			cdel++;
		}

	}

}
