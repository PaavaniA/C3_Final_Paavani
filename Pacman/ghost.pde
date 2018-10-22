class ghost
{
  //member variables
  float x;
  float y;
  float size;
  PVector [] nodes = new PVector [8];
  int target_node = 0;
  PImage img;

  ghost() //default constructor
  {
    x = 500;
    y = 300;
    size = 30;
  }

  void SetNodes(int x, int y, int x2, int y2, int x3, int y3, int x4, int y4, int x5, int y5, int x6, int y6, int x7, int y7, int x8, int y8)
  {
    nodes[0] = new PVector (x, y);
    nodes[1] = new PVector (x2, y2);
    nodes[2] = new PVector (x3, y3);
    nodes[3] = new PVector (x4, y4);
    nodes[4] = new PVector (x5, y5);
    nodes[5] = new PVector (x6, y6);
    nodes[6] = new PVector (x7, y7);
    nodes[7] = new PVector (x8, y8);
  }

  void Draw()
  {
    image(img, x, y, size, size);
  }

  void Move()
  {
    if (x > nodes[target_node].x)
    {
      x-=2;
    }
    if (x < nodes[target_node].x)
    {
      x+=2;
    }
    if (y < nodes[target_node].y)
    {
      y+=2;
    }
    if (y > nodes[target_node].y)
    {
      y-=2;
    }

    if (dist(x, y, nodes[target_node].x, nodes[target_node].y) < 10)
    {
      target_node += 1;
    }

    if (target_node > 7)
    {
      target_node = 0;
    }
  }
}
