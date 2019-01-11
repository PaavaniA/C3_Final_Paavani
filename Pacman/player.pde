class player
{
  //member variables
  float posx;
  float posy;
  float size;
  float movement;
  int angle;
  float value;
  int direction;
  int direction2;
  PImage img;

  player() //default contructor
  {
    posx = 160;
    posy = 190;
    size = 35;
    value = 2;
    movement = value;
    angle = 0;
    img = loadImage("pacman1");
  }

  void Draw()
  {
    for ( int i=-1; i < 2; i++) {
      for ( int j=-1; j < 2; j++) {
        pushMatrix();
        translate((posx+15) + (i * width), (posy+15) + (j*height));
        if (direction == -1) {
          rotate(PI);
        }
        if (direction2 == 1) {
          rotate(HALF_PI);
        }
        if (direction2 == -1) {
          rotate(PI+HALF_PI);
        }
        fill(240, 205, 7);
        arc(0, 0, 30, 30, map((millis() % 500), 0, 500, 0, 0.52), map((millis() % 500), 0, 500, TWO_PI, 5.76) );
        popMatrix();
      }
    }

    noStroke();
    textSize(20);
    fill(255);
    loadFont("CourierNewPSMT-16.vlw");
    //text("LIVES", 30, 45);
    //image(pacman1, 90, 20, size, size);
    //image(pacman1, 130, 20, size, size);
    //image(pacman1, 170, 20, size, size);

    // top long line
    if (posy == 100  && 320 < posx && posx < 650) {
      posy = 90;
    }
    if (posy == 180  && 320 < posx && posx < 650) {
      posy = 190;
    }
    //bottom long line
    if (posy == 390  && 320 < posx && posx < 650) {
      posy = 380;
    }
    if (posy == 470  && 320 < posx && posx < 650) {
      posy = 480;
    }
    //left top small line
    if (posy == 200  && 165 < posx && posx < 800) {
      posy = 190;
    }
    if (posy == 280 && 165 < posx && posx < 800) {
      posy = 285;
    }
    //
    if (posx == 135 && 200 < posy && posy < 265) {
      posx = 130;
    }
    if (posx == 135 && 290 < posy && posy < 350) {
      posx = 130;
    } 
    //
    if (posy == 290  && 165 < posx && posx < 800) {
      posy = 285;
    }
    if (posy == 375 && 165 < posx && posx < 800) {
      posy = 380;
    }
    //top left peg
    if (posx == 210 && 0 < posy && posy < 175) {
      posx = 200;
    }

    //stroke(255);
    line(250, 0, 250, 175);
    line(750, 0, 750, 600);
    line(320, 200, 650, 200);
  }

  void keyPressed()
  { //arrow keys move pacman up, down, left, right

    if (keyPressed)
    {
      if (key == CODED)
      {
        if (keyCode == UP)
        {
          direction = 0;
          direction2 = -1;
          movement = value;
          posy -= movement;
          if (posy < 80)
          {
            movement = value;
            posy = 81;
          }
        } else if (keyCode == DOWN)
        {
          direction = 0;
          direction2 = 1;
          movement = value;
          posy += movement;
          if (posy > height-115)
          {
            movement = value;
            posy = height-116;
          }
        } else if (keyCode == LEFT)
        {

          direction = -1;
          direction2 = 0;
          movement = value;
          posx -= movement;
          if (posx < 30)
          {
            movement = value;
            posx = 31;
          }
        } else if (keyCode == RIGHT)
        {
          direction = 1;
          direction2 = 0;
          movement = value;
          posx += movement;
          if (posx > width-70)
          {
            movement = value;
            posx = width-71;
          }
        }
      }
    }
  }
}
