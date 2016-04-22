// Deals with creating and interacting with the main menu

void mainMenu()
{
  if(mainMenu == true)
  {
    fill(50, 220, 50);
    textSize(50);
    text("ASTEROIDS", width / 2 - 150 , height / 2 - 100);
    textSize(20);
    text("USE W, A + D TO MOVE", width / 2 - 130, 280);
    text("USE SPACE TO SHOOT", width / 2 - 125, 310);
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