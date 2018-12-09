class Target{
  int x, centerY, high, low;
  Target(int x, int centerY){

    high= centerY-50;
    low=centerY+50;
  }
  
  void newTarget(){
    x=(int)random(width/2,width-3);
    centerY=(int)random(height*0.25,height*0.75);
    high= centerY-50;
    low=centerY+50;

  }
  boolean hit(){
    return b.x >= t.x && b.x<= x+10 && height-b.y >= high && height-b.y <= low;
  }
}
