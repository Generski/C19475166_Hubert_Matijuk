Star[] stars = new Star[100];

float col = 0;

void setup()
{
  size(800, 600);

  //Instantiate stars
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star(3);
  }

  colorMode(HSB);
}

void draw()
{
  background(0);
  
  //Drawing rays
  for (int x = 0; x <= width; x += 20)
  {
    stroke(map(x, 0, width, 0, 255), 255, 255);
    line(width/2, height/2, x, height);
  }

  //Line
  stroke(255);
  line(0, height/2, width, height/2);

  //Drawing stars
  for (Star s : stars)
  {
    s.display();
  }
}
