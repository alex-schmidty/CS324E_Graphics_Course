Road road1, road2;
CarWheel car1, car2;
Driver driver1, driver2;
RaceBanner startBanner1, startBanner2, finishBanner1, finishBanner2;
float posTarget1 = 200 , posTarget2 = 300; //Controls car movement
StopLight light;

void setup(){
  size(1000,600);
  textSize(100);
  
  road1 = new Road(0);
  road2 = new Road(width);
  
  // Create cars and their drivers
  car1 = new CarWheel(0,color(0,0,255),0,155);
  driver1 = new Driver(1, car1);
  car2 = new CarWheel(0,color(255,0,0),0,315);
  driver2 = new Driver(1, car2);
  startBanner1 = new RaceBanner(300, 150, road1);
  startBanner2 = new RaceBanner(300, 299, road1);
  light = new StopLight(475, 200);
}

void draw(){
  background(color(0,140,40));
  road1.display();
  road2.display();
  if (frameCount > 180){
    road1.move();
    road2.move();
  }
  
  if (frameCount < 300){
    startBanner1.update();
    startBanner2.update();
  } else if (frameCount > 1400 && frameCount < 1600){
    finishBanner1.update();
    finishBanner2.update();
  } else if (frameCount > 1600){
    finishBanner1.displayText();
    finishBanner2.displayText();
  }
  
  if (frameCount % 300 == 0){
    posTarget1 = random(100, 300);
  }
  else if (frameCount % 300 == 100){
    posTarget2 = random(100, 300);
  }
  
  drawCars();
  
  if (frameCount < 210){
    light.draw();
  }
  
  if (frameCount == 1400){
    finishBanner1 = new RaceBanner(300, 150, road2, car1, "Blue Wins!");
    finishBanner2 = new RaceBanner(300, 299, road2, car2, "Red Wins!");
  }
}
