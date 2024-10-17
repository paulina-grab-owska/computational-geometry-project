class trianglePerson {
  float angle = 0; // Początkowy kąt obrotu

  trianglePerson() {
  }

  void drawPerson() {
    lights();
    translate(width/2, height/2); // Przesunięcie do środka ekranu
    
    rotateY(angle); // Obrót całego obiektu wokół osi Y
    angle += 0.01; // Zwiększenie kąta obrotu dla płynnego ruchu
    
    // Głowa
    fill(255, 200, 200);
    translate(0, -200, 0); // Przesunięcie głowy w górę
    sphere(35);


    // Tułów
    fill(100, 150, 255);
    translate(0, 110, 0); // Przesunięcie tułowia w dół
    drawBox(50, 150, 50);

    // Ręce
    pushMatrix();
    translate(-30, -20, 0);
    fill(255, 200, 200);
    drawBox2(20, 100, 30);
    popMatrix();

    pushMatrix();
    translate(30, -20, 0);
    fill(255, 200, 200);
    drawBox2(20, 100, 30);
    popMatrix();

    // Nogi
    pushMatrix();
    translate(-20, 150, 0);
    fill(255, 200, 200);
    drawBox2(15, 150, 30);
    popMatrix();

    pushMatrix();
    translate(20, 150, 0);
    fill(255, 200, 200);
    drawBox2(15, 150, 30);
    popMatrix();
  }

  void drawBox(float w, float h, float d) {
    float x = w / 2;
    float y = h / 2;
    float z = d / 2;
    int divisions = 11; // Liczba podziałów w jednej osi
    float stepX = w / divisions; // Krok podziału w osi X
    float stepY = h / divisions/2; // Krok podziału w osi Y
    float stepZ = d / divisions; // Krok podziału w osi Z

    beginShape(TRIANGLES);

    // Przednia ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions*2; j++) {
        float x0 = -x + i * stepX;
        float x1 = -x + (i + 1) * stepX;
        float y0 = -y + j * stepY;
        float y1 = -y + (j + 1) * stepY;
        float z0 = z;

        // Triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x1, y1, z0);
          vertex(x0, y0, z0); vertex(x1, y1, z0); vertex(x0, y1, z0);
        } else {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x0, y1, z0);
          vertex(x1, y0, z0); vertex(x1, y1, z0); vertex(x0, y1, z0);
        }
      }
    }

    // Tylna ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions*2; j++) {
        float x0 = -x + i * stepX;
        float x1 = -x + (i + 1) * stepX;
        float y0 = -y + j * stepY;
        float y1 = -y + (j + 1) * stepY;
        float z0 = -z;

        // Triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x1, y1, z0);
          vertex(x0, y0, z0); vertex(x1, y1, z0); vertex(x0, y1, z0);
        } else {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x0, y1, z0);
          vertex(x1, y0, z0); vertex(x1, y1, z0); vertex(x0, y1, z0);
        }
      }
    }

    // Lewa ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions*2; j++) {
        float z0 = z - i * stepZ;
        float z1 = z - (i + 1) * stepZ;
        float y0 = -y + j * stepY;
        float y1 = -y + (j + 1) * stepY;
        float x0 = -x;

        // Triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z1);
          vertex(x0, y0, z0); vertex(x0, y1, z1); vertex(x0, y1, z0);
        } else {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z0);
          vertex(x0, y0, z1); vertex(x0, y1, z1); vertex(x0, y1, z0);
        }
      }
    }

    // Prawa ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions*2; j++) {
        float z0 = z - i * stepZ;
        float z1 = z - (i + 1) * stepZ;
        float y0 = -y + j * stepY;
        float y1 = -y + (j + 1) * stepY;
        float x0 = x;

        // Triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z1);
          vertex(x0, y0, z0); vertex(x0, y1, z1); vertex(x0, y1, z0);
        } else {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z0);
          vertex(x0, y0, z1); vertex(x0, y1, z1); vertex(x0, y1, z0);
        }
      }
    }

    // Górna ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions; j++) {
        float x0 = -x + i * stepX;
        float x1 = -x + (i + 1) * stepX;
        float z0 = z - j * stepZ;
        float z1 = z - (j + 1) * stepZ;
        float y0 = -y;

        // Triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x1, y0, z1);
          vertex(x0, y0, z0); vertex(x1, y0, z1); vertex(x0, y0, z1);
        } else {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x0, y0, z1);
          vertex(x1, y0, z0); vertex(x1, y0, z1); vertex(x0, y0, z1);
        }
      }
    }

    // Dolna ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions; j++) {
        float x0 = -x + i * stepX;
        float x1 = -x + (i + 1) * stepX;
        float z0 = z - j * stepZ;
        float z1 = z - (j + 1) * stepZ;
        float y0 = y;

        // Triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x1, y0, z1);
          vertex(x0, y0, z0); vertex(x1, y0, z1); vertex(x0, y0, z1);
        } else {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x0, y0, z1);
          vertex(x1, y0, z0); vertex(x1, y0, z1); vertex(x0, y0, z1);
        }
      }
    }

    endShape();
  }
  
  
  
    void drawBox2(float w, float h, float d) {
    float x = w / 2;
    float y = h / 2;
    float z = d / 2;
    int divisions = 8; // Liczba podziałów w jednej osi
    float stepX = w / divisions; // Krok podziału w osi X
    float stepY = h / divisions/2; // Krok podziału w osi Y
    float stepZ = d / divisions; // Krok podziału w osi Z

    beginShape(TRIANGLES);

    // Przednia ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions*2; j++) {
        float x0 = -x + i * stepX;
        float x1 = -x + (i + 1) * stepX;
        float y0 = -y + j * stepY;
        float y1 = -y + (j + 1) * stepY;
        float z0 = z;

        // Triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x1, y1, z0);
          vertex(x0, y0, z0); vertex(x1, y1, z0); vertex(x0, y1, z0);
        } else {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x0, y1, z0);
          vertex(x1, y0, z0); vertex(x1, y1, z0); vertex(x0, y1, z0);
        }
      }
    }

    // Tylna ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions*2; j++) {
        float x0 = -x + i * stepX;
        float x1 = -x + (i + 1) * stepX;
        float y0 = -y + j * stepY;
        float y1 = -y + (j + 1) * stepY;
        float z0 = -z;

        // Triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x1, y1, z0);
          vertex(x0, y0, z0); vertex(x1, y1, z0); vertex(x0, y1, z0);
        } else {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x0, y1, z0);
          vertex(x1, y0, z0); vertex(x1, y1, z0); vertex(x0, y1, z0);
        }
      }
    }

    // Lewa ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions*2; j++) {
        float z0 = z - i * stepZ;
        float z1 = z - (i + 1) * stepZ;
        float y0 = -y + j * stepY;
        float y1 = -y + (j + 1) * stepY;
        float x0 = -x;

        // Triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z1);
          vertex(x0, y0, z0); vertex(x0, y1, z1); vertex(x0, y1, z0);
        } else {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z0);
          vertex(x0, y0, z1); vertex(x0, y1, z1); vertex(x0, y1, z0);
        }
      }
    }

    // Prawa ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions*2; j++) {
        float z0 = z - i * stepZ;
        float z1 = z - (i + 1) * stepZ;
        float y0 = -y + j * stepY;
        float y1 = -y + (j + 1) * stepY;
        float x0 = x;

        // Triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z1);
          vertex(x0, y0, z0); vertex(x0, y1, z1); vertex(x0, y1, z0);
        } else {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z0);
          vertex(x0, y0, z1); vertex(x0, y1, z1); vertex(x0, y1, z0);
        }
      }
    }

    // Górna ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions; j++) {
        float x0 = -x + i * stepX;
        float x1 = -x + (i + 1) * stepX;
        float z0 = z - j * stepZ;
        float z1 = z - (j + 1) * stepZ;
        float y0 = -y;

        // Triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x1, y0, z1);
          vertex(x0, y0, z0); vertex(x1, y0, z1); vertex(x0, y0, z1);
        } else {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x0, y0, z1);
          vertex(x1, y0, z0); vertex(x1, y0, z1); vertex(x0, y0, z1);
        }
      }
    }

    // Dolna ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions; j++) {
        float x0 = -x + i * stepX;
        float x1 = -x + (i + 1) * stepX;
        float z0 = z - j * stepZ;
        float z1 = z - (j + 1) * stepZ;
        float y0 = y;

        // Triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x1, y0, z1);
          vertex(x0, y0, z0); vertex(x1, y0, z1); vertex(x0, y0, z1);
        } else {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x0, y0, z1);
          vertex(x1, y0, z0); vertex(x1, y0, z1); vertex(x0, y0, z1);
        }
      }
    }

    endShape();
  }
}
