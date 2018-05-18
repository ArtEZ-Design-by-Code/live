import codeanticode.syphon.*;

SyphonServer syphon;

float y = 0;

void setup() {
  size(1280, 720, OPENGL);
  
  syphon = new SyphonServer(this, "Syphon");
}

void draw() {
  background(0);
  
  y += 10;
  
  if (y > height) y = 0;
  
  fill(255);
  noStroke();
  
  ellipse(width / 2, y, 150, 150);
  
  PImage currentFrame = get();
  
  syphon.sendImage(currentFrame);
}