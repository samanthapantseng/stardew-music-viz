//<<<<<<< HEAD
/* Tecnológico de Costa Rica
 Escuela de Diseño Industrial
 D7 Visual - Tarea 3 Music Visualization
 Valeria Navarro - 2018254437
 Samantha Pan Tseng  - 2019065194
 Elke Segura Badilla - 2018086696
 Leslie Valeria Serrano - 2019159088
 */
import ddf.minim.analysis.*;
import ddf.minim.*;
PImage instrucciones, sax1, cello1, maraca1;

Minim minim; // declara la instancia de la biblioteca
AudioPlayer cancion; // declara la variable que contendrá la canción
FFT fftLog; // objeto que hace el análisis de las frecuencias logarítmicas
FFT fftLin; // objeto que hace el análisis de las frecuencias lineales
AudioMetaData metaDatos; // objeto para obtener datos de la canción

Frecuencias cancionprincipal;
Frecuencias cancionintro;

MainCharacter mainCharacter;
Frecuencias frecuencias;

void setup() {

  fullScreen();
  colorMode(HSB, 360, 100, 100, 1);
  minim = new Minim(this);
  smooth();
  rectMode(CENTER);
  
  cancionprincipal = new Frecuencias(minim.loadFile("jazzParis.mp3", 1024));
  cancionintro = new Frecuencias(minim.loadFile("Presentacion.mp3", 1024));
  
  sax1 = loadImage("sax1.png");
  cello1 = loadImage("cello1.png");
  maraca1 = loadImage("maraca1.png");
  
  
  
  mainCharacter = new MainCharacter();
  
}



void draw(){
  background(#333333);
  
  
    //de estas solo se puede usar una al mismo tiempo
   cancionprincipal.aura1();
   
   // cancionintro.aura2(); descomentar esta y comentar la anteriores para ver las frecuencias de la intro
  
  
  mainCharacter.dibujar();
  mainCharacter.staticFranklin();
  
  
  imageMode(CENTER);
  
  image (sax1,width*3/6,height*1/3);
  image (cello1,width*1/6,height*1/3);
  image (maraca1,width*5/6,height*1/3);
  
  sax1.resize(10*width/68,10*width/68);
  cello1.resize(10*width/68,10*width/68);
  maraca1.resize(10*width/68,10*width/68);
}



void keyPressed() {

      if (keyCode == RIGHT) {
          mainCharacter.danceRight();
      }  
      else {
        mainCharacter.clearRight();
      }
      if (keyCode == LEFT) {
          mainCharacter.danceLeft();
      }
      else {
        mainCharacter.clearLeft();
      }
      if (keyCode == UP) {
          mainCharacter.danceUp();
      }
      else {
        mainCharacter.clearUp();
      }
      if (keyCode == DOWN) {
          mainCharacter.danceDown();
      }
      else {
        mainCharacter.clearDown();
      }

}
