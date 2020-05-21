class Ship
{
  float x;
  float y;
  float s;

  float speed = 2;

  boolean right;

  Ship(float tempX, float tempY, float tempS)
  {
    x = tempX;
    y = tempY;
    s = tempS;

    if (y <= height/6)
    {
      speed = 1;
    } else
    {
      speed = -1;
    }
  }

  void display()
  {
    if (right == false)
    {//When going right
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
    } else
    {//When going left
      //Base
      stroke(255);
      fill(0);
      rect(x - s/2, y - s/2, s, s);
      triangle(x + s/2, y - s/2, x + s * 1.25, y + s/2, x + s/2, y + s/2);

      //Fill
      noStroke();
      rect(x - s/2 + 1, y - s/2 + 1, s, s - 1);

      //Wing
      stroke(255);
      rect(x - s, y + s/6, 1.25 * s, s/4);
    }
  }

  void move()
  {
    x += speed;

    if (x < 0 - s * 1.5 || x > width + s * 1.5)
    {
      speed *= -1;
    }
    
    if(speed > 0)
    {
      right = true;
    } else
    {
      right = false;
    }
  }
}
