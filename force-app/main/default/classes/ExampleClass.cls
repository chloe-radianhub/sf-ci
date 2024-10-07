public with sharing class ExampleClass {
    public ExampleClass() {
    }

    @AuraEnabled
    public static Decimal addOne(Decimal num) {
        return num + 1;
    }
}