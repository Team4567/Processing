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
      // This is complicated, the short answer is:
      // "final" means that the value being assigned to BOUNCE_SPEED is not allowed to ever change, it is a constant.
      // "public" or "private" declare if the variable can be seen outside the class.
      //    for example if "b" is a Ball, can I use "b.c" to get the color, that would require making "c" public.
      //    if private it would be a syntax error, no c is available.
      //    We'll talk about why this is useful.
      // Most variables in a class are "member" variables.  Every object of this class has its own value of these variables.
      // Every ball we create will have its own c, x, y and speed.
      // If every Ball always uses the same value for something that we say the variable is "static".
      // Once again, this is a holdover from old programming days.
      // In this case, BOUNCE_SPEED is set to 85%.  THis value is used for every ball object.
      // If this were changed ALL balls would use the new value.
    public static final float BOUNCE_SPEED = 0.85;
    
      // Float? New to me. How come x and y can be defined on the same line? Assuming it is like double
      // Yes, float is a smaller version of a double, 4 bytes of storage instead of 8.
      // It has about 8 significant digits instead of 16.
      // I'm showing my age when I use float, there is very little reason, today, to use this over double.
      // You may declare as many variables of a type on one line.  This is identical to having x and y on separate lines.
    private int c;         // Color of the ball
    private float x, y;    // The current X and Y position 
    private float speed;   // The current speed (changes with each call to "fall"
    
    Ball( int x, int y, int c ) {
          //What is "this." ? I saw in the robot codes, 
          //it is something that makes when Ball was created it refrenced these vars, 
          //but now uses its own but under the same name?
          //
          // This is a big topic, short answer is:
          // This routine is called a constructor, the name of the routine matches the name of the class
          // Its job is to run code each time we create a new object of type Ball.
          // In this case we create a new ball and set the ball's x value to the x value that is supplied.
          // same for y and c.
          // The speed value is always set to 1.0 for all new balls.
          // "this" is a way to refer to the object that was just created. (more here to talk about)
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
        // Using "this" again.  In this case it is optional, it is implied when I say "speed".
        // Java only knows this because "fall" is a "member" routine or "method" of the Ball class.
        // it can only be calls if you have a ball like b.fall().  "this" is a reference to the "b".
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
