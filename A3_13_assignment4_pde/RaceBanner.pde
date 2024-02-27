public Car carWon = null;

class RaceBanner{
  private Car car;
  private float xpos;
  private float ypos;
  private String type;
  private Road road;
  private float localX;
  private String winMessage;
  
  RaceBanner(float localX, float ypos, Road road){
    this.road = road;
    this.xpos = road.xpos + localX;
    this.ypos = ypos;
    this.localX = localX;
    this.type = "start";
    
  }
  
  RaceBanner(float localX, float ypos, Road road, Car car, String winMessage){
    this.road = road;
    this.car = car;
    this.xpos = road.xpos + localX;
    this.ypos = ypos;
    this.localX = localX;
    this.type = "finish";
    this.winMessage = winMessage;
  }
  
  void display(){
    strokeWeight(2);
    stroke(0);
    int squareSize = 25;
    int numrows = 2;
    int numcols = 6;
    for (int row = 0; row < numrows; row++){
      for (int col = 0; col < numcols; col++){
        if ((row + col) % 2 == 0){
          fill(255);
        } else{
          fill(0);
        }
          rect(xpos + row * squareSize, ypos + col * squareSize, squareSize, squareSize);
      }
    }
    
    if (this.type == "finish"){
      if (this.car.xpos > this.xpos && carWon == null && this.xpos > 0){
        carWon = this.car;
      }
    }
  }
  
  void move(){
    this.xpos = this.road.xpos + localX;
  }
  
  void update(){
    display();
    move();
    if (this.type == "finish"){
      displayText();
    }
  }
  
  void displayText(){
    if (carWon == this.car){
      fill(255);
      text(this.winMessage, 200, 100);
    }
  }
}
