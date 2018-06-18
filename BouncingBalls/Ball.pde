// The Ball class

class Ball {
    // Speed is in pixels/loop
    // Gravity is an acceleration downward
    // Acceleration will be a change in speed per loop
    // Acceleration units are pixels/loop per loop
    // Interesting thing to try, the gravity on the moon is 1/6th of the earth.
    public static final float GRAVITY = 0.2;  
    
    // After a bounce some speed is lost
    // The "after" speed is a percentage of the speed before the bounce. 
    public static final float BOUNCE_SPEED = 0.85;
    
    private int c;         // Color of the ball
    private float x, y;    // The current X and Y position 
    private float speed;   // The current speed (changes with each call to "fall"
    
    Ball( int x, int y, int c ) {
        this.x = x;
        this.y = y;
        this.c = c;
        this.speed = 1.0;
    }

    float getX() {
      return x;
    }
    float getY() {
      return y;
    }
    int getColor() {
      return c;
    }
    
    void fall() {
        this.speed += GRAVITY;
        this.y += this.speed;

        if( this.y >= height ) {
            // When y is greater than "height" the ball hit the floor
            // Remember y gets bigger as the ball heads down.
            // Don't let the ball go off the screen.
            this.y = height;
            
            // Set the new speed in the opposite direction.
            // -speed means travelling up, the -y direction.
            this.speed *= -BOUNCE_SPEED;
        }
    }
    
    boolean isOnFloor() {
        return (this.y == height && abs(this.speed) < 0.2 );
    }
};
