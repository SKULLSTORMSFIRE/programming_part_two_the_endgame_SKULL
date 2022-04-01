class defender {
  int x, y = 100;
  
  int readx(){ 
     return(x);
  }
  
  void movin() {
    if (keyPressed == true && key == CODED) {
      if (keyCode == LEFT && x > 0) {
        x = drawbox(-10);
      } else if (keyCode == RIGHT && x < width-100) {
        x = drawbox(10);
      }else{
        drawbox(0);
      }
    } else {
      drawbox(0);
    }
  }
  
  int drawbox(int xmove) {
    x+=xmove;
    xmove = 0;
    image(photos.get(2), x, y);
    return x;
  }
}
