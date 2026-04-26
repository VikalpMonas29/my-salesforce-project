global class ReminderEmailBatchScheduler implements Schedulable {

    global void execute(SchedulableContext sc) {
        // Instantiate the batch class
        ReminderEmailBatch batch = new ReminderEmailBatch();

        // Calculate the cron expression for running daily at 6 pm
        String cronExp = '0 0 18 * * ?';

        // Schedule the batch to run using the calculated cron expression
        System.schedule('ReminderEmailBatchJob', cronExp, batch);
    }
}