float noisePosition=0;
float noiseAdjust=.04;
float fishX=250;
float fishY=250;
float xVelocity=0;
float yVelocity=0;
float xAdjustment=0;
float yAdjustment=0;
float heading=0;
float camR=0;
float camL=0;

PImage fishHead;
PImage fishTailSegment1;
PImage fishTailSegment2;

void setup(){
  size(500,500);
  fishHead=loadImage("fishH.png");
  fishTailSegment1=loadImage("fishT.png");
  fishTailSegment2=loadImage("fishT2.png");
}

void draw(){
  background(0,200,200);
  fill(50,100,200);
  
  xVelocity=(5 * noise(noisePosition) - 2.5);
  yVelocity=(5 * noise(noisePosition,noisePosition+100) - 2.5);
  
  fishX+=2*xAdjustment+xVelocity;
  fishY+=2*yAdjustment+yVelocity;
  
  if(fishX<=15){
    fishX=15;
    xAdjustment=1;
    noisePosition+=noiseAdjust;
  }
  if(fishX>=500-15){
    fishX=500-15;
    xAdjustment=-1;
    noisePosition+=noiseAdjust;
  }
  if(fishY<=15){
    fishY=15;
    yAdjustment=1;
    noisePosition+=noiseAdjust;
  }
  if(fishY>=500-15){
    fishY=500-15;
    yAdjustment=-1;
    noisePosition+=noiseAdjust;
  }
  
  heading=.5*PI+atan2(yVelocity,xVelocity);
  
  pushMatrix();
    translate(fishX,fishY);
    rotate(heading);
    image(fishHead,-25,-20);
    strokeWeight(3);
    stroke(17,59,92);
    
    line(0,6+0,20-sin(camR),6+0);
    line(0,6+2,22-sin(camR+.2),6+2);
    line(0,6+4,24-sin(camR+.4),6+4);
    line(0,6+6,24-sin(camR+.6),6+6);
    line(0,6+8,22-sin(camR+.8),6+8);
    line(0,6+10,20-sin(camR+1),6+10);
    
    
    line(0,6+0,-20+sin(camL),6+0);
    line(0,6+2,-22+sin(camL+.2),6+2);
    line(0,6+4,-24+sin(camL+.4),6+4);
    line(0,6+6,-24+sin(camL+.6),6+6);
    line(0,6+8,-22+sin(camL+.8),6+8);
    line(0,6+10,-20+sin(camL+1),6+10);
    
    translate(0,24.5);
    rotate(sin(camR)*.1);
    image(fishTailSegment1,-25,-14.5);
    
    translate(0,28);
    rotate(sin(camR)*.1);
    image(fishTailSegment2,-25,-9.5);
    
    
    camR+=sqrt((xVelocity*xVelocity)+(yVelocity*yVelocity))*.1;
    camL+=sqrt((xVelocity*xVelocity)+(yVelocity*yVelocity))*.1;
  popMatrix();
  
  noisePosition+=.001;
  xAdjustment*=.95;
  yAdjustment*=.95;
}