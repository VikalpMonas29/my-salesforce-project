@RestResource(urlMapping='/Position__c/*')
global class RestfulService {
    @HttpPost
    global static String createPosition(String Name, String Department, String status, String rectype) {
        Id recordTypeId;

        if (rectype.equalsIgnoreCase('Technical')) {
            recordTypeId = Schema.SObjectType.Position__c.getRecordTypeInfosByDeveloperName().get('Technical_Position').getRecordTypeId();
        } else {
            recordTypeId = Schema.SObjectType.Position__c.getRecordTypeInfosByDeveloperName().get('Nontechnical_Position').getRecordTypeId();
        }

        Position__c pos = new Position__c(Name = Name, Department__c = Department, Status__c = status, RecordTypeId = recordTypeId);

        try {
            Insert pos;
            return pos.Id;
        } catch (DMLException ex) {
            System.debug(ex.getMessage());
            return 'Unable to create a position record.';
        }
    }
}