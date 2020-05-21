import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer music;

Star[] stars = new Star[100];
Ship[] ships = new Ship[2];

float col = 0;

float shipSize = 50;

void setup()
{
  size(1024, 512);

  minim = new Minim(this);
  music = minim.loadFile("music.mp3", 1024);
  music.loop();

  //Instantiate stars
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star(3);
  }

  //Instantiate ships
  for (int i = 0; i < ships.length; i++)
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

  /*//Line
   stroke(255);
   line(0, height/2, width, height/2);
   */
  
  //Line
  for (int i = 0; i < music.bufferSize() - 1; i++)
  {
    stroke(255);
    float x = map(i, 0, music.bufferSize(), 0, width);
    line(x, height/2 + music.left.get(i), x, height/2 + music.left.get(i) * 10);
  }

  //Drawing stars
  for (Star s : stars)
  {
    s.display();
    s.fall();
  }

  //Drawing ships
  for (Ship s : ships)
  {
    s.display();
    s.move();
  }
}
