public class EmployeeController {
    public List<Emplyee__c> employees {get;set;}
    
    public EmployeeController(){
        employees=[SELECT Id,Last_Name__c,Salary__c,Date_of_Birth__c,Email__c FROM Emplyee__c];
    }  
}