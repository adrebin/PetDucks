
function setup() {
  createCanvas(400, 400);
  left = loadImage("p5js/PetDucks/data/left-transparent-waddle-duck.gif");
  right = loadImage("p5js/PetDucks/data/right-transparent-waddle-duck.gif");
  bread = loadImage("p5js/PetDucks/data/bread.png");
  boom = loadImage("p5js/PetDucks/data/boom.png");
  dduck = loadImage("p5js/PetDucks/data/dduck.png");
  this.duckSystem = new DuckSystem(1, createVector(mouseX, mouseY), left, right, bread, boom, dduck);
  this.leftDuck = left;
  this.rightDuck = right;
}

function draw() {
  background(0);
  // let duck = new Duck(this.leftDuck, this.rightDuck);
  // duck.run();
  this.duckSystem.run();
}

function mousePressed(){
  this.duckSystem.addDuck();
}
