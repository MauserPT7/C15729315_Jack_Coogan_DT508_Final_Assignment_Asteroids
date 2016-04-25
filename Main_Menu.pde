// Deals with creating and interacting with the main menu
// Shows some text 'in' the gameworld, with instructions on what to do + the games creator and student number
void mainMenu()
{
  if(score >= highScore)
  {
    highScore = score;
  }
  
  if(mainMenu == true
  && gameOver == false)
  {    
    rectMode(CORNER);
    stroke(50, 220, 50);
    strokeWeight(3);
    
    fill(10, 20, 100);
    
    rect(width / 2 - 175, height / 2 - 105, 310, 220);
    rect(width / 2 - 170, height / 2 - 100, 300, 210);
    
    fill(textShadow);
    
    textSize(80);
    text("ASTEROIDS", width / 2 - 201 , height / 2 - 118);
    
    textSize(30);
    text("High Score: " + highScore, width / 2 - 156, height / 2 - 58);
    
    textSize(20);
    text("Use W, A + D to move", width / 2 - 126, height / 2 - 16);
    text("Use SPACE to shoot", width / 2 - 121, height / 2 + 4);
    text("Press any key to continue", width / 2 - 136, height / 2 + 54);
    text("Enjoy!", width / 2 - 46, height / 2 + 84);
    
    textSize(15);
    text("Jack Coogan - C15729315", 14, height - 6);
    
    fill(50, 220, 50);
    
    textSize(80);
    text("ASTEROIDS", width / 2 - 205 , height / 2 - 120);
    
    textSize(30);
    text("High Score: " + highScore, width / 2 - 160, height / 2 - 60);
    
    textSize(20);
    text("Use W, A + D to move", width / 2 - 130, height / 2 - 20);
    text("Use SPACE to shoot", width / 2 - 125, height / 2);
    text("Press any key to continue", width / 2 - 140, height / 2 + 50);
    text("Enjoy!", width / 2 - 50, height / 2 + 80);
    
    textSize(15);
    text("Jack Coogan - C15729315", 10, height - 10);
    
    if(mainMenu == true
    && keyPressed)
    {
      isDead = false;
      mainMenu = false;
    }
  }
}