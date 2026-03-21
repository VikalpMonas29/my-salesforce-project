public class EditContact {
   contact con;
    public EditContact()
    {
        id conid=apexpages.currentPage().getParameters().get('id');
        con=[select firstname,lastname,email,phone from contact where id=:conid];
    }
    public contact getCont()
    {
        return con;
    }
    public void edit()
    {
        update con;
    }
}