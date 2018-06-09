// Rupert Russell
// 8 June 2018
// Esrefoglu Mosque Page 37 Islamic Geometric Patterns 

float xCenter = 300;
float yCenter = 300;

float scale = 550;

float[] outerX; // store xPoints for the 10 points on the outer circle
float[] outerY; // store yPoints for the 10 points on the outer circle

float[] innerX;
float[] innerY;

float[] innerMostX;
float[] innerMostY;

void setup() {
  size(600, 600); // width x height

  noFill();
  rectMode(CENTER);
  ellipseMode(CENTER);

  outerX = new float[10]; // store x Points for the 10 points on the outer circle
  outerY = new float[10]; // store y Points for the 10 points on the outer circle

  innerX = new float[360]; // store x Points for the 10 points on the outer circle
  innerY = new float[360]; // store y Points for the 10 points on the outer circle

  innerMostX = new float[360]; // store x Points for the 10 points on the outer circle
  innerMostY = new float[360]; // store y Points for the 10 points on the outer circle
  // noLoop();
}

void draw() {
  strokeJoin(MITER);
  //  strokeCap(PROJECT);
  background(255);
  translate(xCenter, yCenter);
  calculateNPoints(6, 0.5);

  //float innerScale = 0.589;
  //calculateNinnerPoints(80, innerScale /2);

  //float innerMost = 0.171; 
  //calculateNinnerMostPoints(20, innerMost /2);
  //drawStar();
  pushMatrix();
  rotate(radians(90));
  // draw outter ellipse
  ellipse(0, 0, scale, scale);

  // draw outer hexagon
  for (int counter = 0; counter < 6; counter ++) {
    line(outerX[counter], outerY[counter], outerX[counter + 1], outerY[counter + 1]);
  }
  // verticle line
  line(outerX[3], outerY[3], outerX[6], outerY[6]);
  line(outerX[4], outerY[4], outerX[1], outerY[1]);
  line(outerX[5], outerY[5], outerX[2], outerY[2]);

  // Draw Triangle 1
  line(outerX[2], outerY[2], outerX[4], outerY[4]);
  line(outerX[4], outerY[4], outerX[6], outerY[6]);
  line(outerX[6], outerY[6], outerX[2], outerY[2]);


  // Draw Triangle 2
  line(outerX[1], outerY[1], outerX[3], outerY[3]);
  line(outerX[3], outerY[3], outerX[5], outerY[5]);
  line(outerX[5], outerY[5], outerX[1], outerY[1]);

  popMatrix();

  pushMatrix();

  float x = -0.145;
  float y = 0.416;
  ellipse(scale * x, scale * y, 15, 15);
  ellipse(scale * x, scale * - y, 15, 15);
  ellipse(scale * - x, scale * - y, 15, 15);
  ellipse(scale * - x, scale * y, 15, 15);

  line(scale * x, scale * y, scale * x, scale * - y);
  line(scale * - x, scale * - y, scale * - x, scale * y);

  rotate(radians(60));
  line(scale * x, scale * y, scale * x, scale * - y);
  line(scale * - x, scale * - y, scale * - x, scale * y);

  rotate(radians(60));
  line(scale * x, scale * y, scale * x, scale * - y);
  line(scale * - x, scale * - y, scale * - x, scale * y);

  popMatrix();


  x = -0.145;
  y = 0.25;

  ellipse(scale * x, scale * y, 15, 15);
  ellipse(scale * x, scale * - y, 15, 15);
  ellipse(scale * - x, scale * - y, 15, 15);
  ellipse(scale * - x, scale * y, 15, 15);


  stroke(255, 0, 0);
  x = -0.29;
  y = 0.335;
  ellipse(scale * x, scale * y, 15, 15);
  //ellipse(scale * x, scale * - y, 15, 15);
  //ellipse(scale * - x, scale * - y, 15, 15);
  //ellipse(scale * - x, scale * y, 15, 15);

  // 1st inner ellipse
  float innerScale = 0.8813;
  ellipse(0, 0, innerScale * scale, innerScale * scale);

  stroke(0);

  //println("mouseX = " + (mouseX - 300));
  //println("mouseY = " + (mouseY - 300));

  rotate(radians(10));
  calculateNinnerPoints(18, 0.8813);

  calculateNinnerMostPoints(18, .335);

  strokeWeight(4);
  // draw lines
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


  strokeWeight(1);
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

    //   ellipse(x,y,10,10);
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

    stroke(255, 0, 0);

    if (counter == 0) {
      fill(255, 255, 0);
    } else
    {
      noFill();
    }
    ellipse(x, y, 10, 10);
    stroke(0);
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
    stroke(255, 0, 0);
    ellipse(x, y, 10, 10);

    if (counter == 0) {
      fill(255, 0, 0);
    } else
    {
      noFill();
    }

    stroke(0);

    counter ++;
  }
} // end  calculateNinnerMostPoints

void drawStar() {
  for (int count = 0; count < 6; count ++) {
    drawLines();
    rotate(radians(30));
  }
} // end drawStar


void mousePressed() {
  scale = 1500;   // scale of bounding square
}

void mouseReleased() {
  scale = 550; // scale of bounding square
}

void drawLines() {

  strokeWeight(3);
  stroke(0);
  line(outerX[5], outerY[5], innerX[51], innerY[51]);
  line(outerX[5], outerY[5], innerX[29], innerY[29]);

  line(outerX[0], outerY[0], innerX[69], innerY[69]);
  line(outerX[0], outerY[0], innerX[11], innerY[11]);

  line(innerX[51], innerY[51], innerMostX[15], innerMostY[15]);
  line(innerX[29], innerY[29], innerMostX[5], innerMostY[5]);

  line(innerX[69], innerY[69], innerMostX[15], innerMostY[15]);
  line(innerX[11], innerY[11], innerMostX[5], innerMostY[5]);
  stroke(100);
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    save("Esrefoglu_Mosque_007.png"); 
    exit();
  }
}
