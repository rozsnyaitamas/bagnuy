static class Tile {
  public static final byte WATER = 0;
  public static final byte EARTH = 1;
  public static final byte STONE = 2;
}

color tileToColor(byte tile) {
    switch(tile) {
      case Tile.WATER: return color(0, 0, 255);
      case Tile.EARTH: return color(160, 82, 45);
      case Tile.STONE: return color(100, 100, 100);
      default: return color(255);
    }
  }