trigger Trigger2 on Contact (before insert) {
    for(contact c:trigger.new)
    {
        if(c.accountid==null)
        {
            c.AccountId.addError('Account is mandatory');
        }
    }
}