// Classes are a description of what a software "this" IS 
// And what it DOES
// Class names should start with an UPPERCASE characte
// Its fields are what the Ship IS
// A constructor is a special method used to create
// objects from the class
// AKA an instance of the class
// Constructors do not have a return type
// Its always the same name as the class
// You can have lots of constructors so long as they all take different parameters 

// This class is a global class for both the player and AI ships
class GameObject
{
  public PVector position;
  public PVector aiPosition;
  public PVector playerPosition;
  public PVector bulletPosition;
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
  
  int shotRate;
  int shotTime;
  int bulletLifetime;
  
  GameObject(float x, float y)
  {
    position = new PVector(x, y);
    aiPosition = new PVector(x, y);
    starPosition = new PVector(x, y);
    bulletPosition = new PVector(x, y);
    playerPosition = new PVector(x, y);
    
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
    // 'this' is used to call a Constructor in the same class
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