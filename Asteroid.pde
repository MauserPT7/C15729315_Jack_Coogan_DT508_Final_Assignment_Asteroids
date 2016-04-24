// Grey rocks that the player shoots
class Asteroid extends GameObject
{  
  Asteroid()
  {
    super();
  }
  
  Asteroid(float x, float y, int size)
  {
    super(x, y);
    
    theta = random(-200, 200);
    trajectory = random(-2, 2);
    
    radius = random(10, 35);
  }
  
  void render()
  {
    pushMatrix();
    
    translate(position.x, position.y);
    rotate(theta);
    
    noFill();
    
    strokeWeight(8);
    stroke(140);
    
    ellipse(0, 0, radius + (radius / 5), radius + (radius / 5));
    
    strokeWeight(3);
    stroke(100);
    
    ellipse(0, 0, radius + (radius / 5), radius + (radius / 5));
    
    // Center-Point
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
  
  void destroyAsteroid(ArrayList < Asteroid > asteroids)
  {
    score += 100;
    audioPlayer[2].play();
    audioPlayer[2].rewind();
    asteroids.remove(this);
  }
}