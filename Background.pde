
void drawGround() {
  pushMatrix();
  fill(34, 139, 34);
  translate(0, 100, 0);
  rotateX(HALF_PI);
  rectMode(CENTER);
  rect(0, 0, 2000, 2000); 
  popMatrix();
}

void drawStreet() {
  pushMatrix();
  fill(50);
  translate(0, 95, 0);
  rotateX(HALF_PI);
  rectMode(CENTER);
  rect(0, 0, 200, 2000);  // ulica
  popMatrix();
  
  // Linie na ulicy
  for (int i = -1000; i <= 1000; i += 100) {
    pushMatrix();
    fill(255);
    translate(0, 97, i); 
    box(20, 5, 50); 
    popMatrix();
  }
}
