
function setup() {
  createCanvas(400, 400);
  left = loadImage("data/left-transparent-waddle-duck.gif");
  right = loadImage("data/right-transparent-waddle-duck.gif");
  bread = loadImage("data/bread.png");
  boom = loadImage("data/boom.png");
  dduck = loadImage("data/dduck.png");
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
