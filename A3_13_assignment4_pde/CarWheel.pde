PShape tire ;
class CarWheel extends Car {
  float rotation;

  
  CarWheel(){
    this.rotation = 0;
    col = color(0,0,255);
    xpos = 0;
    lane = 0;
  }
  
  CarWheel(int rot, color col, float xpos, float lane){
    this.rotation = rot;
    this.col = col;
    this.xpos = xpos;
    this.lane = lane;
  }
  

  
  void drive(float inp){
    this.move(inp);
    float x = this.xpos;
    float y = this.lane;
    // Display parent car
    this.display();
    // rotate the wheels based on the input movement
    this.rotation+= 30 * inp;
    drawTire(x + .25*xlen, y + .85*ylen, .1*xlen, this.rotation);
    drawTire(x + .75*xlen, y + .85*ylen, .1*xlen, this.rotation);
  }
    
  void drawTire(float xcorr, float ycorr, float rad, float angle){
    fill(0);
    strokeWeight(2);
    stroke(0);
    arc(xcorr, ycorr, rad, rad, radians(angle), radians(angle+120));
    arc(xcorr, ycorr, rad, rad, radians(angle+121), radians(angle+241));
    arc(xcorr, ycorr, rad, rad, radians(angle+242), radians(angle+359));
    fill(200);
    stroke(200);
    arc(xcorr, ycorr, rad*.9, rad*.9, radians(angle), radians(angle+120));
    arc(xcorr, ycorr, rad*.9, rad*.9, radians(angle+121), radians(angle+241));
    arc(xcorr, ycorr, rad*.9, rad*.9, radians(angle+242), radians(angle+359));
  }
}
