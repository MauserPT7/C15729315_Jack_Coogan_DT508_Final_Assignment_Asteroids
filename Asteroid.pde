class Asteroid extends GameObject
{
  Asteroid()
  {
    super();
  }
  
  Asteroid(float x, float y, int size)
  {
    super(x, y);
  }
  
  void render()
  {
    pushMatrix();
    
    translate(bulletPosition.x, bulletPosition.y);
    rotate(theta);
    rect(100, 100, 10, 10);
    popMatrix();
  }
  
  void update()
  {
    forward.x = sin(theta) * 10;
    forward.y = - cos(theta) * 10;
  }
}