// Toggles keys on and off for multiple key-pressing
void keyPressed()
{
  if(key == 'w')
  {
    keys[0] = true;
  }
 
  if(key == 's')
  {
    keys[1] = true;
  }
  
  if(key == 'a')
  {
    keys[2] = true;
  }
 
  if(key == 'd')
  {
    keys[3] = true;
  }
  
  if(key == ' ')
  {
    keys[4] = true;
  }
  
  if(key == 'p')
  {
    keys[5] = true;
  }
}

void keyReleased()
{
  if(key == 'w')
  {
    keys[0] = false;
  }
 
  if(key == 's')
  {
    keys[1] = false;
  }
  
  if(key == 'a')
  {
    keys[2] = false;
  }
 
  if(key == 'd')
  {
    keys[3] = false;
  }
  
  if(key == ' ')
  {
    keys[4] = false;
  }
  
  if(key == 'p')
  {
    keys[5] = false;
  }
}