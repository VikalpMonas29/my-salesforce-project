trigger Account_Duplication on Account (before insert, before update) {
 Set<String> uniqueLastNames = new Set<String>();
 
    // Check for duplicate last names
for (Account emp : Trigger.new) {
        if (uniqueLastNames.contains(emp.AccountNumber)) {
            emp.addError('Last Name must be unique among Employees');
            System.debug('Duplicate Found');
        } else {
            uniqueLastNames.add(emp.AccountNumber);
            System.debug('Unique Last Name Added');
        }
    }
}