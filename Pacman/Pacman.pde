/*
ME
- Pacman and wall collision
- Grid
- Game screens: menu, game, gameover
  Menu
    - Pacman, ghosts, coins visual
    - Text
   Game
    - Ghost movement
    - Ghost and pacman collision
    - Pacman open and close mouth, flips when change in direction
  Gameover
    - Text
*/

PImage logo;
PImage green_ghost;
PImage pink_ghost;
PImage red_ghost;
PImage yellow_ghost;
PImage pacman1;
PImage pacman2;
PImage pacman3;
PImage pacman4;

PFont mono;
int gameScreen = 0;

ghost ghosts[] = new ghost[4];
player pacman = new player();
score score = new score();
board board = new board();
coins coins = new coins();

void setup()
{
  size(1000, 600, P3D);
  smooth();
  background(0);
  for (int i = 0; i < ghosts.length; i++) {
    ghosts[i] = new ghost();
  }

  logo = loadImage("logo.png");

  pink_ghost = loadImage("pink_ghost.png");
  ghosts[0].img = pink_ghost;
  ghosts[0].SetNodes(500, 380, 355, 380, 355, 190, 200, 190, 190, 100, 190, 190, 115, 190, 115, 380);

  green_ghost = loadImage("green_ghost.png");
  ghosts[1].img = green_ghost;
  ghosts[1].SetNodes(120, 280, 120, 380, 300, 380, 300, 475, 680, 475, 680, 380, 120, 380, 120, 280);

  yellow_ghost = loadImage("yellow_ghost.png");
  ghosts[2].img = yellow_ghost;
  ghosts[2].SetNodes(460, 190, 460, 190, 300, 190, 300, 90, 680, 90, 680, 190, 120, 190, 120, 190);

  red_ghost = loadImage("red_ghost.png");
  ghosts[3].img = red_ghost;
  ghosts[3].SetNodes(850, 280, 850, 380, 790, 380, 790, 480, 935, 480, 935, 80, 935, 280, 850, 280);

  pacman1 = loadImage("pacman.png");
  pacman2 = loadImage("pacman copy.png");
  pacman3 = loadImage("pacman copy 2.png");
  pacman4 = loadImage("pacman copy 3.png");
}

void draw()
{
  background(0);

  if (gameScreen == 0) {
    menuScreen();
  }
  if (gameScreen == 1) {
    gameScreen();
  }
  if (gameScreen == 2) {
    gameOverScreen();
  }
}

void menuScreen()
{
  float textsize = 20;

  background(0);
  textAlign(CENTER);
  fill(255);
  mono = loadFont("AppleBraille-15.vlw");
  textFont(mono);
  textSize(textsize);
  text("S T A R T", width/2, height/2+10);

  if (mouseX>width/2-100&&mouseX<width/2+100&&mouseY>height/2-1005&&mouseY<height/2+100)
  {
    textsize = 40;
  }

  image(pink_ghost, 55, height/2-17, 50, 50);
  image(green_ghost, 130, height/2-15, 40, 40);
  image(yellow_ghost, 200, height/2-15, 40, 40);
  image(red_ghost, 270, height/2-20, 50, 50);
  image(pacman1, 620, height/2-20, 50, 50);
  ellipse(width-300, height/2+5, 20, 20);
  ellipse(width-250, height/2+5, 20, 20);
  ellipse(width-200, height/2+5, 20, 20);
  ellipse(width-150, height/2+5, 20, 20);
  ellipse(width-100, height/2+5, 20, 20);
}

void gameScreen()
{
  image(logo, 370, 10, 260, 40); //actual dimensions (1024, 242)

  pacman.Draw();
  pacman.keyPressed();
  coins.Draw();
  //float dist = dist(pacman.posx, pacman.posy, coins.x, coins.y);

  //if (dist < 10)
  {
    //coins.size = 0;
  }
  for (int i = 0; i < ghosts.length; i++) {
    ghosts[i].Draw();
    ghosts[i].Move();

    float d = dist(pacman.posx, pacman.posy, ghosts[i].x, ghosts[i].y);

    if (d < 10)
    {
      background(255, 0, 0);
      gameOverScreen();
      
    }
  }

  fill(0);
  rect(width/2, height/2-55, 100, 25);

  pushMatrix();
  translate(width/2, height/2);
  board.Draw();
  popMatrix();
  //score.Draw();
}

void gameOverScreen()
{
  background(0);
  textAlign(CENTER);
  fill(255);
  mono = loadFont("AppleBraille-15.vlw");
  textFont(mono);
  textSize(30);
  text("G A M E  O V E R", width/2, height/2+10);
}

void mousePressed()
{
  if (gameScreen == 0)
  {
    startGame();
  }
}

void startGame()
{
  gameScreen = 1;
}
