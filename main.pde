//import toxi.geom.*;
//import toxi.geom.mesh.*;
//import toxi.processing.*;

int w = 800;
int h = 600;
RangeTree1D<Car> carTree; // Deklaracja pola
int collisionCountRed = 0; // Globalna zmienna do przechowywania liczby kolizji czerwonego auta
int collisionCountBlue = 0; // Globalna zmienna do przechowywania liczby kolizji niebieskiego auta

int elapsedTime = 0;
boolean simulationRunning = false;
int killed =0;
int survived =0;
info info;

void settings() {
  size(w, h, P3D);
  smooth(8); 
}

void setup(){
  ca = new carFrame();
  pe = new personFrame();
  info = new info();
  
   carTree = new RangeTree1D<>(); // Inicjalizacja w funkcji setup
   carTree.insert(new Car(65, 35, 800, 0, 0, -random(2, 20), color(0, 0, 200)));
   carTree.insert(new Car(-65, 35, -800, 0, 0, random(2, 20), color(200, 0, 0)));
}

menu m = new menu();
triangleCar a = new triangleCar();
trianglePerson c = new trianglePerson();

int jakascena =0;
carFrame ca;
personFrame pe;

ArrayList<Car> cars = new ArrayList<Car>();
ArrayList<Person> ppl = new ArrayList<Person>();

Person per = new Person(
  400,360,1000,
  0,0,-2);

float moveX = 0;
float moveY = 0;

float scal = 1;

float textX = width - 10; // Pozycja X tekstu
float textY = 10; // Pozycja Y tekstu

void draw() {
  if (jakascena == 0)
    m.displaymenu();

  if (jakascena == 1) {
    if (!simulationRunning) {
      simulationRunning = true;
      elapsedTime = millis();
    }

    if (millis() - elapsedTime > 20000) {
      jakascena = 4;
    }
    
    else if (cars.size() < 2) {
      cars.add(new Car(
        65, 35, 800,
        0, 0, -random(2, 20), color(0, 0, 200)));
      cars.add(new Car(
        -65, 35, -800,
        0, 0, random(2, 20), color(200, 0, 0)));
    }

    while (ppl.size() < 10) {
      ppl.add(new Person(
        800, 60, random(1600) - 800,
        -random(2), 0, 0));
    }

    background(135, 206, 235);
    lights();

    // kamera
    camera(cos(moveX * 0.002) * 500 * scal, (-150 + sin(moveY * 0.002) * 100) * scal, sin(moveX * 0.002) * 500 * scal, 0, 0, 0, 0, 1, 0);

    // ziemia
    drawGround();

    // ulica
    drawStreet();

    // czlowiek
    for (int j = 0; j < ppl.size(); j++) {
      Person p = ppl.get(j);
      p.frameMovement();
      p.drawShape();

      if (p.isOut()) {
        ppl.remove(p);
        j--;
      }
    }

    // auto
    float minX = -1000; // minimalna współrzędna X
    float maxX = 1000;  // maksymalna współrzędna X

    List<Car> carsInRange = carTree.queryRange(new Car(minX, 0, 0, 0, 0, 0, color(0, 0, 0)), new Car(maxX, 0, 0, 0, 0, 0, color(0, 0, 0)));

    for (Car c : carsInRange) {
        c.frameMovement();
        c.drawShape();

        // Sprawdzanie kolizji z osobami
        for (int j = 0; j < ppl.size(); j++) {
            Person p = ppl.get(j);
            if (checkCollision(c, p)) {
                if (c.getColor() == color(200, 0, 0)) {
                    collisionCountRed++;
                } else if (c.getColor() == color(0, 0, 200)) {
                    collisionCountBlue++;
                }
                ppl.remove(j);
                j--;
            }
        }

        if (c.isOut()) {
          if (c.posZ > 0) {
            if (c.getColor() == color(0, 0, 200)) {
                carTree.remove(c); 
                carTree.insert(new Car(65, 35, 800, 0, 0, -random(2, 20), color(0, 0, 200))); 
              }
              if (c.getColor() == color(200, 0, 0)) {
                carTree.remove(c); 
                carTree.insert(new Car(-65, 35, -800, 0, 0, random(2, 20), color(200, 0, 0))); 
              }
            } else {
              if (c.getColor() == color(0, 0, 200)) {
                  carTree.remove(c); 
                  carTree.insert(new Car(65, 35, 800, 0, 0, -random(2, 20), color(0, 0, 200))); 
                }
                if (c.getColor() == color(200, 0, 0)) {
                  carTree.remove(c); 
                  carTree.insert(new Car(-65, 35, -800, 0, 0, random(2, 20), color(200, 0, 0))); 
                }
           }
        }
    }

    // Wyłącz testowanie głębokości przed rysowaniem tekstu
    hint(DISABLE_DEPTH_TEST);

    // Rysuj tekst
    drawCollisionText();

    // Włącz testowanie głębokości po rysowaniu tekstu
    hint(ENABLE_DEPTH_TEST);
  }

  if (jakascena == 2) {
    ca.carFrame();
    a.drawCar();
  }

  if (jakascena == 3) {
    pe.personFrame();
    c.drawPerson();
  }
  
  if (jakascena == 4) {
    info.displayInfo(collisionCountBlue, collisionCountRed, collisionCountBlue+collisionCountRed);
  }
}

void mousePressed() {
  noCursor();
}

void mouseReleased() {
  cursor();
}

void mouseDragged() {
  moveX += mouseX - pmouseX;
  moveY += mouseY - pmouseY;

  if (moveY < -250) moveY = -250;
  if (moveY > 250) moveY = 250;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  scal = scal * pow(1.1, e);
}

void keyPressed() {
  if (jakascena == 0) m.menuonclick();
  else if (jakascena == 2) ca.carFrameonclick();
  else if (jakascena == 3) pe.personFrameonclick();
    else if (jakascena == 4) info.infoFrameonclick();
}

boolean checkCollision(Car car, Person person) {
  // Sprawdzamy odległość między samochodem a osobą
  float distance = dist(car.posX, car.posY, car.posZ, person.posX, person.posY, person.posZ);
  float collisionDistance = 50; // Odległość, w której uznajemy kolizję (można dostosować w zależności od wielkości obiektów)

    return distance < collisionDistance;
}


void drawCollisionText() {
  hint(DISABLE_DEPTH_TEST); // Wyłącza testowanie głębokości
  camera(); // Resetowanie kamery do domyślnego widoku 2D
  textSize(20);
  textAlign(RIGHT, TOP);

  // Tekst dla niebieskiego auta
  fill(0); 
  String blueRest = " auta: " + collisionCountBlue;
  float blueRestWidth = textWidth(blueRest);
  text(blueRest, width - 10, 10);

  fill(0, 0, 255); 
  String blueWord = "niebieskiego";
  float blueWordWidth = textWidth(blueWord);
  text(blueWord, width - 10 - blueRestWidth, 10);

  fill(0); 
  String textBlue = "Kolizje ";
  float textBlueWidth = textWidth(textBlue);
  text(textBlue, width - 10 - blueRestWidth - blueWordWidth, 10);

  // Tekst dla czerwonego auta
  fill(0);
  String redRest = " auta: " + collisionCountRed;
  float redRestWidth = textWidth(redRest);
  text(redRest, width - 10, 40);

  fill(255, 0, 0); 
  String redWord = "czerwonego";
  float redWordWidth = textWidth(redWord);
  text(redWord, width - 10 - redRestWidth, 40);

  fill(0); 
  String textRed = "Kolizje ";
  float textRedWidth = textWidth(textRed);
  text(textRed, width - 10 - redRestWidth - redWordWidth, 40);

  hint(ENABLE_DEPTH_TEST); 
}
