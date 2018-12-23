
// Note, our ArrayList is declared to hold Ball objects.
ArrayList<Ball> balls;


void setup() {
    size( 800, 600 );
    balls = new ArrayList<Ball>();
}


void draw() {
    background(255);

    noStroke();

    // Should get used to this style, considered more modern.
    for( Ball b : balls ) {
        // Call "fall" on the ball.
        b.fall();

        // Call "draw" on the ball.
        b.draw();
    }

    balls = onlyBouncingBalls( balls );
    
    fill(0);
    text( balls.size(), 20, 20 );
}

void mousePressed() {
    if( mouseButton == LEFT ) {
        // Add a Ball object to the ArrayList
        // These will be black
        balls.add( new Ball( mouseX, mouseY ) );
        
    }
    else {
        // Add a ColoredBall object with a random color to the ArrayList
        // Can we do that?  "balls" is declared to hold Ball objects, not ColoredBalls.
        // We can because ColoredBall extends Ball.  We say that ColoredBall is-a Ball.
        //
        // When we use a subclass object (ColoredBall) using a reference that is declared 
        // as the super class (Ball), we can only use the features of the subclass.
        // for example, even though our object is a ColoredBall we will not be able to say:
        // b.getColor() since this method was added by the ColoredBall subclass.
        //
        // HOWEVER, any methods in Ball that are overridden by ColoredBall will result
        // in the overridden method to be called.
        //
        // This concept of a "Ball" taking on different behaviors is called: Polymorphism
        
        int c = color( random(256), random(256), random(256) );
        balls.add( new ColoredBall( mouseX, mouseY, c ) );

        // Side note, the variable "c" is declared with in a pair of braces {}
        // The variable only exists within these braces, as soon as we leave, it is gone.
        // We say that "c" has a "scope" of only this block of code.
        // We might have declared "c" as the first line in this method.
        // Then, the variable would be scoped until the end of the method, the matching }
        // 
        // Private member variables in a class have a scope that includes all of the methods 
        // in the class it was declared.
        // Public member variables have a scope that includes all code.
    }
}

// Routine to remove the Balls that are no longer bouncing
// This is done by creating a new list with only the Balls that are NOT "onTheFloor"
ArrayList<Ball> onlyBouncingBalls( ArrayList<Ball> oldList ) 
{
    ArrayList<Ball> newList = new ArrayList<Ball>();
    for( Ball b : oldList ) {
        if( !b.isOnFloor() ) {
            newList.add( b );
        }
    }

    return newList;
}
