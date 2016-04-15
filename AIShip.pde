class AIShip extends GameObject
{
  AIShip()
  {
    super();
  }
  
  AIShip(float x, float y)
  {
    super(x, y);
  }
  
  void render()
  {
    strokeWeight(3);
    stroke(255, 0, 0);
    
    pushMatrix();                      // Store the old transform
    
    translate(position.x, position.y); // You write these in the opposite order you want them to happen
    rotate(theta);                     // This means rotate first and then translate
    
    quad(0, offset + (offset / 2), 0 + offset, 0 + offset, 0, 0 - offset, 0 - offset, 0 + offset);
    line(8, -15, 10, 0);
    line(-8, -15, -10, 0);
    
    popMatrix();                       // Restore the old transform
  }
  
  void update()
  {
    forward.x = sin(theta) * shipSpeed;
    forward.y = - cos(theta) * shipSpeed;
    position.add(forward);
   
    ExhaustFumes ex = new ExhaustFumes(position.x, position.y, theta);
    gameObjects.add(ex);
    
    if(position.y <= 28)
    {
      theta = radians(90);
    }
    
    if(position.x >= width - 28)
    {
      theta = radians(180);
    }
    
    if(position.y >= height - 28)
    {
      theta = radians(270);
    }
    
    if(position.x <= 28
    && position.y >= 28)
    {
      theta = radians(0);
    }
  }
}