// StartHere - First Processing sketch

//Welcome to code! Some of you may be familiarized with this, but lets all get a refresh on java.
//All of the words in gray are comments. Comment lines are those that start with // or are between a /* and */
//In here we'll be showing the basics of java. Variables, drawing using functions, and having variables change through loops.

// Lets define a variable, initial value of 1
// Variables can be all types, int means it can only be an integer, 1, 2, 3, -1, -4, NOT -4.4
// For Decimal numbers we'll use double, or sometimes float instead of int
// Try to use a decimal when you write int, the code will fail
// Only exception is random, but you'll learn that later.
// If you need a variable to hold text, use string
// double x=4.4;
// float z=4.4;
// string h= "Hello World!";
int y = 0;

// Setup is called once.
// Put code here that you only need to run at the startup of your sketch.

void setup() {
    // Set the window size to 800x600 (it can be anything)
    // You might want to make this smaller if you have a small screen.
    size( 800, 600 );
    
    // This means 800 pixels across (x) and 600 pixels top to bottom (y).
    // Unlike graphing, the y values get bigger as you get lower in the window.
    // 
    // The pixel in the:
    // top left corner is (0, 0)
    // top right corner is (799, 0)  
    // bottom left corner is (0, 599)
    // bottom right corner is (799, 599)
    
    // Draw the background color for the window in white.
    // Color is an amount of Red, Blue and Green.
    // If they are equal amounts it makes a shade of gray until it is so light it looks white.
    // The values range from 0 to 255.
    // Play around with different values.
    background(255, 255, 255);
}


// "draw" gets called over and over in a loop while the program is running.
// Depending on the code, draw can be called as many as 50 times each second.
// Code here usually changes some objects then draws them.

void draw() {
    // Redraw the background color.
    // Come back later and uncomment this line
    // If you only give one number (of the three) it uses this number for all three
    // color values.  This will always be gray of some intensity, white in this case.
    // background(255);
    
    // Draw an ellipse (circle) at x=100, y=50, 
    // that is 30 pixels tall and 30 pixels wide (equal height and width make a circle)
    // play with different values
    // ellipse "formula"- ellipse(x,y,width,height);
    ellipse( 100, 50, 40, 30 );
    
    // Use the 'y' variable above to remember a value and change it
    // We can use it to draw the circle:
    ellipse( 200, y, 30, 30 );
    
    // Change y, we'll take the current value and add 1 to it
    // This is an "Assignment" operation, don't confuse this for an equation.
    // the right side is evaluated first, the current value of y plus 1, then set y to that result.
    y = y + 1;
    
    // You see how it looks really weird? That's because of the way background is working.
    // Since it is only in setup, it is drawn once, then the first circle is drawn, then the one with y+1 is drawn on top, and the next on top of those 2, etc.
    // To make only 1 circle visible at a time, uncomment line 47. This will redraw the background every loop, so the old circle is covered by the background every loop
}

// other things to play with:
// line( x1, y1, x2, y2 ); - draws a line from point x1,y1 to x2,y2
// rect( x1, y1, x2, y2 ); - draws a rectangle using  point x1,y1 and x2,y2 as opposite corners
//
// color:
// stroke( Rvalue, Gvalue, Bvalue ); - sets the color that lines are drawn
// noStroke();  - don't draw the outter line on shapes 
// fill( Rvalue, Gvalue, Bvalue ); - sets the color that is used to fill solid shapes (rect)
// noFill();  - don't fill in shapes
//
// Help/Reference in the menu above will take you to a webpage with all of the commands.
