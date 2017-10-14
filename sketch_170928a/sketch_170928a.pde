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
  
  if (keyPressed){
    
    if (key == 'l'){
      
      state3 = true;
     }
  }
  
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

//checks for the button being activated
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



//the main game - the plan was to have the player run while avoiding falling pillars. pillars last for several seconds after landing
void gameState(){

  background(0);
  
  drawGoof();
  
  }
  


//game ends after you press the 'L' key. 
void gameOver(){
  
  background(0);
  
  print("You Lose!... I think? Please restart the program if you wish to start again.");
  
  exit();
}


//My replacement for the "game" portion of the assignment. 
//I had been getting some weird results after toying around with the second nested loops demo.
void drawGoof(){
  float offset;
  
  offset = random(100);
  
  textAlign(CENTER);
  
  fill(255);
  
  print(" -- PRESS 'L' TO TERMINATE DOTS -- "); 
  
  background(0);
  
  for (float x = offset; x <= width-offset; x += random(100)) {
    for (float y = offset; y <= height-offset; y += random(100)) {
      
      stroke(255, 50);
      
      ellipse(x, y, 3, 3);
    }
  }
}