// An ArrayList is used to manage the list of Ducks
  
class DuckSystem {
  PImage[] allFramesLeft;
  PImage[] allFramesRight;
  PImage breadImage;
  PImage boomImage;
  PImage dduckImage;
  
  ArrayList<Duck> ducks;
  ArrayList<Bread> breads;
  int breadCounter = 0;
  
  PVector origin;    

  DuckSystem(int num, PVector v,
            PImage[] allFramesLeft_,  PImage[] allFramesRight_,
            PImage breadImage_, PImage boomImage_, PImage dduckImage_) {
    allFramesLeft = allFramesLeft_;
    allFramesRight = allFramesRight_;
    breadImage = breadImage_;
    boomImage = boomImage_;
    dduckImage = dduckImage_;
    ducks = new ArrayList<Duck>();   // Initialize the arraylist
    breads = new ArrayList<Bread>();
    origin = v.copy();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      ducks.add(new Duck(allFramesLeft_, allFramesRight_));    // Add "num" amount of particles to the arraylist
    }
  }


  void run() {
    checkBreads();
    
    for(int i = breads.size()-1; i >=0; i--){
      Bread b = breads.get(i);
      b.run();
    }
    
    // Cycle through the ArrayList backwards, because we are deleting while iterating
    for (int i = ducks.size()-1; i >= 0; i--) {
      Duck d = ducks.get(i);
      if(d.isFull) {
        ducks.remove(d);
        image(boomImage, d.location.x, d.location.y, 100, 100);
      } else if(d.isHungry) {
        ducks.remove(d);
        image(dduckImage, d.location.x, d.location.y, 100, 100);
      } else {
        d.run();
      }
    }
    
    breadCounter = (breadCounter+1) % 400;
    if(breadCounter == 0) {
      breads = new ArrayList<Bread>();
    }
    else if(breadCounter % 20 == 0){
       addBread(); 
    }
  }
  
  
  void checkBreads(){
    for(int d = ducks.size()-1; d >=0; d--){
     print("duck number:" + d + "\n");
     Duck duck = ducks.get(d);
     boolean didEat = false;
     for(int b = breads.size()-1; b >=0; b--){
     Bread bread = breads.get(b);
      
      
      boolean overlaps = doOverlap(bread.location, bread.location.copy().add(new PVector(50, 50)),
                                   duck.location, duck.location.copy().add(new PVector(50, 50)));
      if(overlaps){
         // Duck is over bread, duck eats bread
         duck.grow();
         breads.remove(b);
         print("removing bread\n");
         didEat = true;
       } 
     }
     if(!didEat) duck.shrink();
    }
  }

  void addDuck() {
    Duck m = new Duck(allFramesLeft, allFramesRight);
    ducks.add(m);
  }

  void addDuck(Duck m) {
    ducks.add(m);
  }
  
  void addBread(){
    Bread b = new Bread(breadImage);
    breads.add(b);
  }
  
  boolean doOverlap(PVector l1, PVector r1, PVector l2, PVector r2) {   
    // To check if either rectangle is actually a line
    // For example :  l1 ={-1,0}  r1={1,1}  l2={0,-1}  r2={0,1}
    print(l1 + " " + r1 + " " + l2 + " " + r2 + "\n");
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
