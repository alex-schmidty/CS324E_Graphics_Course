class Driver {
  Car car;
  int mood; // 1 = happy, 0 = sad

  Driver(int mood, Car TheirCar){
    this.mood = mood;
    this.car = TheirCar;    
  }
    
  void draw(){
    fill(255,255,0);
    float x = this.car.xpos;
    float y = this.car.lane;
    //head
    ellipse(x + .55*xlen, y + .32*ylen, .07*xlen, .08*xlen);
    
    //eyes
    stroke(0);
    beginShape(POINTS);
    vertex(x + .54*xlen, y +.3*ylen);
    vertex(x + .56*xlen, y +.3*ylen);
    endShape();
    
    //smile based off mood
    noFill();
    stroke(0);
    if (mood == 1){
      arc(x + .55*xlen, y + .35*ylen, .03*xlen, .02*xlen, radians(0),radians(180));    
    } else if (mood == 0){
      arc(x + .55*xlen, y + .38*ylen, .03*xlen, .02*xlen, radians(180),radians(360)); 
    }      
  }
}

  
  
