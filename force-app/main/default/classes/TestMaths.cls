@IsTest
public class TestMaths {
    Maths m;
    public TestMaths(){
        m = new Maths();
    }
    @IsTest
    public static void testAdd(){
        Maths m = new Maths();
        System.assertEquals(10,m.add(5,5));
    }
    @IsTest
    public static void testMultiply(){
         Maths m = new Maths();
        System.assertEquals(25,m.multiply(5,5));
    }

}