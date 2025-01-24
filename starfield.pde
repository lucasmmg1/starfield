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
      
  drawUI();
  drawWorldspace();
}
void mousePressed() 
{
  if (isOverLink()) 
    link("https://youtu.be/17WoOqgXsRM?si=uZk3IUtb7gAK-_kL");
}

void drawUI()
{
  textSize(25);
  fill(255);
  text("Starfield", -width / 2 + 10, -height / 2 + 30);
  textSize(15);
  text("Reference Link: ", -width / 2 + 10, -height / 2 + 47.5);
  
  if (isOverLink())
    fill(51, 102, 204);
  else
    fill(127);
  text("https://youtu.be/17WoOqgXsRM?si=uZk3IUtb7gAK-_kL", -width / 2 + 15 + textWidth("Reference Link: "), -height / 2 + 47.5);
}
void drawWorldspace()
{ 
  for (int i = 0; i < stars.length; i++)
  {
    stars[i].updatePosition();
    stars[i].drawStar();
  }
}
boolean isOverLink()
{
  return (mouseX >= 15 + textWidth("Reference Link: ") && mouseX <= 15 + textWidth("Reference Link: ") + textWidth("https://youtu.be/17WoOqgXsRM?si=uZk3IUtb7gAK-_kL")) && (mouseY >= 37.5 && mouseY <= 47.5);
}
