class Pacman {
  PVector pos;
  PVector vel = new PVector(-1, 0);
  //when pacman reaches a node its velocity changes to the value stored in turnto
  PVector turnTo = new PVector(-1, 0);
  boolean turn = false;
  boolean  gameOver = false;

  Pacman() {
    pos = new PVector(13*16+8, 23*16 +8);
  }

  void show() {
    fill(255, 255, 0);
    stroke(255, 255, 0);
    image(pacman1, pos.x-10, pos.y-10, 20, 20);
    //ellipse(pos.x, pos.y, 20, 20);
  }

    //move pacman if not facing wall
    void move() {
      if (checkPosition()) {
        pos.add(vel);
      }
    }
    void keyPressed() {//controls for pacman
      switch(key) {
      case CODED:
        switch(keyCode) {
        case UP:
          pacman.turnTo = new PVector(0, -1);
          pacman.turn = true;
          
          break;
        case DOWN:
          pacman.turnTo = new PVector(0, 1);
          pacman.turn = true;
          break;
        case LEFT:
          pacman.turnTo = new PVector(-1, 0);
          pacman.turn = true;
          break;
        case RIGHT:
          pacman.turnTo = new PVector(1, 0);
          pacman.turn = true;
          break;
        }
      }
    }


    //returns whether pacman can move i.e. there is no wall in the direction of vel
    boolean checkPosition() {

      if ((pos.x-8)%16 == 0 && (pos.y - 8)% 16 ==0) {//if on a critical position

        PVector matrixPosition = new PVector((pos.x-8)/16, (pos.y - 8)/16);//convert position to an array position

        //check if the position has been eaten or not, note the blank spaces are initialised as already eaten
        if (!tiles[floor(matrixPosition.y)][floor(matrixPosition.x)].eaten) {
          tiles[floor(matrixPosition.y)][floor(matrixPosition.x)].eaten =true;
        }


        PVector positionToCheck= new PVector(matrixPosition.x + turnTo.x, matrixPosition.y+ turnTo.y); // the position in the tiles double array that the player is turning towards

        if (tiles[floor(positionToCheck.y)][floor(positionToCheck.x)].wall) {//check if there is a free space in the direction that it is going to turn
          if (tiles[floor(matrixPosition.y + vel.y)][floor(matrixPosition.x + vel.x)].wall) {//if not check if the path ahead is free
            return false;//if neither are free then dont move
          } else {//forward is free
            return true;
          }
        } else {//free to turn
          vel = new PVector(turnTo.x, turnTo.y);
          return true;
        }
      } else {
        if ((pos.x+10*vel.x-8)%16 == 0 && (pos.y + 10*vel.y - 8)% 16 ==0) {//if 10 places off a critical position in the direction that pacman is moving
          PVector matrixPosition = new PVector((pos.x+10*vel.x-8)/16, (pos.y+10*vel.y-8)/16);//convert that position to an array position
          if (!tiles[floor(matrixPosition.y)][floor(matrixPosition.x)].eaten ) {//if that tile has not been eaten 
            tiles[floor(matrixPosition.y)][floor(matrixPosition.x)].eaten =true;//eat it
          }
        }
        if (turnTo.x + vel.x == 0 && vel.y + turnTo.y ==0) {//if turning chenging directions entirely i.e. 180 degree turn
          vel = new PVector(turnTo.x, turnTo.y);//turn
          return true;
        }
        return true;//if not on a critical postion then continue forward
      }
    }
  }
