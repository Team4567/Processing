// For best results when running both NetTables and NetTablesServer, run on commandline:
// processing-java --sketch=<full path to sketch folder> --force --run
// I changed to the repo directory and ran: 
// processing-java --sketch=%cd%/NetTablesServer --force --run
// processing-java --sketch=%cd%/NetTables --force --run
// You can click in either window to set a new x and y value.

import edu.wpi.first.networktables.NetworkTable;
import edu.wpi.first.networktables.NetworkTableEntry;
import edu.wpi.first.networktables.NetworkTableInstance;

NetworkTableInstance inst;
NetworkTable table;
NetworkTableEntry xEntry;
NetworkTableEntry yEntry;
NetworkTableEntry angleEntry;
public ArrayList<Contour> contours= new ArrayList<Contour>();
// The reason these are definted outside of setup is because otherwise contours.size() gave nullpointerexception
public Contour a= new Contour((int)random(0,256),(int)random(0,144));
public Contour b= new Contour((int)random(0,256),(int)random(0,144));
public Contour c= new Contour((int)random(0,256),(int)random(0,144));
public Contour ClosestC;
public double min;
public int minIndex;
public boolean isDone;
void setup() {
    size(256, 144); //<>//
    contours.add(a);
    contours.add(b);
    contours.add(c);
    inst = NetworkTableInstance.getDefault();
    table = inst.getTable("datatable");
    xEntry = table.getEntry("x");
    yEntry = table.getEntry("y");
    angleEntry= table.getEntry("angle");
    min = 999999999; //The largest # I could fit in a double
    minIndex = -1;
    isDone=true;
    
// If you are running on the DS you can use startDSClient
// You will need to have the robot connected since it is the NetworkTables server.
// See the Processing sketch NetTablesServer for running your own server on local host.
// In that case you use startClient("localhost")
// "localhost" is a special host name the always refers to the machine you are on.

//    inst.startDSClient(4567);
//    inst.startClientTeam(4567);
    inst.startClient("localhost");
}
void runCheck(){
  //isDone makes it happen forever
  if(isDone){
    isDone=false;
    for (int i=0; i<contours.size(); i++){
     if (contours.get(i).distanceToCenter() < min){
        min = contours.get(i).distanceToCenter();
        minIndex = i;
     }
     isDone=true;
    }
  }
}
void draw() {
    try {
        Thread.sleep(1000); //<>//
    } catch (InterruptedException ex) {
        System.out.println("interrupted");
        return;
    }
    double x = xEntry.getDouble(0.0);
    double y = yEntry.getDouble(0.0);
    
    System.out.println("X: " + x + " Y: " + y);
    runCheck();
  for(int i=0; i<contours.size();i++){
    if(i==minIndex){
      ClosestC=contours.get(i);
      contours.get(i).setClosest(true);
    } else{
      contours.get(i).setClosest(false);
    }
    NetworkTableEntry contX= table.getEntry("X of Contour " +i);
    NetworkTableEntry contY= table.getEntry("Y of Contour " +i);
    NetworkTableEntry isClose= table.getEntry("Is Contour " + i + " closest");
    contX.setDouble(contours.get(i).centerX);
    contY.setDouble(contours.get(i).centerY);
    isClose.setBoolean(contours.get(i).isClosest);
  }
  a.draw();
  b.draw();
  c.draw();
  fill(0);
  ellipse(width/2,height/2,10,10);
  
}

void mousePressed() {
  xEntry.setDouble( mouseX );
  yEntry.setDouble( mouseY );
  angleEntry.setDouble(mouseX/mouseY);
}
