// Example3 - four balls, using a ball class
//
// This program is still pretty bad.
// The introduction of the Ball class organizes the variables a little better.
// But we still have the code duplicated for each ball object.
// We use the "." operator to access a variable in an object.
// See the Ball class to see the declaration of the x, y, speed, and color variables.
// This has its own tab.

// Declare the 4 ball objects.
// Initialize each with a new Ball.
Ball b1 = new Ball();
Ball b2 = new Ball();
Ball b3 = new Ball();
Ball b4 = new Ball();

void setup() {
    size( 800, 600 );

    // Initializing the ball objects only needs to be done once.
    // We put code that only runs once in the setup routine.

    // Initialize the b1 object
    b1.x = 100;
    b1.y = 20;
    b1.speed = 1;
    b1.c = color( 255, 0, 0 );
    
    // Initialize the b2 object
    b2.x = 150;
    b2.y = 40;
    b2.speed = 2;
    b2.c = color( 0, 255, 0 );
    
    // Initialize the b3 object
    b3.x = 200;
    b3.y = 60;
    b3.speed = 3;
    b3.c = color( 0, 0, 255 );
    
    // Initialize the b4 object
    b4.x = 250;
    b4.y = 80;
    b4.speed = 4;
    b4.c = color( 255, 255, 0 );
}

void draw() {
    background(255);

    // Move the balls
    b1.y = b1.y + b1.speed;
    b2.y = b2.y + b2.speed;
    b3.y = b3.y + b3.speed;
    b4.y = b4.y + b4.speed;
    
    // Check to see if the ball went off the bottom or above the top.
    // the top row is y=0 and the bottom is y=599.
    // 
    // if so we'll set the ball to the endge and negate the speed.
    // this will make the ball travel in the opposite direction.
    
    if ( b1.y > 599 ) {
        b1.y = 599;
        b1.speed = -b1.speed;  // set speed1 to the negative of the current value
    }
    if ( b1.y < 0 ) {
        b1.y = 0;
        b1.speed = -b1.speed;  // set speed1 to the negative of the current value
    }
    
    if ( b2.y > 599 ) {
        b2.y = 599;
        b2.speed = -b2.speed;  // set speed1 to the negative of the current value
    }
    if ( b2.y < 0 ) {
        b2.y = 0;
        b2.speed = -b2.speed;  // set speed1 to the negative of the current value
    }
    
    if ( b3.y > 599 ) {
        b3.y = 599;
        b3.speed = -b3.speed;  // set speed1 to the negative of the current value
    }
    if ( b3.y < 0 ) {
        b3.y = 0;
        b3.speed = -b3.speed;  // set speed1 to the negative of the current value
    }
    
    if ( b4.y > 599 ) {
        b4.y = 599;
        b4.speed = -b4.speed;  // set speed1 to the negative of the current value
    }
    if ( b4.y < 0 ) {
        b4.y = 0;
        b4.speed = -b4.speed;  // set speed1 to the negative of the current value
    }

    // And finally after updating the balls, time to draw them.
    fill( b1.c );
    ellipse( b1.x, b1.y, 30, 30 );

    fill( b2.c );
    ellipse( b2.x, b2.y, 30, 30 );

    fill( b3.c );
    ellipse( b3.x, b3.y, 30, 30 );

    fill( b4.c );
    ellipse( b4.x, b4.y, 30, 30 );
}
