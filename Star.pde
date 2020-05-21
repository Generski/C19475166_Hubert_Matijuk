class Star
{
  float x;
  float y;
  float l;
  
  float col = random(0, 255);
  
  Star(float tempL)
  {
    x = random(0, width);
    y = random(0, height/2);
    l = tempL;
  }
  
  void display()
  {
    stroke(col, 255, 255);
    line(x - l, y, x + l, y);
    line(x, y - l, x, y + l);
  }
}
