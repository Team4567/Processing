
class Ball {
    // Speed is in Pixels/loop
    // Gravity is an acceleration downward
    // Acceleration will be a change in speed per loop
    // Acceleration units are pixels/loop per loop
    public static final float GRAVITY = 0.2;  
    
    // After a bounce some speed is lost
    // The after speed is a percent of the speed before bounce.
    public static final float BOUNCE_SPEED = 0.85;
    
    private int c;
    private float x, y;
    private float speed;
    
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
            // when y is greater than hight it hit the floor
            // remember y gets bigger downing down.
            // Don't let the call go offer the screen.
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
