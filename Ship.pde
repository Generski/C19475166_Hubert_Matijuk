class Ship
{
  float x;
  float y;
  float s;
  
  float speed = 2;

  Ship(float tempX, float tempY, float tempS)
  {
    x = tempX;
    y = tempY;
    s = tempS;
  }

  void display()
  {
    //Base
    stroke(255);
    fill(0);
    rect(x - s/2, y - s/2, s, s);
    triangle(x - s/2, y - s/2, x - s * 1.25, y + s/2, x - s/2, y + s/2);
    
    //Fill
    noStroke();
    rect(x - s/2, y - s/2 + 1, s, s - 1);
    
    //Wing
    stroke(255);
    rect(x - s/4, y + s/6, 1.25 * s, s/4);
  }
  
  void move()
  {
    x += speed;
    
    if(x < 0 || x > width)
    {
      speed *= -1;
    }
  }
}
