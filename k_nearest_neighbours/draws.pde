
class Draw {
  
  void draw_dataset(ArrayList<ArrayList> dataset) {
    
    ArrayList<PVector> a_labels = dataset.get(0);
    ArrayList<PVector> b_labels = dataset.get(1);
    
    for(int i=0; i<=a_labels.size() - 1; i++) {

      pushStyle();
      strokeWeight(10);
      stroke(255, 0, 0);
      point(a_labels.get(i).x, a_labels.get(i).y);
      popStyle();
      
      pushStyle();
      strokeWeight(10);
      stroke(0, 255, 0);
      point(b_labels.get(i).x, b_labels.get(i).y);
      popStyle();

    }
    
  }
  
  void draw_point(PVector point) {
    
    pushStyle();
    strokeWeight(10);
    stroke(0, 0, 255);
    
    point(point.x, point.y);
    
    popStyle();
    
  }
  
  void draw_line(PVector a, PVector b, String _color) {
    
    if(_color == "red") {
      
      pushStyle();
      stroke(255, 0, 0);
      line(a.x, a.y, b.x, b.y);
      popStyle();
    }
    else if(_color == "green") {
      
      pushStyle();
      stroke(0, 255, 0);
      line(a.x, a.y, b.x, b.y);
      popStyle();
    }
    
  }
}