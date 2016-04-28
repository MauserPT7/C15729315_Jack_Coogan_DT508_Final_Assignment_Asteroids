// A red, AI ship that flies around
class AIShip extends GameObject
{
  float mass;
  float timeDelta = 1.0f / 60.0f;
  float radius;
  PVector speed;
  PVector acceleration;
  PVector force;
  
  AIShip()
  {
    super();
  }
  
  AIShip(float x, float y)
  {
    super(x, y);
    force = new PVector();
    acceleration = new PVector();
    mass = 1.0f;
  }
  
  void render()
  {    
    pushMatrix();                      
    
    translate(position.x, position.y);
    rotate(theta);
    
    // Outer Glow
    strokeWeight(8);
    strokeCap(BEVEL);
    stroke(225, 0, 0);
    
    noFill();
    
    quad(0, offset + (offset / 2), 0 + offset, 0 + offset, 0, 0 - offset, 0 - offset, 0 + offset);
    
    line(8, -18, 10, 0);
    line(-8, -18, -10, 0);
    
    // Inner Glow
    strokeWeight(3);
    stroke(100, 0, 0);
    
    quad(0, offset + (offset / 2), 0 + offset, 0 + offset, 0, 0 - offset, 0 - offset, 0 + offset);
    
    line(8, -15, 10, 0);
    line(-8, -15, -10, 0);
    
    // Center-Point
    //ellipse(0, 0, 5, 5);
    
    popMatrix();
  }
  
  // Check for collision against an bullet
  boolean bulletCollisionCheck(ArrayList < Bullet > bullets)
  {
    for(Bullet bullet : bullets)
    {
      PVector distance = PVector.sub(position, bullet.position);
      
      if(distance.mag() < bullet.radius + 30)
      {
        gameObjects.remove(this);
        score += 1000;
        return true;
      }
    }
    
    return false;
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
   
    ExhaustFumes ex = new ExhaustFumes(position.x, position.y, theta);
    gameObjects.add(ex);
    
    bulletCollisionCheck(bullets);
    
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
    
    if (keys[0]
    && gameOver == false)
    {
      force.add(PVector.mult(forward, 400));
    }

    if (keys[2]
    && gameOver == false)
    {
      theta -= 0.1f;
    }

    if (keys[3]
    && gameOver == false)
    {
      theta += 0.1;
    }

    acceleration = PVector.div(force, mass);
    velocity.add(PVector.mult(acceleration, timeDelta));
    position.add(PVector.mult(velocity, timeDelta));
    velocity.mult(0.99f);
    force.x = force.y = 0;
  }
}