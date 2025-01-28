Star [] stars = new Star[1000];

void setup()
{
  size (800, 600);
  
  for (int i = 0; i < stars.length; i++)
    stars[i] = new Star();
}
void draw()
{
  background(0);
  translate(width / 2, height / 2);
  fill(255);
      
  for (int i = 0; i < stars.length; i++)
  {
    stars[i].updatePosition();
    stars[i].drawStar();
  }
}
