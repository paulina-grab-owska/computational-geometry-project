class menu{
  
    int wyb = 0;
    
  void displaymenu(){
    PImage img;
    String t;
    String i;
    String r;
    String s;
    
    img=loadImage("menu.jpg");
    img.resize(width,height);
    background(img);
    
    textAlign(CENTER);
    textSize(42);
    t = "SYMULACJA";
    if(wyb == 0){
    t = "> "+t+" <";
    fill(255,140,0);
    }
    text(t, width/2, height/4);
    fill(0,0,0);
    
    textSize(42);
    i = "MODEL AUTA";
    if(wyb == 1){
    i = "> "+i+" <";
    fill(255,140,0);
    }
    text(i, width/2, height*5/12);
    fill(0,0,0);
    
    textSize(42);
    r = "MODEL CZŁOWIEKA";
    if(wyb == 2){
    r = "> "+r+" <";
    fill(255,140,0);
    }
    text(r, width/2, height*7/12);
    fill(0,0,0);    
    
    textSize(42);
    s = "WYJŚCIE";
    if(wyb == 3){
    s = "> "+s+" <";
    fill(255,140,0);
    }
    text(s,width/2, height*9/12);
    fill(0,0,0);
    
  }
  
  void menuonclick(){
  if (keyCode==ENTER){
    if(wyb==0) symulacja();
    if(wyb==1) jakascena=2; //model auta
    if(wyb==2) jakascena=3;//model człeka
    if(wyb==3) exit();
    }
    if (keyCode==87){
      wyb--;
    }
    if (keyCode==83){
      wyb++;
    }
    if (wyb==4){
      wyb=0;
    }
    if (wyb==-1){
      wyb=3;
    }
  }  
}
  void symulacja(){
         jakascena=1;
  }
