//setting globals
int bgcolor = 255;
boolean state1 = true;
boolean state2 = false;
boolean state3 = false;
PImage[] helmBoy = new PImage[1];
int helmCounter;

//sizing
void setup(){
 size(800,600); 
 background(bgcolor);
}

//checking for each state - running each respectively
void draw(){
 if (state1){
   menu();
 }else if (state2){
   gameState();
 }else if (state3){
   gameOver();
 }
}

//main menu animation loop and 'start game' button
void menu(){
  for (int i = 0; i < helmBoy.length; i++){
    helmBoy[i] = loadImage(i + ".png");
  }
  image(helmBoy[helmCounter], width/2, height/2);
  if (frameCount % 8 == 0) {
    helmCounter++;
    helmCounter = helmCounter % helmBoy.length;
  }
}

//the main game - shoot down enemies before they reach you
void gameState(){
  
}

//game ends upon an enemy contacting the player
void gameOver(){
  
}