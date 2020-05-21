class Planet
{
  float x;
  float y;
  float s;

  float col = random(0, 255);
  float speed = 1;

  float moveDir = random(-1, 1);


  float craterPosX;
  float craterPosY;
  float craterSize;

  Planet()
  {
    x = random(s, width - s);
    y = random(height/2 + s, height - s);
    s = random(10, 40);

    if (moveDir > 0)
    {
      speed = 1;
    } else
    {
      speed = -1;
    }

    craterPosX = random(-s/6, s/6);
    craterPosY = random(-s/6, s/6);
    craterSize = random(s/4, s/2);
  }

  void display()
  {
    //Planet
    noStroke();
    fill(col, 255, 255);
    ellipse(x, y, s, s);
    
    //Crater
    stroke(0);
    fill(col, 200, 200);
    ellipse(craterPosX + x, craterPosY + y, craterSize, craterSize);
  }

  void move()
  {
    x += speed;
    if (x > width + s || x < 0 - s)
    {
      speed *= -1;
      col = random(0, 255);
    }

    y += 0.1;
    if (y > height + s)
    {
      x = 0 - s;
      y = height/2 + s;
      col = random(0, 255);
    }
  }
}
