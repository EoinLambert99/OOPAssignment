class Radar
{
  float cx, cy;
  float radius;
  float theta;
  float speed;
  float frequency;
  color c;
  
  Radar(float cx, float cy, float radius, float frequency, color c)
  {
    this.cx = cx;
    this.cy = cy;
    this.radius = radius;
    this.frequency = frequency;
    this.speed = (TWO_PI / 60.0) * frequency;
    this.theta = 0;
    this.c = c;
  }
  
  void update()
  {
    theta += speed;
  }
  
  void render()
  {
    line(850,850,850, 900);
    stroke(0,255,0);
    fill(0);
    rect(850, 850, 200,200);
   
    ellipse(cx, cy, radius * 2, radius * 2);
    ellipse(cx, cy, radius + 30, radius + 30);
    ellipse(cx, cy, radius - 30, radius - 30);
   
    line(850,750,850, 950);
    line(750,850, 950, 850 );
    
    int trailLength = 10;
    float greenIntensity = 255 / (float)trailLength;
    
    for(int i = 0 ; i < trailLength ; i ++)
    {
      stroke(0, i * greenIntensity, 0);
      float x = cx + sin(theta + i * speed) * radius;
      float y = cy -cos(theta + i * speed) * radius;
      line(cx, cy, x, y);
    }
     
    float c = 10;
    float d = 20;
     
    noStroke();
    fill(255,255,0);
    ellipse(875, 775, c,c);
    ellipse(845, 825, d, d);

    if(frameCount % 120 == 0)
    {
     c = c + 10;
     d = d + 15;
     ellipse(875, 775, c,c);
     ellipse(845, 825, d,d);
    }
    
    fill(0);
    rect(800, 970, 100,30);
    textSize(13);
    fill(255);
    textAlign(LEFT, TOP);
    text("Radar", 750, 970);
    
  }   
  
}