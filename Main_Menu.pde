// Deals with creating and interacting with the main menu
// Works by showing some text 'in' the gameworld, with instructions on what to do + the games creator and student number
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
    
    rect(width / 2 + 50, height / 2 - 105, 440, 230);
    rect(width / 2 + 55, height / 2 - 100, 430, 220);
    
    noFill();
    
    rectMode(CENTER);
    rect(width / 2, height / 2, 90, 80);
    rect(width / 2, height / 2, 80, 70);
    
    fill(textShadow);
    
    textSize(80);
    text("ASTEROIDS", width / 2 - 180 , height / 2 - 115);
    
    textSize(30);
    text("High Score: " + highScore, width / 2 + 65, height / 2 - 60);
    text("<- Spawn Here with any key!", width / 2 + 60, height / 2 - 10);
    text("Use W, A + D to move", width / 2 + 105, height / 2 + 25);
    text("Use SPACE to shoot", width / 2 + 115, height / 2 + 55);
    text("Enjoy!", width / 2 + 175, height / 2 + 95);
    
    textSize(15);
    text("Jack Coogan - C15729315", 15, height - 5);
    
    fill(50, 220, 50);
    
    textSize(80);
    text("ASTEROIDS", width / 2 - 185, height / 2 - 120);
    
    textSize(30);
    text("High Score: " + highScore, width / 2 + 60, height / 2 - 65);
    text("<- Spawn Here with any key!", width / 2 + 55, height / 2 - 15);
    text("Use W, A + D to move", width / 2 + 100, height / 2 + 20);
    text("Use SPACE to shoot", width / 2 + 110, height / 2 + 50);
    text("Enjoy!", width / 2 + 170, height / 2 + 90);
    
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