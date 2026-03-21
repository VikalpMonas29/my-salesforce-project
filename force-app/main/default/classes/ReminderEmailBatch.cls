global class ReminderEmailBatch implements Database.Batchable<SObject>, Database.Stateful, Schedulable {
    global string query;
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Query positions that are open for more than 2 days
        DateTime twoDaysAgo = System.now().addDays(-2);
        query='select id,name,status__c,owner.email,date_opened__c from position__c where date_opened__c < :PositionDate';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Position__c> scope) {
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();

        for (Position__c pos : scope) {
            // Create and send a reminder email for each position owner
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new List<String>{pos.Owner.Email});
            email.setSubject('Position Reminder');
            email.setPlainTextBody('Reminder: The position "' + pos.Name + '" is open for more than 2 days.');
            emailList.add(email);
        }

        // Send reminder emails
        Messaging.sendEmail(emailList);
    }

    global void finish(Database.BatchableContext BC) {
        // Implement any post-processing logic if needed
    }

    // Schedule the batch to run every day at 6 pm
    global void execute(SchedulableContext sc) {
        ReminderEmailBatch batch = new ReminderEmailBatch();
        Database.executeBatch(batch);
    }
}