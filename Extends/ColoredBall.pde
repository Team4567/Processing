// ColoredBall to extend Ball
// Inherit all the same functionality but we add color, "c".

class ColoredBall extends Ball {

    // We will be able to access the x and y from the Ball object
    // This is possible because the variables (fields) are declared as protected.
    // See Ball.
    //
    // Side note:  x, this.x, getX(), and this.getX() are all okay
    //
    // There is some benefit in using getX() instead of "x", in general.
    // This is the way the object (Ball) means users to access "x".
    // 
    // There is a concept of lazy evaluation where the variable "x" may not have a good
    // value right away, but only when somebody asks for it.
    // Consider if computing "x" was very time consuming and there was a chance that nobody would 
    // ask.  We might not compute "x" until the first call to getX().
    // We know this isn't the case because we own the Ball class too.
    // If we were extending a class that we don't own, and might not have the code for, we can't
    // be sure.
    
    private int c;
    
    ColoredBall( int x, int y, int c ) {
        super(x, y);      // Call the constructor for the Ball part of ColoredBall.
                          // Then, add any new code to construct the ColoredBall part.
        this.c = c;
    }
    
    // This "getter" function is important because we declared color to be private.
    // Nobody has access to the value but the code in this class.
    // By writing only a "getter" and not writting a "setter", there is no way for anybody
    // to change this value on us, but we allow for the value to be read.
    //
    // It is considered good style to make all variables private (or protected) and add
    // the appropriate setters and getters that you want to offer to other code.
    // Constances:  public static final ...  are the exception since they can't be changed anyway.
    
    int getColor() {
        return c;
    }

    // We override the draw procedure because we want to draw in color.
    @Override
    void draw() {
        fill( c );    // Set fill color
        ellipse( x, y, 30, 30 );
        
        // If we wanted to add code to draw and not replace it, we might have called draw in
        // the super class as:  super.draw();
        // In this case, and almost always, we want to completely replace the method.
    }
};
