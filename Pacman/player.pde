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
    posx = 100;
    posy = 100;
    size = 35;
    value = 5;
    movement = value;
    angle = 0;
  }

  void Draw()
  {
    image(pacman1, posx, posy, size, size);


    if (posy == 200  && 165 < posx && posx < 800)
    {
      posy = 195;
    }
    if (posy == 280 && 165 < posx && posx < 800)
    {
      posy = 285;
    }
    if (posx == 165 && 195 < posy && posy < 200)
    {
      posx = 160;
    }
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
          movement = value;
          posy -= movement;
          if (posy < 80)
          {
            movement = value;
            posy = 81;
          }
        } else if (keyCode == DOWN)
        {
          movement = value;
          posy += movement;
          if (posy > height-115)
          {
            movement = value;
            posy = height-116;
          }
        } else if (keyCode == LEFT)
        {
          movement = value;
          posx -= movement;
          if (posx < 30)
          {
            movement = value;
            posx = 31;
          }
        } else if (keyCode == RIGHT)
        {
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
