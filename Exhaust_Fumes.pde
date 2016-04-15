class ExhaustFumes extends GameObject
{
  ExhaustFumes()
  {
    super();
  }
  
  ExhaustFumes(float x, float y, float theta)
  {
    super(x, y);
    this.theta = theta;
  }
  
  void render()
  {
    pushMatrix();
    
    translate(position.x, position.y);
    rotate(theta);
    
    strokeWeight(6);
    stroke(0, 0, 100, alpha);
    fill(0, 0, 100, alpha);
    ellipse(0, 30, exhaustSize, exhaustSize);
    
    popMatrix();
  }
  
  void update()
  {
    forward.x = sin(theta) * 2;
    forward.y = - cos(theta) * 2;
    
    position.sub(forward);
    alpha -= 8;
    
    if(alpha <= 0)
    {
      gameObjects.remove(this);
    }
  }
}