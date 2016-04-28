// Displays when the player has lost all his lives
void gameOver()
{
  if(gameOver == true)
  {
    fill(textShadow);
    text("GAME OVER", width / 2 - 100 , height / 2 - 100);
    text("High Score: " + highScore , width / 2 - 140, height / 2 - 60);
    text("Press R to Respawn", width / 2 - 140, height / 2 - 25);
    
    fill(50, 220, 50);
    text("GAME OVER", width / 2 - 105 , height / 2 - 105);
    text("High Score: " + highScore , width / 2 - 145, height / 2 - 65);
    text("Press R to Respawn", width / 2 - 145, height / 2 - 30);
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
      gameObjects.add(new Player(width / 2, height / 2));
    }
  }
}