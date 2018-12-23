// Simple Ball class to inherit from
// I've removed color, we'll add it back in a subclass.

class Ball {
    // Time to talk about public, private, and protected
    // A variable that is public can be accessed by any code that has a reference to an object.
    // A static variable exists even when there isn't an object.  We refer to this through the 
    // class name: Ball
    // For example, any code can access the GRAVITY value with: Ball.GRAVITY
    // This is okay because by declaring this "final" the value can't be changed.
    // No other code can mess with our GRAVITY value.
    //
    // IF x was declared:  public float x;
    // Any code could access x with:  
    // Ball b = new Ball( 10, 20 );
    // b.x = 5;
    // This changes the value of x in our object, this is bad.
    // By declaring this private, b.x would be a syntax error.
    //
    // The last choice is protected:  protected float x;
    // This allows code that is in classes that extend Ball to access the value.
    // See ColoredBall.
    
    public static final float GRAVITY = 0.2;  
    public static final float BOUNCE_SPEED = 0.85;

    protected float x, y;    // The current X and Y position 
    protected float speed;   // The current speed (changes with each call to "fall"
    
    Ball( int x, int y ) {
        this.x = x;
        this.y = y;
        this.speed = 0.0;
    }

    float getX() {
      return x;
    }
    float getY() {
      return y;
    }

    // Fall should be called about 20 times per second to look real.
    // This is about how often draw() gets called in Processing.
    void fall() {
        this.speed += GRAVITY;
        this.y += this.speed;

        if( this.y >= height ) {
            this.y = height;
            this.speed *= -BOUNCE_SPEED;
        }
    }
    
    boolean isOnFloor() {
        return (this.y == height && abs(this.speed) < 0.2 );
    }
    
    void draw() {
        fill( 0, 0, 0 );          // Draw in black.
        ellipse( x, y, 30, 30 );  // Draw a cirle.
                                  // "this" is implied, or you can write this.x if you like.
    }
};
