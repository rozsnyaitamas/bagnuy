World world;

void setup() {
  size(800, 400);
  noSmooth(); // Draw points 6 times faster
  frameRate(60);
  
  // Loading Screen
  background(0);
  textAlign(CENTER);
  textSize(40);
  text("Generating World...", width/2, height/2);
  
  long start = millis();
  world = new World(400, 400);
  long dt = millis() - start;
  System.out.println("Generation took: " + dt + " ms");
}

void draw() {
  background(0);
  
  {
    long start = millis();
    world.update();
    long dt = millis() - start;
    System.out.println("Updating took: " + dt + " ms");
  }
  
  {
    long start = millis();
    world.draw();
    long dt = millis() - start;
    System.out.println("Drawing took: " + dt + " ms");
  }
}