trigger DuplicateAccount on Account (before insert) {
  list<string> names=new list<string>();
    for(account a:trigger.new)
    {
        names.add(a.name);
    }
    list<account> acclist=[select name from account where name in: names];//20=> fetching and storing existing account names in accList
    for(account a1:trigger.new)//new record which is getting added 
    {
        for(account a2:acclist)//all existing account records
        {
            if(a1.name==a2.Name)//comparing new account name with existing list names 
            {
                a1.name.addError('Duplicate account name');
            }
        }
    }
}