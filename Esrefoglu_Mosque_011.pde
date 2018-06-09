// Rupert Russell
// 9 June 2018
// Esrefoglu Mosque Page 37 Islamic Geometric Patterns 
int fudge = 2;
int loops = 0;
float xCenter = 150;
float yCenter = 150;
float scale = 550 /2;

float[] outerX; // store xPoints for the 10 points on the outer circle
float[] outerY; // store yPoints for the 10 points on the outer circle

float[] innerX;
float[] innerY;

float[] innerMostX;
float[] innerMostY;

void setup() {
  size(600, 300); // width x height

  noFill();
  rectMode(CENTER);

  outerX = new float[10]; // store x Points for the 10 points on the outer circle
  outerY = new float[10]; // store y Points for the 10 points on the outer circle

  innerX = new float[360]; // store x Points for the 10 points on the outer circle
  innerY = new float[360]; // store y Points for the 10 points on the outer circle

  innerMostX = new float[360]; // store x Points for the 10 points on the outer circle
  innerMostY = new float[360]; // store y Points for the 10 points on the outer circle
}

void draw() {
  // noLoop();
  strokeJoin(MITER);
  //  strokeCap(PROJECT);
  background(255);
  translate(xCenter, yCenter);
  calculateNPoints(6, 0.5);

  pushMatrix();
  rotate(radians(90));

  // draw outer hexagon
  for (int counter = 0; counter < 6; counter ++) {
    line(outerX[counter], outerY[counter], outerX[counter + 1], outerY[counter + 1]);
  }
  popMatrix();

  pushMatrix();
  rotate(radians(10));
  calculateNinnerPoints(18, 0.8813);
  calculateNinnerMostPoints(18, .335);

  drawLines();

  stroke(255, 0, 0);
  drawLines();
  popMatrix();

  rotate(radians(-90));
  // draw outer hexagon
  for (int counter = 0; counter < 6; counter ++) {
    line(outerX[counter], outerY[counter], outerX[counter + 1], outerY[counter + 1]);
  }

  rotate(radians(-90));
  translate(- scale * .867, 0);

  stroke(255, 0, 0);
  fudge ++;
  loops ++;
  println("loops = " + loops);
  if (loops > 360) {
    exit();
  }


  rotate(radians(-fudge));
  drawLines();

  rotate(radians(-90 + fudge));
  // draw outer hexagon
  stroke(0);
  for (int counter = 0; counter < 6; counter ++) {
    line(outerX[counter], outerY[counter], outerX[counter + 1], outerY[counter + 1]);
  }
  saveFrame("frame-###.png");
}


// End Draw()


void calculateNPoints(float numPoints, float scaleFactor) {
  // calculate and store n points around the outer circle
  int counter = 0;
  double step = radians(360/numPoints); 
  float h = 0; 
  float k = 0;
  float r =  scale * scaleFactor ;
  for (float theta=0; theta < 2 * PI; theta += step) {
    float x = h + r * cos(theta);
    float y = k - r * sin(theta); 

    // store the calculated coordinates
    outerX[counter] = x;
    outerY[counter] = y;

    //   // ellipse(x,y,10,10);
    counter ++;
  }
} // end  calculateNPoints


void calculateNinnerPoints(float numPoints, float scaleFactor) {
  // calculate and store n points around the outer circle
  int counter = 0;
  double step = radians(360/numPoints); 
  float h = 0; 
  float k = 0;
  float r =  scale * scaleFactor / 2 ;
  for (float theta=0; theta < 2 * PI; theta += step) {
    float x = h + r * cos(theta);
    float y = k - r * sin(theta); 

    // store the calculated coordinates
    innerX[counter] = x;
    innerY[counter] = y;
    counter ++;
  }
} // end  calculateNinnerPoints


void calculateNinnerMostPoints(float numPoints, float scaleFactor) {
  // calculate and store n points around the outer circle
  int counter = 0;
  double step = radians(360/numPoints); 
  float h = 0; 
  float k = 0;
  float r =  scale * scaleFactor /2 ;
  for (float theta=0; theta < 2 * PI; theta += step) {
    float x = h + r * cos(theta);
    float y = k - r * sin(theta); 

    // store the calculated coordinates
    innerMostX[counter] = x;
    innerMostY[counter] = y;
    counter ++;
  }
} // end  calculateNinnerMostPoints


void mousePressed() {
  scale = 1500;   // scale of bounding square
}

void mouseReleased() {
  scale = 550; // scale of bounding square
}

void drawLines() {

  strokeWeight(3);
  line(innerX[0], innerY[0], innerMostX[2], innerMostY[2]);
  line(innerMostX[2], innerMostY[2], innerX[4], innerY[4]);

  line(innerX[3], innerY[3], innerMostX[5], innerMostY[5]);
  line(innerMostX[5], innerMostY[5], innerX[7], innerY[7]);

  line(innerX[6], innerY[6], innerMostX[8], innerMostY[8]);
  line(innerMostX[8], innerMostY[8], innerX[10], innerY[10]);

  line(innerX[9], innerY[9], innerMostX[11], innerMostY[11]);
  line(innerMostX[11], innerMostY[11], innerX[13], innerY[13]);

  line(innerX[12], innerY[12], innerMostX[14], innerMostY[14]);
  line(innerMostX[14], innerMostY[14], innerX[16], innerY[16]);

  line(innerX[15], innerY[15], innerMostX[17], innerMostY[17]);
  line(innerMostX[17], innerMostY[17], innerX[1], innerY[1]);
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    save("Star_001_01.png"); 
    exit();
  }
}
