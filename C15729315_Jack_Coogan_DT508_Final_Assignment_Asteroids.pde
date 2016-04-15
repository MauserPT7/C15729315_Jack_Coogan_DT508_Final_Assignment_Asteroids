// C15729315 Jack Coogan DT508 Final Programming Assignment

// Essential! You need to create the instance
// by calling the constructor, otherwise you will generate a NullPointerException

// distance over time; Dis = Time x S
// rate of chnage of speed; Vel = Acc x Time; meters/second every second
// Chnage in speed; deltaSpeed / deltaTime
// Change in accerlation; time = 
// Mass, Acceleration, Force; A = F / M

Player player;
AIShip aiShip;
Bullet bullet;
Star star;

boolean[] keys;

ArrayList < GameObject > gameObjects = new ArrayList < GameObject > ();
ArrayList < Bullet > bullets = new ArrayList < Bullet > (3);
ArrayList < Star > stars = new ArrayList < Star > (25);

float mass;
float time;
PVector speed;
PVector acceleration;
PVector force;

void setup()
{
  size(1000, 600);
  smooth();
  
  // instances of the class should have a lower case character
  gameObjects.add(new Player(100, 100));
  gameObjects.add(new AIShip(50, 50));
  gameObjects.add(new Star(200, 200));
  //bullets.add(new Bullet(1000, 1000, 0));

  keys = new boolean[5];
  keys[0] = false; // 'w'
  keys[1] = false; // 's'
  keys[2] = false; // 'a'
  keys[3] = false; // 'd'
  keys[4] = false; // 'space'
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
  
  // Menu
  /*
  fill(200, 70);
  noStroke();
  rect(0, 0, width, 50);
  */
}