import processing.video.*;

Capture video;
PImage previous;

float threshold = 50;


void setup() {
  size(640, 480);
  video = new Capture( this, 640, 480 );
  video.start();
  previous = new PImage( video.width, video.height );  
}

void captureEvent( Capture video ) {
  previous.copy( video, 0, 0, video.width, video.height, 0, 0, previous.width, previous.height ); 
  previous.updatePixels();
  video.read();
}

void draw() {
  background(0);
//  image( video, 0, 0, width, height );

  loadPixels();
  video.loadPixels();

  if ( mousePressed ) {
    threshold = map( mouseX, 0, width, 0, 100); 
  }

  for ( int y=0; y<video.height; y++ ) {
    for ( int x=0; x<video.width-1; x++ ) {
      int index = x + y*width;
      float dr = abs( red(video.pixels[index]) - red(previous.pixels[index]) );
      float dg = abs( green(video.pixels[index]) - green(previous.pixels[index]) );
      float db = abs( blue(video.pixels[index]) - blue(previous.pixels[index]) );
      float d = dr + dg + db;
      
      if ( d > threshold ) {
        pixels[index] = color(255); // video.pixels[index];
      }
    }
  }
  updatePixels();
  textSize(12);
  text( threshold, 10, 10);
}

float distSq( float r1, float g1, float b1, float r2, float g2, float b2 ) {
  return ( abs(r2-r1) + abs(g2-g1) + abs(b2-b1) );
}
