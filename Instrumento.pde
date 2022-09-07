import ddf.minim.analysis.*;
import ddf.minim.*;

class Frecuencias {

int posicion=0;
int duracion=0;

Minim minim; // declara la instancia de la biblioteca
AudioPlayer cancion; // declara la variable que contendrá la canción
FFT fftLog; // objeto que hace el análisis de las frecuencias logarítmicas
FFT fftLin; // objeto que hace el análisis de las frecuencias lineales
AudioMetaData metaDatos; // objeto para obtener datos de la canción

int tamagnoDeBuffer = 1024; // se puede usar 1024 pero 512 es más fácil de analisar visualmente

float maximo = 0;
color colorDeFondo = color (64);
float actualMax = 0;


public Frecuencias(AudioPlayer _cancion) {
  
  minim = new Minim(this);
  
  cancion = _cancion;

  metaDatos = cancion.getMetaData(); // carga los megadatos del archivo
  

  // crea el objeto FFT logarítmico con el tamaño de búfer y su relación de muestras
  // ambos son 1024 en este caso
  fftLog = new FFT( cancion.bufferSize(), cancion.sampleRate() );
  // calcula los promedios basandose en octabas que comienzan en 22 Hz
  // cada octaba la parte en tres bandas resultando 30 bandas en total
  fftLog.logAverages( 22, 3 );

  // crea el objeto FFT lineal con el tamaño de búfer y su relación de muestras
  // ambos son 1024 en este caso
  fftLin = new FFT( cancion.bufferSize(), cancion.sampleRate() );
  // calcula linearmente las bandas en grupos con promedio de 30
  fftLin.linAverages( 30 );
} 

void aura1() {
  cancion.play();
  fftLog.forward( cancion.mix );

  // calcula linealmente las frecuencias en el canal mixto
  fftLin.forward( cancion.mix );

  for (int i = 0; i < fftLog.specSize(); i++) {
    // notas muy bajos y colores azules ---------------------
    noStroke();
    int bandaActual = 5;
    if (i>bandaActual-5 && i <bandaActual+5) {
      //if (maximo < fftLog.getBand(i)) maximo = fftLog.getBand(i);
      float ancho = fftLog.getBand(i) * 100;
      float alto = fftLog.getBand(i) * 100;
      float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
      colorDeFondo = color (200, 85, 85, transparencia); // color base 219,42,67 o #637CAD
      fill(colorDeFondo);
      rect(width*1/6, height*1/3, ancho, alto);
      //imprimaValoresMaximos (i, bandaActual);
    }

    // notas intermedias y colores amarillos ---------------------
    bandaActual = 30;
    if (i>bandaActual-10 && i <bandaActual+10) {
      //if (maximo < fftLog.getBand(i)) maximo = fftLog.getBand(i);
      float ancho = fftLog.getBand(i) * 100;
      float alto = fftLog.getBand(i) * 100;
      float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
      colorDeFondo = color (250, 85, 85, transparencia); // color base 219,42,67 o #637CAD
      fill(colorDeFondo);
      rect(width*5/6, height*1/3, ancho, alto);
      //imprimaValoresMaximos (i, bandaActual);
    }
    
    bandaActual = 130;
    if (i>bandaActual-10 && i <bandaActual+10) {
      float ancho = fftLog.getBand(i) * 100;
      float alto = fftLog.getBand(i) * 100;
      float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
      colorDeFondo = color (30, 85, 85, transparencia); // color base 219,42,67 o #637CAD
      fill(colorDeFondo);
      rect(width*3/6, height*1/3, ancho, alto);
  } // fin del ciclo FOR de visualización del gráfico por logaritmo
  }
}

void aura2() {
  cancion.play();
  fftLog.forward( cancion.mix );

  // calcula linealmente las frecuencias en el canal mixto
  fftLin.forward( cancion.mix );

  for (int i = 0; i < fftLog.specSize(); i++) {
    // notas muy bajos y colores azules ---------------------
    noStroke();
    int bandaActual = 5;
    if (i>bandaActual-5 && i <bandaActual+5) {
      //if (maximo < fftLog.getBand(i)) maximo = fftLog.getBand(i);
      float ancho = fftLog.getBand(i) * 100;
      float alto = fftLog.getBand(i) * 100;
      float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
      colorDeFondo = color (200, 85, 85, transparencia); // color base 219,42,67 o #637CAD
      fill(colorDeFondo);
      rect(width*1/6, height*1/3, ancho, alto);
      //imprimaValoresMaximos (i, bandaActual);
    }

    // notas intermedias y colores amarillos ---------------------
    bandaActual = 200;
    if (i>bandaActual-10 && i <bandaActual+10) {
      //if (maximo < fftLog.getBand(i)) maximo = fftLog.getBand(i);
      float ancho = fftLog.getBand(i) * 100;
      float alto = fftLog.getBand(i) * 100;
      float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
      colorDeFondo = color (250, 85, 85, transparencia); // color base 219,42,67 o #637CAD
      fill(colorDeFondo);
      rect(width*5/6, height*1/3, ancho, alto);
      //imprimaValoresMaximos (i, bandaActual);
    }
    
    bandaActual = 60;
    if (i>bandaActual-10 && i <bandaActual+10) {
      float ancho = fftLog.getBand(i) * 100;
      float alto = fftLog.getBand(i) * 100;
      float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
      colorDeFondo = color (30, 85, 85, transparencia); // color base 219,42,67 o #637CAD
      fill(colorDeFondo);
      rect(width*3/6, height*1/3, ancho, alto);
  } // fin del ciclo FOR de visualización del gráfico por logaritmo
  }
}




}
