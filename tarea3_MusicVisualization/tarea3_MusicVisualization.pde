//<<<<<<< HEAD
/* Tecnológico de Costa Rica
 Escuela de Diseño Industrial
 D7 Visual - Tarea 3 Music Visualization
 Valeria Navarro - 2018254437
 Samantha Pan Tseng  - 2019065194
 Elke Segura Badilla - 2018086696
 Leslie Valeria Serrano - 2019159088
 */
 
PImage instrucciones;

MainCharacter mainCharacter;

void setup() {

  fullScreen();
  
  mainCharacter = new MainCharacter();
}



void draw(){
  background(#333333);
  mainCharacter.dibujar();
  mainCharacter.staticFranklin();
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
