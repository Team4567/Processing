// Good, you're on the right track.
// It is vital to understand the difference between a class and an object.
// A class is the code that defines the behavior of a "thing", in general.
// An object "is" a specific thing, "this" ball.
// So, a Ball class says that a Ball has a color.  A Ball object has a specific color, blue for example.
// Other ball objects could have other colors.
//
// Moving on to the constructor, you always want an object to be in a complete state.
// The job of the constructor is to make sure this is true right from the instant it is created.
// In your constructor you are not assigning a value to "x" (x does default to zero but this really isn't a good value)
// You take "x" as an argument, make sure you assign it too.

class Target {
  int x;
//  int centerY;  I'm thinking you don't need to save this once you initialize high and low.
  int high, low;

  Target(int x, int centerY) {
    // In a contructor it is a good habit to use "this" even though not strictly necessary.
    // If you said x = 5, in this case, it would not do what you think.
    // It would not initialize this.x it would change the x parameter value passed in.

    this.high = centerY - 50;
    this.low  = centerY + 50;

    this.x = (int)random(width/2,width-3);  // Be mindful that "width" is a global variable managed by Processing.
                                            // Standard Java will not know what "width" is.

//    centerY = ?;  This raises the question, is centerY really needed if we have high and low?
  }


// It is interesting that you see the need to have a separate routine that creates objects.
// We'll talk about this more later.  This is often referred to as a "Factory" method.
// A method that builds an object.  LOTS of reasons to have this.
// Though, in this case not sure it is needed now that "x" is initialized correctly.
  
//  void newTarget() {
//    x=(int)random(width/2,width-3);
//    centerY=(int)random(height*0.25,height*0.75);
//    high= centerY-50;
//    low=centerY+50;
//  }

// This is also a very interesting topic, it is referred to as "hit testing".
// In this case you will not have access to any balls so the use of "b" won't work.
// Also, it would be good to say "does 'this' ball hit the target.
// We might have many balls to test.  Not in this program but we might use this class again later.
// Pass in the ball to test.
// Remember, when "hit" is called it will be referted to through a specific object, "this" object (of class Target).

  boolean hit( Ball b ) {
    // return b.x >= t.x && b.x<= x+10 && height-b.y >= high && height-b.y <= low;

    return b.x >= this.x && b.x <= this.x+10 && height-b.y >= this.high && height-b.y <= this.low;
  }
}
