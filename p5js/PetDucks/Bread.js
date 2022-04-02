class Bread{
  
  constructor(breadImage_){
    this.breadImage = breadImage_;
    this.location = createVector(mouseX, mouseY);
  }
  
  run(){
    image(this.breadImage, this.location.x, this.location.y, 50, 50);
  }
}