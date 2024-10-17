class info {
  PImage img;
  int wyb = 0;
  
  info() {
    img = loadImage("menu.jpg");
  }

  void displayInfo(int killed_1, int killed_2, int razem) {
    String s;
    background(img);
    textSize(30);
    fill(0, 0, 0);
    
    textAlign(CENTER);
    textSize(42);
    fill(255, 0, 0);
    text("Symulacja zakończona", width / 2, height / 4);
    
    fill(0, 0, 0);
    textSize(32);
    text("Kolizje auta niebieskiego: " + killed_1, width / 2, height / 2);
    text("Kolizje auta czerwonego: " + killed_2, width / 2, height / 2 + 50);
    text("Łączna liczba zabitych: " + razem, width / 2, height / 2 + 100);
    
    textSize(30);
    fill(0, 0, 0);
    s = "WSTECZ DO MENU";
    if (wyb == 0) {
      fill(255, 140, 0);
    }
    text("<= " + s, width / 2, height * 3 / 4+50);
  }

  void infoFrameonclick() {
    if (keyCode == ENTER) {
      if (wyb == 0) {
        jakascena = 0;
        resetSimulation();
      }
    }
  }

  void resetSimulation() {
    cars.clear();
    ppl.clear();
    simulationRunning = false;
    killed = 0;
    survived = 0;
  }
}
