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
    
    radius = random(20, 45);
  }
  
  void render()
  {
    pushMatrix();
    
    translate(position.x, position.y);
    rotate(theta);
    
    // Outer Glow
    rectMode(CENTER);
    
    noFill();
    
    strokeWeight(16);
    stroke(140);
    
    // Inner Glow
    ellipse(0, 0, radius + (radius / 5), radius + (radius / 5));
    rect(0, 0, radius, radius);
    
    strokeWeight(6);
    stroke(100);
    
    ellipse(0, 0, radius + (radius / 5), radius + (radius / 5));
    rect(0, 0, radius, radius);
    
    // Center-Point
    //ellipse(0, 0, 5, 5);
    
    popMatrix();
  }
  
  void update()
  {
    forward.x = sin(theta) * trajectory;
    forward.y = - cos(theta) * trajectory;
    
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
    if(isDead == false)
    {
      score += 100;
    }
    
    audioPlayer[2].play();
    audioPlayer[2].rewind();
    totalAsteroids --;
    asteroids.remove(this);
  }
}