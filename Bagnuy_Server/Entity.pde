abstract class Entity {
  public String name;
  public int x;
  public int y;
  public int speed = 1;
  
  public Entity(int x, int y, String name) {
    this.name = name;
    this.x = x;
    this.y = y;
  }
  
  void move(int x, int y){
      this.x = x % world.width;
      this.y = min(world.height-1,max(y,0));
      System.out.println(this.x + " " + this.y);
  }
  
  public abstract void update();
  public abstract void draw();
}

class Player extends Entity {
  
  public Player(int x, int y, String name) {
    super(x, y, name);
  }
  
  public void update() {
    if (keyPressed) switch (key) {
        case 'a': move(x-speed, y); break;
        case 'd': move(x+speed, y); break;
        case 'w': move(x, y-speed); break;
        case 's': move(x, y+speed); break;
        default: break;
    }
  }
  
  public void draw() {
    // Minimap
    stroke(255);
    fill(255);
    textSize(10);
    ellipse(x, y, 5, 5);
    text(name, x, y-10);
    
    // Custom viewDistance
    int viewDistance = 4;
    int tilesPerScreen = 2 * viewDistance + 1;
    int n = height / tilesPerScreen;
    int xoffset = 400;
    
    for (int i = 0; i < tilesPerScreen; i++) for (int j = 0; j < tilesPerScreen; j++) {
      
      int xFromWorld = (i + x - viewDistance) % world.width;
      int yFromWorld = (j + y - viewDistance);
      
      color c = (xFromWorld == x && yFromWorld == y)? color(255) : 
                (yFromWorld<0 || yFromWorld> world.height-1)? color(0):
                tileToColor(world.tiles[xFromWorld][yFromWorld]) ;
      fill(c);
      rect(i * n + xoffset, j * n, n, n);
    }
  }
}
