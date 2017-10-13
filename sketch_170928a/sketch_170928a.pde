//setting globals
boolean timeUp = false;
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
boolean mouseIsOnButton(){
    return ((mouseX > buttonLeft) &&
    (mouseX < buttonRight) &&
    (mouseY > buttonTop) &&
    (mouseY < buttonBottom));
    }
//sizing
void setup(){
 size(400,400); 
 background(bgcolor);
 //button stuff
 buttonState = 1;
 buttonX = width/2 - 30;
 buttonY = height/2;
 rectMode(CORNER);
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
  checkTime();
  isButtonPressed();
 if (state1){
   
   menu();
   
 }
 if (state2){
   
   gameState();
   
 } 
 if (state3){
   
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


void isButtonPressed(){
  if ((mouseIsOnButton()) && (mousePressed)){
      state2 = true;
  }
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

void checkTime(){
  if ((millis() == 20000)){
    timeUp = true;
  }
}

//the main game - the plan was to have the player run while avoiding falling pillars. pillars last for several seconds after landing
void gameState(){

  background(0);
  drawGoof();
    checkTime();
    if (timeUp = true){
      state3 = true;
    }
  }
  


//game ends after you click the screen again. Click once more to go back to the menu.
void gameOver(){
  background(0);
  
  print("You Lose!... I think? Please restart the program.");
  exit();
}

void drawGoof(){
  float offset;
  offset = random(100);
  background(0);
  for (float x = offset; x <= width-offset; x += random(100)) {
    for (float y = offset; y <= height-offset; y += random(100)) {
      stroke(255, 50);
      ellipse(x, y, 3, 3);
    }
  }
}