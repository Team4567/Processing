// The Ball will get much more useful now.
// Not only will we have the declaration of the variables that a ball has
// we will also create some routines (often calls "methods")
// 
// when we write the code:   line( 1, 10, 20, 30) 
// We are actually calling a routine, called line, that will draw the line for us.
// We pass in arguments to that routine to affect how the line is to be drawn.
//
// We will add routines to our Ball class to handle:
//   Initializing (constructing)
//   move
//   draw

class Ball {
    public int x;
    public int y;
    public int speed;
    public int c;  // can't use the work color because that is a command.

    // This is a special routine called a constructor
    // It gets called when we "new" an object.
    // We pass in arguments that are used to initialize the variables of this new ball.
    
    Ball( int x, int y, int speed, int c ) {
        this.x = x;
        this.y = y;
        this.speed = speed;
        this.c = c;
    }

    // The logic that we had to adjust the y variable is placed here.
    // Note that a specific ball (this one) only has a single x, y, speed, c
    // We don't need any arguments, the variables in the object have all we need.
    public void move() {
        // Move the ball
        y = y + speed;
    
        if ( y > 599 ) {
            y = 599;
            speed = -speed;
        }
        if ( y < 0 ) {
            y = 0;
            speed = -speed;
        }
    }

    // Draw the ball using the current values stored in the balls variables.
    public void draw() {
        fill( c );
        ellipse( x, y, 30, 30 );
    }
};
