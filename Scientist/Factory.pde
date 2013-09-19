public class Factory {
  public Buildings makeBuildings(String type) {
    Buildings b;
    if (type == "Tree")
      b = new Tree();
    else if (type == "Mine")
      b =  new Mine();
    else if (type == "Lab")
      b = new Lab();
    else if (type == "Reactor")
      b = new Reactor();
    else
      b =  new Rocket();
    return b;
  }
  public Buildings makeBuildings() {
    return new Buildings(null, 0);
  }
}

