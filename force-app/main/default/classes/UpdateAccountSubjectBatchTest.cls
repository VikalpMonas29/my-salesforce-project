@isTest
public class UpdateAccountSubjectBatchTest {
    @isTest
    static void testBatch() {
        // Create test data with RecordType 'Dummy'
        RecordType rt = [SELECT Id FROM RecordType WHERE SObjectType = 'Account' AND DeveloperName = 'Dummy'];
     //   Account testAccount = new Account(Name = 'Test Account', RecordTypeId = rt.Id);

 
        Test.startTest();
        UpdateAccountSubjectBatch batchJob = new UpdateAccountSubjectBatch();
        Database.executeBatch(batchJob);
        Test.stopTest();
 
       
     //   Account updatedAccount = [SELECT Subject FROM Account WHERE Id = :testAccount.Id];
     //   System.assertEquals('Not for use Yourname', updatedAccount.Subject);
    }
}