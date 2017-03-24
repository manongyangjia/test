import java.util.Date;


public class Test {

	
	public static void main(String[] args) {
	Date  t=new Date();
	try {
		Thread.sleep(1000*15);
		Date  t1=new Date();
		System.out.println((t1.getTime()-t.getTime())/1000);
		
	} catch (InterruptedException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	}
}
