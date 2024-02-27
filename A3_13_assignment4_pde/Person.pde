public class Person
{
  private final static float PHB= 40.0; // person height body
  private final static float PLL= 20.0; // person limb length
  private final static float PW= 20.0; // person width
  
  private float xloc;
  private float yloc;
  private color c;
  private float timer;
  private float timeLimit;
  
  
  public Road parent;
  
 
  
  public Person(float x, float y, color c, float animTime, Road parent)
  {
    xloc = x;
    yloc = y;
    this.parent = parent;
    this.c = c;
    timeLimit = animTime;
    timer = timeLimit;
  }
  public void move()
  {
    timer -= 1;
    if(timer<=0)
    {
      timer = timeLimit;
    }
    
    if(timer>timeLimit/2 && timer<=timeLimit)
    {
      yloc+=20/timeLimit;
    }
    else if(timer<=timeLimit/2)
    {
      yloc-=20/timeLimit;
    }
    
    
  }
  
  public void display()
  {
    noStroke();
    fill(c);
    ellipse(xpos(), ypos(), 20,20);
    stroke(c);
    strokeWeight(7);
    line(xpos(), ypos(), xpos(), ypos()+PHB); //body
    line(xpos(), ypos()+PHB, xpos()-PW, ypos()+ PLL + PHB);// left leg
    line(xpos(), ypos()+PHB, xpos()+PW, ypos()+ PLL + PHB);// right leg
    line(xpos(), ypos()+PHB/3, xpos()-PW, ypos()+ PLL+PHB/3);// left arm
    line(xpos(), ypos()+PHB/3, xpos()+PW, ypos()+ PLL+PHB/3);// left arm

  }
  public float xpos(){return xloc+parent.xpos;}
  public float ypos(){return yloc+parent.ypos;}
  
}
