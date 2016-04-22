class Asteroid extends GameObject
{ 
  float trajectory;
  
  Asteroid()
  {
    super();
  }
  
  Asteroid(float x, float y, int size)
  {
    super(x, y);
    radius = random(10, 35);
    theta = random(-200, 200);
    trajectory = random(-2, 2);
  }
  
  void render()
  {
    
    pushMatrix();
    
    translate(position.x, position.y);
    
    strokeWeight(8);
    stroke(140);
    noFill();
    rotate(theta);
    rect(0, 0, radius, radius);
    
    strokeWeight(3);
    stroke(100);
    rect(0, 0, radius, radius);
    
    //ellipse(0, 0, 5, 5);
    
    popMatrix();
  }
  
  void update()
  {
    forward.x = sin(trajectory) * trajectory;
    forward.y = - cos(trajectory) * trajectory;    
    position.add(forward);
    
    theta -= 0.01f;
    
    if(position.y <= -10)
    {
      position.y = height;
    }
      
    if(position.x >= width + 10)
    {
      position.x = 0;
    }
      
    if(position.y >= height + 10)
    {
      position.y = 0;
    }
      
    if(position.x <= -10)
    {
      position.x = width;
    }
  }
}