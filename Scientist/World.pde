public class World {
  int EARTH_OFFSET = 250, currentWorld = 1, foundWorlds = 1, WORLD_COUNT = 4, world_size = 130, lab_count = 0;
  int EARTH_SLOWNESS = 20000;
  Star[] stars = new Star[25];

  public World() {
    for (int x = 0; x < stars.length; x++) 
      stars[x] = new Star(random(width ), random(height ));
    for (int i = 0; i < 120; i++) {
      buildings[i] = f.makeBuildings();
    }
    for (int i = 0; i < 10; i++) {
      int x = r.nextInt(TILE_COUNT);
      buildings[x] = f.makeBuildings("Tree");
    }
    for (int i = 0; i < TILE_COUNT; i++) {
      buildings[i + TILE_COUNT] = f.makeBuildings("Mine");
      buildings[i + 2 * TILE_COUNT] = f.makeBuildings("Reactor");
    }
  }

  public int getworldSlowness() {
    return EARTH_SLOWNESS;
  }

  public void drawWorlds() {
    fill(255);
    for (int x = 0; x < stars.length; x++) {
      stars[x].drawStars();
    }
    if (currentWorld==0)
      fill(color(148, 114, 51));
    else if (currentWorld==1)
      fill(color(146, 146, 142));
    else if (currentWorld==2)
      fill(color(140, 159, 77));
    else if (currentWorld==3)
      fill(color(149, 217, 206));
    ellipse(0, 0, world_size*2, world_size*2);
  }

  public void drawBuildings() {
    for (int x = 30 * (currentWorld - 1); x < 30 * currentWorld ; x++) {
      buildings[x].drawBuilding(x);
    }
  }
  public int getcurrentWorld() {
    return currentWorld;
  }

  public void discoverWorld() {
    currentWorld+= 1;
  }
  public int getworldSize() {
    return world_size;
  }
  public void setworldSize(int x) {
    world_size = x;
  }

  public int getWORLD_COUNT() {
    return this.WORLD_COUNT;
  }

  public int getEarthOffset() {
    return EARTH_OFFSET;
  }

  public void addLab() {
    lab_count++;
  }

  public void growBuildings() {
    for (int x = 0; x < buildings.length; x++) {
      if (millis() - buildings[x].getstartTime() > 5000 - (lab_count * 25) && buildings[x].getWorth() < 12 && (buildings[x] instanceof Tree || buildings[x] instanceof Mine|| buildings[x] instanceof Reactor))
        buildings[x].grow();
    }
  }
}

