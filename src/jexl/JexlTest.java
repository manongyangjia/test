package jexl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.jexl3.JexlBuilder;
import org.apache.commons.jexl3.JexlContext;
import org.apache.commons.jexl3.JexlEngine;
import org.apache.commons.jexl3.JexlScript;
import org.apache.commons.jexl3.MapContext;

public class JexlTest {

	public static void main(String[] args) {
		JexlEngine jexl = new JexlBuilder().cache(512).strict(true).silent(false).create();
		// JexlExpression exp = jexl.createExpression("if(a>b){c=0;}");

		// Number ee = (Number ) exp.evaluate(context);

		JexlScript e = jexl.createScript("a+10/9.0");
		JexlContext jc = new MapContext();
		jc.set("a", 222);
		Object o = e.execute(jc);
		System.out.println(o);
	}
}
