public class CreateAccount {
    public static void NewAccount(String name,Integer num,String type){
        Account acct = new Account(Name=name,NumberOfEmployees=num,Type=type);
        insert acct;
 }
}