class Car implements Comparable<Car> {
    float posX;
    float posY;
    float posZ;
    float vX;
    float vY;
    float vZ;
    color col; // Zmieniona nazwa zmiennej na 'col'

    public Car(
        float posX,
        float posY,
        float posZ,
        float vX,
        float vY,
        float vZ,
        color col // Zmieniona nazwa parametru na 'col'
    ){
        this.posX = posX;
        this.posY = posY;
        this.posZ = posZ;
        this.vX = vX;
        this.vY = vY;
        this.vZ = vZ;
        this.col = col; // Zmieniona nazwa zmiennej na 'col'
    }
  
  void frameMovement(){
    posX += vX;
    posY += vY;
    posZ += vZ;
  }
  @Override
    public int compareTo(Car otherCar) {
        return Float.compare(this.posX, otherCar.posX);
    }
  
  void drawShape(){
    pushMatrix();
    translate(posX, posY, posZ);
    scale(0.5);
    rotateX(-PI/2);
    rotateZ(PI/2);
    drawCar();
    popMatrix();
  }
  
  void drawCar() { 
    // Rysowanie karoserii
    fill(col); 
    box(100, 100, 70); // Pierwszy prostopadłościan (kolor samochodu)
  
    // Drugi prostopadłościan 
    fill(col); 
    translate(0, 0, 60); // Przesunięcie w dół, aby prostopadłościan był na wysokości poprzedniego
    box(200, 100, 50); // Drugi prostopadłościan (kolor samochodu)
    
    // Rysowanie kół
    pushMatrix();
    translate(-60, 50, 25); // Przesunięcie lewego przedniego koła
    rotateX(PI/2); // Obrót koła wokół osi X
    drawWheel(20, 15, 10); // Lewe przednie koło
    popMatrix();
    
    pushMatrix();
    translate(60, 50, 25); // Przesunięcie prawego przedniego koła
    rotateX(PI/2); // Obrót koła wokół osi X
    drawWheel(20, 15, 10); // Prawe przednie koło
    popMatrix();
    
    pushMatrix();
    translate(-60, -50, 25); // Przesunięcie lewego tylne koła
    rotateX(PI/2); // Obrót koła wokół osi X
    drawWheel(20, 15, 10); // Lewe tylne koło
    popMatrix();
    
    pushMatrix();
    translate(60, -50, 25); // Przesunięcie prawego tylne koła
    rotateX(PI/2); // Obrót koła wokół osi X
    drawWheel(20, 15, 10); // Prawe tylne koło
    popMatrix();
  }
  
  void drawWheel(float radius, float thickness, int segments) {
    float angleIncrement = TWO_PI / segments; // Wartość kąta między segmentami
    float[] px = new float[segments + 1]; // Tablica przechowująca współrzędne x
    float[] py = new float[segments + 1]; // Tablica przechowująca współrzędne y
    
    beginShape(TRIANGLE_STRIP); // Rozpoczęcie rysowania wielokąta
    
    for (int i = 0; i <= segments; i++) {
      float angle = i * angleIncrement;
      px[i] = cos(angle) * radius;
      py[i] = sin(angle) * radius;
    }
    
    fill(200); // Ustawienie koloru na szary
    
    for (int i = 0; i < segments; i++) {
      vertex(px[i], py[i], thickness / 2);
      vertex(0, 0, thickness / 2);
      vertex(px[i + 1], py[i + 1], thickness / 2);
      vertex(px[i], py[i], -thickness / 2);
      vertex(0, 0, -thickness / 2);
      vertex(px[i + 1], py[i + 1], -thickness / 2);
    }
    
    endShape();
  }
  
  float getDirection(int dir){
    switch (dir) {
      case 0:
        return vX / abs(vX);
      case 1:
        return vY / abs(vY);
      case 2:
        return vZ / abs(vZ);
    }
    return 0;
  }
  
  boolean isOut(){
    return (posX > 1000 || posX < -1000 || posY > 1000 || posY < -1000 || posZ > 1000 || posZ < -1000);
  }
  
  color getColor() {
    return col; // Zmieniona nazwa zmiennej na 'col'
  }
}
