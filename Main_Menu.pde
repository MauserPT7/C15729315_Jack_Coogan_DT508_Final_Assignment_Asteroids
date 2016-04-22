// Deals with creating and interacting with the main menu

void mainMenu()
{
  if(mainMenu == true)
  {
    fill(200);
    noStroke();
    rect(0, 0, width, height);
    fill(0);
    text("ASTEROIDS", 300 , 110);
    fill(255);
    rect(width / 2 - 150, height / 2 - 100, 300, 200);
    fill(0);
    textSize(30);
    text("Welcome!", 333, 230);
    line(320, 240, 480, 240);
    textSize(20);
    text("USE W, A + D TO MOVE", 330, 280);
    text("SPACE TO SHOOT", 305, 300);
    text("Press any key to continue", 280, 340);
    text("Enjoy!", 375, 380);
    textSize(15);
    text("Jack Coogan - C15729315", 10, 590);
    
    if(mainMenu == true
    && keyPressed)
    {
      mainMenu = false;
    }
  }
}