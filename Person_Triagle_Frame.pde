class personFrame{
  PImage img;
  int wyb=0;

personFrame(){

  img=loadImage("menu.jpg");
}


void personFrame(){
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

void personFrameonclick(){
    if (keyCode==ENTER){
      if(wyb==0)jakascena=0;     
    }
}
}
