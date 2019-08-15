
import processing.pdf.*;

PShape path;
boolean record;

void setup() {
  size(2000, 1200 ,P2D);
  frameRate(20);
}

void draw() {
  
  if (record) {
    String filename = String.format("C:/Users/Jason/Documents/Processing Projects/Output/scribble_%d%d%d%d%d.pdf", year(), month(), day(), hour(), minute(), second());
  }
  
  background(51);
  // Draw the path at the mouse location
  
  PShape shp1 = new PShape();
  shp1 = make_shp(random(3));
  
  translate(width/2, height/2);
    shape(shp1);
  translate(width/200, height/200);
    shape(shp1);
  translate(width/180, height/120);
    shape(shp1);  

  if (record) {
      record = false;
  }

}

PShape make_shp(float fct) {
// Create the shape
  path = createShape();
  path.beginShape();
  // Set fill and stroke
  path.noFill();
  path.stroke(255);
  path.strokeWeight(2);
  
  float x = 0;
  // Calculate the path as a sine wave
  for (float a = 0; a < TWO_PI; a+=0.1) {
    path.curveVertex(cos(a)*(fct * random(1, width*0.09)), sin(a)* (fct * random(2,width*0.12)));
    x+= 20;
  }
  // The path is complete
  path.endShape(CLOSE);  
  
  return(path);
}

void keyPressed() {
  record = true;
}
