public class CustomAccount {

    public id accid
    {
        get;
        set;
    }
    list<selectoption> acclist=new list<selectoption>();
    public list<selectoption> getAccOptions()
    {
        acclist.add(new selectoption('--select--','--select--'));
        for(account ac:[select id,name from account])
        {
            acclist.add(new selectoption(ac.id,ac.name));
        }
        return acclist;
    }
    public list<account> getAccs()
    {
        list<account> listofAcc=[select name,type,industry, annualrevenue from account where id=:accid];
        return listOfAcc;
    }
    
}