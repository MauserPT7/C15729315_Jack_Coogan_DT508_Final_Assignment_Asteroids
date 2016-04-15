// WIP, not yet implemented
class Star extends GameObject
{
  float mass;
  float timeDelta = 1.0f / 60.0f;
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
  }

  void render()
  {
    pushMatrix();

    translate(starPosition.x, starPosition.y);
    // rotate(theta);

    strokeWeight(8);
    stroke(0, 200, 250);
    noFill(); 
    
    popMatrix();
  }

  void update()
  {
    forward.x = sin(theta) * shipSpeed;
    forward.y = - cos(theta) * shipSpeed;

    if (starPosition.y <= -10)
    {
      starPosition.y = height;
    }

    if (starPosition.x >= width + 10)
    {
      starPosition.x = 0;
    }

    if (starPosition.y >= height + 10)
    {
      starPosition.y = 0;
    }

    if (starPosition.x <= -10)
    {
      starPosition.x = width;
    }

    if (keys[0])
    {
      force.add(PVector.mult(forward, -100));
    }

    if (keys[2])
    {
      theta -= 0.1f;
    }

    if (keys[3])
    {
      theta += 0.1;
    }

    acceleration = PVector.div(force, mass);
    velocity.add(PVector.mult(acceleration, timeDelta));
    starPosition.add(PVector.mult(velocity, timeDelta));
    velocity.mult(0.99f);
    force.x = force.y = 0;
  }
}