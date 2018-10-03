PImage logo;
PImage green_ghost;
PImage pink_ghost;
PImage red_ghost;
PImage yellow_ghost;
PImage pacman1;

ghost ghosts = new ghost();
player pacman = new player();
score score = new score();
board board = new board();
coins coins = new coins();

void setup()
{
  size(1000, 600, P3D);
  smooth();
  background(0);

  logo = loadImage("logo.png");

  green_ghost = loadImage("green_ghost.png");
  pink_ghost = loadImage("pink_ghost.png");
  red_ghost = loadImage("red_ghost.png");
  yellow_ghost = loadImage("yellow_ghost.png");
  pacman1 = loadImage("pacman.png");
}

void draw()
{
  background(0);
  coins.Draw();

  ghosts.Draw();
  ghosts.Move();

  pacman.Draw();
  pacman.keyPressed();
  
  translate(width/2, height/2);
  board.Draw();
  //image(logo, 400, 7, 210, 45); //actual dimensions (1024, 242)
  //score.Draw();
}
