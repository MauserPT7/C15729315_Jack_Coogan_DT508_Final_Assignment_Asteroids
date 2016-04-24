// The stars that render in the background, moves with the player
class Star extends GameObject
{
  float mass;
  float timeDelta = 1.0f / 60.0f;
  float radius;
  PVector speed;
  PVector acceleration;
  PVector force;

  Star()
  {
    super();
  }

  Star(float x, float y)
  {
    super(x, y);
    force = new PVector();
    acceleration = new PVector();
    mass = 1.0f;
    radius = random(1, 3);
  }

  void render()
  {
    pushMatrix();
    
    strokeWeight(2);
    stroke(255 , 50);
    fill(255, 255, 200);
    translate(position.x, position.y);
    ellipse(0, 0, radius, radius);
    
    popMatrix();
  }

  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);

    if (position.y <= -10)
    {
      position.y = height;
    }

    if (position.x >= width + 10)
    {
      position.x = 0;
    }

    if (position.y >= height + 10)
    {
      position.y = 0;
    }

    if (position.x <= -10)
    {
      position.x = width;
    }

    if (keys[0]
    && isDead == true)
    {
      force.add(PVector.mult(forward, -100));
    }

    if (keys[2]
    && isDead == true)
    {
      theta -= 0.1f;
    }

    if (keys[3]
    && isDead == true)
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