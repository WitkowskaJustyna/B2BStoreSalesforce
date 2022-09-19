public with sharing class OpinionController {
    
    @AuraEnabled(cacheable=false)
    public static List<Opinion__c> getOpinions(String recordId) {
        System.debug(recordId);
        List<Opinion__c> oplist = [SELECT Id, Opinion_about_product__c, Opinion15__c   FROM Opinion__c WHERE Product__c =: recordId LIMIT 5];
        System.debug(oplist);
        return oplist;
       
    }

    @AuraEnabled(cacheable=false)
    public static List<Opinion__c> getAllOpinions(String recordId) {
        System.debug(recordId);
        List<Opinion__c> oplist = [SELECT Id, Opinion_about_product__c, Opinion15__c   FROM Opinion__c WHERE Product__c =: recordId ];
        System.debug(oplist);
        return oplist;
       
    }
}