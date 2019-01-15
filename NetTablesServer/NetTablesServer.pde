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

void setup() {
    size(640, 480); //<>//
    
    inst = NetworkTableInstance.getDefault();
    table = inst.getTable("datatable");
    xEntry = table.getEntry("x");
    yEntry = table.getEntry("y");
    
    // Runs a server on the "localhost"
    inst.startServer();
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
}

void mousePressed() {
  xEntry.setDouble( mouseX );
  yEntry.setDouble( mouseY );
}
