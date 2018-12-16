// The Ball class will be much more useful now.
// Not only will we have the declaration of the variables that a ball has
// we will also create some routines (often called "methods")
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
  // What variables will be used will be put here.
    public int x;
    public int y;
    public int speed;
    public int c;  // can't use the work color because that is a command.

    // This is a special routine called a constructor
    // It gets called when we "new" an object.
    // We pass in arguments that are used to initialize the variables of this new ball.
    // This tells how many pieces of data and what types must be put in the parentheses when a ball is made, aka lines 10-14 of Ex4.
    // If all 4 weren't there, or if a decimal was used (these are int, no decimals), the code wouldn't compile and give an error.
    Ball( int x, int y, int speed, int c ) {
       // this prevents the code from confusing the x, y, speed, and c of one ball with other balls. So many variables will be named the same thing, but each will be with b1, b2, etc.
       // Ex b1.x  and b2.x both use x, but can be different numbers because of "this"
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
    // eventually this can be cleaned up as "y += speed". y is itself + speed.
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
