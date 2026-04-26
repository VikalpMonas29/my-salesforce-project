public class PositionSearchController{
     public List<Position__c> positionList {get; set;}
     public List<Position__c> searchResultList{get; set;}
 
    public String keyword {get; set;}
 
    public PositionSearchController() {
 
         positionList = [select Name, Department__c, Location__c, Status__c from Position__c];
    }
    public PageReference search(){
 
      searchResultList = (List<Position__c>)[FIND: keyword IN ALL FIELDS RETURNING Position__c(Name, Department__c, Location__c,Status__c)][0];
      return null;
    }
}