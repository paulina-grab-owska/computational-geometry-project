class Person {
    float posX;
    float posY;
    float posZ;
    float vX;
    float vY;
    float vZ;

  public Person(
    float posX,
    float posY,
    float posZ,
    float vX,
    float vY,
    float vZ
  ){
    this.posX = posX;
    this.posY = posY;
    this.posZ = posZ;
    this.vX = vX;
    this.vY = vY;
    this.vZ = vZ;
  }
  
  void frameMovement(){
    posX += vX;
    posY += vY;
    posZ += vZ;
  }

  void drawShape(){
  

    pushMatrix();
    translate(posX,posY,posZ);
    rotateY(PI/2);
    scale(0.2);
    drawPerson();
    popMatrix();
  }


  void drawPerson() {
    
    // Głowa
    fill(255, 200, 200);
    translate(0, -200, 0); // Przesunięcie głowy w górę
    noStroke(); // TROJKAt
    sphere(35);
    stroke(0); //TROJKAT
  
    // Tułów
    fill(100, 150, 255);
    translate(0, 110, 0); // Przesunięcie tułowia w dół
    box(50, 150, 50);
  
    // Ręce
    pushMatrix();
    translate(-30, -20, 0);
    fill(255, 200, 200);
    box(20, 100, 30);
    popMatrix();
  
    pushMatrix();
    translate(30, -20, 0);
    fill(255, 200, 200);
    box(20, 100, 30);
    popMatrix();
  
    // Nogi
    pushMatrix();
    translate(-20, 150, 0);
    fill(255, 200, 200);
    box(15, 150, 30);
    popMatrix();
  
    pushMatrix();
    translate(20, 150, 0);
    fill(255, 200, 200);
    box(15, 150, 30);
    popMatrix();
    
  }
  
    float getDirection(int dir){
    switch(dir){
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
    if(posX > 1000 || posX < -1000 || posY > 1000 || posY < -1000 || posZ > 1000 || posZ < -1000)return true;
    return false;
  }
}
