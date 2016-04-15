class Bullet extends GameObject
{ 
  Bullet()
  {
    super();
  }
  
  Bullet(float x, float y, float theta)
  {
    super(x, y);
    this.theta = theta;
  }
  
  void renderBullet()
  {
    pushMatrix();
    
    translate(bulletPosition.x, bulletPosition.y);
    rotate(theta);
    
    strokeWeight(2);
    stroke(0, 200, 255);
    ellipse(0, 0, 10, 10);
    line(8, -25, 8, -5);
    line(-8, -25, -8, -5);
    
    popMatrix();
  }
  
  void updateBullet()
  {
    forward.x = sin(theta) * 10;
    forward.y = - cos(theta) * 10;
    bulletPosition.add(forward);
    
    bulletLifetime--;

    if(bulletPosition.y <= -10)
    {
      bulletPosition.y = height;
    }
      
    if(bulletPosition.x >= width + 10)
    {
      bulletPosition.x = 0;
    }
      
    if(bulletPosition.y >= height + 10)
    {
      bulletPosition.y = 0;
    }
      
    if(bulletPosition.x <= -10)
    {
      bulletPosition.x = width;
    }
    
    if(bulletLifetime <= 0)
    {
      bullets.remove(this);
    }
    
    if(aiPosition.x <= bulletPosition.x
    && aiPosition.x + 5 >= bulletPosition.x
    && aiPosition.y <= bulletPosition.y
    && aiPosition.y + 5 >= bulletPosition.y)
    {
      //gameObjects.remove(this);
      println("Direct Hit");
    }
  }
}