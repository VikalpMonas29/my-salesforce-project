public class UpdateAccountSubjectScheduler implements Schedulable{
public void execute(SchedulableContext sc) {
        UpdateAccountSubjectBatch batchJob = new UpdateAccountSubjectBatch();
        Database.executeBatch(batchJob);
    }
}