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
int escena;

int[] baile;
int paso;

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

  escena = 1;

  baile = new int[8];

  // dentro de [] va el numero de paso
  // considere la columna derecha 1 = left, 2 = right, 3 = up, 4 = down
  baile[0] = 1;
  baile[1] = 2;
  baile[2] = 1;
  baile[3] = 2;
  baile[4] = 3;
  baile[5] = 4;
  baile[6] = 3;
  baile[7] = 4;

  paso = 0;

  sax1 = loadImage("sax1.png");
  cello1 = loadImage("cello1.png");
  maraca1 = loadImage("maraca1.png");

  mainCharacter = new MainCharacter();

  sax1.resize(10*width/68, 10*width/68);
  cello1.resize(10*width/68, 10*width/68);
  maraca1.resize(10*width/68, 10*width/68);
}

void draw() {
  background(#000000);

  imageMode(CENTER);

  mainCharacter.dibujar();
  mainCharacter.staticFranklin();

  // solo mainCharacter
  if (escena == 1) {
    
    if (paso == 8) {
      escena = 2;
    }
  }

  // presentacion musicos
  if (escena == 2) {
    cancionintro.aura2();
    image (sax1, width*3/6, height*1/3);
    image (cello1, width*1/6, height*1/3);
    image (maraca1, width*5/6, height*1/3);
    
  }

  // cancion
  if (escena == 3) {

    cancionprincipal.aura1();
  }
}

void keyPressed() {

  // RIGHT
  if (keyCode == RIGHT) {
    mainCharacter.danceRight();

    if (escena == 1 && baile[paso] == 2) {
      paso++;
      // TO DO: pintar la flecha de la grafica como confirmacion de que hizo el paso correcto
    } else {
      paso = 0;
      // TO DO: reiniciar grafica de flechas
    }
  } else {
    mainCharacter.clearRight();
  }

  // LEFT
  if (keyCode == LEFT) {
    mainCharacter.danceLeft();

    if (escena == 1 && baile[paso] == 1) {
      paso++;
      // TO DO: pintar la flecha de la grafica como confirmacion de que hizo el paso correcto
    } else {
      paso = 0;
      // TO DO: reiniciar grafica de flechas
    }
  } else {
    mainCharacter.clearLeft();
  }

  // UP
  if (keyCode == UP) {
    mainCharacter.danceUp();

    if (escena == 1 && baile[paso] == 3) {
      paso++;
      // TO DO: pintar la flecha de la grafica como confirmacion de que hizo el paso correcto
    } else {
      paso = 0;
      // TO DO: reiniciar grafica de flechas
    }
  } else {
    mainCharacter.clearUp();
  }

  // DOWN
  if (keyCode == DOWN) {
    mainCharacter.danceDown();

    if (escena == 1 && baile[paso] == 4) {
      paso++;
      // TO DO: pintar la flecha de la grafica como confirmacion de que hizo el paso correcto
    } else {
      paso = 0;
      // TO DO: reiniciar grafica de flechas
    }
  } else {
    mainCharacter.clearDown();
  }
}
