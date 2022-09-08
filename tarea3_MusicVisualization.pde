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

PImage instrucciones, sax1, cello1, maraca1, escenarioPrincipal, escenarioTramposo;
int escena;

int[] baile;
int paso, cortinaW1, cortinaW2;

Minim minim; // declara la instancia de la biblioteca
AudioPlayer cancion; // declara la variable que contendrá la canción
FFT fftLog; // objeto que hace el análisis de las frecuencias logarítmicas
FFT fftLin; // objeto que hace el análisis de las frecuencias lineales
AudioMetaData metaDatos; // objeto para obtener datos de la canción

Frecuencia cancionPrincipal;
Frecuencia cancionIntro;

MainCharacter mainCharacter;
Frecuencia frecuencias;

void setup() {

  fullScreen();
  colorMode(HSB, 360, 100, 100, 1);
  minim = new Minim(this);
  smooth();
  rectMode(CENTER);

  cancionPrincipal = new Frecuencia(minim.loadFile("jazzParis.mp3", 1024));
  cancionIntro = new Frecuencia(minim.loadFile("Presentacion.mp3", 1024));

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

  escenarioPrincipal = loadImage("escenarioPrincipal.png");
  escenarioTramposo = loadImage("escenarioTramposo.png");

  mainCharacter = new MainCharacter();

  sax1.resize(11*width/68, 0);
  cello1.resize(11*width/68, 0);
  maraca1.resize(11*width/68, 0);

  escenarioPrincipal.resize(0, 13*width/68);
  escenarioTramposo.resize(0, 13*width/68);

  cortinaW1 = width/2;
  cortinaW2 = width/2;
}

void draw() {
  background(#000000);

  imageMode(CENTER);

  // solo mainCharacter
  if (escena == 1) {

    image (sax1, width*2/4, height*1/4);
    image (cello1, width*1/4, height*1/4);
    image (sax1, width*3/4, height*1/4); // TO DO va maraca aca

    image (escenarioPrincipal, width*2/4, height*2/3);

    rectMode(CORNER);
    fill(#000000);
    rect(0, 0, cortinaW1, height);
    rect(cortinaW2, 0, width/2, height);
    rectMode(CENTER);

    //image (escenarioTramposo, width*2/4, height*2/3);

    if (paso == 8) {
      cortinaW1-=5;
      cortinaW2+=5;

      if (cortinaW1 <= 0) {
        escena = 2;
        paso = 0;
        cancionIntro.cancion.play(0);
      }
    }
  }

  // presentacion musicos
  if (escena == 2) {

    cancionIntro.aura2();
    image (sax1, width*2/4, height*1/4);
    image (cello1, width*1/4, height*1/4);
    image (sax1, width*3/4, height*1/4); // TO DO va maraca aca

    image (escenarioPrincipal, width*2/4, height*2/3);

    if (!cancionIntro.cancion.isPlaying()) {
      fill(#ffffff);
      textSize(0.8*width/68);
      textAlign(CENTER);
      text("press space to start the party", width/2, 2*height/68);
    }
  }

  // cancion
  if (escena == 3) {

    cancionPrincipal.aura1();
    image (sax1, width*2/4, height*1/4);
    image (cello1, width*1/4, height*1/4);
    image (sax1, width*3/4, height*1/4); // TO DO va maraca aca

    image (escenarioPrincipal, width*2/4, height*2/3);

    rectMode(CORNER);
    fill(#000000);
    rect(0, 0, cortinaW1, height);
    rect(cortinaW2, 0, width/2, height);
    rectMode(CENTER);

    //image (escenarioTramposo, width*2/4, height*2/3);

    if (!cancionPrincipal.cancion.isPlaying()) {
      cortinaW1+=5;
      cortinaW2-=5;

      if (cortinaW1 >= width/2) {
        escena = 1;
      }
    }
  }

  mainCharacter.dibujar();
  mainCharacter.staticFranklin();
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

  if (key == ' ') {
    if (escena == 2) {
      escena = 3;
      cancionIntro.cancion.pause();
      cancionPrincipal.cancion.play(0);
    }
  }
}
