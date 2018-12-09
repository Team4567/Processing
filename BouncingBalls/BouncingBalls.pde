
// An ArrayList is a list of things.
// In this case <Ball> indicates that we need a list of Ball objects.
// Note, this does not create the list.
// "balls" is simply declared to be able to point to one.
// Variables declared outside of a function (like setup) are visible to all code in this file.

ArrayList<Ball> balls;

// Setup is called once.
// Put code here that you only need to run at the startup of your sketch.

void setup() {
    // Set the screen size to 1024x768
    // You might need to make this smaller if you have a small screen.
    size( 800, 600 );

    // Now is the time to actually create our list of Ball objects.
    // Make the "balls" variable point to the new ArrayList.
    // A new ArrayList starts out empty.
      // Does <Ball> mean each time an item is added to the real it is automatically a Ball class?
      // No, if you attempt to add something that isn't a Ball it will be a syntax error.
      // I'll add another note below when I add a ball.
    balls = new ArrayList<Ball>();
}

// "draw" gets called over and over in a loop while the program is running.
// Code here usually changes the objects then draws them.
// In this case we'll call "fall" for each of the balls in our ArrayList, then draw them.

void draw() {
    // Redrawing the background erases anything that was on the screen before.
    // If you are unsure why we need this try commenting it out. (//)
    background(255);

    // A "stroke" is the line that makes a shape.
    // noStroke means we don't want a border on our circles.
    noStroke();

    // "for" loops for each ball in the ArrayList "balls", one at a time.
    // For each loop, the next ball is assigned to "b".
    // Never understood "for"
    // for each ball in the array Balls, called b for simplicity, do this?
    // This kind of "for" is relatively new to Java, many other languages had it so they added it.
    // I'll put in the old style code which was easier to understand, but longer, for comparison.
    // Note that ArrayList items are numbered 0 through size-1, the 0 item being the 0 offset from the beginning.
    // This confuses everybody at first.  It is a holdover from the VERY early days of programming.
//  for( Ball b : balls ) {

  // Original "for" loop:
    /*
    Every time mouse is clicked or moved while held down, a "ball" is added to the array with its x and y confirmed.
    When the code realizes a new ball is the array, aka when the i of the for statement is less than the size, 
    the for loop will draw the ball with a random color and start its falling. By doing the code again, it equalizes i and the size.
    */
    for( int i=0; i<balls.size(); i++) {  // declare "i" to count through the ArrayList, initialize to zero 
                                          // while i is less then the size of the list, perform the code in the loop
                                          // each time, after the code in the is done, increment i by 1
                                            // After watching a khanacademy on for, the old style like this came back to memory.
        // Get the i'th element of the ArrayList
        Ball b;
        b = balls.get(i);
  // end alternate "for"
  
        // Call "fall" on the ball.
        b.fall();
        
        // "fill" is the color inside of a shape, a circle in this case.
        // Each of the balls has a different color so we set this just before drawing each one.
        fill( b.getColor() );
        
        // Ask the Ball for its x and y value to place the ball in the window.
        // An ellispe that is 30 pixel tall and 30 pixels wide is a circle.
        ellipse( b.getX(), b.getY(), 30, 30 );
    }

    // After a while the balls lose all their energy and are just sitting on the ground.
    // The "onlyBouncingBalls" routine will remove these balls from the ArrayList
    // It does this by creating a new ArrayList with only bouncing balls.
    // This is returned and assigned to "balls".
    // The old ArrayList (that "balls" used to point to) is deleted automatically.
    balls = onlyBouncingBalls( balls );
    
    // Set the fill to black to draw the text
    fill(0);
    
    // Draw the number of balls in the upper left corner of the window.
    // This asks "balls", the ArrayList, for its size.
    text( balls.size(), 20, 20 );
}

// "mousePressed" is called automatically whenever a button on the mouse is pressed.
// This is only called once even if the button is held down.
// You can find out the position of the mouse by looking at "mouseX" and "mouseY"

void mousePressed() {
    // Add a new ball to the ArrayList
    addBall();
}

// "mouseDragged" is called automatically whenever the mouse is moved, even if no button pressed.
// It is called over and over as the mouseX and mouseY values change (mouse moved).

void mouseDragged() {
    // Add a new ball to the ArrayList
      //Not Working? Balls only added when clicked
      // hum, working for me....  This is a click (hold down) and drag operation, try that.
    addBall();
}
      //How is addBall used above if it is defined below?
      // Ah, yes.  I little "Processing" magic going on here.
      // When you are writting code within a class you can refer to routines later down in the file.
      // This is because the entire file is compiled into class code before anything is run.
      // "Processing" takes all of the code in this file and wraps it in a class for you.

void addBall() {
    // Add a new Ball to the ArrayList
    // Pick a random color
    // Colors are made up of an amount of Red, Green and Blue
    // Each range from 0 to 255, making for 16 million possible colors.
    // "random" just picks a value from 0 to the number given.
    // The "color" routine returns the color number that can be stored in an "int".
      //color changes every loop
      // No, it changes every time we create a new ball.
      // Once we create a ball it holds these values unless we change them, as we do with x and y.
    int c = color( random(256), random(256), random(256) );
    
    // "balls", the ArrayList, has a method to call to add a new Ball to the ArrayList
    // A new Ball is created to pass to "add".
    // The Ball is created at the current position of the mouse with the random color.
    //
    // This command, new Ball( mouseX, mouseY, c ), says to create a new Ball with these arguments.
    // I got lazy and put this right in as the argument to balls.add( )
    
//    balls.add( new Ball( mouseX, mouseY, c ) );

  // Alternate code:
    Ball newBall = new Ball( mouseX, mouseY, c );
    balls.add( newBall );
    
    // If newBall wasn't a Ball type this code would not even compile.
}

// Routine to remove the Balls that are no longer bouncing
// This is done by creating a new list with only the Balls that are NOT "onTheFloor"
ArrayList<Ball> onlyBouncingBalls( ArrayList<Ball> oldList ) 
{
    // Create a new empty ArrayList
    ArrayList<Ball> newList = new ArrayList<Ball>();
 
    // Loop over all of the Balls in this list
      // oldList is the balls in the balls array, stated in line60?
    for( Ball b : oldList ) {
        // Check if the Ball in NOT(!) on the floor
        if( !b.isOnFloor() ) {
            // Add the Ball to the new list
            newList.add( b );
        }
    }

    // Return the new ArrayList
    return newList;
}

/*
  There is an array called Balls
  The screen is 1024x768, it has a white background (255,255,255), don't put outline on anything
  Each time the mouse is clicked, a ball will be added to the array, starting at the x and y of the mouse, with a random color made in the loop the mouse was clicked, 30x30, and created to the screen
  Balls will upon creation, starting at a speed of 1, increasing by .2 until they hit the floor. The speed will immediately be flipped back up at an upwards speed of 85% from when it hit the floor. 
  Gravity (.2) will keep on being added back every loop and pulling it back down
  Eventually, the upward speed from hitting the floor will reach 0 and start to increase down because of gravity.
  This repeats as long as needed until the ball hits the floor, and after the reversal the speed it should've gone up at is below 0.2. At this point, the ball is filtered out of the Balls list by the onlyBounceingBalls
  
 
*/
