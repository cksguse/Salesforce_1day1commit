public with sharing class AccountContactService{
    public static Map<Id, List<Contact>> getContactByAccIds(List<Id> accIds){
        List<Contact> contactList = [SELECT Id, Name, AccountId FROM CONTACT WHERE AccoutId IN :accIds];
        Map<Id, List<Contact>> contactMap = new Map<Id, List<Contact>>();
        for(Contact contact : contactList){
            if(comtactMap.containsKey(contact.AccountId)){
                contactMap.get(contact.AccountId).add(contact);
            } else{
                contactMap.put(contact.AccountId, new List<Contact>{contact});
            }
        }
        return contactMap;
    }
}