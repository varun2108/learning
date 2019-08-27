class Parent
{
  //private methods are not overridden
  private void method1()
  {
    System.out.println("From parent method1()");
  }
  protected void method2()
  {
    System.out.println("From parent method2()");
  }
}
class Child extends Parent
{
  //new method1() method
  //unique to Child class
  private void method1()
  {
    System.out.println("From child method1()");
  }
  //overriding method
  //with more accessibility
  @Override
  public void method2()
  {
    System.out.println("From child method2()");
  } 
}
//Driver class
class MethodOverriding
{
  public static void main(String[] args)
  {
    Parent obj1 = new Parent();
    obj1.method2();
    Parent obj2 = new Child();
    obj2.method2();
  }
}