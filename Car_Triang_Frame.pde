class carFrame{
  PImage img;
  int wyb=0;

carFrame(){

  img=loadImage("menu.jpg");
}


void carFrame(){
    String s;
    background(img);
    textSize(30);
    fill(0,0,0);
    s = "WSTECZ";
    if(wyb == 0){
    fill(255,140,0);
    }
    text("<= "+s, 100,50);
}

void carFrameonclick(){
    if (keyCode==ENTER){
      if(wyb==0)jakascena=0;     
    }
}
}
