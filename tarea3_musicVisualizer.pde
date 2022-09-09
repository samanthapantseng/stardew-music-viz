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

PImage instrucciones, escenarioPrincipal, escenarioTramposo;
PFont font;

PImage[] sax;
PImage[] maraca;
PImage[] cello;
PImage[] dancer;

PImage paso_01, paso_02, paso_03, paso_04, paso_05, paso_06, paso_07, paso_08, paso_00;
int escena;

int[] baile;
int paso, cortinaW1, cortinaW2;

int movimientoBaile;

Minim minim; // declara la instancia de la biblioteca
AudioPlayer cancion; // declara la variable que contendrá la canción
FFT fftLog; // objeto que hace el análisis de las frecuencias logarítmicas
FFT fftLin; // objeto que hace el análisis de las frecuencias lineales
AudioMetaData metaDatos; // objeto para obtener datos de la canción

Frecuencia cancionPrincipal;
Frecuencia cancionIntro;
Frecuencia frecuencias;

AudioSample hiHat;

MainCharacter mainCharacter;

void setup() {

  fullScreen();
  colorMode(HSB, 360, 100, 100, 1);
  minim = new Minim(this);
  smooth();
  rectMode(CENTER);

  font = createFont("Stardew_Valley.otf", width/40);
  textFont(font);

  cancionPrincipal = new Frecuencia(minim.loadFile("jazzParis.mp3", 1024));
  cancionIntro = new Frecuencia(minim.loadFile("Presentacion.mp3", 1024));

  hiHat = minim.loadSample("hiHat.mp3");

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

  paso_01 = loadImage("paso_01.png");
  paso_02 = loadImage("paso_02.png");
  paso_03 = loadImage("paso_03.png");
  paso_04 = loadImage("paso_04.png");
  paso_05 = loadImage("paso_05.png");
  paso_06 = loadImage("paso_06.png");
  paso_07 = loadImage("paso_07.png");
  paso_08 = loadImage("paso_08.png");
  paso_00 = loadImage("paso_00.png");

  paso_01.resize(34*width/68, 0);
  paso_02.resize(34*width/68, 0);
  paso_03.resize(34*width/68, 0);
  paso_04.resize(34*width/68, 0);
  paso_05.resize(34*width/68, 0);
  paso_06.resize(34*width/68, 0);
  paso_07.resize(34*width/68, 0);
  paso_08.resize(34*width/68, 0);
  paso_00.resize(34*width/68, 0);

  sax = new PImage[3];
  sax[0] = loadImage("sax1.png");
  sax[1] = loadImage("sax2.png");
  sax[2] = loadImage("sax3.png");

  cello = new PImage[3];
  cello[0] = loadImage("cello1.png");
  cello[1] = loadImage("cello2.png");
  cello[2] = loadImage("cello3.png");

  maraca = new PImage[3];
  maraca[0] = loadImage("maraca1.png");
  maraca[1] = loadImage("maraca2.png");
  maraca[2] = loadImage("maraca3.png");

  dancer = new PImage[3];
  dancer[0] = loadImage("dancer1.png");
  dancer[1] = loadImage("dancer2.png");
  dancer[2] = loadImage("dancer3.png");

  movimientoBaile = 0;

  escenarioPrincipal = loadImage("escenarioPrincipal.png");
  escenarioTramposo = loadImage("escenarioTramposo.png");

  mainCharacter = new MainCharacter();

  sax[0].resize(11*width/68, 0);
  sax[1].resize(11*width/68, 0);
  sax[2].resize(11*width/68, 0);

  cello[0].resize(11*width/68, 0);
  cello[1].resize(11*width/68, 0);
  cello[2].resize(11*width/68, 0);

  maraca[0].resize(11*width/68, 0);
  maraca[1].resize(11*width/68, 0);
  maraca[2].resize(11*width/68, 0);

  dancer[0].resize(11*width/68, 0);
  dancer[1].resize(11*width/68, 0);
  dancer[2].resize(11*width/68, 0);

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

    image (sax[movimientoBaile], width*2/4, height*1/4);
    image (cello[movimientoBaile], width*1/4, height*1/4);
    image (maraca[movimientoBaile], width*3/4, height*1/4);

    image (escenarioPrincipal, width*2/4, height*2/3);

    image (dancer[0], width*13/32, height*2/3);
    image (dancer[0], width*19/32, height*2/3);

    rectMode(CORNER);
    fill(#000000);
    rect(0, 0, cortinaW1, height);
    rect(cortinaW2, 0, width/2, height);
    rectMode(CENTER);

    // instrucciones
    if (paso < 8) {
      textSize(width/32);
      textAlign(CENTER);
      fill(#FFFFFF, 100);
      text("start the groove", width/2, height/5);
    }

    //image (escenarioTramposo, width*2/4, height*2/3);
    if (paso == 0) {
      image (paso_00, width/2, height/3);
    }
    if (paso == 1) {
      image (paso_01, width/2, height/3);
    }
    if (paso == 2) {
      image (paso_02, width/2, height/3);
    }
    if (paso == 3) {
      image (paso_03, width/2, height/3);
    }
    if (paso == 4) {
      image (paso_04, width/2, height/3);
    }
    if (paso == 5) {
      image (paso_05, width/2, height/3);
    }
    if (paso == 6) {
      image (paso_06, width/2, height/3);
    }
    if (paso == 7) {
      image (paso_07, width/2, height/3);
    }
    if (paso == 8) {
      if (cortinaW1 >= width/2) {
        image (paso_08, width/2, height/3);
      }

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

    if (cancionIntro.cancion.mix.level() >  0.1) {
      movimientoBaile = 1;
    } else if (cancionIntro.cancion.mix.level() ==  0) {
      movimientoBaile = 0;
    } else {
      movimientoBaile = 2;
    }

    cancionIntro.aura2();
    image (sax[movimientoBaile], width*2/4, height*1/4);
    image (cello[movimientoBaile], width*1/4, height*1/4);
    image (maraca[movimientoBaile], width*3/4, height*1/4);

    image (escenarioPrincipal, width*2/4, height*2/3);

    image (dancer[0], width*13/32, height*2/3);
    image (dancer[0], width*19/32, height*2/3);


    if (!cancionIntro.cancion.isPlaying()) {
      fill(#ffffff);
      textSize(2*width/68);
      textAlign(CENTER);
      text("press space to start the party", width/2, 62*height/68);
    }
  }

  // cancion
  if (escena == 3) {

    if (cancionPrincipal.cancion.mix.level() > 0.1) {
      movimientoBaile = 1;
    } else if (cancionPrincipal.cancion.mix.level() ==  0) {
      movimientoBaile = 0;
    } else {
      movimientoBaile = 2;
    }

    cancionPrincipal.aura1();
    image (sax[movimientoBaile], width*2/4, height*1/4);
    image (cello[movimientoBaile], width*1/4, height*1/4);
    image (maraca[movimientoBaile], width*3/4, height*1/4);

    image (escenarioPrincipal, width*2/4, height*2/3);

    image (dancer[0], width*13/32, height*2/3);
    image (dancer[0], width*19/32, height*2/3);


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
      hiHat.trigger();
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
      hiHat.trigger();
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
      hiHat.trigger();
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
      hiHat.trigger();
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
