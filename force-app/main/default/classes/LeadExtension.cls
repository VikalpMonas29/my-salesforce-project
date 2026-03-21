public class LeadExtension {
 
    public List<Lead> leadList{set; get;}

    //use the class as a extension 

    //parameterized constr

    public LeadExtension(){

        leadList=[select name,status from Lead order by name desc];    

    }
    /*

    public LeadExtension(MyAccountCustController mycon){

        leadList=[select name,status from Lead order by name]; 

    }*/

}