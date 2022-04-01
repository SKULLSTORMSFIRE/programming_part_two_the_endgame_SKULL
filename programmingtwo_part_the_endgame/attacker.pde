abstract class attacker {
  public abstract void climbin();
  int score;
  int count;
  boolean ending = false;
  float stickx;
  float sticky;

  float checkpos(float y) {
    if (y <= 150) {
      y = 1000;
    }
    return y;
  }

  float rockcoliosion (float x, float y) {
    ArrayList<ArrayList<Integer>> arrayofpositions = rocka.givearray();
    for (ArrayList<Integer> xyvars : arrayofpositions) {
      //print(xyvars);
      if (abs(xyvars.get(0)-x) <= 30 && abs(xyvars.get(1)-y) <= 30) {//the area that the rock needs to be in to hit the attacker
        arrayofpositions.remove(xyvars);
        rocka.returnarray(arrayofpositions);
        score++; 
        return(1000);
      } else {
        return(y);
      }
    }
    return(y);
  }

  void defendercoliosion (float x, float y) {
    if (abs(defendera.readx()-x) <= 60 && abs(y-50) <= 160) {
      if (ending == true) {
        stickx = x;
        sticky = y;
      }
      ending = true;
    }
    if (ending == true) {
      count++;
      if (count<=5) {
        image(photos.get(3), stickx, sticky);
      } else if (count<=10 && count>5) {
        image(photos.get(4), stickx, sticky);
      } else if (count<=15 && count>10) {
        image(photos.get(5), stickx, sticky);
      } else {
        menua.endgame(score);
      }
    }
  }
}



class fastattacker extends attacker {
  float y = 1000, x = 250;
  void climbin() {
    y = checkpos(y);
    y-=15;
    y = rockcoliosion(x, y);
    image(photos.get(1), x, y);
    defendercoliosion(x, y);
  }
}

class wobbleattacker extends attacker {
  float y = 1000, x = 1000;
  void climbin() {
    y = checkpos(y);
    if (x <= 0) {
      x = 1000;
    }
    y-=10;
    x += sin(radians(y))*10;
    defendercoliosion(x, y);
    y = rockcoliosion(x, y);
    image(photos.get(1), x, y);
    defendercoliosion(x, y);
    //print(x+" ");
  }
}

class slowattacker extends attacker {
  float y = 1000, x = 750;
  void climbin() {
    y = checkpos(y);
    y-=5;
    y = rockcoliosion(x, y);
    image(photos.get(1), x, y);
    defendercoliosion(x, y);
  }
}
