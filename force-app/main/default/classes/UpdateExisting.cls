public class UpdateExisting {
    public static void updateRecord(){
        Account acct = [SELECT Id FROM Account where Id= '0015g00001SfgdWAAR'];
        
        delete acct;
    }
}