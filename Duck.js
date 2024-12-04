class Duck {
  
  constructor(leftDuck_, rightDuck_) {
    this.leftDuck = leftDuck_;
    this.rightDuck = rightDuck_;
    
    this.location = createVector(mouseX, mouseY);
    this.velocity = createVector(0,0);
    this.topSpeed = 15;
    frameRate(12);
    this.isFull = false;
    this.isHungry = false;
    this.size = 100;
    this.counter = 0;
  }

  update(){
    this.mouse = createVector(mouseX, mouseY);
    this.acceleration = this.mouse.sub(this.location);
    this.acceleration.setMag(0.9);
    
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.topspeed);
    this.location.add(this.velocity);
  }
  
  display(){
    if(this.size > 200){
      this.isFull = true;
    } else if(this.size < 20){
      this.isHungry = true;
    }
    
    if(this.location.x > mouseX){
      console.log("left duck");
      image(this.leftDuck, this.location.x, this.location.y, this.size, this.size);
    } else {
      console.log("right duck");
      image(this.rightDuck, this.location.x, this.location.y, this.size, this.size);
    }
  }
  
  grow(){
    console.log("growing");
    this.size = this.size + 10;
  }
  
  shrink(){
    console.log("shrinking");
    this.size = this.size - 1;
  }
  
  run(){
    this.update();
    this.display();
  }  
}