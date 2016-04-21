class Asteroid extends GameObject
{ 
  Asteroid()
  {
    super();
  }
  
  Asteroid(float x, float y, int size)
  {
    super(x, y);
    radius = 20;
  }
  
  void render()
  {
    pushMatrix();
    
    translate(position.x, position.y);
    rotate(theta);
    ellipse(0, 0, radius, radius);
    
    popMatrix();
  }
  
  void update()
  {
    forward.x = sin(theta) * 10;
    forward.y = - cos(theta) * 10;
  }
}