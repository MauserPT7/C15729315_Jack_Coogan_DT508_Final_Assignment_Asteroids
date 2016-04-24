// Deals with creating and interacting with the main menu
// Shows some text 'in' the gameworld, with instructions on what to do + the games creator and student number
void mainMenu()
{
  if(score >= highScore)
  {
    highScore = score;
  }
  
  if(mainMenu == true)
  {
    
    stroke(50, 220, 50);
    
    fill(10, 20, 100);
    
    rect(width / 2 - 175, height / 2 - 105, 310, 220);
    rect(width / 2 - 170, height / 2 - 100, 300, 210);
    
    fill(20);
    
    textSize(50);
    text("ASTEROIDS", width / 2 - 146 , height / 2 - 118);
    
    textSize(30);
    text("High Score: " + highScore, width / 2 - 156, height / 2 - 58);
    
    textSize(20);
    text("Use W, A + D to move", width / 2 - 126, 282);
    text("Use SPACE to shoot", width / 2 - 121, 312);
    text("Press any key to continue", width / 2 - 136, 362);
    text("Enjoy!", width / 2 - 46, 392);
    
    textSize(15);
    text("Jack Coogan - C15729315", 10, 590);
    
    fill(50, 220, 50);
    
    textSize(50);
    text("ASTEROIDS", width / 2 - 150 , height / 2 - 120);
    
    textSize(30);
    text("High Score: " + highScore, width / 2 - 160, height / 2 - 60);
    
    textSize(20);
    text("Use W, A + D to move", width / 2 - 130, 280);
    text("Use SPACE to shoot", width / 2 - 125, 310);
    text("Press any key to continue", width / 2 - 140, 360);
    text("Enjoy!", width / 2 - 50, 390);
    
    textSize(15);
    text("Jack Coogan - C15729315", 10, 590);
    
    if(mainMenu == true
    && keyPressed)
    {
      mainMenu = false;
    }
  }
}