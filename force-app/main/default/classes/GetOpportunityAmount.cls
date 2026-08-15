public with sharing class GetOpportunityAmount{
    @invocableMethod(label='Get Opportunity Amount')
    public static List<Decimal> getOpportunityAmount(List<id> accIds){
        List<AggregateResult> arLists = [SELECT AccountId, SUM(Amount) sumAmount FROM Opportunity WHERE AccountId IN :accIds GROUP BY AccountID];

        Map<Id, Decimal> accAmountMap = new Map<Id, Decimal>();
        for(AggregateResult arList : arLists){
            accAmountMap.put((Id)arList.get('AccountID'), (Decimal)arList.get('sumAmount'));
        }

        List<Decimal> result = new List<Decimal>();
        for(Id accId : accIds){
            if(accAmountMap.containsKey(accId)){
                result.add(accAmountMap.get(accId));
            }else{
                result.add(0);
            }
        }
        return result;
    }
}