class triangleCar {

  float angle = 0; // Początkowy kąt obrotu

  void drawCar() {
    
    translate(width/2, height/2); // Przesunięcie do środka ekranu
    
    rotateY(angle); // Obrót całego obiektu wokół osi Y
    angle += 0.01; // Zwiększenie kąta obrotu dla płynnego ruchu
    
    // Obrót całego rysunku o 90 stopni wokół osi Y
    rotateX(-PI/2);
    
    // Rysowanie karoserii z trójkątów
    fill(200, 0, 0); 
    drawBox(100, 100, 60); // Pierwszy prostopadłościan (niebieski)

    // Drugi prostopadłościan 
    fill(200, 0, 0); 
    translate(0, 0, 60); // Przesunięcie w dół, aby prostopadłościan był na wysokości poprzedniego
    drawBox2(200, 100, 60); // Drugi prostopadłościan (czerwony)

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
    translate(-60, -50, 25); // Przesunięcie lewego tylnego koła
    rotateX(PI/2); // Obrót koła wokół osi X
    drawWheel(20, 15, 10); // Lewe tylne koło
    popMatrix();
    
    pushMatrix();
    translate(60, -50, 25); // Przesunięcie prawego tylnego koła
    rotateX(PI/2); // Obrót koła wokół osi X
    drawWheel(20, 15, 10); // Prawe tylne koło
    popMatrix();
    
  }

  void drawBox(float w, float h, float d) {
    float x = w / 2;
    float y = h / 2;
    float z = d / 2;
    int divisions = 10; // Liczba podziałów w jednej osi
    float stepX = w / divisions; // Krok podziału w osi X
    float stepY = h / divisions; // Krok podziału w osi Y
    float stepZ = d / divisions; // Krok podziału w osi Z

    beginShape(TRIANGLES);

    //Górna ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions; j++) {
        float x0 = -x + i * stepX;
        float x1 = -x + (i + 1) * stepX;
        float y0 = -y + j * stepY;
        float y1 = -y + (j + 1) * stepY;
        float z0 = -z;

        // triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x1, y1, z0);
          vertex(x0, y0, z0); vertex(x1, y1, z0); vertex(x0, y1, z0);
        } else {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x0, y1, z0);
          vertex(x1, y0, z0); vertex(x1, y1, z0); vertex(x0, y1, z0);
        }
      }
    }

    // Tylnia ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions; j++) {
        float z0 = z - i * stepZ;
        float z1 = z - (i + 1) * stepZ;
        float y0 = -y + j * stepY;
        float y1 = -y + (j + 1) * stepY;
        float x0 = -x;

        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z1);
          vertex(x0, y0, z0); vertex(x0, y1, z1); vertex(x0, y1, z0);
        } else {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z0);
          vertex(x0, y0, z1); vertex(x0, y1, z1); vertex(x0, y1, z0);
        }
      }
    }

    // Przednia ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions; j++) {
        float z0 = z - i * stepZ;
        float z1 = z - (i + 1) * stepZ;
        float y0 = -y + j * stepY;
        float y1 = -y + (j + 1) * stepY;
        float x0 = x;

        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z1);
          vertex(x0, y0, z0); vertex(x0, y1, z1); vertex(x0, y1, z0);
        } else {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z0);
          vertex(x0, y0, z1); vertex(x0, y1, z1); vertex(x0, y1, z0);
        }
      }
    }

    //Prawa ściana
    
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions; j++) {
        float x0 = -x + i * stepX;
        float x1 = -x + (i + 1) * stepX;
        float z0 = z - j * stepZ;
        float z1 = z - (j + 1) * stepZ;
        float y0 = -y;

      //triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x1, y0, z1);
          vertex(x0, y0, z0); vertex(x1, y0, z1); vertex(x0, y0, z1);
        } else {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x0, y0, z1);
          vertex(x1, y0, z0); vertex(x1, y0, z1); vertex(x0, y0, z1);
        }
      }
    }


    //Lewa ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions; j++) {
        float x0 = -x + i * stepX;
        float x1 = -x + (i + 1) * stepX;
        float z0 = z - j * stepZ;
        float z1 = z - (j + 1) * stepZ;
        float y0 = y;

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
    int divisions = 10; // Liczba podziałów w jednej osi
    float stepX = w / divisions; // Krok podziału w osi X
    float stepY = h / divisions; // Krok podziału w osi Y
    float stepZ = d / divisions; // Krok podziału w osi Z

    beginShape(TRIANGLES);
    
    //Górna ściana
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions; j++) {
        float x0 = -x + i * stepX;
        float x1 = -x + (i + 1) * stepX;
        float y0 = -y + j * stepY;
        float y1 = -y + (j + 1) * stepY;
        float z0 = -z;

        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x1, y1, z0);
          vertex(x0, y0, z0); vertex(x1, y1, z0); vertex(x0, y1, z0);
        } else {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x0, y1, z0);
          vertex(x1, y0, z0); vertex(x1, y1, z0); vertex(x0, y1, z0);
        }
      }
    }

    // Tylnia ściana
    
    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions; j++) {
        float z0 = z - i * stepZ;
        float z1 = z - (i + 1) * stepZ;
        float y0 = -y + j * stepY;
        float y1 = -y + (j + 1) * stepY;
        float x0 = -x;

        // triangulacja
        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z1);
          vertex(x0, y0, z0); vertex(x0, y1, z1); vertex(x0, y1, z0);
        } else {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z0);
          vertex(x0, y0, z1); vertex(x0, y1, z1); vertex(x0, y1, z0);
        }
      }
    }

    // Przednia ściana

    for (int i = 0; i < divisions; i++) {
      for (int j = 0; j < divisions; j++) {
        float z0 = z - i * stepZ;
        float z1 = z - (i + 1) * stepZ;
        float y0 = -y + j * stepY;
        float y1 = -y + (j + 1) * stepY;
        float x0 = x;

        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z1);
          vertex(x0, y0, z0); vertex(x0, y1, z1); vertex(x0, y1, z0);
        } else {
          vertex(x0, y0, z0); vertex(x0, y0, z1); vertex(x0, y1, z0);
          vertex(x0, y0, z1); vertex(x0, y1, z1); vertex(x0, y1, z0);
        }
      }
    }

    //Prawa ściana
    
        
     //divisions = 10; // Liczba podziałów w jednej osi
     stepX = w / divisions/2; // Krok podziału w osi X
     stepY = h / divisions; // Krok podziału w osi Y
     stepZ = d / divisions; // Krok podziału w osi Z

    
    for (int i = 0; i < divisions*2; i++) {
      for (int j = 0; j < divisions; j++) {
        float x0 = -x + i * stepX;
        float x1 = -x + (i + 1) * stepX;
        float z0 = z - j * stepZ;
        float z1 = z - (j + 1) * stepZ;
        float y0 = -y;

        if (i % 2 == j % 2) {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x1, y0, z1);
          vertex(x0, y0, z0); vertex(x1, y0, z1); vertex(x0, y0, z1);
        } else {
          vertex(x0, y0, z0); vertex(x1, y0, z0); vertex(x0, y0, z1);
          vertex(x1, y0, z0); vertex(x1, y0, z1); vertex(x0, y0, z1);
        }
      }
    }

    //Lewa ściana
    
    for (int i = 0; i < divisions*2; i++) {
      for (int j = 0; j < divisions; j++) {
        float x0 = -x + i * stepX;
        float x1 = -x + (i + 1) * stepX;
        float z0 = z - j * stepZ;
        float z1 = z - (j + 1) * stepZ;
        float y0 = y;

      //triangulacja
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

  void drawWheel(float radius, float thickness, int segments) {
    float angleIncrement = TWO_PI / segments; // Wartość kąta między segmentami
    float[] px = new float[segments+1]; // Tablica przechowująca współrzędne x
    float[] py = new float[segments+1]; // Tablica przechowująca współrzędne y
    
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
      vertex(px[i+1], py[i+1], thickness / 2);
      vertex(px[i], py[i], -thickness / 2);
      vertex(0, 0, -thickness / 2);
      vertex(px[i+1], py[i+1], -thickness / 2);
    }
    
    endShape();
  }

}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


import java.util.ArrayList;

class DelaunayTriangulation {
    ArrayList<Vec2D> points; // Lista punktów używanych do triangulacji
    ArrayList<Triangle> triangles; // Lista trójkątów tworzących triangulację

    // Konstruktor
    DelaunayTriangulation(ArrayList<Vec2D> points) {
        this.points = points;
        this.triangles = new ArrayList<Triangle>();
        // Dodanie trójkąta okalającego do triangulacji
        Triangle superTriangle = createSuperTriangle(points);
        triangles.add(superTriangle);
        // Przetwarzanie każdego punktu
        for (Vec2D point : points) {
            ArrayList<Triangle> badTriangles = new ArrayList<Triangle>();
            // Znajdowanie trójkątów, które zawierają nowy punkt
            for (Triangle triangle : triangles) {
                if (triangle.circumcircleContains(point)) {
                    badTriangles.add(triangle);
                }
            }
            ArrayList<Edge> polygon = new ArrayList<Edge>();
            // Tworzenie wielokąta z trójkątów, które zawierają nowy punkt
            for (Triangle triangle : badTriangles) {
                for (Edge edge : triangle.edges) {
                    boolean shared = false;
                    for (Triangle other : badTriangles) {
                        if (other != triangle && other.containsEdge(edge)) {
                            shared = true;
                            break;
                        }
                    }
                    if (!shared) {
                        polygon.add(edge);
                    }
                }
            }
            // Usuwanie złych trójkątów
            triangles.removeAll(badTriangles);
            // Dodawanie nowych trójkątów
            for (Edge edge : polygon) {
                triangles.add(new Triangle(edge.a, edge.b, point));
            }
        }

    }

    // Metoda do tworzenia trójkąta okalającego
    private Triangle createSuperTriangle(ArrayList<Vec2D> points) {
        float minX = Float.POSITIVE_INFINITY;
        float minY = Float.POSITIVE_INFINITY;
        float maxX = Float.NEGATIVE_INFINITY;
        float maxY = Float.NEGATIVE_INFINITY;
        for (Vec2D point : points) {
            if (point.x < minX) minX = point.x;
            if (point.y < minY) minY = point.y;
            if (point.x > maxX) maxX = point.x;
            if (point.y > maxY) maxY = point.y;
        }
        float dx = maxX - minX;
        float dy = maxY - minY;
        float deltaMax = Math.max(dx, dy);
        Vec2D p1 = new Vec2D(minX - 2 * deltaMax, minY - deltaMax);
        Vec2D p2 = new Vec2D(minX + dx / 2, maxY + 2 * deltaMax);
        Vec2D p3 = new Vec2D(maxX + 2 * deltaMax, minY - deltaMax);
        return new Triangle(p1, p2, p3);
    }
}

// Klasa reprezentująca punkt 2D
class Vec2D {
    float x, y;

    Vec2D(float x, float y) {
        this.x = x;
        this.y = y;
    }
}

// Klasa reprezentująca krawędź
class Edge {
    Vec2D a, b;

    Edge(Vec2D a, Vec2D b) {
        this.a = a;
        this.b = b;
    }

    // Sprawdza, czy krawędź jest taka sama jak inna krawędź
    boolean equals(Edge other) {
        return (a == other.a && b == other.b) || (a == other.b && b == other.a);
    }
}

// Klasa reprezentująca trójkąt
class Triangle {
    Vec2D[] vertices;
    Edge[] edges;

    Triangle(Vec2D a, Vec2D b, Vec2D c) {
        vertices = new Vec2D[]{a, b, c};
        edges = new Edge[]{new Edge(a, b), new Edge(b, c), new Edge(c, a)};
    }

    // Sprawdza, czy trójkąt zawiera punkt w swoim okręgu opisanym
    boolean circumcircleContains(Vec2D point) {
        float ab = (vertices[0].x * vertices[0].x) + (vertices[0].y * vertices[0].y);
        float cd = (vertices[1].x * vertices[1].x) + (vertices[1].y * vertices[1].y);
        float ef = (vertices[2].x * vertices[2].x) + (vertices[2].y * vertices[2].y);
        float circumX = (ab * (vertices[2].y - vertices[1].y) + cd * (vertices[0].y - vertices[2].y) + ef * (vertices[1].y - vertices[0].y)) / (vertices[0].x * (vertices[2].y - vertices[1].y) + vertices[1].x * (vertices[0].y - vertices[2].y) + vertices[2].x * (vertices[1].y - vertices[0].y)) / 2;
        float circumY = (ab * (vertices[2].x - vertices[1].x) + cd * (vertices[0].x - vertices[2].x) + ef * (vertices[1].x - vertices[0].x)) / (vertices[0].y * (vertices[2].x - vertices[1].x) + vertices[1].y * (vertices[0].x - vertices[2].x) + vertices[2].y * (vertices[1].x - vertices[0].x)) / 2;
        float circumRadius = sqrt(pow(vertices[0].x - circumX, 2) + pow(vertices[0].y - circumY, 2));
        float dist = sqrt(pow(point.x - circumX, 2) + pow(point.y - circumY, 2));
        return dist <= circumRadius;
    }

    // Sprawdza, czy trójkąt zawiera daną krawędź
    boolean containsEdge(Edge edge) {
        for (Edge e : edges) {
            if (e.equals(edge)) {
                return true;
            }
        }
        return false;
    }
}
