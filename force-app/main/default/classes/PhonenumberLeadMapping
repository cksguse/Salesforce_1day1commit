//Set<String> phoneNumbers를 넘겨 받아 대응하는 Lead를 Map을 사용해 반환하는 클래스
//★오답노트 : class 키워드를 누락함
public with sharing class PhonenumberLeadMapping {
  public static Map<String, List<Lead>> PhoneLeadMap(Set<String> Phonenumbers){
    //SOQL로 대응하는 리드를 추출
    List<Lead> Leads = [SELECT Id, Name, Phone FROM Lead WHERE Phone IN :Phonenumbers];

    //결과 반환용 Map 생성
    Map<String, List<Lead>> result = new Map<String, List<Lead>>();
    
    //Leads 리스트를 순회하면서 Phone 값을 기준으로 Map에 추가
    for(Lead lead : Leads){
      if(result.containskey(lead.Phone)){
        //★오답노트 : get 키워드를 누락함
        result.get(lead.Phone).add(lead);
      }else{
        //★오답노트 : List<Lead>가 아닌 Lead를 넣어버림
        result.put(lead.Phone, new List<Lead>{lead});
      }

      //Map 반환
      return result;
    }  
  }
}

//Map을 만들기 위해서는 원천 데이터를 모두 포함하고 있는 데이터가 존재해야 한다. 이 원천 데이터를 for문으로 순회하며 키와 밸류를 채워 넣어야 한다. 원천 데이터는 set list 둘 다 가능하다.
