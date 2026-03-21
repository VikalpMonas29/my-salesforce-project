public class Student {
  public integer rollno;
  public string name;
    
    public Student(){
        system.debug('in def contrustor.....');
    }
    public Student(integer roll, string nm){
        system.debug('in para constr.....');
        this.rollno=roll;
        this.name=nm;
    }
      
    public void setRollno(integer r){
        this.rollno=r;
    }
    public void setName(string n){
        this.name=n;
    }
    public integer getRollno(){
        return rollno;
    }
    public string getName(){
        return name;
    }   
    public void show(){
        system.debug('Name=>'+this.name+' '+'Rollno=>'+this.rollno);
    }
}