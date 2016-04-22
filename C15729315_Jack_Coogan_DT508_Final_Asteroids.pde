// C15729315 Jack Coogan DT508 Final Programming Assignment

import ddf.minim.*;

AudioPlayer[] audioPlayer;
Minim minim;

Player player;
AIShip aiShip;
Bullet bullet;
Star star;
Asteroid asteroid;

boolean[] keys;
boolean mainMenu = true;

ArrayList < GameObject > gameObjects = new ArrayList < GameObject > ();
ArrayList < Bullet > bullets = new ArrayList < Bullet > (3);
ArrayList < Star > stars = new ArrayList < Star > ();
ArrayList < Asteroid > asteroids = new ArrayList < Asteroid > ();

float mass;
float time;
float asteroidCount;
float starCount;

PVector speed;
PVector acceleration;
PVector force;

void setup()
{
  size(1200, 600);
  smooth();
  
  asteroidCount = 10;
  starCount = 255;
  
  // instances of the class should have a lower case character
  gameObjects.add(new Star(200, 200));
  gameObjects.add(new AIShip(50, 50));
  gameObjects.add(new Player(width / 2, height / 2));

  keys = new boolean[5];
  keys[0] = false; // 'w'
  keys[1] = false; // 's'
  keys[2] = false; // 'a'
  keys[3] = false; // 'd'
  keys[4] = false; // 'space'
  
  minim = new Minim(this);
  audioPlayer = new AudioPlayer[2];
  
  audioPlayer[0] = minim.loadFile("thrusters.wav");
  audioPlayer[1] = minim.loadFile("lazer.wav");
  //audioPlayers[0].loop();
  
  for(int i = 0 ; i < starCount ; i++)
  {
    stars.add(new Star(random(10, width - 10), random(10, height - 10)));
  }
  
  for(int i = 0 ; i < asteroidCount ; i++)
  {
    asteroids.add(new Asteroid(random(10, width - 10), random(10, height - 10), 0));
  }
}

void draw()
{ 
  background(20);
  
  // Renders stars under everything else
  for(int i = 0 ; i < stars.size() ; i++)
  {
    Star star = stars.get(i);
    star.render();
    star.update();
  }
  
  // Renders asteroids
  for(int i = 0 ; i < asteroids.size() ; i++)
  {
    Asteroid asteroid = asteroids.get(i);
    asteroid.render();
    asteroid.update();
  }

  // Renders bullets
  for(int i = 0 ; i < bullets.size() ; i++)
  {
    Bullet bullet = bullets.get(i);
    bullet.update();
    bullet.render();
  }
  
  // Deals with keeping the total amount of bullets allowed in the scene at 3.
  for(int i = bullets.size() - 1 ; i >= 0 ; i--)
  {
    if(bullets.size() >= 4)
    {
      Bullet bullet = bullets.get(i);
      bullets.remove(0);
    }
  }
  
  // Renders other objects like the player and ai
  for(int i = 0 ; i < gameObjects.size() ; i++)
  {
    GameObject gameObject = gameObjects.get(i);
    gameObject.update();
    gameObject.render();
  }
  
  // Calls the Main Menu function
  mainMenu();
}