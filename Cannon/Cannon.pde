
Ball b;

int target = 400;
float xSpeed = 0.0;
float ySpeed = 0.0;
float angle = 0.0;
float speed = 0.0;

void setup() {
   size( 750, 600 );
   background(255);
   
}
Target t= new Target((int)random((width/2),(width-3)),(int)random((0.25*height),(0.75*height)));
void draw() {
  if(t.x<(width/2)){
  t.newTarget();
}
   // background(255);
     //Inside the b, if exists, do this. b is NOT equal to non-existent
   if( b != null ) {
      b.move();

      fill( b.c );
      noStroke();
      ellipse( b.x, height - b.y, 3, 3 );

      noStroke();
      fill(255);
      rect(0, 0, 178, 60);

      stroke(0);
      fill(0);
      textSize(16);
      text( int(speed) + " ft/sec at " + int(angle) + " deg", 10, 30 );
      text( "Impact at X: " + int(b.x) + " Y: " + int(b.y), 10, 50 );

      if( b.stopped() ) {
         if( t.hit() ) {
            textSize(32);
            text( "Hit!", 10, 120 );
         } else {
            textSize(32);
            text( "Miss", 10, 120 );
         }
      }
   } else {  // Aiming mode
      background(255);
      fill(255, 0, 0);
      stroke(224);
      ellipse( 97, 75, 100, 100 );

      fill(0);
      strokeWeight(5);
      textSize(14);
      text( "Press to", 75, 65 );
      textSize(24);
      text( "Fire!", 75, 90 );

      float xs = mouseX;
      float ys = height - mouseY;
      float s = sqrt(mouseX*mouseX + ys*ys);

      angle = atan(ys/xs) * 360 / (2*3.14159);
        // ^So this finds the radian of the mouse position to the bottom right corner, then converts it to degrees
      if( s < 225 ) {
         ySpeed = ys;
         speed = s;
         xSpeed = xs;
      } else {
         speed = 225;
         // convert back to radians
         ySpeed = sin( angle * (2 * 3.14159) / 360 ) * speed;
         // Opposite/Hyp of Right triangle angle
         xSpeed = cos( angle * (2 * 3.14159) / 360 ) * speed;
         // adj/hyp of right triangle angle
         // I haven't taken physics, I'll probably understand it eventually
      }

      stroke(0);
      textSize(16);
      line( 0, height, xSpeed, height-ySpeed );
      text( int(speed) + " ft/sec at " + int(angle) + " deg", mouseX-30, mouseY-80 );
   }

   // Always draw target and dimensions
   fill(0);
   textSize(16);
   stroke(255, 0, 0);
   line( t.x, t.high, t.x, t.low );
   text( t.high + " ft" + t.x, t.x-55, t.high-5 );
   text( t.low + " ft", t.x-55, t.low+5 );
   text( int(width) + " ft", width/2, height-10 );
}


void mousePressed() {
   if( b != null && b.stopped() ) {
      background(255);
      if( t.hit() ) {
        //that (int) makes sure random only produces integers? 
        t.newTarget();
      }
      b = null;
   }
   else {
//   if( mouseX > 20 && mouseX < 170 && mouseY > 50 && mouseY < 100 ) {
      background(255);
      b = new Ball( 0, 0, xSpeed, ySpeed, color(255, 0, 0) );
   }
}
