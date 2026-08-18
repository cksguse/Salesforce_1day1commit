//Account의 Id Set을 받아서 각 Account에 연결된 미해결 Case의 목록을 AccountId로 묶어서 반환하는 맵핑 클래스
public with sharing class AccountCaseMapping {
  public static Map<Id, List<Case>> GetOpenCaseByAccountIds(Set<Id> accountIds){
    //미해결 Case의 목록을 추출
    List<Case> CaseList = [SELECT Id, Subject, AccountId FROM Case WHERE AccountId IN :accountIds AND Status != Closed]
    //Accountid와 미해결 Case의 목록을 집어넣을 Map을 작성
    Map<Id, List<Case>> result = new Map<Id, List<Case>>();

    //방어코드
    if(accountIds == null || accountIds.isEmpty()){
      return result;
    }

    for(Case c : CaseList){
      if(result.containskey(c.AccountId)){
        result.get(c.AccountId).add(c);
      }else{
        result.put(c.AccountId, new List<Case>{c});
      }
    }
    return result;
  } 
}
