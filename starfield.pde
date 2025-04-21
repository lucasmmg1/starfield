int numStars = 1000;
float[] starX, starY, starZ;
float[] speed, maxRadius, maxSize;
PVector[] previousPosition;

void setup()
{
  size(800, 600);
  
  // Inicializando os arrays para as estrelas
  starX = new float[numStars];
  starY = new float[numStars];
  starZ = new float[numStars];
  
  speed = new float[numStars];
  maxRadius = new float[numStars];
  maxSize = new float[numStars];
  
  previousPosition = new PVector[numStars];
  
  for (int i = 0; i < numStars; i++)
  {
    starX[i] = random(-width, width);
    starY[i] = random(-height, height);
    starZ[i] = random(width);
    
    speed[i] = 25;
    maxRadius[i] = 5;
    maxSize[i] = 0.01;
    
    previousPosition[i] = new PVector(starX[i], starY[i], starZ[i]);
  }
}

void draw()
{
  background(0);
  translate(width / 2, height / 2);
  fill(255);
  
  for (int i = 0; i < numStars; i++)
  {
    updatePosition(i);
    drawStar(i);
  }
}

void updatePosition(int i)
{
  previousPosition[i] = new PVector(starX[i], starY[i], starZ[i]);
  starZ[i] -= speed[i];
  
  if (starZ[i] < 1)
  {
    starX[i] = random(-width, width);
    starY[i] = random(-height, height);
    starZ[i] = random(width);
    previousPosition[i] = new PVector(starX[i], starY[i], starZ[i]);
  }
}

void drawStar(int i)
{
  noStroke();
  PVector updatedStarPosition = new PVector(map(starX[i] / starZ[i], 0, 1, 0, width), map(starY[i] / starZ[i], 0, 1, 0, height));
  float tempRadius = map(starZ[i], 0, width, maxRadius[i], 0);
  ellipse(updatedStarPosition.x, updatedStarPosition.y, tempRadius, tempRadius);
  
  stroke(127);
  PVector updatedTrailPosition = new PVector(map(starX[i] / previousPosition[i].z, 0, 1, 0, width), map(starY[i] / previousPosition[i].z, 0, 1, 0, height));
  float tempSize = map(starZ[i], 0, width, maxSize[i], 0);
  line(updatedTrailPosition.x, updatedTrailPosition.y - tempSize, updatedStarPosition.x, updatedStarPosition.y);
}
