public with sharing class EmailContact{
    public static Map<String, Contact> getContactByEmail(List<String> emailList){
        List<Contact> contactList = [SELECT Id, Email FROM Contact WHERE Email IN :emailList];
        Map<String, Contact> contactMap = new Map<String, Contact>();
        for(Contact c : contactList){
            contactMap.put(c.Email, c);
        }
        return contactMap;
    }
}