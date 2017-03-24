package freemaker;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import freemarker.template.TemplateException;

public class Test {

	public static void main(String[] args) throws ParseException, IOException, TemplateException {
		
		String a="011";
		System.out.println(a.startsWith("0"));
		System.out.println(a.substring(1, a.length()));
		
 	}

}
