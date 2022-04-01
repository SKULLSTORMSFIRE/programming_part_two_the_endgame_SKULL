class rock {
  ArrayList<ArrayList<Integer>> arrayofpositions = new ArrayList<ArrayList<Integer>>();
  int cooldown;

  ArrayList  givearray() {
    return(arrayofpositions);
  }
  void returnarray(ArrayList arrayofpositions) {
    this.arrayofpositions = arrayofpositions;
  }

  void displayrock(int xpos, int ypos) {
    fill(150,75,0);
    circle(xpos, ypos, 20);
  }

  void droppin() {
    ArrayList<Integer> xyvars = new ArrayList<Integer>();

    cooldown++;
    if (xyvars.size() == 0) {
      xyvars.add(0);
      xyvars.add(0);
    }

    if (keyPressed == true && keyCode == DOWN && cooldown >= 30) {
      Integer x = defendera.drawbox(0)+50;// for where the defender is y should be 50
      Integer y = 100;
      xyvars.set(0, x-50);
      xyvars.set(1, y);
      //print(xyvars+"\t");
      arrayofpositions.add(xyvars);
      //print(arrayofpositions+"\t");
      cooldown = 0;
    }

    //iterate through list after every tick and add 20 to y and if y >= heiget rid
    for (int i = 0; i <= arrayofpositions.size()-1; i++) {
      int xpos = arrayofpositions.get(i).get(0);
      int ypos = arrayofpositions.get(i).get(1); 
      displayrock(xpos, ypos);

     if (ypos <= height) {
        ypos += 10;
        arrayofpositions.get(i).set(1, ypos);
      } else {
        arrayofpositions.remove(i);
        //print("t");
      }
    }
  }
}
