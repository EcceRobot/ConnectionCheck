import interfascia.GUIController;      //for input field
import interfascia.IFTextField;        //for input field
import interfascia.IFLabel;            //for input field
import interfascia.GUIEvent;            //for input field
import java.net.InetAddress;           //for ping
import java.net.UnknownHostException;  //for ping


////////////////////GLOBAL VARIABLES/////////////////////////////


//interfascia
GUIController myGUIController;
IFTextField IP_1_IFTextField, IP_2_IFTextField, IP_3_IFTextField, IP_4_IFTextField;
IFLabel IP_1_IFLabel, IP_2_IFLabel, IP_3_IFLabel, IP_4_IFLabel;


int timeOut = 100; // milliseconds
int T_now; //ms

//default IPs
String IP_1_address = "192.168.0.100";
String IP_2_address = "192.168.0.1";
String IP_3_address = "192.168.0.254";
String IP_4_address = "8.8.8.8";

boolean IP_1_reachable, IP_2_reachable, IP_3_reachable, IP_4_reachable;

PImage img_logo, img_chain;




void setup() {

  size(426, 350);
  textSize(20);

  imageMode(CORNER); //same as default rect
  img_logo = loadImage("logo.gif");
  img_chain = loadImage("signal_chain_1.png");

  //interfascia
  myGUIController = new GUIController(this);

  IP_1_IFTextField = new IFTextField("IP_1", 200, 50, 150);
  IP_1_IFLabel = new IFLabel(IP_1_address, 100, 55, 20);

  IP_2_IFTextField = new IFTextField("IP_2", 200, 120, 150);
  IP_2_IFLabel = new IFLabel(IP_2_address, 100, 125, 20);

  IP_3_IFTextField = new IFTextField("IP_3", 200, 190, 150);
  IP_3_IFLabel = new IFLabel(IP_3_address, 100, 195, 20);

  IP_4_IFTextField = new IFTextField("IP_4", 200, 260, 150);
  IP_4_IFLabel = new IFLabel(IP_4_address, 100, 265, 20);

  myGUIController.add(IP_1_IFTextField);
  myGUIController.add(IP_1_IFLabel);
  myGUIController.add(IP_2_IFTextField);
  myGUIController.add(IP_2_IFLabel);
  myGUIController.add(IP_3_IFTextField);
  myGUIController.add(IP_3_IFLabel);
  myGUIController.add(IP_4_IFTextField);
  myGUIController.add(IP_4_IFLabel);
  
  IP_1_IFTextField.addActionListener(this);
  IP_2_IFTextField.addActionListener(this);
  IP_3_IFTextField.addActionListener(this);
  IP_4_IFTextField.addActionListener(this);
}


void draw() {


  background(255);
  image(img_chain, 0, height-30, 426, 30);
  image(img_logo, 71, height-32, 123, 32);
 





  /************************PING**IP_1**********************************/

  if (isValidInet4Address(IP_1_address)) {
    try {

      T_now = millis();
      IP_1_reachable = InetAddress.getByName(IP_1_address).isReachable(timeOut);
      println((millis()-T_now) + " ms \t\t" + IP_1_address + "\t\t" + IP_1_reachable);
    }  
    catch(Exception E) {
    }
  } else {
    IP_1_reachable = false ;
    alert_triangle(365, 70);
  }


  /**********************PING****IP_2**********************************/

  if (isValidInet4Address(IP_2_address)) {
    try {
      T_now = millis();
      IP_2_reachable = InetAddress.getByName(IP_2_address).isReachable(timeOut);
      println( (millis()-T_now) + " ms \t\t" + IP_2_address + "\t\t" + IP_2_reachable);
    }
    catch(Exception E) {
    }
  } else {
    IP_2_reachable = false ;
    alert_triangle(365, 140);
  }


  /***********************PING***IP_3**********************************/

  if (isValidInet4Address(IP_3_address)) {
    try {
      T_now = millis();
      IP_3_reachable = InetAddress.getByName(IP_3_address).isReachable(timeOut);
      println((millis()-T_now) + " ms \t\t" + IP_3_address + "\t\t" + IP_3_reachable);
    }
    catch(Exception E) {
    }
  } else {
    IP_3_reachable = false ;
    alert_triangle(365, 210);
  }

  /**********************PING****IP_4**********************************/

  if (isValidInet4Address(IP_4_address)) {
    try {
      T_now = millis();
      IP_4_reachable = InetAddress.getByName(IP_4_address).isReachable(timeOut);
      println((millis()-T_now)+ " ms \t\t" + IP_4_address + "\t\t" + IP_4_reachable );
    }
    catch(Exception E) {
    }
  } else {
    IP_4_reachable = false ;
    alert_triangle(365, 280);
  }


   println("______________________________________________________________");





  /******************************TRAFFIC LIGHTS*****************************/


  if (IP_1_reachable) {
    fill(#00FF00);
  } else {
    fill(#FF0000);
  }
  ellipse(50, 60, 50, 50);

  if (IP_2_reachable) {
    fill(#00FF00);
  } else {
    fill(#FF0000);
  }
  ellipse(50, 130, 50, 50);

  if (IP_3_reachable) {
    fill(#00FF00);
  } else {
    fill(#FF0000);
  }
  ellipse(50, 200, 50, 50);

  if (IP_4_reachable) {
    fill(#00FF00);
  } else {
    fill(#FF0000);
  }
  ellipse(50, 270, 50, 50);
}//END OF DRAW



/////////////////////////////////////////FUNCTIONS////////////////////////////////////////////////////////////////////



// this let me extract values from input field and assign to program variables

void actionPerformed(GUIEvent e) {
  if (e.getMessage().equals("Completed")) {

    if (e.getSource() == IP_1_IFTextField) {
      IP_1_IFLabel.setLabel(IP_1_IFTextField.getValue());
      IP_1_address = IP_1_IFTextField.getValue();
    }

    if (e.getSource() == IP_2_IFTextField) {
      IP_2_IFLabel.setLabel(IP_2_IFTextField.getValue());
      IP_2_address = IP_2_IFTextField.getValue();
    }
    if (e.getSource() == IP_3_IFTextField) {
      IP_3_IFLabel.setLabel(IP_3_IFTextField.getValue());
      IP_3_address = IP_3_IFTextField.getValue();
    }
    if (e.getSource() == IP_4_IFTextField) {
      IP_4_IFLabel.setLabel(IP_4_IFTextField.getValue());
      IP_4_address = IP_4_IFTextField.getValue();
    }
  }
}





//Check IP validity, es. not 172.300.20.0

public static boolean isValidInet4Address(String ip)
{
  try {
    InetAddress inetAddress = InetAddress.getByName(ip);
    return inetAddress.getHostAddress().equals(ip); 
    //&& inetAddress instanceof Inet4Address;
  }
  catch (UnknownHostException ex) {
    return false;
  }
}







//draw a red alert triangle

void alert_triangle(int pos_x, int pos_y) {
  pushStyle();
  strokeWeight(3);
  stroke(#FF0000);
  noFill();
  triangle(pos_x, pos_y, pos_x+20, pos_y, pos_x + 10, pos_y - 17);
  popStyle();
}