/*
NOT ME
- Pacman and coin collision (I understand)
- Pacman and wall collision (I don't understand)
- Grid (I understand)

ME
- Intro, main, and death music
- Game screens: menu, game, gameover
  Menu
    - Pacman, ghosts, coins visual
    - Click text (font, size increase)
   Game
    - Ghost movement
    - Ghost and pacman collision
  Gameover
    - Click text (font, size increase)
*/

import java.util.Deque;
import java.util.Iterator;
import java.util.LinkedList;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer introSong;
AudioPlayer mainSong;
AudioPlayer coinSong;
AudioPlayer deathSong;
AudioInput input;

PFont mono;
Pacman pacman;

PImage green_ghost;
PImage pink_ghost;
PImage red_ghost;
PImage yellow_ghost;
PImage pacman1;
Ghost ghosts[] = new Ghost[4];

int gameScreen = 0;

PImage maze;
Tile[][] tiles = new Tile[31][28];
int[][] tilesRepresentation = { 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
  {1, 8, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 8, 1}, 
  {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
  {1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 6, 1, 1, 6, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
  {1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 6, 1, 1, 6, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
  {1, 1, 1, 1, 1, 1, 0, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
  {1, 1, 1, 1, 1, 1, 0, 1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1, 6, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
  {1, 1, 1, 1, 1, 1, 0, 1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1, 6, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
  {1, 1, 1, 1, 1, 1, 0, 6, 6, 6, 1, 1, 1, 1, 1, 1, 1, 1, 6, 6, 6, 0, 1, 1, 1, 1, 1, 1}, 
  {1, 1, 1, 1, 1, 1, 0, 1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1, 6, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
  {1, 1, 1, 1, 1, 1, 0, 1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1, 6, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
  {1, 1, 1, 1, 1, 1, 0, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
  {1, 1, 1, 1, 1, 1, 0, 1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1, 6, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
  {1, 1, 1, 1, 1, 1, 0, 1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1, 6, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
  {1, 8, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 8, 1}, 
  {1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1}, 
  {1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1}, 
  {1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1}, 
  {1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}};

void setup() {
  frameRate(100);
  size(448, 496);
  background(0);
  maze = loadImage("map.png");

  minim = new Minim(this);
  introSong = minim.loadFile("intro.mp3");
  mainSong = minim.loadFile("main.mp3");
  coinSong = minim.loadFile("coin.mp3");
  deathSong = minim.loadFile("death.mp3");
  input = minim.getLineIn();

  for (int i = 0; i < ghosts.length; i++) {
    ghosts[i] = new Ghost();
  }

  pacman1 = loadImage("pacman.png");

  pink_ghost = loadImage("pink_ghost.png");
  ghosts[0].img = pink_ghost; //done
  ghosts[0].SetNodes(94, height/2-25, 94, 12, 14, 14, 12, 130, 94, 130, 94, 12, 94, 130, 94, 314, 94, 314);

  green_ghost = loadImage("green_ghost.png");
  ghosts[1].img = green_ghost; //not done
  //(x,     y,       x2,   y2,  x3,  y3,  x4,  y4,  x5,  y5,  x6,  y6,  x7,  y7,  x8,  y8,  x9,  y9)
  ghosts[1].SetNodes(335, height/2-25, 335, 410, 415, 410, 415, 460, 240, 460, 240, 410, 290, 410, 290, 360, 335, 360);

  yellow_ghost = loadImage("yellow_ghost.png");
  ghosts[2].img = yellow_ghost; //done
  ghosts[2].SetNodes(width/2+10, height/2-25, 238, 125, 290, 125, 290, 80, 415, 80, 415, 125, 335, 125, 335, height/2-25, 160, height/2-25);

  red_ghost = loadImage("red_ghost.png");
  ghosts[3].img = red_ghost; //not done
  ghosts[3].SetNodes(850, height/2-25, 850, 380, 790, 380, 790, 480, 935, 480, 935, 80, 935, 280, 850, 280, 850, 280);


  for (int i = 0; i< 28; i++) {
    for (int j = 0; j< 31; j++) {
      tiles[j][i] = new Tile(16*i +8, 16*j+8);
      switch(tilesRepresentation[j][i]) {
      case 1: //1 is a wall
        tiles[j][i].wall = true;
        break;
      case 0: // 0 is a dot
        tiles[j][i].dot = true;
        break;
      case 6://6 is a blank space
        tiles[j][i].eaten = true;
        break;
      }
    }
  }

  pacman = new Pacman();
}

void draw()
{
  image(maze, 0, 0);
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

void mousePressed()
{
  if (gameScreen == 0)
  {
    startGame();
  }

  if (gameScreen == 2)
  {
    startGame();
  }
}

void startGame()
{
  gameScreen = 1;
}

void menuScreen()
{
  background(0);
  introSong.play();
  textAlign(CENTER);
  mono = loadFont("AppleBraille-15.vlw");
  textFont(mono);
  if (mouseX > 150 && mouseX < 300 && mouseY > height/2+15 && mouseY < height/2+45)
  {
    fill(164, 248, 250);
    textSize(20);
    text("CLICK TO START.", width/2, height/2+30);
  } else {
    fill(255);
    textSize(15);
    text("CLICK TO START.", width/2, height/2+30);
  }

  image(pink_ghost, 40, height/2-40, 30, 30);
  image(green_ghost, 80, height/2-38, 25, 25);
  image(yellow_ghost, 120, height/2-38, 25, 25);
  image(red_ghost, 155, height/2-40, 30, 30);
  image(pacman1, 250, height/2-40, 30, 30);
  fill(255);
  ellipse(width-150, height/2-25, 10, 10);
  ellipse(width-125, height/2-25, 10, 10);
  ellipse(width-100, height/2-25, 10, 10);
  ellipse(width-75, height/2-25, 10, 10);
  ellipse(width-50, height/2-25, 10, 10);
}

void gameScreen() 
{
  mainSong.play();
  introSong.pause();
  maze.resize(448, 496);

  if (!pacman.gameOver) {
    stroke(255);

    for (int i = 0; i< 28; i++) {
      for (int j = 0; j< 31; j++) {
        tiles[j][i].show();
      }
    }
    pacman.move();
    pacman.show();
    pacman.keyPressed();
  }

  for (int i = 0; i < ghosts.length; i++) {
    ghosts[i].Draw();
    ghosts[i].Move();

    float d = dist(pacman.pos.x, pacman.pos.y, ghosts[i].x, ghosts[i].y);

    if (d < 15)
    {
      background(255);
      gameScreen = 2;
      gameOverScreen();
    }
  }
}

void gameOverScreen()
{
  background(0);
  mainSong.pause();
  deathSong.play();
  textAlign(CENTER);
  fill(255);
  mono = loadFont("AppleBraille-15.vlw");
  textFont(mono);
  textSize(20);
  text("G A M E  O V E R", width/2, height/2-10);

  if (mouseX > width/2-50 && mouseX < width/2+50 && mouseY > height/2+40 && mouseY < height/2+60)
  {
    fill(164, 248, 250);
    textSize(15);
    text("CLICK TO PLAY AGAIN", width/2, height/2+50);
  } else {
    fill(255);
    textSize(10);
    text("CLICK TO PLAY AGAIN", width/2, height/2+50);
  }
}

//returns the nearest non wall tile to the input vector
//input is in tile coordinates
PVector getNearestNonWallTile(PVector target) {
  float min = 1000;
  int minIndexj = 0;
  int minIndexi = 0;
  for (int i = 0; i< 28; i++) {//for each tile
    for (int j = 0; j< 31; j++) {
      if (!tiles[j][i].wall) {//if its not a wall
        if (dist(i, j, target.x, target.y)<min) { //if its the current closest to target
          min =  dist(i, j, target.x, target.y);
          minIndexj = j;
          minIndexi = i;
        }
      }
    }
  }
  return new PVector(minIndexi, minIndexj);//return a PVector to the tile
}
