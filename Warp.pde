class Warp extends GameObject
{
  Warp()
  {
    super();
  }
  
  Warp(float x, float y)
  {
    super(x, y);
  }
  
  void render()
  {    
    strokeWeight(6);
    stroke(0, 0, 100, alpha);
    
    fill(0, 0, 100, alpha);
    
    ellipseMode(CENTER);
    ellipse(0, 0, warpSize, warpSize);
  }
  
  // Check for collision against an asteroid for safe respawning
  boolean warpCollisionCheck(ArrayList < Asteroid > asteroids)
  {
    for(Asteroid asteroid : asteroids)
    {
      PVector distance = PVector.sub(position, asteroid.position);
      
      if(distance.mag() < asteroid.radius + warpSize)
      {
        asteroid.destroyAsteroid(asteroids);
        warp = true;
        
        return true;
      }
    }
    
    return false;
  }
  
  void update()
  {
    warpSize --;
    
    warpCollisionCheck(asteroids);
    
    if(warpSize <= 0)
    {
      warp = false;
      gameObjects.remove(this);
    }
  }
}