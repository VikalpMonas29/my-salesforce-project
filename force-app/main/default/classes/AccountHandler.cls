public class AccountHandler {
    public static Account insertNewAccount(String str){
        try{
            Account newAccount = new Account(Name=str);
            insert newAccount;
            return newAccount;
        }catch(DmlException e){
            System.debug('A DML exception has occured: '+e.getMessage());
            return null;
        }
                         
    }
}