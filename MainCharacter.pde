class MainCharacter {
  
  PImage franklin_estatico;
  PImage franklin_izq;
  PImage franklin_der;
  PImage franklin_up;
  PImage franklin_down;
  float px; // posición x
  float py;  // posición y
  int size;
  boolean danceLeft;
  boolean danceRight;
  boolean danceUp;
  boolean danceDown;
  boolean staticFranklin;
  int w = 10*width/68; // largo de la foto
  int h = 10*width/68; // alto de la foto
  
  
  public MainCharacter() {
    franklin_estatico = loadImage("franklin_estatico.png");
    franklin_izq = loadImage("franklin_izq.png");
    franklin_der = loadImage("franklin_der.png");
    franklin_up = loadImage("franklin_up.png");
    franklin_down = loadImage("franklin_down.png");
    franklin_izq.resize(w,h);
    franklin_der.resize(w,h);
    franklin_up.resize(w,h);
    franklin_down.resize(w,h);
    franklin_estatico.resize(w,h);
    
    px = (34* width/68)-(franklin_estatico.width/2);
    py = (40* height/68)-(franklin_estatico.width/2);
    
  }
  void dibujar() {
    
   if (danceLeft) {
     image (franklin_izq,px,py);
     
   }      
   else if (danceRight) {
     image (franklin_der,px,py);
     
   }
   else if (danceUp) {
     image (franklin_up,px,py);
     
   }
   else if (danceDown) {
     image (franklin_down,px,py);
     
   } 
   else if (staticFranklin) {
     image (franklin_estatico,px,py);
     
   }
  }
   
  void staticFranklin() {
    staticFranklin = true;
  }
  
  void danceLeft() {
    danceLeft = true; 
  }
  
  void danceRight() {
    danceRight = true;
  }
  
  void danceUp() {
    danceUp = true;
  }
  
  void danceDown() {
    danceDown = true;
  }
  void clearLeft() {
    danceLeft = false;
  }
  void clearUp() {
    danceUp = false;
  }
  void clearRight() {
    danceRight = false;
  }
  void clearDown() {
    danceDown = false;
  }
}
