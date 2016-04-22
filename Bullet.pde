// The projectile the player shoots
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
  
  void render()
  {
    pushMatrix();
    
    translate(position.x, position.y);
    rotate(theta);
    
    strokeWeight(4);
    stroke(0, 255, 40);
    
    line(8, -25, 8, -5);
    line(-8, -25, -8, -5);
    
    // Center-Point
    //ellipse(0, 0, 5, 5);
    
    popMatrix();
  }
  
  boolean collisionCheck(ArrayList < Asteroid > asteroids)
  {
    for(Asteroid asteroid : asteroids)
    {
      PVector distance = PVector.sub(bullet.position, asteroid.position);
      
      if(distance.mag() <= 1000)
      {
        println("Direct Hit!");
        return true;
      }
    }
    
    return false;
  }
  
  void update()
  {
    forward.x = sin(theta) * 10;
    forward.y = - cos(theta) * 10;
    
    position.add(forward);
    
    bulletLifetime--;

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
    
    if(bulletLifetime <= 0)
    {
      bullets.remove(this);
    }
  }
}