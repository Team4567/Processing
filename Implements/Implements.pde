// We'll be using Collections.sort, a standard Java utility.
// We must import any classes we plan to use.
// I'm saying to import all of the classes in java.util (I'm lazy).
import java.util.*;

//
// Demonstration of Interfaces
//
// Note, this isn't even remotely an efficient way to do this.
//
// Foreshadow of a future Computer Science class you'll take in college:
//
// This sketch will be sorting an array to find a minimum value.
// Sorting is, at best, an "O(n log n)" operation 
// (number of compare operations is n log n where n is the number of elements)
// A single scan through the list for the minimum value is simply "O(n)"
// Any operation done 'n' times will be less intensive than one done 'n log n'
//
// We use this notation to indicate how compute intensive an algorithm is.
// "n" means that the work is proportional to the number of elements in the list.
// A single scan, testing each elemment once, is "n" since the work grows with the 
// number of values.
// Sorting is not possible with a single test.  The better sort algoritms build a 
// binary tree leading to "n" times the log base 2 of "n" compare operations.
//
// There is a far better call that you can use:  Collections.min
// This will return the Object in the list that is the minimum value.
// See if you can fix this sketch to use this.

ArrayList<Ball> balls;

void setup() {
    size( 800, 600 );
    balls = new ArrayList<Ball>();
}


void draw() {
    background(255);

    noStroke();

    // Each time draw is called we reposition the balls and redraw them.
    // We draw the ball that is "highest" in red and all others black.
    // "highest" is the minimum 'y' value, the first in a sorted list.
    
    // First move all balls
    for( Ball b : balls ) {
        b.fall();
    }

    // Sort the ArrayList by using the Java Utility
    // The objects in the ArrayList must implement Comparable or they can't be sorted.
    // Don't bother sorting a list with a single item (or none).
    if( balls.size() > 1 ) {
        Collections.sort( balls );
    }
    
    // We want to draw only the first ball in the list in Red and the rest in black.
    // I use a flag variable to say if I've draw the first ball yet.
    // This is pretty inefficient and rather ineligant but I already mentioned this 
    // sketch is not my best work :)
    boolean isFirstDrawn = false;
    for( Ball b : balls ) {
        if( !isFirstDrawn ) {   // ! means 'not'
            fill( 255, 0, 0 );  // Red, this is a Red, Green, Blue (RGB) value.
            isFirstDrawn = true;
        }
        else {
            fill( 0, 0, 0 );  // Black
        }
        
        ellipse( b.getX(), b.getY(), 30, 30 );  // Draw a cirle.
    }

    balls = onlyBouncingBalls( balls );
    
    fill(0);
    text( balls.size(), 20, 20 );
}

void mousePressed() {
    balls.add( new Ball( mouseX, mouseY ) );
}

// Uncomment this only when you want to play with performance.
// If balls are too close together it is hard to see the red one.
//void mouseDragged() {
//    balls.add( new Ball( mouseX, mouseY ) );
//}

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
