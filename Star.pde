class Star
{
  float x;
  float y;
  float l;
  
  float speed = random(0.1, 0.3);
  
  float col = random(0, 255);
  float brightness = 255;
  
  Star(float tempL)
  {
    x = random(0, width);
    y = random(0, height/2);
    l = tempL;
  }
  
  void display()
  {
    stroke(col, 255, brightness);
    line(x - l, y, x + l, y);
    line(x, y - l, x, y + l);
  }
  
  void fall()
  {//Fall down and fade away
    y += speed;
    brightness -= speed;
    
    //Reset the star
    if(y >= height/2 - l)
    {
      y = 0 - l;
      x = random(0, width);
      brightness = 255;
    }
  }
}
