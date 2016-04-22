// A red, AI ship that flies around
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
    pushMatrix();                      
    
    translate(position.x, position.y);
    rotate(theta);
    
    strokeWeight(8);
    strokeCap(BEVEL);
    stroke(225, 0, 0);
    
    noFill();
    
    quad(0, offset + (offset / 2), 0 + offset, 0 + offset, 0, 0 - offset, 0 - offset, 0 + offset);
    line(8, -18, 10, 0);
    line(-8, -18, -10, 0);
    
    strokeWeight(3);
    stroke(100, 0, 0);
    
    quad(0, offset + (offset / 2), 0 + offset, 0 + offset, 0, 0 - offset, 0 - offset, 0 + offset);
    line(8, -15, 10, 0);
    line(-8, -15, -10, 0);
    
    // Center-Point
    //ellipse(0, 0, 5, 5);
    
    popMatrix();
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