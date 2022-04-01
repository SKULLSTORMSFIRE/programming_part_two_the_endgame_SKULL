class menu {
  PrintWriter output;

  void writetofile(float score) {//adds score to the file
    BufferedReader reader = createReader("highscores.txt");
    try {
      String line = reader.readLine();
      output = createWriter("highscores.txt");
      output.println(line + str(score) + " ");
      output.flush(); 
      output.close();
    }
    catch(IOException e) {
    }
  }

  ArrayList listsorter(ArrayList<Float> intscores) {
    boolean noswap = false;
    intscores.remove(intscores.size()-1);
    while (noswap == false) {
      noswap = true;
      for (int i = 1; i <= intscores.size()-1; i++) {//does a sort to make all the scores in highest to lowest
        float temp1 = intscores.get(i-1);
        float temp2 = intscores.get(i);
        if (temp1 < temp2) {//had to do this as .sort() needs to import a package and if do that processing for me has a fit (im on mac btw)
          intscores.set(i, temp1);
          intscores.set(i-1, temp2);
          noswap = false;
        }
      }
    }
    return(intscores);
  }

  ArrayList<Float> readfromfile() {//reads from the file, changes it to integers sorts them and delivers a list
    BufferedReader reader = createReader("highscores.txt");
    ArrayList<Float> intscores = new ArrayList<Float>();
    String[] scores = {};
    String line;
    try {
      while ((line = reader.readLine()) != null) {
        scores = split(line, " ");
        for (String score : scores) {
          try {
            intscores.add(float(score));
          }
          catch (NumberFormatException ex) {
            ex.printStackTrace();
          }
        }
      }
      intscores = listsorter(intscores);
    } 
    catch(IOException e) {
      e.printStackTrace();
    }
    return(intscores);//retuns list of scores in integer form and in an arraylist
  }

  void endgame(int score) {
    writetofile(score);
    ArrayList<Float> intscores = readfromfile();
    background(0);
    noLoop();
    
    fill(255, 0, 0);
    textSize(50);
    text("GAME OVER", 120, 120);
    text("SCORE", 40, 220);
    text(score, 40, 320);
    text("HIGH SCORES:", 300, 220);
    for (int i =0; i <= 4; i++) {
      text(intscores.get(i)+"\n", 300, 320+(i*40));
    }
  }
}
