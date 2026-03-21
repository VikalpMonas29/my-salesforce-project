public class Pizza {
 
    public string name;
    public static integer count;//null
    public Pizza(){
        system.debug('in def pizza constr');        
    }
    //non-static method can access static data member
    //non-static method can access non-static data member
    public Pizza(string pizzaname){ 
        system.debug('in para pizza constr');   
        this.name=pizzaname;
        system.debug(count);
    }
    public void setName(string pname){
        this.name=pname;
    }
    public string getName(){
        return name;
    }
    //static method can access static data member
    //static method can't access non-static data member
    public static void showCount(){
        system.debug('Number of pizza ordered=>'+count);
     }
}