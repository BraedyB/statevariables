//setting globals
int bgcolor = #76A08A;
boolean state1 = true;
boolean state2 = false;
boolean state3 = false;
PImage[] helmBoy = new PImage[16];
int helmCounter;
PFont titleFont;
float buttonX, buttonY, buttonWidth, buttonHeight;
float buttonTop, buttonBottom, buttonLeft, buttonRight;
int buttonState;
//sizing
void setup(){
 size(400,400); 
 background(bgcolor);
 //button stuff
 buttonState = 1;
 buttonX = width/2;
 buttonY = height/2;
 rectMode(CENTER);
 buttonHeight = 20;
 buttonWidth = 60;
 //button stuf contd.
 buttonTop = buttonY;
 buttonBottom = buttonY + buttonHeight;
 buttonLeft = buttonX;
 buttonRight = buttonX + buttonWidth;
 
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
  background(bgcolor);
  textAlign(3);
  fill(#FFF700);
  titleFont = loadFont("ColonnaMT-48.vlw");
  textFont(titleFont);
  textSize(80);
  text("HELM", width/2, height/2-50);
  //button stuff
  if (buttonState == 1){
    drawButton();
  }
  
  
  
  
  for (int i = 0; i < helmBoy.length; i++){
    helmBoy[i] = loadImage(i + ".png");
  }
  imageMode(CENTER);
  image(helmBoy[helmCounter], width/2, height-28);
  if (frameCount % 5 == 0) {
    helmCounter++;
    helmCounter = helmCounter % helmBoy.length;
  }
}
boolean mouseIsOnButton(){
  return ((mouseX > buttonLeft) &&
    (mouseX < buttonRight) &&
    (mouseY > buttonTop) &&
    (mouseY < buttonBottom));
}
//draws the button
void drawButton(){
  
  if (mouseIsOnButton()){
    stroke(175);
  }else{
    fill(190);
  }
  noStroke();
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
  
}

//the main game - shoot down enemies before they reach you
void gameState(){
  
}

//game ends upon an enemy contacting the player
void gameOver(){
  
}