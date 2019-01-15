
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
//    inst.startClientTeam(4567);
    inst.startClient("localhost");
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
