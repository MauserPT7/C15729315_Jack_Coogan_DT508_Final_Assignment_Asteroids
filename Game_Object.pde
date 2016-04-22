// This class is a global class for both the player and AI ships
class GameObject
{
  // General positioning and game physics
  public PVector position;
  
  PVector forward;
  PVector velocity;
  
  float theta;
  
  // Player + AI
  float offset;
  float shipSpeed;
  
  // Exhaust Fumes
  float exhaustSize;
  float exhaustColour;
  float alpha;
  
  // Asteroids
  float radius;
  float trajectory;
  
  // Bullets
  int shotRate;
  int shotTime;
  int bulletLifetime;
  
  GameObject(float x, float y)
  {
    position = new PVector(x, y);
    
    forward = new PVector(0, -1);
    velocity = new PVector(0, 0);
    theta = 0;
    
    offset = 20;
    shipSpeed = 2.5;
    
    shotRate = 30;
    bulletLifetime = 120;
    
    alpha = 100;
    exhaustSize = random(5, 30);
  }
  
  GameObject()
  {
    this(200, 130);
  }
  
  public void render()
  {
    
  }
  
  public void update()
  {
    
  }
}