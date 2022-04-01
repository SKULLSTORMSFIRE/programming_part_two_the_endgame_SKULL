ArrayList<attacker> membersattackers = new  ArrayList<attacker>();
ArrayList<PImage> photos = new  ArrayList<PImage>();

defender defendera;
attacker fastattacker, wobbleattacker, slowattacker;
rock rocka;
menu menua;

void setup() {
  PImage temp;

  temp = loadImage("background.jpg");
  photos.add(temp);

  temp = loadImage("attacker.jpg");
  photos.add(temp);

  temp = loadImage("defender.jpeg");
  photos.add(temp);
  
  temp = loadImage("boom.png");
  photos.add(temp);
  
  temp = loadImage("bop.png");
  photos.add(temp);
  
  temp = loadImage("pow.png");
  photos.add(temp);
  
  size(1000, 1000);
  frameRate(30);

  fastattacker = new fastattacker();
  wobbleattacker = new wobbleattacker();
  slowattacker = new slowattacker();

  membersattackers.add(0, fastattacker);//adds the member img1 at postion 0
  membersattackers.add(1, wobbleattacker);
  membersattackers.add(2, slowattacker);

  defendera = new defender();

  rocka = new rock();

  menua = new menu();
}
void draw() {
  background(photos.get(0));
  shapeMode(CENTER);
  imageMode(CENTER);

  defendera.movin();

  rocka.droppin();

  for (int i = 0; i <= 2; i++) {
    membersattackers.get(i).climbin();
  }
}
