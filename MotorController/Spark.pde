// This contains SOME of the commands of motor controllers, mostly the one's we'll be needing.
// Keep in mind this was made in order to give a visual, the real Spark class is much more complex and doesn't have Desc strings and x,y.
class Spark{
  public int port;
  public String speedDesc;
  public String invertDesc;
  public float speed;
  public boolean isInverted;
  public int x;
  public int y;
  Spark(int port){
    this.port=port;
    
      
    }
    
  
  // Sometimes, the motor will be set to forward, but due to its physical orientation it will go backwards.
  // We can fix this with an inverse function.
  public void setInverted(boolean inv){
    isInverted=inv;
    // Anytime you see Desc, its just for the visuals
    if(isInverted){
        invertDesc= "This motor is inverted.";
      } else if(isInverted==false){
        invertDesc= "This motor is not inverted.";
      }
    
    
  } 
  // Motor controllers can get set values of -1 to 1. Decimals are used all in between.
  // This number will determine the Pulse Width for the PWM. Remember the drawing we had on the board?
  // 1 is 100% Speed Forward, -1 is 100% speed backward
  public void set(float s){
    this.speed=s;
    // Anytime you see Desc, its just for the visuals
    if(speed==0){
        speedDesc="This Motor Isn't Moving.";
       } else if(speed>0){
        speedDesc="This Motor is moving at " + (abs(speed)*100) + "% forward.";
      }else if(speed<0){
        speedDesc="This Motor is moving at " + (abs(speed)*100) + "% backward.";
      }
    
  }
  // Returns the current speed, in range -1 to 1.
  public double get(){
    return speed;
  }
  // Returns the inverted state of the motor controller.
  public boolean getInverted(){
    // if isInverted was never used in the code, invertDesc would come up null. I couldn't find a working way to make isInverted default to false, which is why this if is here.
    if(invertDesc==null){
      isInverted=false;
    }
    return isInverted;
  }
  
  
  
  // These 4 aren't real robot functions, just for processing to add visuals.
    public String getInvertedDesc(){
    return invertDesc;
  }
  public String getDesc(){
    return speedDesc;
  }
  public String getFullDesc(){
    return speedDesc+ " " + invertDesc;
  }
  public void draw(PImage img, int x,int y){
    this.x=x;
    this.y=y;
    image(img,x,y,200,200);
    fill(255,0,0);
    text("These run to the Power Distribution Panel, or PDP.",x,y+225);
    text("These run to the motor being used.",x,y-15);
    // if isInverted was never used in the code, invertDesc would come up null. I couldn't find a working way to make isInverted default to false.
    if(invertDesc==null){
      isInverted=false;
      invertDesc="This motor is not inverted.";
    }
    if(speedDesc==null){
      speed=0;
      speedDesc="This Motor Isn't Moving.";
    }
    text("This motor controller is set to PWM Port " + port + ".",x+200,y+85);
    text(speedDesc,x+200,y+100);
    text(invertDesc,x+200,y+115);
    text("These wires (PWM) go to the ports on the RoboRIO",x+200,y+130);
  }
}
