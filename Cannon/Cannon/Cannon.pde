
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

void draw() {
   // background(255);
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
         if( b.x >= 750 && b.y >= target-50 && b.y <= target+50 ) {
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
      if( s < 225 ) {
         ySpeed = ys;
         speed = s;
         xSpeed = xs;
      } else {
         speed = 225;
         ySpeed = sin( angle * (2 * 3.14159) / 360 ) * speed;
         xSpeed = cos( angle * (2 * 3.14159) / 360 ) * speed;
      }

      stroke(0);
      textSize(16);

      line( 0, height, xSpeed, height-ySpeed );
      text( int(speed) + " ft/sec at " + int(angle) + " deg", mouseX-30, mouseY-40 );
   }

   // Always draw target and dimensions
   fill(0);
   textSize(16);
   stroke(255, 0, 0);
   line( width-3, height - target-50, width-3, height - target+50 );
   text( int(target-50) + " ft", width-55, height - (target-55) );
   text( int(target+50) + " ft", width-55, height - (target+55) );
   text( int(width) + " ft", width/2, height-10 );
}


void mousePressed() {
   if( b != null && b.stopped() ) {
      background(255);
      if( b.x >= 750 && b.y >= target-50 && b.y <= target+50 ) {
         target = (int)random( 100, height-100 );
      }
      b = null;
   }
   else {
//   if( mouseX > 20 && mouseX < 170 && mouseY > 50 && mouseY < 100 ) {
      background(255);
      b = new Ball( 0, 0, xSpeed, ySpeed, color(255, 0, 0) );
   }
}
