

import gifAnimation.*;

class Duck {

  PImage[] allFramesLeft;
  PImage[] allFramesRight;
  int counter = 0;

  // The Duck tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  // The Duck's maximum speed
  float topspeed;
  
  int colorR = (int) random(0, 250);
  int colorG = (int) random(0, 250);
  int colorB = (int) random(0, 250);
  
  float size = 100;
  
  boolean isFull = false;
  boolean isHungry = false;

  Duck(PImage[] allFramesLeft_,  PImage[] allFramesRight_) {
    // Start in the center
    location = new PVector(mouseX, mouseY);
    velocity = new PVector(0,0);
    topspeed = 15;
    frameRate(12);
    allFramesLeft = allFramesLeft_;
    allFramesRight = allFramesRight_;
  }

  void update() {
    
    // Compute a vector that points from location to mouse
    PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = PVector.sub(mouse,location);
    // Set magnitude of acceleration
    acceleration.setMag(0.9);
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
  }

  void display() {
    if(size > 200){
      print("duck too full, died\n"); 
      isFull = true;
    } else if(size < 20) {
      print("duck too hungry, died\n");
      isHungry = true;
    }
    
    
    if(location.x > mouseX){
      image(allFramesLeft[counter], location.x, location.y, size, size);
    } else {
      image(allFramesRight[counter], location.x, location.y, size, size);
    }
   
    counter = (counter+1) % 4;
  }
  
  void grow(){
     size = size + 50;
     print("duck growing\n");
  }
  
  void shrink(){
     size = size - 1;
  }
  
  void run(){
    update();
    display();
  }
    

}
