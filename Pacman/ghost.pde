class ghost
{
  //member variables
  float x;
  float y;
  float size;

  ghost() //default constructor
  {
    x = 425;
    y = 280;
    size = 30;
  }

  void Draw()
  {
    image(green_ghost, x, y, size, size);
    image(pink_ghost, x+40, y, size + 5, size + 5);
    image(red_ghost, x+80, y, size + 5, size + 5);
    image(yellow_ghost, x+120, y, size, size);
    
  }

  void Move()
  {
    //x += 1;
    //y += random(-1, 1);
  }
}
