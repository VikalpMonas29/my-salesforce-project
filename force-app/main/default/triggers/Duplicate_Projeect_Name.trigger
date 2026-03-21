trigger Duplicate_Projeect_Name on Project__c (before insert ,before update) {
  Set<String> uniqueName = new Set<String>();
    
    for(Project__c obj : Trigger.new){
        if(uniqueName.contains(obj.Name)){
            
            System.debug('Same Project Name');
        }
        else{
            uniqueName.add(obj.Name);
            System.debug('Added Sucessfully');
        }
    }
}