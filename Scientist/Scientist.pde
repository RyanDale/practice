Buildings[] buildings;
World world;
Player player;
HUD hud;
Factory f;
Random r = new Random();
static PImage img;
PImage tree, drill, radar, ship, tree_f, drill_f, radar_f, door, door_f, ship_f, wood, metal, rock;
final static byte TILE_COUNT = 30;
final static double TILE_TO_RAD = Math.PI * 2 / TILE_COUNT;
boolean rightClick = false;
static int[] worlds = new int[] {
  130, 170, 160, 150, 0
};
long t;
void setup() {
  f = new Factory();
  img=loadImage("s.png");
  tree=loadImage("tree.png");
  drill=loadImage("drill.png");
  radar=loadImage("radar.png");
  door=loadImage("door.png");
  ship=loadImage("ship.png");

  tree_f=loadImage("tree_f.png");
  drill_f=loadImage("drill_f.png");
  radar_f=loadImage("radar_f.png");
  door_f=loadImage("door_f.png");
  ship_f=loadImage("ship_f.png");

  wood=loadImage("wood.png");
  metal=loadImage("metal.png");
  rock=loadImage("rock.png");
  buildings = new Buildings[30 * 4];
  world = new World();
  player = new Player();
  hud = new HUD();
  size(500, 500);
}

void draw() {
  world.growBuildings();
  t = (long)1.36555987;
  if (player.getRocketState()) {
    world.discoverWorld();
    world.setworldSize(worlds[world.getcurrentWorld() - 1]);
    player.setRocketState(false);
  }
  else {
    if (player.getTarget() != -1) {
      player.setCurrentTile((int) (Math.round(player.getPosition() / TILE_TO_RAD) % TILE_COUNT) + TILE_COUNT * world.getcurrentWorld());
      player.setCurrentTile(player.getCurrentTile() - TILE_COUNT * world.getcurrentWorld());
      if (player.getTarget() == player.getCurrentTile()) {
        player.setCurrentTile(player.getCurrentTile() + TILE_COUNT * (world.getcurrentWorld()-1)); 
        player.setTarget(-1);
        player.setSpeed(player.getSpeed() / 2);
        if (buildings[player.getCurrentTile()] instanceof Buildings && rightClick) {
          if (player.getselectedItem() == "Tree") 
            if (player.getWood() >= 2) {
              player.useWood(2);
              buildings[player.getCurrentTile()]= f.makeBuildings(player.getselectedItem());
            }
          if (player.getselectedItem() == "Mine") 
            if (player.getWood() >= 10) {
              player.useWood(10);
            }
          if (player.getselectedItem() == "Reactor") 
            if (player.getWood() >= 20 && player.getStone() >= 50) {
              player.useWood(10);
              player.useStone(50);
              buildings[player.getCurrentTile()]= f.makeBuildings(player.getselectedItem());
            }
          if (player.getselectedItem() == "Lab") 
            if (player.getWood() >= 30 && player.getStone() >= 15) {
              player.useWood(30);
              player.useStone(15);
              buildings[player.getCurrentTile()]= f.makeBuildings(player.getselectedItem());
            }
          if (player.getselectedItem() == "Rocket") {
            if (player.getWood() >= 15 && player.getStone() >= 99 && player.getUranium() >= 50) {
              player.useWood(15);
              player.useStone(99);
              player.useUranium(50);
              buildings[player.getCurrentTile()]= f.makeBuildings(player.getselectedItem());
            }
          }
        }
        else if (buildings[player.getCurrentTile()] instanceof Buildings) {
          if (buildings[player.getCurrentTile()] instanceof Tree) {
            player.addWood(buildings[player.getCurrentTile()].getWorth());
            buildings[player.getCurrentTile()]= f.makeBuildings();
          }
          if (buildings[player.getCurrentTile()] instanceof Mine) {
            player.addStone(buildings[player.getCurrentTile()].getWorth());
            buildings[player.getCurrentTile()].useWorth();
          }
          if (buildings[player.getCurrentTile()] instanceof Reactor) {
            player.addUranium(buildings[player.getCurrentTile()].getWorth());
            buildings[player.getCurrentTile()].useWorth();
          }
          if (buildings[player.getCurrentTile()] instanceof Rocket) {
            player.setRocketState(true);
          }
        }
      }
      if ((player.getTarget() < player.getCurrentTile() && player.getCurrentTile() - player.getTarget() < TILE_COUNT / 2)
        || (player.getTarget() > player.getCurrentTile() && player.getTarget() - player.getCurrentTile() > TILE_COUNT / 2)) {
        player.setSpeed(player.getSpeed() - player.getAcceleration());
      }
      else {
        player.setSpeed(player.getSpeed() + player.getAcceleration());
      }
    }
  }
  //move character
  player.setPosition(player.getPosition() + player.getSpeed());
  player.setPosition((player.getPosition() + 2 * Math.PI) % (2 * Math.PI));
  player.setSpeed(player.getSpeed() * player.getPlayer_Braking());
  if (Math.abs(player.getSpeed()) > player.getAcceleration()) {
    player.setAnimation((int)(player.getAnimation() + player.getAnimationSpeed()));
  }
  else {
    player.setAnimation(1);
  }
  if (world.getcurrentWorld() == world.getWORLD_COUNT() ) {
    fill(color(0xCCFFFFFF));
    rect(160, 190, 175, 70, 10, 10, 10, 10);
    player.setScore(millis() - (int)t);
    fill(color(0, 0, 0));
    text("You win!", 170, 210);
    text("Time (s): ", 170, 230);
    text(String.valueOf(player.getScore()), 260, 230);
  }
  else {
    //background
    fill(color(35, 51, 85));
    rect(0, 0, 500, 500);
    translate(250, 250 - 30);
    rotate((float) t/world.getworldSlowness());
    world.drawWorlds();
    world.drawBuildings();
    hud.drawfeedBack();
    player.drawPlayer();
    rotate((float) -t/world.getworldSlowness());
    translate(-250, -250 + 30);
    hud.drawShop();
    hud.drawPlayerResources();

    for (int i = 0; i < world.getWORLD_COUNT(); i++) {
      if (i > world.getcurrentWorld()-1) 
        fill(color(150, 150, 150));
      ellipse(10+15*i, 480, 15, 15);
    }
  }
  do {
    Thread.yield();
  } 
  while (System.currentTimeMillis () - t < 16);
}

void mouseDragged() {
  handleInput();
}
void mouseClicked() {
  handleInput();
}

public void handleInput() {
  if (mouseY > 410) {
    if (mouseX > 170 && mouseX < 480) {
      switch((mouseX - 175) / 65) {
      case 0:
        player.setselectedItem("Tree");
        break;
      case 1:
        player.setselectedItem("Mine");
        break;        
      case 2:
        player.setselectedItem("Reactor");
        break;        
      case 3:
        player.setselectedItem("Lab");
        break;        
      case 4:
        player.setselectedItem("Rocket");
        break;
      }
    }
  }
  else {    
    rightClick = mouseButton==RIGHT;
    mouseX -= world.getEarthOffset();
    mouseY -= 220;
    if (mouseX != 0 && mouseY != 0) {
      double targetTheta = (Math.PI * 200000001.5 - t/world.getworldSlowness() + 2 * Math.atan(mouseY / (mouseX + Math.sqrt(mouseY * mouseY + mouseX * mouseX)))) % (2 * Math.PI);
      player.setTarget((int) (Math.round(targetTheta / TILE_TO_RAD) % TILE_COUNT) + TILE_COUNT * world.getcurrentWorld());
      if (player.getTarget()<9)
        player.setTarget(player.getTarget() + TILE_COUNT);
      player.setTarget(player.getTarget() - 8);
      player.setTarget(player.getTarget() % TILE_COUNT);
    }
  }
}

