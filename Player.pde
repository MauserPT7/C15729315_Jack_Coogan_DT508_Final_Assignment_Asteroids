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
    mass = 1.0f;
  }
  
  void render()
  {   
    pushMatrix();                      // Store the old transform
    
    translate(playerPosition.x, playerPosition.y); // You write these in the opposite order you want them to happen
    rotate(theta);                     // This means rotate first and then translate
    
    strokeWeight(8);
    stroke(0, 200, 250);
    noFill();
    strokeCap(BEVEL);
    line(8, -23, 8, 0);
    line(-8, -23, -8, 0);
    quad(0, (offset / 2), 0 + offset, 0 + offset, 0, 0 - offset, 0 - offset, 0 + offset);
    
    strokeWeight(3);
    stroke(0, 100, 200);
    line(8, -20, 10, 0);
    line(-8, -20, -10, 0);
    quad(0, (offset / 2), 0 + offset, 0 + offset, 0, 0 - offset, 0 - offset, 0 + offset);
    
    
    popMatrix(); // Restore the old transform
  }
  
  void update()
  {
    forward.x = sin(theta) * shipSpeed;
    forward.y = - cos(theta) * shipSpeed;
    
    shotRate--;
    
    /*
    velocity.x = forward.x;
    velocity.y = forward.y;
    */
    
    if(playerPosition.y <= -10)
    {
      playerPosition.y = height;
    }
      
    if(playerPosition.x >= width + 10)
    {
      playerPosition.x = 0;
    }
      
    if(playerPosition.y >= height + 10)
    {
      playerPosition.y = 0;
    }
      
    if(playerPosition.x <= -10)
    {
      playerPosition.x = width;
    }
    
    if(keys[0])
    {
      force.add(PVector.mult(forward, 100));
      
      ExhaustFumes ex = new ExhaustFumes(playerPosition.x, playerPosition.y, theta);
      gameObjects.add(ex);
      audioPlayer[0].play();
    }
    
    else if(!keys[0])
    {
      audioPlayer[0].rewind();
      //audioPlayer[0].loop();
      //minim.stop();
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
    
    if(keys[4]
    && bullets.size() <= 2)
    {
      Bullet bullet = new Bullet(playerPosition.x, playerPosition.y, theta);
      
      if(shotRate <= 0)
      {
        bullets.add(bullet);
        shotRate = 30;
        audioPlayer[1].play();
        audioPlayer[1].rewind();
      }
    }
    
    acceleration = PVector.div(force, mass);
    velocity.add(PVector.mult(acceleration, timeDelta));
    playerPosition.add(PVector.mult(velocity, timeDelta));
    velocity.mult(0.99f);
    force.x = force.y = 0;
  }
}