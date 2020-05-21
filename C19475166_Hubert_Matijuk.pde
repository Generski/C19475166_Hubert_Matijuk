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
Planet[] planets = new Planet[10];

Planet pressedPlanet;

float col = 0;

float shipSize = 50;

int score = 0;

void setup()
{
  size(1024, 512);

  minim = new Minim(this);
  music = minim.loadFile("music.mp3", 1024);
  music.play();

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

  //Instantiate planets
  for (int i = 0; i < planets.length; i++)
  {
    planets[i] = new Planet();
  }

  colorMode(HSB);
}

void draw()
{
  background(0);

  if (music.isPlaying() == true)
  {
    //Drawing rays
    for (int x = 0; x <= width; x += 20)
    {
      stroke(map(x, 0, width, 0, 255), 255, 255);
      line(width/2, height/2, x, height);
    }

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
      s.trail();
    }

    //Draw planets
    for (Planet p : planets)
    {
      p.display();
      p.move();

      //Detecting which planet was pressed
      if (p.press() == true)
      {
        pressedPlanet = p;
      }
    }

    //Score
    if (score <= 0)
    {
      fill(255);
      textSize(20);
      text("Press a planet to start", width/2 - 100, 50);
    } else
    {
      fill(255);
      textSize(20);
      text("Score: " + score, width/2 - 40, 50);
    }
  } else if (music.isPlaying() == false)
  {//Game O
    fill(255);
    textSize(50);
    text("Well done!", width/2 - 125, height/2);
    textSize(30);
    text("Your score: " + score, width/2 - 100, height/2 + 50);
  }
}

void mousePressed()
{
  if (pressedPlanet != null)
  {
    if (pressedPlanet.press() == true)
    {
      score++;
      pressedPlanet.reset();
    } else
    {
      return;
    }
  }
}
