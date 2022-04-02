import gifAnimation.*;

Gif myAnimation;
PImage[] allFramesLeft;
PImage[] allFramesRight;
int counter = 0;

DuckSystem duckSystem;

void setup() {
    size(800,800);
    frameRate(5);
    allFramesLeft = Gif.getPImages(this, "left-transparent-waddle-duck.gif");
    allFramesRight = Gif.getPImages(this, "right-transparent-waddle-duck.gif");
    PImage breadImage = loadImage("bread.png");
    PImage boomImage = loadImage("boom.png");
    PImage dduckImage = loadImage("dduck.png");
    duckSystem = new DuckSystem(1, new PVector(mouseX, mouseY),
                                allFramesLeft, allFramesRight,
                                breadImage, boomImage, dduckImage);

}

void draw() {
    background(0);
    duckSystem.run();
}

void mousePressed(){
  duckSystem.addDuck();
}
