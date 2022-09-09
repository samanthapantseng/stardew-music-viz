import ddf.minim.analysis.*;
import ddf.minim.*;

class Frecuencia {

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


  public Frecuencia(AudioPlayer _cancion) {

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
    fftLog.forward( cancion.mix );

    // calcula linealmente las frecuencias en el canal mixto
    fftLin.forward( cancion.mix );
    
    
      

    for (int i = 0; i < fftLog.specSize(); i++) {
      
      textSize(24);
      fill(#FFFFFF);
      text(cancion.position(), width/2, height/2);
// cancion primera parte 
    if (cancion.position() <  23000) {
      int bandaActual = 5;
      if (i>bandaActual-5 && i <bandaActual+5) {
        //if (maximo < fftLog.getBand(i)) maximo = fftLog.getBand(i);
        float ancho = fftLog.getBand(i) * 100;
        float alto = fftLog.getBand(i) * 100;
        float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
        
        colorDeFondo = color (200, 85, 85, transparencia); // color base 219,42,67 o #637CAD
        fill(colorDeFondo);
        rect(width*1/4, height*1/4, ancho, alto);
        //imprimaValoresMaximos (i, bandaActual);
      }
      // maracas---------------------
      
       bandaActual = 30;
      
      if (i>bandaActual-7 && i <bandaActual+7) {
        //if (maximo < fftLog.getBand(i)) maximo = fftLog.getBand(i);
        float ancho = fftLog.getBand(i) * 100;
        float alto = fftLog.getBand(i) * 100;
        float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
        colorDeFondo = color (250, 85, 85, transparencia); // color base 219,42,67 o #637CAD
        fill(colorDeFondo);
        rect(width*3/4, height*1/4, ancho, alto);
        //imprimaValoresMaximos (i, bandaActual);
      
      }
      // sax---------------------
      if (cancion.position() > 6500)  {
      bandaActual = 130;
      if (i>bandaActual-10 && i <bandaActual+10) {
        float ancho = fftLog.getBand(i) * 100;
        float alto = fftLog.getBand(i) * 100;
        float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
        colorDeFondo = color (30, 85, 85, transparencia); // color base 219,42,67 o #637CAD
        fill(colorDeFondo);
        rect( width*2/4, height*1/4, ancho, alto);
      } // fin del ciclo FOR de visualización del gráfico por logaritmo
      }
      
    }
      
      
   // canción segunda parte   
      
      
      if (cancion.position() >  23000) {
      int bandaActual = 5;
      if (i>bandaActual-5 && i <bandaActual+5) {
        //if (maximo < fftLog.getBand(i)) maximo = fftLog.getBand(i);
        float ancho = fftLog.getBand(i) * 100;
        float alto = fftLog.getBand(i) * 100;
        float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
        
        colorDeFondo = color (200, 85, 85, transparencia); // color base 219,42,67 o #637CAD
        fill(colorDeFondo);
        rect(width*1/4, height*1/4, ancho, alto);
        //imprimaValoresMaximos (i, bandaActual);
      }
      // maracas---------------------
      
       bandaActual = 30;
      
      if (i>bandaActual-7 && i <bandaActual+7) {
        //if (maximo < fftLog.getBand(i)) maximo = fftLog.getBand(i);
        float ancho = fftLog.getBand(i) * 100;
        float alto = fftLog.getBand(i) * 100;
        float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
        colorDeFondo = color (250, 85, 85, transparencia); // color base 219,42,67 o #637CAD
        fill(colorDeFondo);
        rect(width*3/4, height*1/4, ancho, alto);
        //imprimaValoresMaximos (i, bandaActual);
      
      }
      // sax---------------------
      if ((cancion.position() < 48000) || (cancion.position() > 52000))  {
      bandaActual = 60;
      if (i>bandaActual-10 && i <bandaActual+10) {
        float ancho = fftLog.getBand(i) * 100;
        float alto = fftLog.getBand(i) * 100;
        float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
        colorDeFondo = color (30, 85, 85, transparencia); // color base 219,42,67 o #637CAD
        fill(colorDeFondo);
        rect( width*2/4, height*1/4, ancho, alto);
      } // fin del ciclo FOR de visualización del gráfico por logaritmo
      }
  }
  }
  }
  

  void aura2() {
    fftLog.forward( cancion.mix );

    // calcula linealmente las frecuencias en el canal mixto
    fftLin.forward( cancion.mix );

    for (int i = 0; i < fftLog.specSize(); i++) {
      // notas muy bajos y colores azules ---------------------
      noStroke();
      
      textSize(24);
      fill(#FFFFFF);
      text(cancion.position(), width/2, height/2);
      
      // cello ---------------------
      if (cancion.position() < 8000){
      int bandaActual = 5;
      if (i>bandaActual-5 && i <bandaActual+5) {
        //if (maximo < fftLog.getBand(i)) maximo = fftLog.getBand(i);
        float ancho = fftLog.getBand(i) * 100;
        float alto = fftLog.getBand(i) * 100;
        float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
        colorDeFondo = color (200, 85, 85, transparencia); // color base 219,42,67 o #637CAD
        fill(colorDeFondo);
        rect(width*1/4, height*1/4, ancho, alto);
        //imprimaValoresMaximos (i, bandaActual);
      }
      }
      
      if (cancion.position() > 8000)  {
      // maracas ---------------------
      int bandaActual = 200;
      if (i>bandaActual-10 && i <bandaActual+10) {
        //if (maximo < fftLog.getBand(i)) maximo = fftLog.getBand(i);
        float ancho = fftLog.getBand(i) * 100;
        float alto = fftLog.getBand(i) * 100;
        float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
        colorDeFondo = color (250, 85, 85, transparencia); // color base 219,42,67 o #637CAD
        fill(colorDeFondo);
        rect(width*3/4, height*1/4, ancho, alto);
        //imprimaValoresMaximos (i, bandaActual);
      }
        // sax ---------------------
      bandaActual = 60;
      if (i>bandaActual-10 && i <bandaActual+10) {
        float ancho = fftLog.getBand(i) * 100;
        float alto = fftLog.getBand(i) * 100;
        float transparencia = map (fftLog.getBand(i), 0, 3, 1, 0.5);
        colorDeFondo = color (30, 85, 85, transparencia); // color base 219,42,67 o #637CAD
        fill(colorDeFondo);
        rect(width*2/4, height*1/4, ancho, alto);
      } // fin del ciclo FOR de visualización del gráfico por logaritmo
    }
  }
}
}
