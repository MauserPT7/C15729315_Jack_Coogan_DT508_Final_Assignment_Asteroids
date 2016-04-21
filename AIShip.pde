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
    
    translate(aiPosition.x, aiPosition.y); // You write these in the opposite order you want them to happen
    rotate(theta);                     // This means rotate first and then translate
    //ellipse(0, 0, 10, 10);
    quad(0, offset + (offset / 2), 0 + offset, 0 + offset, 0, 0 - offset, 0 - offset, 0 + offset);
    line(8, -15, 10, 0);
    line(-8, -15, -10, 0);
    
    popMatrix();                       // Restore the old transform
  }
  
  void update()
  {
    forward.x = sin(theta) * shipSpeed;
    forward.y = - cos(theta) * shipSpeed;
    aiPosition.add(forward);
   
    ExhaustFumes ex = new ExhaustFumes(aiPosition.x, aiPosition.y, theta);
    gameObjects.add(ex);
    
    if(aiPosition.y <= 28)
    {
      theta = radians(90);
    }
    
    if(aiPosition.x >= width - 28)
    {
      theta = radians(180);
    }
    
    if(aiPosition.y >= height - 28)
    {
      theta = radians(270);
    }
    
    if(aiPosition.x <= 28
    && aiPosition.y >= 28)
    {
      theta = radians(0);
    }
  }
}