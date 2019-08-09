public class Pattern1{
	public static void main(String[] args){
		int space=4;
		for(int i=1;i<=4;i++)
		{
			for(int j=1;j<=space;j++)
				System.out.print(" ");
			space--;
			for(int k=1;k<=(2*i)-1;k++)
				System.out.print("*");
			System.out.println();
		}
		space=2;
		for(int i=3;i>=1;i--)
		{
			for(int j=1;j<=space;j++)
				System.out.print(" ");
			space++;
			for(int k=1;k<=(2*i)-1;k++)
				System.out.print("*");
			System.out.println();
		}
	}
}
		
