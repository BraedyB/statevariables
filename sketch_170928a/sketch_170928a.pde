//setting globals
int bgcolor = 255;
boolean state1 = true;
boolean state2 = false;
boolean state3 = false;

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
  
}

//the main game - shoot down enemies before they reach you
void gameState(){
  
}

//game ends upon an enemy contacting the player
void gameOver(){
  
}