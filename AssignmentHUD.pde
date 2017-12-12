//OOP Assignment by Eoin Lambert
//C16362513 DT228/2
//Assignment to create a Sci-Fi HUD
//i created a star field with a radar and dynamic bar charts
//i used arrays for colours and also used different fucntions to draw new shapes

//declare my arrays
Star[] stars = new Star[2000];
String[] Galaxy = {"Tatooine", "Mustafar", "Naboo", "Endor", "Galactic Senate"};
color[] colors = new color[12];

//global variable for the speed of thestars
float speed = 10;

//call the radar class to cretae a radar at the given co-ordinates
void setup()
{
  size(1000, 1000);
  radar1 = new Radar(850, 850, 100, 0.5, color(random(255)));
  
  //print out the stars in the array 
  for(int i = 0; i < stars.length; i++)
  {
     stars[i] = new Star(); 
  }
}

Radar radar1;
 
int value = 0;
int i = 0; 

float buttonWidth = 200;
float buttonHeight = 50;
boolean clicked = false;


void draw()
{ 
  background(150);
  //draw the window of thespaceship
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
  
   //draw the octagon in the middle of the window, i tried to base this on the enemy fighter pilot out of star wars
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
   
   //draw the lines connecting the big window with the smaller octagon in the middle
   line(100,100,400,250);
   line(900,100,600,250);
   line(600, 550, 900, 700);
   line(400, 550, 100, 700);
   line(650, 350, 975,250);
   line(650, 450, 975, 550);
   line(350, 350, 25, 250);
   line(350, 450, 25, 550);
    
  //pushes this transormation on the  matrix stack, this allows the stars to be rotated into the middle of the screen but the,
  //rest of thr program stay with the original co-ordinates
  pushMatrix(); 
  translate(width/2, height/2);
  for(int i = 0; i < stars.length; i++)
  {
     stars[i].update(); 
     stars[i].show();
  }
  popMatrix();
  //takes it off the matrix stack
  
  //call the radar class so it comes onto the screen.
  radar1.render();
  radar1.update();
  
  //call the function show to print out the bar charts
  show(); 

  //these make the stars move past the ship faster or slower,
  //this gives the illusion of the ship travelling at different speeds
  if(keyPressed)
  {
     //decrease speed 
    if(keyCode == DOWN)
    {
       barHeight = barHeight - 0.5;
       speed = speed - 2; 
        if (speed == 0)
        {
           speed = 2; 
        }
    }
    //increase speed
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
     
     //print out galaxies in the universe, i wanted to addd the function that when one of these was clicked it would change the color of the screen to represent th e
     //ship flying to a new galaxy
   for (int i = 0 ; i < Galaxy.length ; i ++)
  {
    println("Galaxy:" + Galaxy[i]); 
    //the number prints the array at different parts along the x-axis
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
     
     //prints out the barchart
     //i tried to have the bar chart continuously moving up and down to represent data changing on a spaceship but whenevr i tried to add the random fucntion to 'number' 
     //it was moving them up and down the y-axis instead of just moving the top of it
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
//this fucntion returns whether the variable is true or not if it was clicked it then 
//allows the usuer to cick on the circle and chnage the colour of the window while it is ckicked
void mousePressed()
{
  //if it is within the range of the button
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
    //meant to represent a bullet, it draws a line with a circle on it when you click onto the screen
      stroke(255);
      ellipse(mouseX, mouseY, 60, 60);
     line(500, 700, mouseX, mouseY);
    }

}

//when you aren't clicking the mouse
void mouseReleased()
{
  clicked = false;
}

//gives the square its random color that can be printed to the screen
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