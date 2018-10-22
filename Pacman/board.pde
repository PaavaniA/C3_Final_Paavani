class board
{

  void Draw()
  {
    rectMode(CENTER);
    strokeWeight(10);
    noFill();
    stroke(0, 0, 255);

    pushMatrix(); //saves currect coordinate system to the stack

    //main border
    rect(0, 0, 960, 460, 1); 

    //short lines connected to main border
    rect(250, 180, 20, 100, 5);
    rect(-250, 180, 20, 100, 5);
    rect(250, -180, 20, 100, 5);
    rect(-250, -180, 20, 100, 5);

    //long lines
    rect(0, 140, 300, 20, 5);
    rect(0, -140, 300, 20, 5);

    //short lines
    rect(-240, 45, 170, 20, 5);
    rect(240, 45, 170, 20, 5);
    rect(-240, -45, 170, 20, 5); 
    rect(240, -45, 170, 20, 5); 

    //L border (short, long)
    rect(-380, 160, 75, 20, 5); 
    rect(380, 160, 75, 20, 5);
    rect(-380, -160, 75, 20, 5);
    rect(380, -160, 75, 20, 5); 

    rect(-410, 115, 20, 110, 5);
    rect(-410, -115, 20, 110, 5);
    rect(410, -115, 20, 110, 5);
    rect(410, 115, 20, 110, 5);

    rect(0, 0, 180, 110, 5);//ghost house
    stroke(0);
    fill(0);


    //L black lines (short, long)
    noStroke();
    fill(0);
    rect(-380, 160, 65, 10, 5);
    rect(380, 160, 65, 10, 5); 
    rect(-380, -160, 65, 10, 5);
    rect(380, -160, 65, 10, 5); 

    rect(-410, 115, 10, 100, 5); 
    rect(-410, -115, 10, 100, 5);
    rect(410, -115, 10, 100, 5); 
    rect(410, 115, 10, 100, 5); 

    popMatrix(); //restores prior coordinate system
  }
}
