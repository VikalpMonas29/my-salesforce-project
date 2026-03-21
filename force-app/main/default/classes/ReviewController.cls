public with sharing class ReviewController {
    @AuraEnabled(cacheable=true)
    public static List<Review__c> fetchReviews() {
        // Query and return the list of reviews (adjust object/field names as needed)
        return [SELECT Name,Candidate_Name__c,Core_Competencies__c,Experience__c, Leadership_Skills__c, Recommend_for_Hire__c, Overall_Review_Score__c
                FROM Review__c];
    }
}