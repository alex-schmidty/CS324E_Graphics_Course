PFont fontchoice;
String[] uniqwords;
int fontSize = 18;
int margin = 10;

void setup(){
  //create canvas and set font
  size(700,600);
  fontchoice = createFont("Georgia", fontSize);
  textFont(fontchoice);
 
  // read in text file and shuffle each index with a random other index
  uniqwords = loadStrings("uniquewords.txt");
  randomizeWords();
}

void draw(){
  background(100);
  createWordcloud();
}

void mouseClicked(){
  randomizeWords();
}

void randomizeWords(){
  int n = uniqwords.length;
  for (int i = 0; i < n; i++){
    int swapIndx = i + int(random(n-i));
    String swapper = uniqwords[swapIndx];
    uniqwords[swapIndx] = uniqwords[i];
    uniqwords[i] = swapper;
  }
}

void createWordcloud(){
  String currline = "";
  int yheight = fontSize;      //set line height to font size
  float xlength = margin;
  // Iterate through shuffled words
  for(int i = 0; i< uniqwords.length; i++){
    if (yheight <= height){
      if (textWidth(currline + uniqwords[i] ) < width - 2 * margin){ 
        fill(chooseColor(uniqwords[i]));
        text(uniqwords[i],xlength, yheight);
        currline = currline + uniqwords[i] + " ";
        xlength = textWidth(currline) + margin;
      }else{
        xlength = margin;
        yheight += 1.2 * fontSize;
        currline = "";
      }
    }
  }
}

color chooseColor(String word){
  char char1 = word. charAt(0);
  if (char1 < "i".charAt(0)){
    return color(74,237,102);
  } else if ( char1 > "i".charAt(0) && char1 < "r".charAt(0)){
    return color(52,112,206);
  } else if ("r".charAt(0) < char1){
    return color(216,138,55);
  } 
  return color(0); // in case if's fail return black
}

// First, I use the setup function to create the canvas, read in the words from 
// the unique words file, and then shuffle that array for randomization. Then 
// the draw function writes the words in the shuffled array word by word, 
// adjusting the x and y coordinates such that the new word is written one space 
// away from the last word and each line is the height of the font. The color
// of each word is based on where it's first letter falls in the alphabet.
// I chose the font because it was easily legible and the size as it is also 
// easily legible and fits the words just so they fill the canvas
