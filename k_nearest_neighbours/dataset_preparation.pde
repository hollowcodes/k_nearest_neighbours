
class Dataset {

  int dataset_size;

  Dataset(int dataset_size) {
    
    this.dataset_size = dataset_size;
  }
  
  ArrayList<PVector> create_labelset(int min, int max) {
    
    ArrayList<PVector> set = new ArrayList<PVector>();
    
    for(int i=1; i<=dataset_size/2; i++) {
      
      double x = min + Math.random() * (max - min);
      double y = min + Math.random() * (max - min);
            
      PVector element = new PVector( (float)x, (float)y);
      set.add(element);
      
    }

    return set;
    
  }
  
  ArrayList<ArrayList> create_dataset() {
    
    ArrayList<ArrayList> dataset = new ArrayList<ArrayList>();
    
    dataset.add(create_labelset(100, 400));
    dataset.add(create_labelset(300, 600));
    
    return dataset;
  }
}