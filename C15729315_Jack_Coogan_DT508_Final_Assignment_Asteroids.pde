// C15729315 Jack Coogan DT508 Final Programming Assignment

// Essential! You need to create the instance
// by calling the constructor, otherwise you will generate a NullPointerException

// distance over time; Dis = Time x S
// rate of chnage of speed; Vel = Acc x Time; meters/second every second
// Chnage in speed; deltaSpeed / deltaTime
// Change in accerlation; time = 
// Mass, Acceleration, Force; A = F / M

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
ArrayList < Star > stars = new ArrayList < Star > (25);
ArrayList < Asteroid > asteroids = new ArrayList < Asteroid > ();

float mass;
float time;
float asteroidCount;
PVector speed;
PVector acceleration;
PVector force;

void setup()
{
  size(1000, 600);
  smooth();
  
  asteroidCount = 10;
  
  // instances of the class should have a lower case character
  gameObjects.add(new Player(width / 2, height / 2));
  gameObjects.add(new AIShip(50, 50));
  gameObjects.add(new Star(200, 200));

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
  
  for(int i = 0 ; i < asteroidCount ; i++)
  {
    asteroids.add(new Asteroid(random(10, width - 10), random(10, height - 10), 0));
  }
}

void draw()
{ 
  background(20);
  
  for(int i = 0 ; i < gameObjects.size() ; i++)
  {
    GameObject gameObject = gameObjects.get(i);
    gameObject.update();
    gameObject.render();
  }
  
  // Deals with rendering bullets
  for(int i = 0 ; i < bullets.size() ; i++)
  {
    Bullet bullet = bullets.get(i);
    bullet.updateBullet();
    bullet.renderBullet();
  }
  
  // Deals with keeping the total amount of bullets at 3
  for(int i = bullets.size() - 1 ; i >= 0 ; i--)
  {
    if(bullets.size() >= 4)
    {
      Bullet bullet = bullets.get(i);
      bullets.remove(0);
    }
  }
  
  for(int i = 0 ; i < asteroids.size() ; i++)
  {
    Asteroid asteroid = asteroids.get(i);
    asteroid.render();
    asteroid.update();
  }
  
  // Menu
  if(mainMenu == true)
  {
    fill(200);
    noStroke();
    rect(0, 0, width, height);
    fill(0);
    text("ASTEROIDS", 300 , 110);
    fill(255);
    rect(width / 2 - 150, height / 2 - 100, 300, 200);
    fill(0);
    textSize(30);
    text("Welcome!", 333, 230);
    line(320, 240, 480, 240);
    textSize(20);
    text("USE W, A + D TO MOVE", 330, 280);
    text("SPACE TO SHOOT", 305, 300);
    text("Press any key to continue", 280, 340);
    text("Enjoy!", 375, 380);
    textSize(15);
    text("Jack Coogan - C15729315", 10, 590);
    
    if(mainMenu == true
    && keyPressed)
    {
      mainMenu = false;
    }
  }
}