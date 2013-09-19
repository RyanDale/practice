public class Player {
  int MAN = -1, wood = 10, stone, uranium, target = -1, animation = 0, currentTile, score;
  float PLAYER_BRAKING = 0.6F;
  String selectedItem;
  float player_acceleration = .008F;
  float player_animation_speed = 0.2F;
  double position, speed = 0;
  byte CHAR_SPRITE_HEIGHT = 14;
  boolean inRocket = false;

  public void drawPlayer() {
    if (!player.getRocketState()) {
      rotate((float)player.getPosition());
      translate(0, world.getworldSize());
      int spriteX = ((int) player.getAnimation() % 2 == 1) ? 0 : 5 + 7 * ((int) player.getAnimation() % 4) / 2;
      int spriteWidth = ((int) player.getAnimation() % 2 == 1) ? 5 : 7;
      int spriteAlgWidth = (player.getSpeed() < 0) ? -spriteWidth : spriteWidth;

      PImage img2=createImage(spriteWidth*2, player.getSpriteHeight()*2, ARGB);
      img2.copy(img, spriteX, 0, spriteWidth, player.getSpriteHeight(), 0, 0, spriteWidth*2, player.getSpriteHeight()*2);
      pushMatrix();
      translate(0, 0);
      if (spriteAlgWidth>=0)
        scale(-1, 1);
      image(img2, -img2.width, 0);
      popMatrix();
      translate(0, -world.getworldSize());

      rotate((float)-player.getPosition());
    }
  }
  
  public float getPlayer_Braking(){
    return PLAYER_BRAKING;
  }
  public int getScore() {
    return score;
  }

  public void setScore(int x) {
    score = x;
  }
  public String getselectedItem() {
    return selectedItem;
  }
  public void setselectedItem(String x) {
    selectedItem = x;
  }
  public byte getSpriteHeight() {
    return CHAR_SPRITE_HEIGHT;
  }

  public int getAnimation() {
    return animation;
  }
  public void setAnimation(int x) {
    animation = x;
  }
  public float getAnimationSpeed() {
    return player_animation_speed;
  }
  public float getAcceleration() {
    return player_acceleration;
  }

  public int getCurrentTile() {
    return currentTile;
  }

  public void setCurrentTile(int x) {
    currentTile = x;
  }

  public int getTarget() {
    return target;
  }

  public void setTarget(int x) {
    target = x;
  }

  public boolean getRocketState() {
    return inRocket;
  }
  public void setRocketState(boolean b) {
    inRocket = b;
  }

  public void setPosition(double x) {
    position = x;
  }
  public double getPosition() {
    return position;
  }
  public double getSpeed() {
    return speed;
  }

  public void setSpeed(double d) {
    speed = d;
  }

  public int getWood() {
    return wood;
  }
  public int getStone() {
    return stone;
  }

  public int getUranium() {
    return uranium;
  }

  public void useWood(int x) {
    wood -= x;
  }
  public void useStone(int x) {
    stone -= x;
  }

  public void useUranium(int x) {
    uranium -=x;
  }
  public void addWood(int x) {
    wood += x;
  }
  public void addStone(int x) {
    stone += x;
  }

  public void addUranium(int x) {
    uranium += x;
  }
}

