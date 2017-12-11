Star[] stars = new Star[1000];

float speed = 10;

void setup()
{
  size(1000, 1000);
  radar1 = new Radar(850, 850, 100, 0.5, color(random(255)));
  
  for(int i = 0; i < stars.length; i++)
  {
     stars[i] = new Star(); 
  }
}

Radar radar1;


float buttonWidth = 200;
float buttonHeight = 50;
boolean clicked = false;


void draw()
{
  //speed = map(mouseX, 0, width, 0, 50); 
  background(150);
 
  beginShape();
    vertex(25, 250);
    vertex(100,100);
    vertex(900,100);
    vertex(975,250);
    vertex(975, 550);
    vertex(900, 700);
    vertex(100, 700);
    vertex(25, 550);
    vertex(25,250);
  endShape();
    
  pushMatrix();
  translate(width/2, height/2);
  for(int i = 0; i < stars.length; i++)
  {
     stars[i].update(); 
     stars[i].show();
  }
  popMatrix();
  
  radar1.render();
  radar1.update();
  
  if(keyPressed)
  {
    if(keyCode == DOWN)
    {
       speed = speed - 2; 
        if (speed == 0)
        {
           speed = 2; 
        }
    }
    else if(keyCode == UP)
    {
      speed = speed + 2;
      if(speed == 20)
      {
         speed = 20; 
      }
    }
  }
  
  
  rectMode(CENTER);
  noStroke();
  
  if (clicked)
  {
    fill(0);
  }
  else
  {
    fill(0);
  }
  
  rect(600,800, buttonWidth, buttonHeight);
    
}

void mousePressed()
{
  float tlx = 600 - buttonWidth / 2;
  float tly = 800 - buttonHeight / 2;
  if (mouseX > tlx && mouseX < tlx + buttonWidth && mouseY > tly && mouseY < tly + buttonHeight)
    {
      clicked = true;
      background(20);
    }
}