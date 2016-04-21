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
    radius = 50;
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
  
  boolean CollisionCheck(ArrayList < Asteroid > asteroids)
  {
    for(Asteroid asteroid : asteroids)
    {
      PVector distance = PVector.sub(bulletPosition, asteroid.position);
      
      if(distance.mag() <= asteroid.radius + radius)
      {
        println("Direct Hit!");
        return true;
      }
    }
    
    return false;
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
  }
}