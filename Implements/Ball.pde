// Simple Ball

// This Ball class implements the interface: Comparable
//
// We are adding this so that the balls can be compared to each other.
// In this case we will use the "y" value to decide which ball is less than the another.
// We are doing this so that we can sort our ArrayList of Balls using the standard:
// Collections.sort( List ) routine in the java.util library package.
// This routine can sort any List of Comparable objects.
//
// When a class implements an interface it is declaring that it has the methods as
// defined by the interface.  The Comparable interface requires that the class have a method:
// public int compareTo( Object o );
//
// Note this is different from extends because the interface doesn't have any code for this
// routine.  We must supply this routine.
//
// The difference can seem subtle but they mean two different things.
// Extends is used when the "subclass" is still like the super class but has some extra stuff.
// The ColoredBall is still a Ball but has color added.
//
// An interface is like an attribute or characteristic of the object.
// Implementing Comparable states: "I can be compared" (I have a routine compareTo).
// An object can only extend one other object but can implement any 
// number of interfaces.
//
// Side Note:
// All classes extend "Object" you do not need to specify this, Java just includes it.
// By extending Object you get a couple of methods for free:
// equals, getClass, hashCode, and notify.
// Technically, if you want your class to behave like a "real" Java class you should be
// overriding these with proper code.  Often programmers get lazy.  When they know they
// won't be using these methods they don't bother overriding them.  Also, overriding them
// incorrectly can be worse than not at all.
// For example, if you aren't going to be using your object as a key in one of the set/hash
// Collections you won't likely be calling equals or hashCode.
// More on this later.  Writing correct overrides of the Object methods can be very tricky.
// 

class Ball implements Comparable {
  
    public static final float GRAVITY = 0.2;  
    public static final float BOUNCE_SPEED = 0.85;

    protected float x, y;    // The current X and Y position 
    protected float speed;   // The current speed (changes with each call to "fall"
    
    Ball( int x, int y ) {
        this.x = x;
        this.y = y;
        this.speed = 0.0;
    }

    public float getX() {
      return x;
    }
    public float getY() {
      return y;
    }

    // Fall should be called about 20 times per second to look real.
    // This is about how often draw() gets called in Processing.
    public void fall() {
        this.speed += GRAVITY;
        this.y += this.speed;

        if( this.y >= height ) {
            this.y = height;
            this.speed *= -BOUNCE_SPEED;
        }
    }
    
    public boolean isOnFloor() {
        return (this.y == height && abs(this.speed) < 0.2 );
    }
    
// The Comparable interface requires a method called compareTo( Object o ) but we know it will
// always be called with a Ball object.  We know this because we will be using Collections.sort()
// to sort our ArrayList.  The sort algorithm calls compareTo over and over comparing Balls in
// the list while sorting. 
// We "cast" this object to a Ball so that we can work with it as a Ball.  This is dangerous 
// because if the object isn't a Ball it will throw an exception at the time the code is run and
// the program will stop (as it is written, we can catch this and continue).
//
// The return code of this routine is an integer that is negative, zero or positive.
// If "this" object is less than the supplied object the return is negative.
// If the two are equal, return zero.
// If "this" object is greater, return positive.
// The magnitude of the number doesn't matter.
// We are comparing the height, or "y" value.

    public int compareTo( Object o ) {
        Ball b = (Ball)o;   // Careful, 'o' better be a Ball or this will crash!
                            // We could use "instance of" operator to test, but, there isn't 
                            // anything we can do if 'o' isn't a Ball, no return value is correct.
                            // So, we just let it throw an exception for now.
        
        // 'y' is a float, we'll need to convert (cast) to the required int return type.
        // Notice that I convert each number to an int first.
        // This is because if we substract first then convert we can hit some crazy edge cases.
        // Computers approximate float numbers.  Unfortunately, 1/10 is irrational in base 2 so
        // it converts to something like: 0.099999999 this can lead to some incorrect pos/neg values.
        // (int) rounding to the nearest whole number first will give predictable results.
        //
        return (int)this.y - (int)b.y;
    }
};
