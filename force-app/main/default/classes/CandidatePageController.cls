public class CandidatePageController {
    private final Candidate__c candidate;
 
    public CandidatePageController(ApexPages.StandardController standardController) {
        this.candidate = (Candidate__c)standardController.getRecord();
    }
 
    public List<Job_Application__c> getJobApplications() {
        // Query job applications related to the candidate
        return [SELECT Id,Name,Position__c
                FROM Job_Application__c
                WHERE Candidate__c = :candidate.Id];
    }
    /*public List<Review__c> getReviews() {
        
        return [SELECT Id,Name,Experience__c
                FROM Review__c LIMIT 1
                ];
    }*/
/*    public Job_Application__c jobApplication { get; set; }
    public Candidate__c candidate { get; set; }
    public Review__c review{get; set;}
 
    public CandidatePageController() {
        // Initialize jobApplication and candidate objects based on your logic
        // For example, you can get record Ids from the URL parameters and query the objects
        String jobId = ApexPages.currentPage().getParameters().get('jobId');
        String candidateId = ApexPages.currentPage().getParameters().get('candidateId');
        String reviewId= ApexPages.currentPage().getParameters().get('reviewId');
 
        jobApplication = [SELECT Name, Position__c FROM Job_Application__c WHERE Id = :jobId LIMIT 1];
        candidate = [SELECT Name,First_Name__c,Last_Name__c FROM Candidate__c WHERE Id = :candidateId LIMIT 1];
        review=[SELECT Name,Position_Title__c FROM Review__c WHERE Id=: reviewId];
    }*/
}