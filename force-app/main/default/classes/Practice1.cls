public class Practice1 {
    public static void Run(){
  // Create a list and add elements to it in one step
List<String> colors = new List<String> { 'red', 'green', 'blue' };
// Add elements to a list after it has been created
List<String> moreColors = new List<String>();
   moreColors.add('orange');
   moreColors.add('purple');
        
        // Get elements from a list
String color1 = moreColors.get(0);
String color2 = moreColors[0];
System.assertEquals(color1, color2);
// Iterate over a list to read elements
for(Integer i=0;i<colors.size();i++) {
    // Write value to the debug log
    System.debug(colors[i]);
}
    }
}