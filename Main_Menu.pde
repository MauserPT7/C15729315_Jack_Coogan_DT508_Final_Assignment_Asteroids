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
    
    rect(155, height / 2 - 105, 310, 300);
    rect(160, height / 2 - 100, 300, 290);
    
    noFill();
    //rect(90, height / 2 - 5, 90, 80);
    //rect(95, height / 2, 80, 70);
    
    fill(textShadow);
    
    textSize(80);
    text("ASTEROIDS", width / 2 - 100 , height / 2 - 115);
    
    textSize(30);
    text("High Score: " + highScore, 125, height / 2 - 60);
    text("Spawn Here!", width / 2 + 50, height / 2 - 10);
    
    textSize(20);
    text("Use W, A + D to move", 90, height / 2 - 15);
    text("Use SPACE to shoot", 90, height / 2 + 5);
    text("Press any key to spawn ->", 75, height / 2 + 55);
    text("Enjoy!", 25, height / 2 + 85);
    
    textSize(15);
    text("Jack Coogan - C15729315", 15, height - 5);
    
    fill(50, 220, 50);
    
    textSize(80);
    text("ASTEROIDS", width / 2 - 105, height / 2 - 120);
    
    textSize(30);
    text("High Score: " + highScore, 130, height / 2 - 65);
    text("Spawn Here!", width / 2 + 45, height / 2 - 15);
    
    textSize(20);
    text("Use W, A + D to move", 95, height / 2 - 20);
    text("Use SPACE to shoot", 95, height / 2);
    text("Press any key to spawn ->", 80, height / 2 + 50);
    text("Enjoy!", 30, height / 2 + 80);
    
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