class player
{
  //member variables
  float posx;
  float posy;
  float size;
  float movement;
  int angle;
  float value;

  player() //default contructor
  {
    posx = 160;
    posy = 190;
    size = 35;
    value = 2;
    movement = value;
    angle = 0;
  }

  void Draw()
  {
    noStroke();
    textSize(20);
    fill(255);
    loadFont("CourierNewPSMT-16.vlw");
    text("LIVES", 30, 45);
    image(pacman1, 65, 20, size, size);
    image(pacman1, 105, 20, size, size);
    image(pacman1, 145, 20, size, size);

    // top long line
    if (posy == 100  && 320 < posx && posx < 650)
    {
      posy = 95;
    }

    if (posy == 180  && 320 < posx && posx < 650)
    {
      posy = 190;
    }
    //bottom long line
    if (posy == 390  && 320 < posx && posx < 650)
    {
      posy = 380;
    }

    if (posy == 470  && 320 < posx && posx < 650)
    {
      posy = 480;
    }

    if (posy == 200  && 165 < posx && posx < 800)
    {
      posy = 190;
    }
    if (posy == 280 && 165 < posx && posx < 800)
    {
      posy = 285;
    }
    //
    if (posx == 135 && 200 < posy && posy < 265)
    {
      posx = 130;
    }
    if (posx == 135 && 290 < posy && posy < 350)
    {
      posx = 130;
    } 
    //
    if (posy == 290  && 165 < posx && posx < 800)
    {
      posy = 285;
    }
    if (posy == 375 && 165 < posx && posx < 800)
    {
      posy = 380;
    }
  }

  void keyPressed()
  { //arrow keys move pacman up, down, left, right
  
    if (keyPressed)
    {
      if (key == CODED)
      {
        if (keyCode == UP)
        {
          image(pacman4, posx, posy, size, size);
          movement = value;
          posy -= movement;
          if (posy < 80)
          {
            movement = value;
            posy = 81;
          }
        } else if (keyCode == DOWN)
        {
          image(pacman3, posx, posy, size, size);
          movement = value;
          posy += movement;
          if (posy > height-115)
          {
            movement = value;
            posy = height-116;
          }
        } else if (keyCode == LEFT)
        {
          image(pacman2, posx, posy, size, size);
          movement = value;
          posx -= movement;
          if (posx < 30)
          {
            movement = value;
            posx = 31;
          }
        } else if (keyCode == RIGHT)
        {
          image(pacman1, posx, posy, size, size);
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
