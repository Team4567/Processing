// Example5 - four balls, using a ball class
//
// Finally a reasonably well written program.
// Once you understand this one, you are ready to dive into BouncingBalls.
//

// Here I introduce a new class called an ArrayList
// This is part of Java and is one of the most used classes.
//
// The ArrayList is designed to hold on to a set of objects.
// Objects are added by calling "add"
// They can be removed by calling "remove".

// This ArrayList is declared to hold Ball objects
// This syntax is quite verbose, I don't like this part of Java but there it is.
// The actual variable we are declaring is "balls".
// There is an Arraylist of Ball classes named balls. If anything is added that is not a Ball class, the code will fail, indicated by the <Ball>
ArrayList<Ball> balls = new ArrayList<Ball>();


void setup() {
    size( 800, 600 );

    // Create our first ball
    Ball b1 = new Ball(100, 20, 1, color(255, 0, 0) );
    
    // The ArrayList we declared above is called "balls".
    // We call the "add" routine to add the new ball (b1) to the List.
    balls.add( b1 );

    // Same for the second Ball
    Ball b2 = new Ball(150, 40, 2, color(0, 255, 0) );
    balls.add( b2 );

    // We really don't need to assign the new ball to a variable.
    // We can just pass it straight into the "add" routine:
    balls.add( new Ball(200, 60, 3, color(0, 0, 255) ) );
    balls.add( new Ball(250, 80, 4, color(255, 255, 0) ) );
}

void draw() {
    background(255);

    // Here is were it gets interesting.
    
    // To retrieve a ball from the ArrayList we use "get"
    // The first ball we put in the list is number 0 then 1, 2, ....
    // Ball b = balls.get(0);
    // b.move();
    // b.draw();
    // 
    // b = balls.get(1);
    // b.move();
    // b.draw();
    //
    // But there is a better way.
    // A "for" loop will let us run code over and over.
    // We can use a for loop to run "move" and "draw" for each ball in the balls ArrayList

    // The "for" command below does the following:
    // Create a variable i and initialize it to zero
    // before running the code in the braces ({}) check the condition to make sure it is true.
    // calling balls.size() returns 4, the size of the ArrayList (we put 4 balls in the List)
    // The final part, i++, is shorthand for i=i+1, or add 1 to i
    // This loop will run 4 times, when i is 0, then i is 1, then i is 2...
    // REMEMBER CODE/ARRAYS START ON 0, NOT 1.
    // When i reaches 4 then it stops because i won't be less than 4, the size of the List.
    // for (new variable; is this true about the variable?; do this each time to the variable each time its true, and run this in brackets){
    //}
    for( int i=0; i<balls.size(); i++ ) {
        Ball b = balls.get(i);
        b.move();
        b.draw();
    }
    
    // This code is much better because if you add another ball 
    // you do not need to change the code in draw.
    // The ArrayList will have a size of 5 and the loop will run that extra time automatically.
}


// Time for some Processing magic
//
// If you define a routine called "mousePressed" then Processing will call it if a mouse
// button is pressed.  In addition, there are variables you can use to find out where the mouse
// is pointing, mouseX and mouseY.
// Go ahead and click the mouse to see what happens.

void mousePressed() {
    // random is a Processing routine that returns a random number from 0 to the number you say
    // the returned value is actually floating point number (with decimals)
    // For example, a return value might be: 2.2312367
    // the (int) says to round it to an int, the type of the speed variable.
    // The color routine takes floats as its arguments so no converting necessary.
    //
    // Note that random can return 0.01 which rounds to 0
    // You will see balls just sit in one place and not move.
    
    int speed = (int)random(4);
    int c = color( random(255), random(255), random(255) );
    
    balls.add( new Ball( mouseX, mouseY, speed, c ) );
}
