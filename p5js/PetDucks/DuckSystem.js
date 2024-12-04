class DuckSystem{
  
  constructor(num, v, leftDuck_, rightDuck_, breadImage_,
              boomImage_, dduckImage_){
    this.leftDuck = leftDuck_;
    this.rightDuck = rightDuck_;
    this.breadImage = breadImage_;
    this.boomImage = boomImage_;
    this.dduckImage = dduckImage_;
    
    this.ducks = [];
    this.breads = [];
    this.breadCounter = 0;
    this.origin = v.copy();
    
    for(let i = 0; i < num; i++){
      this.ducks.push(new Duck(this.leftDuck, this.rightDuck));
      console.log(this.ducks);
    }
  }
  
  run(){
    this.checkBreads();
    
    for(let i = this.breads.length -1; i>=0; i--){
      let b = this.breads[i];
      b.run();
    }
    
    for(let i = this.ducks.length-1; i>=0; i--){
      let d = this.ducks[i];
      if(d.isFull){
        console.log("is full");
        this.ducks.splice(i, 1);
        image(this.boomImage, d.location.x, d.location.y, 50, 50);
      } else if(d.isHungry){
        console.log("is hungry");
        this.ducks.splice(i, 1);
        image(this.dduckImage, d.location.x, d.location.y, 50, 50);
      } else {
        d.run();
      }
    }
    
    this.breadCounter = (this.breadCounter + 1) % 400;
    if(this.breadCounter == 0){
      this.breads = [];
    } else if(this.breadCounter % 20 == 0){
      this.addBread();
    }
  }
  
  checkBreads(){
    for(let d = this.ducks.length -1; d >=0; d--){
      let duck = this.ducks[d];
      let didEat = false;
      for(let b = this.breads.length -1; b >=0; b--){
        let bread = this.breads[b];
        let overlaps = this.doOverlap(bread.location, bread.location.copy().add(createVector(50, 50)), duck.location, duck.location.copy().add(createVector(duck.size, duck.size)));
        
        if(overlaps){
          duck.grow();
	  console.log("before breads: ", this.breads);
          this.breads.splice(b, 1);
	  console.log("after breads: ", this.breads, " at:", b);
          didEat = true;
        }
      }
      if(!didEat) duck.shrink();
    } 
  }

  addDuck(){
    let d = new Duck(this.leftDuck, this.rightDuck);
    this.ducks.push(d);
  }
  
  // addDuck(Duck d){
  //   this.ducks.add(d);
  // }
  
  addBread(){
    let bread = new Bread(this.breadImage);
    this.breads.push(bread);
  }
  
  doOverlap(l1, r1, l2, r2) {
    if (l1.x == r1.x || l1.y == r1.y || l2.x == r2.x || l2.y == r2.y){
      // the line cannot have positive overlap
      return false;
    }
    
    // If one rectangle is on left side of other
    if (l1.x >= r2.x || l2.x >= r1.x) {
      return false;
    }
   
    // If one rectangle is above other
    if (l2.y >= r1.y || l1.y >= r2.y) {
      return false;
    }
   
    return true;
  }

}