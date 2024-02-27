// size of car variables for scalablility
float xlen = 350;
float ylen = 100;

class Car{
  color col;
  float xpos;
  float lane;
  float vel;
  float posTarget;
  
  Car(){
    col = color(0,0,255);
    xpos = 0;
    lane = 0;
  }
  
  Car(color col, float xpos, float lane){
    this.col = col;
    this.xpos = xpos;
    this.lane = lane;
    this.vel = 0;
    this.posTarget = 300;
  }
  
  
  void display(){
    stroke(col);
    fill(col);
    float x = this.xpos;
    float y = this.lane;
    beginShape();
    // build main body
    vertex(x + .8*xlen , y+ .9*ylen);
    vertex(x + xlen    , y+ .9*ylen);
    vertex(x + .8*xlen , y+ .45*ylen);
    vertex(x + .45*xlen, y+ .45*ylen);
    vertex(x + .45*xlen, y+ .15*ylen);
    vertex(x + .2*xlen , y+ .45*ylen);
    vertex(x + .15*xlen, y+ .45*ylen);
    vertex(x + .15*xlen, y+ .9*ylen);
    endShape();
    
    strokeWeight(1);
    stroke(20);
    noFill();
    beginShape();
    //build cockpit
    curveVertex(x + 0       , y+ .15*ylen);
    curveVertex(x + .45*xlen, y+ .15*ylen);
    curveVertex(x + .65*xlen, y+ .2*ylen);
    curveVertex(x + .75*xlen, y+ .45*ylen);
    curveVertex(x + .8*xlen , y+ .75*ylen);
    endShape();
    
    //exhaust pipe and flame
    fill(0);
    rect(x+ .1*xlen, y+ .8*ylen, .05*xlen, .05*ylen);
    if(this.xpos < 200 && frameCount > 180){
      stroke(219,83,55);
      fill(219,83,55);
      beginShape(QUADS);
      vertex(x+ .1*xlen , y+ .8*ylen);
      vertex(x+ .05*xlen, y+ .8*ylen);
      vertex(x+ .1*xlen , y+ .85*ylen);
      vertex(x+ .05*xlen, y+ .85*ylen);
      endShape();
    }
  }
  
  void move(float xchange){
    this.xpos += xchange;
  }
}

void drawCars(){  
  if (frameCount > 180){
    car1.vel = .997 * car1.vel + (posTarget1 - car1.xpos) * .0001;
    car2.vel = .997 * car2.vel + (posTarget2 - car2.xpos) * .0001;
  }
  // Drive the two seperate cars
  car1.drive(car1.vel);
  car2.drive(car2.vel);
  // Set emotion based on lead, then draw driver
  if (car1.xpos > car2.xpos){
    driver1.mood = 1;
    driver2.mood = 0;
  } else if (car2.xpos > car1.xpos){
    driver1.mood = 0;
    driver2.mood = 1;
  } else{
    driver1.mood = 1;
    driver2.mood = 1; 
  }
  driver1.draw();
  driver2.draw();
}
  
  
