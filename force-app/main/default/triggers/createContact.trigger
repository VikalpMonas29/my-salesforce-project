trigger createContact on Account (after insert) {
 
    
for (Account acc : Trigger.new) {
       
        if (acc.Industry == 'Banking') {
            
            Contact newContact = new Contact();
                newContact.LastName = acc.Name;
                newContact.Phone = acc.Phone ;
                newContact.AccountId=acc.Id;
                     
           insert newContact;
        }
    }    
    
}