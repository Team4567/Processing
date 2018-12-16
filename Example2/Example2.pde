// Example2 - four balls
//
// This is a very poorly designed program.
// The primary problem is that if you want to add a ball you have to add code
// What if you wanted to have 100 balls?  This program would be quite big.
// Also, what if you don't know how many you'll want to have?
// We'll tackle that problem in the next examples.

// Let's declare an x and y variable for each ball
int x1 = 100;
int y1 = 20;
int x2 = 150;
int y2 = 40;
int x3 = 200;
int y3 = 60;
int x4 = 250;
int y4 = 80;

// Declare a variable to hold the speed for each ball.
// Each ball may move at a different speed.
int speed1 = 1;
int speed2 = 2;
int speed3 = 4;
int speed4 = 5;

// Each ball can have a fill color
// the color command takes the three parts of a color (red, green, blue) and
// encodes it into a number that can be stored in an integer.
int color1 = color( 255, 0, 0 );
int color2 = color( 0, 255, 0 );
int color3 = color( 0, 0, 255 );
int color4 = color( 255, 255, 0 );

void setup() {
    size( 800, 600 );
}

void draw() {
    background(255);
    
    y1 = y1 + speed1;
    y2 = y2 + speed2;
    y3 = y3 + speed3;
    y4 = y4 + speed4;
    
    // Check to see if the ball went off the bottom or above the top.
    // the top row is y=0 and the bottom is y=599.
    // 
    // if so we'll set the ball to the endge and negate the speed.
    // this will make the ball travel in the opposite direction.
    
    if ( y1 > 599 ) {
        y1 = 599;
        speed1 = -speed1;  // set speed1 to the negative of the current value
    }
    if ( y1 < 0 ) {
        y1 = 0;
        speed1 = -speed1;  // set speed1 to the negative of the current value
    }
    
    if ( y2 > 599 ) {
        y2 = 599;
        speed2 = -speed2;  // set speed1 to the negative of the current value
    }
    if ( y2 < 0 ) {
        y2 = 0;
        speed2 = -speed2;  // set speed1 to the negative of the current value
    }
    
    if ( y3 > 599 ) {
        y3 = 599;
        speed3 = -speed3;  // set speed1 to the negative of the current value
    }
    if ( y3 < 0 ) {
        y3 = 0;
        speed3 = -speed3;  // set speed1 to the negative of the current value
    }
    
    if ( y4 > 599 ) {
        y4 = 599;
        speed4 = -speed4;  // set speed1 to the negative of the current value
    }
    if ( y4 < 0 ) {
        y4 = 0;
        speed4 = -speed4;  // set speed1 to the negative of the current value
    }

    // And finally after updating the balls, time to draw them.
    fill( color1 );
    ellipse( x1, y1, 30, 30 );
    
    fill( color2 );
    ellipse( x2, y2, 30, 30 );
    
    fill( color3 );
    ellipse( x3, y3, 30, 30 );
    
    fill( color4 );
    ellipse( x4, y4, 30, 30 );
}
