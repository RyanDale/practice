public class Star {
  float pos_x, pos_y;

  public Star(float x, float y) {
    pos_x = x;
    pos_y = y;
  }

  public float getX() {
    return pos_x;
  }
  public void setX(float x) {
    pos_x = x;
  }

  public float getY() {
    return pos_y;
  }
  public void setY(float x) {
    pos_y = x;
  }
  
  public void drawStars(){
    ellipse(pos_x, pos_y, 3, 3);    
  }
}

