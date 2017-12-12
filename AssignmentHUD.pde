//OOP Assignment by Eoin Lambert
//C16362513 DT228/2
//Assignment to create a Sci-Fi HUD
//i created a star field with a radar and dynamic bar charts






Star[] stars = new Star[2000];
String[] Galaxy = {"Tatooine", "Mustafar", "Naboo", "Endor", "Galactic Senate"};
color[] colors = new color[12];

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
 
int value = 0;

float buttonWidth = 200;
float buttonHeight = 50;
boolean clicked = false;

int i = 0; 

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
  
 beginShape();
    vertex(400,250);
    vertex(600,250);
    vertex(650,350);
    vertex(650, 450);
    vertex(600,550);
    vertex(400,550);
    vertex(350,450);
    vertex(350,350);
    vertex(400, 250);
   endShape();
   
   line(100,100,400,250);
   line(900,100,600,250);
   line(600, 550, 900, 700);
   line(400, 550, 100, 700);
   line(650, 350, 975,250);
   line(650, 450, 975, 550);
   line(350, 350, 25, 250);
   line(350, 450, 25, 550);
       
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
  
  show(); 

  if(keyPressed)
  {
      
    if(keyCode == DOWN)
    {
       barHeight = barHeight - 0.5;
       speed = speed - 2; 
        if (speed == 0)
        {
           speed = 2; 
        }
    }
    else if(keyCode == UP)
    {
      barHeight = barHeight + 0.5;
      speed = speed + 2;
      
      if(speed == 20)
      {
         speed = 20;    
      }
      
    }
  }

  fill(value);
  rect(500, 850, 50, 50);
  
  rectMode(CENTER);
  stroke(255);
  
   if (clicked)
   {
     //fill(color(random(0, 255), random(0, 255), random(0, 255))); 
     
   }
   else
   {
     fill(0);
   }
  
  ellipse(width/2, 800, 40, 40);
  
     int number = 20;
     
   for (int i = 0 ; i < Galaxy.length ; i ++)
  {
    println("Galaxy:" + Galaxy[i]); 
    text(Galaxy[i], 100 + number, 50 );
    number += 100;
  }
    
  
}
 
float barHeight = -100;

 void show(){
    
      float xpos = 100;
      float ypos = 875;
      float barWidth= 30;
      stroke(0,255,0);
      fill(0);
     
      for(int i = 0 ; i < 200 ; i+=50)
       {
        float number =  25;
        
        rect(xpos + i, ypos, barWidth, barHeight - number);
         
       }
       
       textSize(13);
    fill(0);
    textAlign(LEFT);
    text("Power Consumption:", 100, 960 );
              
       stroke(0);
       noFill();
       rect(200,875, 300, 200);
 
}

// This function gets called when the mouse is pressed
void mousePressed()
{
  float tlx = width / 2 - buttonWidth / 2;
  float tly = 800 - buttonHeight / 2;
  if (mouseX > tlx && mouseX < tlx + buttonWidth
    && mouseY > tly && mouseY < tly + buttonHeight
    )
    {
      clicked = true;
    }
    else if(mouseX < 975 && mouseX > 25 && mouseY> 100 && mouseY < 700)
    {
    
      stroke(255);
      ellipse(mouseX, mouseY, 60, 60);
     line(500, 700, mouseX, mouseY);
    }

}

void mouseReleased()
{
  clicked = false;
}

void mouseClicked() {
  if (value == 0) {
     for(int i = 0; i < colors.length ; i ++)
  {
   value=  color(random(0, 255), random(0, 255), random(0, 255)); 
  }
  } else {
    value = 0;
  }
}