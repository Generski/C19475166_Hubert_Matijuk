Star[] stars = new Star[100];
Ship[] ships = new Ship[2];

float col = 0;

float shipSize = 50;

void setup()
{
  size(800, 600);

  //Instantiate stars
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star(3);
  }
  
  //Instantiate ships
  for(int i = 0; i < ships.length; i++)
  {
    ships[i] = new Ship(width/2, height/6 * (i + 1), shipSize);
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
  
  //Drawing ships
  for (Ship s : ships)
  {
    s.display();
    s.move();
  }
}
