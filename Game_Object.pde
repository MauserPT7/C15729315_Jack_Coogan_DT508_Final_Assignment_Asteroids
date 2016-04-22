// This class is a global class for both the player and AI ships
class GameObject
{
  public PVector position;
  public PVector starPosition;
  
  PVector forward;
  PVector velocity;
  
  float offset;
  float theta;
  float shipSpeed;
  float exhaustSize;
  float alpha;
  float lazerColour;
  float exhaustColour;
  
  float radius;
  
  int shotRate;
  int shotTime;
  int bulletLifetime;
  
  GameObject(float x, float y)
  {
    position = new PVector(x, y);
    
    forward = new PVector(0, -1);
    velocity = new PVector(0, 0);
    
    offset = 20;
    theta = 0;
    shipSpeed = 2.5;
    
    exhaustSize = random(5, 30);
    
    shotRate = 30;
    bulletLifetime = 120;
    
    alpha = 100;
    lazerColour = color(0, 0, 255);
    exhaustColour = color(255, 0, 0);
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
  
  public void renderBullet()
  {
    
  }
  
  public void updateBullet()
  {
    
  }
}