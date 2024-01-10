float radius = 90;
int padding = 50;
void setup() {
  size(800, 800);
  smooth();
  colorMode(HSB, 400);
  background(0, 0, 0);
  float xstart = random(10);
  float xnoise = xstart;
  float ynoise = random(10);

  for (int y = padding; y <= height - padding; y += 2 * padding) {
    ynoise += 0.1;
    xnoise = xstart;

    for (int x = padding; x <= width - padding; x += 2 * padding) {
      xnoise += 0.1;
      hexagongrid(x, y, noise(xnoise, ynoise));
    }
  }

  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;

    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.1;
      noisegrid(x, y, noise(xnoise, ynoise));
    }
  }
}

void hexagongrid(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(360));

  radius -= 1;
  beginShape();
  for (int i = 0; i <= 360; i += (360/6)) {
    float grey = (noiseFactor * 400);
    noStroke();
    fill(grey, 400, 400);
    vertex(radius * cos(radians(i)), radius * sin(radians(i)));
  }
  endShape();
  line(0, 0, 20, 0);
  popMatrix();
}

void noisegrid(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(360));
  stroke(0);
  line(0, 0, 10, 0);
  line(20, 0, 30, 0);
  popMatrix();
}
