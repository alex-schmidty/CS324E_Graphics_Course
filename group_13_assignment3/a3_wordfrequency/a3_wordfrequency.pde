String[] lines;
int[] frequency;
int uniqueWords = 0;
float mouseDist = 0;
float mouseAngle = 0;
int[] colors = {0, 20, 50, 80, 120, 140, 160, 180, 200, 230};

void setup(){
  size(600, 600);
  textSize(20);
  colorMode(HSB);
  lines = loadStrings("wordfrequency.txt");
  readFrequency();
}

void draw(){
  background(180);
  drawTitle();
  calculatePos();
  drawPiChart();
  //ellipse(100*cos(mouseAngle) + 300,100 * sin(mouseAngle) + 300,100,100);
}

void readFrequency(){
  frequency = new int[10];
  for (int idx = 0; idx < lines.length; idx ++){
    String line = lines[idx];
    String[] splitLine = split(line, ":");
    uniqueWords += int(splitLine[1]);
    if (idx < frequency.length){
      frequency [idx] = int(splitLine[1]);
    } else{
      frequency[frequency.length - 1] += int(splitLine[1]);
    }
  }
}

void calculatePos(){
  mouseDist = sqrt((mouseX - 300)^2 + (mouseY - 300)^2);
  if (mouseX - 300 == 0){
    mouseAngle = PI / 2;
  } else{
    mouseAngle = atan(float(mouseY - 300) / (mouseX - 300));
  }
  if (mouseX - 300 < 0){
    mouseAngle += PI;
  }
  if (mouseAngle < 0){
    mouseAngle += 2 * PI;
  }
}

void drawPiChart(){
  float proportionCounted = 0;
  for (int idx = 0; idx < frequency.length; idx ++){
    fill(colors[idx], 150, 150);
    float proportion = frequency[idx] / float(uniqueWords);
    float start = 2 * PI * proportionCounted;
    float arcLength = 2 * PI * proportion;
    float end = start + arcLength;
    proportionCounted += proportion;
    if (mouseAngle > start & mouseAngle < end){
      arc(300, 300, 350, 350, start, start + arcLength);
      text(idx + 1, 385, 40);
      text(100 * proportion, 440, 40);
      if (idx == 9){
        text("+", 405, 50);
      }
    } else{
      arc(300, 300, 300, 300, start, start + arcLength);
    }
   float middleOfArc = (start + end) / 2;
   if (idx == 9){
     text("10+", 200 * cos(middleOfArc) + 300, 200 * sin(middleOfArc) + 300);
   } else{
     text(idx + 1, 200 * cos(middleOfArc) + 300, 200 * sin(middleOfArc) + 300); 
   }
 }
}

void drawTitle(){
  fill(0);
  text("Percentage of Words with Frequency:      =  ", 20, 40);
}
