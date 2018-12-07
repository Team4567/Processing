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
      // what does "public static final" do?
    public static final float BOUNCE_SPEED = 0.85;
      // Float? New to me. How come x and y can be defined on the same line? Assuming it is like double 
    private int c;         // Color of the ball
    private float x, y;    // The current X and Y position 
    private float speed;   // The current speed (changes with each call to "fall"
    
    Ball( int x, int y, int c ) {
          //What is "this." ? I saw in the robot codes, 
          //it is something that makes when Ball was created it refrenced these vars, 
          //but now uses its own but under the same name?
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
        //the speed at which the ball falls increases by gravity every loop until it hits the ground, then it goes up at  85% of the speed it was at when it hit.
        // so once the speed is inverted to 85% of its speed at the negative direction, .2 is still added to it until it starts going down again?
    }
    boolean isOnFloor() {
           // y of ball being checked is at the bottom of the screen and our speed is less than 0.2, rather its going up or down
        return (this.y == height && abs(this.speed) < 0.2 );
    }
};
