class coins
{
  float x;
  float y;

  coins()
  {
    x = 0;
    y = 0;
  }
  void Draw()
  {
    noStroke();
    fill(250, 237, 114);
    ellipse(x+50, y+100, 10, 10);
  }
}
