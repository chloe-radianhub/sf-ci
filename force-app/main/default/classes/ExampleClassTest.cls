@isTest
private class ExampleClassTest {
  @isTest
  public static void canAdd() {
    Decimal result = ExampleClass.addOne(2);
    Assert.areEqual(3, result);
  }
}
