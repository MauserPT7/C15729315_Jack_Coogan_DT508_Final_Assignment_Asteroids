// The warp is a special effect that appears when the player spawns or respawns
// The function of this is to destroy any asteroids...
// ...that the player might spawn on top of, thus killing them immediatly.
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
    pushMatrix();
    
    translate(position.x, position.y);
    rotate(theta);
    
    strokeWeight(6);
    stroke(0, 0, 100, alpha);
    
    fill(0, 0, 100, alpha);
    
    ellipseMode(CENTER);
    ellipse(0, 0, warpSize, warpSize);
    
    popMatrix();
  }
  
  // Check for collision against an asteroid for safe respawning
  boolean warpCollisionCheck(ArrayList < Asteroid > asteroids)
  {
    for(Asteroid asteroid : asteroids)
    {
      PVector distance = PVector.sub(position, asteroid.position);
      
      if(distance.mag() < asteroid.radius + (warpSize / 2))
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
    warpSize -= 3;
    
    warpCollisionCheck(asteroids);
    
    if(warpSize <= 1)
    {
      warp = false;
      gameObjects.remove(this);
    }
  }
}