class StopLight{
  float posX;
  float posY;
  int mode;
  
  StopLight(float x, float y){
  this.posX = x;
  this.posY = y;
  this.mode = 0;
  }
  
  void display(){
    fill(50);
    rect(posX, posY, 50, 175);
    
    ellipseMode(CORNER);
    fill(200, 50, 50);
    ellipse(posX + 10, posY + 25, 30, 30);
    fill(200, 200, 50);
    ellipse(posX + 10, posY + 75, 30, 30);
    fill(50, 200, 50);
    ellipse(posX + 10, posY + 125, 30, 30);
    fill(225, 225, 225, 100);
    ellipse(posX + 10, posY + 25 + 50 * mode, 30, 30);
    for (int i = 0; i < 8; i ++){
      float angle = i * PI/4;
      line(posX + 25 + 20 * cos(angle), posY + 40 + 50 * mode + 20 * sin(angle)
      , posX + 25 + 30 * cos(angle), posY + 40 + 50 * mode + 30 * sin(angle));
    }
    ellipseMode(CENTER);
  }
  
  void draw(){
    light.display();
    if (frameCount% 80 == 79){
      this.mode ++;
    }
  }
}
