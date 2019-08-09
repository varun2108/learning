import java.util.*;
public class Greates{
	public static void main(String[] args)
	{
		int a,b,c;
		Scanner sc=new Scanner(System.in);
		a=sc.nextInt();
		b=sc.nextInt();
		c=sc.nextInt();
		if(a>b && a>c)
			System.out.println("the biggest number is"+a);
		else if(b>c)
			System.out.println("the biggest number is"+b);
		else
			System.out.println("the biggest number is"+c);
	}
}