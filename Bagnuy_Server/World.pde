class World {
  int width;
  int height;
  byte[][] tiles; // Each tile is a number from 0 to 255
  ArrayList<Entity> entities = new ArrayList<Entity>();
  
  public World(int width, int height) {
    this.width = width;
    this.height = height;
    init();
  }
  
  private void init() {
    tiles = new byte[width][height];
    
    for (int x = 0; x < width; x++) for (int y = 0; y < height; y++) {
      float elevation = noise(x/100f, y/100f);
      // TODO the problem is that the world will not be continuous,
      // you get hard edges at the end of the screen...
      tiles[x][y] = (elevation < 0.5)? Tile.WATER :
                    (elevation > 0.65)? Tile.STONE : 
                                       Tile.EARTH ;
    }
    
    entities.add(new Player(50, 350, "János"));
  }
  
  public void draw() {
    for (int x = 0; x < width; x++) for (int y = 0; y < height; y++) {
      stroke(tileToColor(tiles[x][y]));
      point(x, y);
    }
    
    for (Entity entity : entities) entity.draw();
  }
  
  public void update() {
    for (Entity entity : entities) entity.update();
  }
}
