public with sharing class CaseTriggerHandler {
    //値の保存はいらないため、static
    public static void createTasks(List<Case> newCases) {
        //DBに入れる時、使用するTaskのList
        List<Task> tasksInsert = new List<Task>();

        for(Case newCase : newCases){
            //新規Task作成後、必須項目入力
            Task newTask = new Task();
            newTask.WhatId = newCase.Id;
            newTask.Subject = '新規ケースフォロー';
            newTask.OwnerId = newCase.OwnerId;
            newTask.Status = 'Not Started';
            newTask.Priority = 'Normal';

            //Listに追加
            tasksInsert.add(newTask);
        }

        //Listに値がある場合、insert
        if(!tasksInsert.isEmpty()){
            insert tasksInsert;
        }
    }
}