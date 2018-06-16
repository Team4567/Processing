ArrayList<Ball> balls;


void setup() {
    size( 1024, 768 );
    noStroke(); // No border around the circles
    balls = new ArrayList<Ball>();
}

void draw() {
    background(255);

    for( Ball b : balls ) {
        b.fall();
        fill( b.getColor() );
        ellipse( b.getX(), b.getY(), 30, 30 );
    }

    balls = onlyBouncingBalls( balls );
    fill(0);
    text( balls.size(), 20, 20 );
}

void mousePressed() {
    addBall();
}

void mouseDragged() {
    addBall();
}

void addBall() {
    int c = color( random(256), random(256), random(256) );
    balls.add( new Ball( mouseX, mouseY, c ) );
}

ArrayList<Ball> onlyBouncingBalls( ArrayList<Ball> inBalls ) 
{
    ArrayList<Ball> newBalls = new ArrayList<Ball>();
    
    for( Ball b : inBalls ) {
        if( !b.onFloor() ) {
            newBalls.add( b );
        }
    }
    return newBalls;
}
