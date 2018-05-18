import codeanticode.syphon.*;

SyphonServer syphon;

float x = 0;

void setup() {
  size(1280, 720, OPENGL);
  
  syphon = new SyphonServer(this, "Syphon");
}

void draw() {
  background(0);
  
  x += 10;
  
  if (x > width) x = 0;
  
  fill(255);
  noStroke();
  
  ellipse(x, height / 2, 150, 150);
  
  PImage currentFrame = get();
  
  syphon.sendImage(currentFrame);
}