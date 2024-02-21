PImage img;


//String imgName = "pillars_of_creation.jpg";
String imgName = "tiger.jpg";
//String imgName = "poc_neb.jpg";
//String imgName = "van_gogh.png";
//String imgName = "guernica.png";


void setup()
{
  size(1000,1000);
  surface.setResizable(true);
  
  
  img = loadImage(imgName);
  surface.setSize(img.width, img.height); 
  background(0);
  
}
void draw()
{
    image(img, 0,0);
    updatePixels(); 
}


void keyReleased()
{
  // reload image
  if(key == '0'){
    img = loadImage(imgName);
    colorMode(RGB);
  }
  
  // convert to grayscale
  else if(key =='1')
  {
    img = makeGray(img);
  }
  
  // increase contrast
  else if(key =='2')
  {
    img = contrastFilter(img, true);
  }
  
  // 3x3 guassian blur
  else if(key == '3')
  {
    float[][] kernel = {{.0625,.125,.0625},
                    {.125,.25,.125},
                    {.0625,.125,.0625}};
    img = convolute(img, kernel);
  }
  
  //image detection convolution
  else if(key == '4')
  {
    float[][] sobelVert = {{-1.0,0.0,1.0},
                        {-2.0,0.0,2.0},
                        {-1.0,0.0,1.0}};
    float[][] sobelHor = {{-1.0,-2.0,-1.0},
                           {0.0,0.0,0.0},
                           {1.0,2.0,1.0}};
    img = compositeImage(convolute(img, sobelVert), convolute(img, sobelHor));
  }
  
  // sharpen convolution
  else if(key == '5')
  {
    float[][] kernel = {{0,-1,0},
                    {-1,5,-1},
                    {0,-1,0}};
    img = convolute(img, kernel);
  }
  
  // 5x5 gaussian blur
  else if(key == '6')
  {
    float[][] kernel = {{1,4,7,4,1},
                        {4,16,26,16,4},
                        {7,26,41,26,7},
                        {4,16,26,16,4},
                        {1,4,7,4,1}};
    for( int i=0; i<5;i++)
    {
      for(int j=0; j<5; j++)
      {
        kernel[i][j] /=273.0;
      }
    }
    img = convolute(img, kernel);
  }
  
  // decrease contrast
  else if(key == '7')
  {
    img = contrastFilter(img, false);
  }
}

// returns buffer of original. kernel does not have to be 3x3
PImage convolute(PImage original, float [][] kernel)
{
  colorMode(RGB);
  PImage buffer = createImage(original.width, original.height, RGB);

  for(int x = 0; x<original.width;x++)
  {
    for(int y = 0; y<original.height; y++)
    {
      float r = 0;
      float g = 0;
      float b = 0;
      int offset= (kernel.length-1)/2;
      for(int i=0; i<kernel.length; i++)
      {
        for(int j=0; j<kernel.length; j++)
        {
           
          int index = wrap((x + i - offset), original.width-1)+ 
                      original.width*wrap((y + j - offset),original.height-1);
          r += kernel[i][j]*red(original.pixels[index]);
          g += kernel[i][j]*green(original.pixels[index]);
          b += kernel[i][j]*blue(original.pixels[index]);
        }
         
      }
      r = constrain(abs(r), 0, 255);
      g = constrain(abs(g), 0, 255);
      b = constrain(abs(b), 0, 255);
      buffer.pixels[(x) + original.width*(y)] = color(r,g,b); 
      
    }
  }
  buffer.updatePixels();                        
  return buffer;
}

// changes contrast. increase=true => increase contrast, false=> decrease contrast
// returns copy of original
PImage contrastFilter(PImage original, boolean increase)
{
  PImage buffer = createImage(original.width, original.height, RGB);
    
  for(int x = 0; x<original.width;x++)
  {
    for(int y = 0; y<original.height; y++)
    {
      int index = (x) + original.width*(y);
      
      float r = red(original.pixels[index]);
      float g = green(original.pixels[index]);
      float b = blue(original.pixels[index]);
      float s = 255;
      if(increase)
      {
        r = constrain(pow((pow(s,2)/4) * (r-s/2), .333)+ s/2, 0, 255);
        g = constrain(pow((pow(s,2)/4) * (g-s/2), .333)+ s/2, 0, 255);
        b = constrain(pow((pow(s,2)/4) * (b-s/2), .333)+ s/2, 0, 255);
      }
      else
      {
        r = constrain(4/(pow(s,2)) * pow(r-s/2,3)+ s/2, 0, 255);
        g = constrain((4/pow(s,2)) * pow(g-s/2,3)+ s/2, 0, 255);
        b = constrain((4/pow(s,2)) * pow(b-s/2,3)+ s/2, 0, 255);
      }
     
      buffer.pixels[index] = color(r, g, b);
    }
  }
  colorMode(RGB);
  buffer.updatePixels();                        
  return buffer;
}

// converts to grayscale
PImage makeGray(PImage original)
{
  colorMode(RGB);
  PImage buffer = createImage(original.width, original.height, RGB);
  
  for(int x = 0; x<original.width;x++)
  {
    for(int y = 0; y<original.height; y++)
    {
      int index = (x) + original.width*(y);
      buffer.pixels[index] = color((red(original.pixels[index])+green(original.pixels[index])+blue(original.pixels[index]))/3); 
    }
  }
  buffer.updatePixels();                        
  return buffer;
}

//images must be same width and height
PImage compositeImage(PImage img1, PImage img2)
{
  PImage buffer = createImage(img1.width, img1.height, RGB);
  
  for(int x = 0; x<buffer.width;x++)
  {
    for(int y = 0; y<buffer.height; y++)
    {
      int index = (x) + buffer.width*(y);
      float r = dist(red(img1.pixels[index]), red(img2.pixels[index]));
      float g = dist(green(img1.pixels[index]), green(img2.pixels[index]));
      float b = dist(blue(img1.pixels[index]), blue(img2.pixels[index]));
      
      buffer.pixels[index] = color(r,g,b); 
    }
  }
  
  buffer.updatePixels();                        
  return buffer;
}

float dist(float x, float y)
{
  return sqrt(pow(x,2)+pow(y,2));
}


int wrap(int num, int max)
{
  if(num<0)
  {
    num+= max;
  }
  else if(num>max)
  {
    num-=max;
  }
  return num;
}
