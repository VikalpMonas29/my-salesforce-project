@isTest
private class PositionSearchControllerTest {
    @isTest static void mathod1(){
       PositionSearchController obj= new PositionSearchController();
        system.assert(true,obj.positionList.size()>0);
 
    } 
    @isTest static void method2(){

        PositionSearchController obj1 = new PositionSearchController(); 
        list<Position__c> list1= [SELECT Name, Department__c, Location__c, Status__c from Position__c];
        system.assertEquals(list1.size(),obj1.positionList.size());
    }
    @isTest static void method3(){

    PositionSearchController obj2 = new PositionSearchController();
    obj2.keyword = 'Super'; 
    obj2.search();

    list<Position__c>list1= (List<Position__c>)[FIND: 'Super' IN ALL FIELDS RETURNING Position__c(Name,Department__c,Location__c,Status__c)][0];
   }
}