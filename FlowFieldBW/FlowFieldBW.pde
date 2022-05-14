PVector[] points;
float angle;

void setup() {
  fullScreen();
  background(0);
   
  init();  
}

void init() {
  points = new PVector[10000];  

  for(int i = 0; i < points.length; i++)
    points[i] = new PVector(random(-width/2,width/2), random(-height/2, height/2));
  
}

void draw() {
  translate(width/2, height/2);
  noFill();
  stroke(255,5);
  
  rectMode(CENTER);
  rect(0, 0, 320, 320);
  
  for(PVector p : points) {
    angle = noise(p.x / 100, p.y / 100) * TAU;
    p.add(new PVector(cos(angle) / TAU, sin(angle) / TAU));
    
    if(p.y < -150 || p.y > 150 || p.x < -150 || p.x > 150)
      p = new PVector(random(-width/2,width/2), random(-height/2, height/2));
    else
      point(p.x, p.y);
  }
}

void mousePressed() {
  background(0);
  noiseSeed((long)random(100));
  init();
}
