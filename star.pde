class Star
{
  float speed = 25;
  float maxRadius = 5;
  float maxSize = 0.01;
  PVector startPosition, currentPosition, previousPosition;
  
  Star()
  {
    startPosition = currentPosition = previousPosition = new PVector(random(-width, width), random(-height, height), random(width));
  }
  
  void updatePosition()
  {
    previousPosition = currentPosition;
    currentPosition = new PVector(startPosition.x, startPosition.y, currentPosition.z - speed);
    
    if (currentPosition.z < 1)
    {
      startPosition = new PVector(random(-width, width), random(-height, height), random(width));
      currentPosition = previousPosition = startPosition;
    }
  }
  
  void drawStar()
  {
    noStroke();
    PVector updatedStarPosition = new PVector(map(currentPosition.x / currentPosition.z, 0, 1, 0, width), map(currentPosition.y / currentPosition.z, 0, 1, 0, height));
    float tempRadius = map(currentPosition.z, 0, width, maxRadius, 0);
    ellipse(updatedStarPosition.x, updatedStarPosition.y, tempRadius, tempRadius);
    
    stroke(127);
    PVector updatedTrailPosition = new PVector(map(currentPosition.x / previousPosition.z, 0, 1, 0, width), map(currentPosition.y / previousPosition.z, 0, 1, 0, height));
    float tempSize = map(currentPosition.z, 0, width, maxSize, 0);
    line(updatedTrailPosition.x, updatedTrailPosition.y - tempSize, updatedStarPosition.x, updatedStarPosition.y);
  }
}
