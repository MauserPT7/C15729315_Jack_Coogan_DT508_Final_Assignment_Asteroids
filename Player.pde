// The character the player controls in the game
class Player extends GameObject
{
  float mass;
  float timeDelta = 1.0f / 60.0f;
  PVector speed;
  PVector acceleration;
  PVector force;
  
  Player()
  {
    super();
  }
  
  Player(float x, float y)
  {
    super(x, y);
    force = new PVector();
    acceleration = new PVector();
    mass = 0.7f;
    isDead = false;
  }
  
  void render()
  {   
    pushMatrix();
    
    translate(position.x, position.y);
    rotate(theta);                     
    
    // Outer Glow
    strokeWeight(8);
    stroke(0, 200, 250);
    strokeCap(BEVEL);
    
    noFill();
    
    line(8, -23, 8, -3);
    line(-8, -23, -8, -3);
    
    quad(0, (offset / 2), 0 + offset, 0 + offset, 0, 0 - offset, 0 - offset, 0 + offset);
    
    // Inner Glow
    strokeWeight(3);
    stroke(0, 100, 200);
    
    line(8, -20, 10, 0);
    line(-8, -20, -10, 0);
    
    quad(0, (offset / 2), 0 + offset, 0 + offset, 0, 0 - offset, 0 - offset, 0 + offset);
    
    popMatrix();
  }
  
  // Checks for when the players crashes into an asteroid
  boolean playerCollisionCheck(ArrayList < Asteroid > asteroids)
  {
    for(Asteroid asteroid : asteroids)
    {
      PVector distance = PVector.sub(position, asteroid.position);
      
      if(distance.mag() < asteroid.radius + 13)
      {
        audioPlayer[3].rewind();
        audioPlayer[3].play();
        
        if(playerLives <= 0)
        {
          score = 0;
          isDead = true;
          gameOver = true;
        }
        
        else if(gameOver == false)
        {
          playerLives -= 1;
          gameObjects.add(new Player(width / 2, height / 2));
        }
        
        gameObjects.remove(this);
        return true;
      }
    }
    
    return false;
  }
  
  void update()
  {
    forward.x = sin(theta) * shipSpeed;
    forward.y = - cos(theta) * shipSpeed;
    
    shotRate--;
    
    playerCollisionCheck(asteroids);
    
    isDead = false;
   
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
    
    if(keys[0])
    {
      force.add(PVector.mult(forward, 100));
      
      ExhaustFumes ex = new ExhaustFumes(position.x, position.y, theta);
      gameObjects.add(ex);
      //audioPlayer[0].rewind();
      audioPlayer[0].play();
    }
    
    else if(!keys[0])
    {
      audioPlayer[0].rewind();
    }
      
    // keys[1] ('s') is not used as there is no reverse thrust for the player
     
    if(keys[2])
    {
      theta -= 0.1f;
    }
      
    if(keys[3])
    {
      theta += 0.1;
    }
    
    // Handles the firing and fire rate of bullets
    if(keys[4]
    && bullets.size() <= 2)
    {
      Bullet bullet = new Bullet(position.x, position.y, theta);
      
      if(shotRate <= 0)
      {
        bullets.add(bullet);
        shotRate = 30;        
        audioPlayer[1].rewind();
        audioPlayer[1].play();
      }
    }
    
    acceleration = PVector.div(force, mass);
    velocity.add(PVector.mult(acceleration, timeDelta));
    position.add(PVector.mult(velocity, timeDelta));
    velocity.mult(0.99f);
    force.x = force.y = 0;
  }
}