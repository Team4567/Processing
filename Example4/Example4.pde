// Example3 - four balls, using a ball class
//
// This example is much better than the others.
// We still can't handle any number of balls but at least the code is much smaller
// You saw how we had to write a line of code for each x, y, speed, and c for each ball. Now, it can go in the parentheses when the ball is defined!
// Also, each group of actions we did, such as the moving (b1.y = b1.y + b1.speed) and giving the color and drawing, into 1 simple line!
// This will all be explained in the ball file.
// Declare the 4 ball objects.
// Initialize each with a new Ball.
Ball b1 = new Ball(100, 20, 1, color(255, 0, 0) );
Ball b2 = new Ball(150, 40, 2, color(0, 255, 0) );
Ball b3 = new Ball(200, 60, 3, color(0, 0, 255) );
Ball b4 = new Ball(250, 80, 4, color(255, 255, 0) );

void setup() {
    size( 800, 600 );

    // No need to initialize the balls here any more.
    // We initialized them when we created them (new).
}

void draw() {
    background(255);

    b1.move();
    b1.draw();
    
    b2.move();
    b2.draw();

    b3.move();
    b3.draw();

    b4.move();
    b4.draw();
}
