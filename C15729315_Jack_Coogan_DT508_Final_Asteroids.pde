// C15729315 Jack Coogan DT508 Final Programming Assignment

// Audio
import ddf.minim.*;

AudioPlayer[] audioPlayer;
Minim minim;

// Classes
Player player;
AIShip aiShip;
Bullet bullet;
Star star;
Asteroid asteroid;

boolean[] keys;
boolean mainMenu = true; // Checks if to display the main menu or not

// Objects that are duplicated are put into arrays
ArrayList < GameObject > gameObjects = new ArrayList < GameObject > ();
ArrayList < Bullet > bullets = new ArrayList < Bullet > (3);
ArrayList < Star > stars = new ArrayList < Star > ();
ArrayList < Asteroid > asteroids = new ArrayList < Asteroid > ();

float asteroidCount;
float starCount;
float mass;

PVector speed;
PVector acceleration;
PVector force;

void setup()
{
  size(1200, 600);
  smooth();
  
  // How many of each there should be
  asteroidCount = 10;
  starCount = 255;
  
  gameObjects.add(new AIShip(50, 50));
  gameObjects.add(new Player(width / 2, height / 2));

  keys = new boolean[5];
  keys[0] = false; // 'w'
  keys[1] = false; // 's'
  keys[2] = false; // 'a'
  keys[3] = false; // 'd'
  keys[4] = false; // 'space'
  
  // Setting up the audio files and library
  minim = new Minim(this);
  audioPlayer = new AudioPlayer[2];
  
  audioPlayer[0] = minim.loadFile("thrusters.wav");
  audioPlayer[1] = minim.loadFile("lazer.wav");
  //audioPlayers[0].loop();
  
  // Calculates position for the stars in the array
  for(int i = 0 ; i < starCount ; i++)
  {
    stars.add(new Star(random(10, width - 10), random(10, height - 10)));
  }
  
  // Calculates position for each asteroid in the array
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

  // Renders bullets, when shot
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
    if(mainMenu == false)
    {
      GameObject gameObject = gameObjects.get(i);
      gameObject.update();
      gameObject.render();
    }
  }
  
  // Calls the Main Menu function
  mainMenu();
}