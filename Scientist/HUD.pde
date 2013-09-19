public class HUD {
  String selected_item = "";
  int[][] ITEM_PROPS = new int[][] {
    new int[] { 
      2, 0, 0, 2
    }
    , // Tree
    new int[] { 
      10, 0, 0, 4
    }
    , 
    new int[] { 
      20, 50, 0, 5
    }
    , 
    new int[] { 
      30, 15, 0, 5
    }
    , 
    new int[] { 
      15, 99, 50, 6
    }
  };
  public void drawfeedBack() {
    fill(color(0xAAFFFFFF));
    if (player.getTarget() != -1) {
      rotate(player.getTarget() * (float)TILE_TO_RAD);
      ellipse(-6, world.getworldSize() -16, 12, 12);
      rotate(- player.getTarget() *(float) TILE_TO_RAD);
    }
  }
  public void drawPlayerResources() {
    fill(color(255, 255, 255));
    image(wood, 20, 371, 21, 21);
    image(metal, 20, 1*30+371, 21, 21);
    image(rock, 20, 2*30+371, 21, 21);
    text(player.getWood(), 48, 0*30 + 386);
    text(player.getStone(), 48, 1*30 + 386);
    text(player.getUranium(), 48, 2*30 + 386);
  }

  public String getSelectedItem() {
    return selected_item;
  }

  public void setSelectedItem(String s) {
    selected_item = s;
  }

  public void drawShop() {
    fill(color(255, 255, 255));
    if (player.getselectedItem() == "Tree") 
      rect(190 + 0*60, 440, 30, 40, 10, 10, 10, 10);
    if (player.getselectedItem() == "Mine") 
      rect(190 + 1*60, 440, 30, 40, 10, 10, 10, 10);
    if (player.getselectedItem() == "Reactor") 
      rect(190 + 2*60, 440, 30, 40, 10, 10, 10, 10);
    if (player.getselectedItem() == "Lab") 
      rect(190 + 3*60, 440, 30, 40, 10, 10, 10, 10);
    if (player.getselectedItem() == "Rocket") 
      rect(190 + 4*60, 440, 30, 40, 10, 10, 10, 10);
    int offset = 0;
    for (int i = 0; i < 5; i++) {
      fill(color(0x55FFFFFF));
      rect(190 + i*60, 440, 55, 40, 10, 10, 10, 10);
      for (int j = 0; j < 3; j++) {
        if (ITEM_PROPS[i][j] > 0) {
          fill(color(255, 255, 255));
          text(String.valueOf(ITEM_PROPS[i][j]), 230 + i*60, 451 + offset);
          offset += 12;
        }
      }
      offset = 0;
    }
    image(tree_f, 195 + 0*60, 447, 12, 28);
    image(drill_f, 195 + 1*60, 447, 20, 28);
    image(radar_f, 195 + 2*60, 447, 16, 28);
    image(door_f, 195 + 3*60, 447, 16, 28);
    image(ship_f, 195 + 4*60, 447, 20, 28);
  }
}

