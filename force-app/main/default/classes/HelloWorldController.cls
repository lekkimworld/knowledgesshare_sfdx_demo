public with sharing class HelloWorldController {
    @AuraEnabled
    public static User getOwner(String recordId) {
        User user = [SELECT Id, FirstName, LastName, Email, Phone 
            FROM User 
            WHERE Id IN (SELECT OwnerId FROM Account WHERE Id =: recordId) LIMIT 1];
        return user;
    }
}
