Dataset dataset = new Dataset(20);
Draw draw = new Draw();

void setup() {
  
  background(0);
  size(700, 700);
  
}

int KNN = 7; // odd number

ArrayList<ArrayList> data_set = dataset.create_dataset();
PVector point = to_classify();

Classifier classifier = new Classifier(KNN, data_set, point);


void draw() {
    
  background(0);
  
  draw.draw_dataset(data_set);
  draw.draw_point(point);
  
  classifier.check();
  
  noLoop();
  
}

PVector to_classify() {
  
  int min = 175;
  int max = 525;
  
  
  double x_range = min + Math.random() * (max - min);
  double y_range = min + Math.random() * (max - min);
  
  return new PVector((float)x_range, (float)y_range);
}