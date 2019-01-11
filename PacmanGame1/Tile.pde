class Tile {
  boolean wall = false;
  boolean dot = false;
  boolean eaten = false;
  PVector pos;
 
  Tile(float x, float y) 
  {
    pos = new PVector(x, y);
  }

  void show() {
    if (dot) {
      if (!eaten) 
      {
        fill(255, 255, 0);
        noStroke();
        ellipse(pos.x, pos.y, 3, 3);
        //coinSong.play();
      }
    }
  }
}