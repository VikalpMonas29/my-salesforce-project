public class MyAccountCustController {
 
    public string accName{get; set;}

    public string conName{get; set;}

    public string conEmail{get; set;}

    public integer accNumEmp{get; set;}

    public String website;

    public String oppName{get; set;}

    public decimal oppAmount{get; set;}

    public String description{get; set;}

    public String type{get;set;}

    //constructor

    public MyAccountCustController(){

        this.description='this is a test account created using getter and setter methods';

    }

    //action method

    public void saveTheRecord(){

        Account a=new Account(Name=accName,NumberOfEmployees=accNumEmp,Description=description,website='www.testaccount.com',type='Prospect');

		insert a;

        Contact c=new Contact(lastname=conName,Email=conEmail,AccountId=a.Id);

        insert c;

        //Here we need to provide values for required fields (eg. StageName and CloseDate)

        Opportunity o=new Opportunity(name=oppName,amount=oppAmount,AccountId=a.Id,StageName='Prospecting',CloseDate=System.today());

        insert o; 

        //https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_system_pagereference.htm

        PageReference pageRef=new PageReference('/apex/AccountContactOppCreateVFPage');

    }

    /*

    public void setAccName(String accname){

        System.debug('setAccName method is called......');

        this.accName=accname;

    }

    public string getAccName(){

         System.debug('getAccName method is called......');

		return this.accName;        

	   }

    public void setAccWebsite(String accwebsite){

        System.debug('setAccWebsite method is called......');

        this.website=accwebsite;

    }

    public string getAccWebsite(){

         System.debug('getAccWebsite method is called......');

		return this.website;        

	   }
 
    public void setAccNumEmps(integer numofEmps){

        System.debug('setAccNumEmps method is called......');

        this.accNumEmp=numofEmps;

    }

    public integer getAccNumEmps(){

         System.debug('getAccNumEmps method is called......');

        return this.accNumEmp;

    }*/
}