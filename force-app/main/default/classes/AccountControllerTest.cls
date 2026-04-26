@isTest
public class AccountControllerTest {
    @isTest
    static void testGetAllActiveAccounts() {
        // Create test data
        Account activeAcc = new Account(Name='Active Account', Active__c='Yes');
        Account inactiveAcc = new Account(Name='Inactive Account', Active__c='No');
        insert new List<Account>{activeAcc, inactiveAcc};
        
        // Call the method
        List<Account> result = AccountController.getAllActiveAccounts();
        
        // Assert
        System.assertEquals(1, result.size(), 'Should return only one active account');
        System.assertEquals('Active Account', result[0].Name, 'Should return the active account');
    }
}
