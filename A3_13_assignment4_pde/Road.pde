import java.util.Random;

public class Road //extends Animatable
{
  public static final float speedPerFrame= 4 * 2;
  public float xpos;
  public float ypos;
  public ArrayList<Person> people;
  public Road(float start)
  {
    xpos = start;
    ypos = 0;
    people = new ArrayList<Person>();
    populate();
  }
  
  public void move()
  {
    xpos-=speedPerFrame;
    if(xpos+width<=0)
    {
      xpos=width;
      populate();
    }
    
    
  }
  
  public void display()
  {
    noStroke();
    fill(70);
    // asphalt
    rect(xpos, height/4, width, height/2);
    // white lines on edge
    fill(255);
    rect(xpos, height/4-10, width, 10);
    rect(xpos, 3*height/4, width, 10);
    
    // dividing lines
    for( int i=0; i<10; i++)
    {
      rect(xpos+i*width/10, height/2-5, width/20, 10);
    }
    
    for(Person person: people)
    {
      person.move();
      person.display();
    }
    
    
  }
  private void populate()
  {
    Random rand = new Random();
    int numPeople = rand.nextInt(40) + 10;
    people.clear();
    for(int i=0; i< numPeople; i++)
    {
      color c = color(rand.nextInt(256),rand.nextInt(256),rand.nextInt(256));
      float animTime = rand.nextFloat()*50+50;
      float xloc = rand.nextFloat()*width;
       float yloc = 50;
      if(rand.nextInt(2)==0){yloc = height -100;}
     
      people.add(new Person(xloc, yloc,c, animTime,this));
    }
      
  }
}
