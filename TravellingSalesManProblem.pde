import java.util.*;

ArrayList<PVector> cities=new ArrayList();
ArrayList<PVector> bestPath = new ArrayList();
int totalCities = 15;
int recordDistance;

void setup(){
  size(800,800);
  for(int i=0;i<totalCities;i++){
    cities.add(new PVector(random(width),random(height)));
  }
  
  int d = calDistance(cities);
  recordDistance = d;
  bestPath = (ArrayList)cities.clone();
}

void draw(){
  background(255);
  fill(0);
  for(int i=0;i<totalCities;i++){
   ellipse(cities.get(i).x,cities.get(i).y,8,8);
  }
  
  stroke(0);
  strokeWeight(1);
  noFill();
  beginShape();
  for(int i=0;i<totalCities;i++){
   vertex(cities.get(i).x,cities.get(i).y);
  }
  endShape();
  
  
  stroke(255,0,0);
  strokeWeight(4);
  noFill();
  beginShape();
  for(int i=0;i<totalCities;i++){
   vertex(bestPath.get(i).x,bestPath.get(i).y);
  }
  endShape();
  
  
  
  int i = floor(random(cities.size()));
  int j = floor(random(cities.size()));
  swap(cities,i,j);
  
  int d = calDistance(cities);
  if(d<recordDistance){
    recordDistance = d;
    bestPath = (ArrayList)cities.clone();
    System.out.println(recordDistance);
  }
}

void swap(ArrayList<PVector> array,int i,int j){
  
  PVector temp = array.get(i);
  array.set(i,array.get(j));
  array.set(j,temp);
}

int calDistance(ArrayList<PVector> p){
  int sum = 0;
  for(int i=0;i<p.size()-1;i++){
    int temp = floor(dist(p.get(i).x,p.get(i).y,p.get(i+1).x,p.get(i+1).y));
    sum+=temp;
  }
  return sum;
}
