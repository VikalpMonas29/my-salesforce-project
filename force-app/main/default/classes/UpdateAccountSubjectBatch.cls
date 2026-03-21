public class UpdateAccountSubjectBatch implements Database.Batchable<sObject> {
  public Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator('SELECT Id, Subject FROM Account WHERE RecordType.DeveloperName = \'Dummy\'');
    }
 
    public void execute(Database.BatchableContext context, List<Account> scope) {
        for (Account acc : scope) {
          //  acc.Subject = 'Not for use Yourname';
        }
        update scope;
    }
    public void finish(Database.BatchableContext context) {
    }
}