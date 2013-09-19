public class Buildings {
  PImage sprite = null;
  int worth = 0;
  double scale = .5;
  long startTime;
  public Buildings(PImage sprite, int worth) {
    this.sprite = sprite;
    this.worth = worth;
  }

  public void setScale(double x) {
    scale = x;
  }
  public double getScale() {
    return scale;
  }
  public void grow() {
    scale+= .25;
    startTime = millis();
    worth+=4;
  }
  public void useWorth() {
    worth = 0;
  }
  public int getWorth() {
    return worth;
  }

  public float getstartTime() {
    return startTime;
  }
  public PImage getSprite() {
    if (sprite!=null)
      return sprite;
    return null;
  }

  public void drawBuilding(int x) {
    if (sprite != null) {
      rotate(x * (float)(Math.PI * 2 / 30));
      translate(0, world.getworldSize());
      if (this instanceof Tree)  
        image(sprite, 19 - 22, 0, 10 * (float)scale, 30*(float)scale);
      if (this instanceof Mine || this instanceof Reactor) {
        fill(0);
        image(sprite, 19 - 22, 0, 20, 30);
        ellipse(8, -8, 10 * worth / 8, (10* worth) / 8);
      }
      if (this instanceof Rocket || this instanceof Lab) {
        image(sprite, 19 - 22, 0, 20, 30);
      }
      translate(0, -world.getworldSize());
      rotate( - x * (float)(Math.PI * 2 / 30));
    }
  }
}
