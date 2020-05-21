class Ship
{
  float x;
  float y;
  float s;

  float speed = 2;
  
  float col = random(0, 255);

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
      fill(col, 100, 100);
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
      fill(col, 100, 100);
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

    if (x < 0 - s * 3 || x > width + s * 3)
    {
      speed *= -1;
      col = random(0, 255);
    }

    if (speed > 0)
    {
      right = true;
    } else
    {
      right = false;
    }
  }

  void trail()
  {
    if (right == true)
    {
      for (int i = 0; i < music.bufferSize() - 1; i++)
      {
        stroke(col, 255, 255);
        float xPos = map(i, 0, music.bufferSize(), x - 2 * s, x - s);
        line(xPos, y + s/6 + s/8 + music.left.get(i), xPos - s, y + s/6 + s/8 + music.left.get(i) * 10);
      }
    } else
    {
      for (int i = 0; i < music.bufferSize() - 1; i++)
      {
        stroke(col, 255, 255);
        float xPos = map(i, 0, music.bufferSize(), x + 2 * s, x + s);
        line(xPos, y + s/6 + s/8 + music.left.get(i), xPos + s, y + s/6 + s/8 + music.left.get(i) * 10);
      }
    }
    
    col -= random(0.5, 0.8);
    if(col <= 0)
    {
      col = 255;
    }
  }
}
