// Displays when the player has lost all his lives
void gameOver()
{
  if(gameOver == true)
  {
    fill(textShadow);
    text("GAME OVER", width / 2 - 100 , height / 2 - 120);
    text("High Score: " + highScore , width / 2 - 140, height / 2 - 30);
    text("Press R to Respawn", width / 2 - 140, height / 2 - 45);
    
    fill(50, 220, 50);
    text("GAME OVER", width / 2 - 105 , height / 2 - 125);
    text("High Score: " + highScore , width / 2 - 145, height / 2 - 85);
    text("Press R to Respawn", width / 2 - 145, height / 2 - 50);
    
    stroke(50, 220, 50);
    strokeWeight(3);
    
    noFill();
    
    rectMode(CENTER);
    rect(width / 2, height / 2, 90, 80);
    rect(width / 2, height / 2, 80, 70);
  }
  
  if(keys[6] == true
  && gameOver == true)
  {
    playerLives = 3;
    
    gameOver = false;
    mainMenu = true;
    
    // Makes sure to add only 1 new player ship
    for(int i = 0 ; i < 1 ; i++)
    {
      gameObjects.add(new Warp(width / 2, height / 2));
      gameObjects.add(new Player(width / 2, height / 2));
    }
  }
}