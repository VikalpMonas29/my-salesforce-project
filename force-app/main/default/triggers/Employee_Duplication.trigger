trigger Employee_Duplication on Emplyee__c (before insert, before update) {
 Set<String> uniqueLastNames = new Set<String>();
 
    // Check for duplicate last names
for (Emplyee__c emp : Trigger.new) {
        if (uniqueLastNames.contains(emp.Last_Name__c)) {
            emp.addError('Last Name must be unique among Employees');
            System.debug('Duplicate Found');
        } else {
            uniqueLastNames.add(emp.Last_Name__c);
            System.debug('Unique Last Name Added');
        }
    }
}