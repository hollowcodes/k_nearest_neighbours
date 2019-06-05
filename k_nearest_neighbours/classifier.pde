import java.util.Collections;

class Classifier {
  
  int nearest_neighbours;
  
  ArrayList<PVector> a_labels = new ArrayList<PVector>();  // red
  ArrayList<PVector> b_labels = new ArrayList<PVector>();  // green
  PVector to_classify = new PVector();
  
  Classifier(int nearest_neighbours, ArrayList<ArrayList> data_set, PVector to_classify) {
        
    this.nearest_neighbours = nearest_neighbours;
    
    this.a_labels = data_set.get(0);
    this.b_labels = data_set.get(1);

    this.to_classify = to_classify;
  }
  
  ArrayList<PVector> get_nearest_neighbours() {
    
    ArrayList<PVector> data_points = new ArrayList<PVector>();
    for(int i=0; i<=this.a_labels.size() - 1; i++) {
      data_points.add(this.a_labels.get(i));
      data_points.add(this.b_labels.get(i));
    }

    
    ArrayList<Float> distances = new ArrayList<Float>();
    for(int i=0; i<=data_points.size() - 1; i++) {
      
      float dist = distance(this.to_classify, data_points.get(i));
      distances.add(dist);
    }
    
    ArrayList<PVector> nearest_points = new ArrayList<PVector>();
        
    for(int i=1; i<=this.nearest_neighbours; i++) {
      
      int index = distances.indexOf(Collections.min(distances));
      PVector nearest = data_points.get(index);
      
      nearest_points.add(nearest);
      
      distances.remove(index);
      data_points.remove(index);
      
    }

    return nearest_points;
  }
  
  void check() {
    
    ArrayList<PVector> a_nearest = new ArrayList<PVector>();
    ArrayList<PVector> b_nearest = new ArrayList<PVector>();
    
    ArrayList<PVector> nearest = get_nearest_neighbours();
    
    for(int i=0; i<=nearest.size() - 1; i++) {
      
      if(this.a_labels.contains(nearest.get(i)) == true) {
        a_nearest.add(nearest.get(i));
      }
      else {
        b_nearest.add(nearest.get(i));
      }
      
    }
    
    if(a_nearest.size() > b_nearest.size()) {
      println("classified as [RED]");
    }
    else{
      println("classified as [GREEN]");
    }
    
    for(int i=0; i<=a_nearest.size() - 1; i++) {
      draw.draw_line(this.to_classify, a_nearest.get(i), "red");
    }
    for(int i=0; i<=b_nearest.size() - 1; i++) {
      draw.draw_line(this.to_classify, b_nearest.get(i), "green");
    }
    
  }
  
  
  float distance(PVector a, PVector b) {
        
    return sqrt(pow((a.x - b.x), 2) + pow((a.y - b.y), 2));
  }
  
}