// This will demonstrate a motor controller in the real robot and how's it's used in real code.
// I will be demonstrating using the term Spark, this is a commmon motor controller.
// Allthough this year, you might see more TalonSRX, but its the same functions.



//Traditionally, I named motor controllers by what part of the robot they control.
// Motor Controllers have 2 basic functions (excluding when we start attatching encoders to them). set, and setInverted.
// get and getInverted can be used in real code, but are really just for diagnosis use
// They are described in the Spark class.
// There are also speedcontroller groups, where all of these actions can be done on the same motor controller group at the same time, but we'll get to that in normal code if we need to.
// Spark leftWheelFront= new Spark(0);
// Spark leftWheelBack= new Spark(1);
// SpeedControllerGroup leftWheels = new SpeedControllerGroup(leftWheelFront, leftWheelBack);

// This one below would work if you knew that you would NEVER need one of the wheels to act differently than the other, because they won't be able to be called individually.
// SpeedControllerGroup leftWheels = new SpeedControllerGroup(new Spark(0), new Spark(1));

// When this is ran, you'll see a Spark with information on its wires, and the current speed and inversion state set in the code below. Play around with them.

Spark leftWheel= new Spark(0);


public PImage img;
void setup(){
  size(800,600);
  img=loadImage("Spark.jpg");
}

void draw(){
  

  background(255);
  // Currently set to 50% forward, and inverted.
  leftWheel.set(0.5);
  leftWheel.setInverted(true);
  // leftWheel.draw wouldn't be part of real code, it is just here because we are visualizing a motor controller.
  leftWheel.draw(img, 300,100);
  
  
}
void mousePressed(){
  // println prints code to the console, which is the black box below this code. 
  // Sending info to console will have a different name in real code, but this is to show get and getInverted.
  println(leftWheel.get());
  println(leftWheel.getInverted());
}
