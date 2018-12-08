// This new Ball class has better physics modeling.
// Speeds are in Feet/Second.
// Positive X and Y directions are to the right and upward respectively.
// When the ball hits the ground it just stops exactly in place.
// We do not currently consider bouncing or rolling.
//
// We will map the x and y positions, in feet, to pixels on the screen
// in a separate class.

class Ball {
   // Each time the move method is called it is assumed that
   // TICK_LENGTH times, in seconds, has elapsed.
   float TICK_LENGTH=0.050;    // 50 milliseconds is 1/20 of a second

   // Gravity is a constant, on earth it is 32 ft/sec/sec
   // This means that each second the speed changes by 32 feet/second
   // Gravity is a downward force so is a negative value (y increases going up)
   float GRAVITY = -32.0;  // ft/sec/sec

   int c;
   float x, y;
   float xSpeed, ySpeed;

   Ball( float x, float y, float xSpeed, float ySpeed, int c ) {
      this.x = x;
      this.y = y;
      this.xSpeed = xSpeed;
      this.ySpeed = ySpeed;
      this.c = c;
   }
   

   // For now we use TICK_LENGTH amount of time elapsed on each call to move.
   // It would be better to use the clock to see how long it actually was since last move.

   void move() {
      // X position is simply the previous x + xSpeed * time
      // Speed is ft/second and time in seconds yields a distance in feet.
      x += xSpeed * TICK_LENGTH;

      // Y position change is the same as X but using the ySpeed.
      y += ySpeed * TICK_LENGTH;

      // xSpeed doesn't change for now.  
      // Once xSpread is set it stays the same, unlike ySpeed.

      // ySpeed increases downward from gravity.
      // Gravity is a force that creates an acceleration of 32 ft/sec/sec.
      // If the ball is heading up (positive ySpeed) it will slow down
      // If the ball is heading down is will increase speed (toward the ground)
      // ySpeed is in Ft/sec, Gravity is ft/sec/sec, time in seconds
      // Gravity * time yeilds a speed in ft/sec to be added to ySpeed
      // We may consider the effect of wind resistance later.
      ySpeed += GRAVITY * TICK_LENGTH;
      
      // The ball hits the ground when the y position falls to (or below) zero.
      // For now, it simply stops at that position.
      // We also limit the shooting range of the ball to 750 feet.
      // It stops in place if x reaches 750.

      if( y <= 0.0 ) {
         y = 0.0;
         xSpeed = 0.0;
         ySpeed = 0.0;
      } else if( x >= 750 ) {
         x = 750;
         xSpeed = 0.0;
         ySpeed = 0.0;
      } 
   }

   boolean stopped() {
      return ( xSpeed == 0.0 && ySpeed == 0.0 );
   }   
};
