@RESTResource(urlMapping='/employees/*')
global class REST_API_Employee
{
 /*  @HTTPGET
    global static List<Employee_REST__c> getDetails()
    {
		//Name=> Radha Torus
		List<Employee_REST__c> emplist=[select id,name,First_Name__c,Last_Name__c,Email__c,Joining_Date__c,phone_number__c from Employee_REST__c ];
        return emplist;
    }*/
    @HTTPGET
    global static Employee_REST__c getDetailById()
    {
        Map<String,String>  paramsMap=RestContext.request.params;
         String empid=paramsMap.get('id');
        System.debug('Map values:'+paramsMap);
        System.debug('ID:'+empid);
        Employee_REST__c emp=[select id,name,First_Name__c,Last_Name__c,Email__c,Joining_Date__c from Employee_REST__c where id=:empid LIMIT 3];
        return emp;
    }
    @HTTPPOST
	global static Employee_REST__c saveEmp()
    {
        String fname,lname,email,phone,dd,mm,yy;
        RestRequest req=RestContext.request;
        RestResponse res=RestContext.response;
        String jsonBody=req.requestBody.toString();
        JSONParser parser=JSON.createParser(jsonBody);
        while(parser.nextToken()!=null)
        {
                String jsonKey=parser.getCurrentName();
                String jsonValue=parser.getText();
                if(jsonKey=='firstName')
                {
                    fname=jsonValue;
                }else  if(jsonKey=='lastName')
                {
                    lname=jsonValue;
                }else  if(jsonKey=='email')
                {
                    email=jsonValue;
                }/*else  if(jsonKey=='month')
                {
                    mm=jsonValue;
                }
            	else  if(jsonKey=='year')
                {
                    yy=jsonValue;
                }
            	else  if(jsonKey=='day')
                {
                    dd=jsonValue;
                }*/
        }
      //  Date doj=Date.newInstance(Integer.valueOf(yy), Integer.valueOf(mm),Integer.valueOf(dd));
        Employee_REST__c emp=new Employee_REST__c(First_Name__c=fname,Last_Name__c=lname,Email__c=email); /*,ASVNamespace__Joining_Date__c=doj*/
        insert emp;

        return emp;
    }
    @HTTPDelete
    global static Employee_REST__c deleteRecord()
    {
        Map<String,String>  paramsMap=RestContext.request.params;
        String empid=paramsMap.get('id');
        Employee_REST__c emp=[select id,name,First_Name__c,Last_Name__c,Email__c,Joining_Date__c from Employee_REST__c where id=:empid ];
        delete emp;
        return emp;
    }
    @HTTPPut
    global static Employee_REST__c updateRecord()
    {
        String fname,lname,email,phone,dd,mm,yy,objid;
        RestRequest req=RestContext.request;
        RestResponse res=RestContext.response;
        String jsonBody=req.requestBody.toString();
        JSONParser parser=JSON.createParser(jsonBody);
        while(parser.nextToken()!=null)
        {
                String jsonKey=parser.getCurrentName();
                String jsonValue=parser.getText();
                if(jsonKey=='firstName')
                {
                    fname=jsonValue;
                }else  if(jsonKey=='lastName')
                {
                    lname=jsonValue;
                }else  if(jsonKey=='email')
                {
                    email=jsonValue;
                }else  if(jsonKey=='month')
                {
                    mm=jsonValue;
                }
            	else  if(jsonKey=='year')
                {
                    yy=jsonValue;
                }
            	else  if(jsonKey=='day')
                {
                    dd=jsonValue;
                }else  if(jsonKey=='id')
                {
                    objid=jsonValue;
                }
        }
        Date doj=Date.newInstance(Integer.valueOf(yy), Integer.valueOf(mm),Integer.valueOf(dd));
        Employee_REST__c emp=new Employee_REST__c(First_Name__c=fname,Last_Name__c=lname,Email__c=email,Joining_Date__c=doj,id=objid);
        update emp;
        return emp;
    }
}