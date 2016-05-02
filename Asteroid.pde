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
    trajectory = random(-3, 3);
    
    asteroidSize = size;
    
    totalAsteroids ++;
    
    // Large
    if(size == 0)
    {
      radius = 50;
    }
    
    // Medium
    if(size == 1)
    {
      radius = 30;
    }
    
    // Small
    if(size == 2)
    {
      radius = 15;
    }
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
    
    //theta -= 0.01f;
    
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
  
  // Handles what happens when different sized asteroids are destroyed
  // Is called by the bullet
  void destroyAsteroid(ArrayList < Asteroid > asteroids)
  {    
    if(asteroidSize == 0
    && isDead == false
    && warp == false)
    {      
      for(int i = 0 ; i < 2 ; i++)
      {
        float theta = random(2 * PI);
        PVector newRotation = new PVector(radius * sin(theta), radius * cos(theta));
        asteroids.add(new Asteroid(position.x, position.y, 1));
      }
      
      score += 100;
      asteroids.remove(this);
    }
    
    if(asteroidSize == 1
    && isDead == false
    && warp == false)
    {
      for(int i = 0 ; i < 2 ; i++)
      {
        float theta = random(2 * PI);
        PVector newRotation = new PVector(radius * sin(theta), radius * cos(theta));
        asteroids.add(new Asteroid(position.x, position.y, 2));
      }
      
      score += 200;
      asteroids.remove(this);
    }
    
    if(asteroidSize == 2
    && isDead == false
    && warp == false)
    {
      score += 500;
      asteroids.remove(this);
    }
    
    if(asteroidSize == 0
    || asteroidSize == 1
    || asteroidSize == 2
    && warp == true)
    {
      asteroids.remove(this);
    }
    
    totalAsteroids --;
    audioPlayer[2].play();
    audioPlayer[2].rewind();
  }
}