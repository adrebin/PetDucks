
class Bread{
 
  PImage breadImage;
  PVector location;
  
  Bread(PImage breadImage_){
    breadImage = breadImage_;
    location = new PVector(mouseX, mouseY);
  }
  
  void run(){
     image(breadImage, location.x, location.y, 50, 50);
  }
}
