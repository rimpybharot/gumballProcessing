PFont font; //<>// //<>//
int quarterX = 50;
int quarterY = 400;
int crankX = 450;
int crankY = quarterY;
boolean overInsertButton = false;
boolean overCrankButton = false;
boolean clickedInsertButton = false;
boolean clickedCrankButton = false;
int buttonWidth = 60;
int buttonLength = 100;

GumballMachine gumballMachine = new GumballMachine(5);

void setup() 
{
  size(600, 600) ;
  background(255) ;
  smooth() ;
  strokeWeight(3);
  strokeCap(ROUND);

  // load font
  font = loadFont("BookAntiqua-48.vlw");
  textFont(font, 32);

  System.out.println("Gumball Machine initiated with 5 gumballs");

  // Only draw once
  //noLoop();

}

void draw() {
  update();
  clear();

  /* buttons and highlight*/

  if(overInsertButton){
    drawInsertButton(235);
  }
  else{
    drawInsertButton(255);
  }
  if(overCrankButton){
    drawCrankButton(235);
  }
  else{
    drawCrankButton(255);
  }
}

void drawInsertButton(color c){

  fill(c);
  rect(quarterX, quarterY, buttonLength, buttonWidth);

  String label = "Insert Quarter";
  textFont(font, 15);
  fill(1);
  text(label, quarterX+5, quarterY+40);
  fill(255);


}

void drawCrankButton(color c){

  fill(c);
  rect(crankX, crankY, buttonLength, buttonWidth);

  String label = "Turn Crank";
  textFont(font, 15);
  fill(1);
  text(label, crankX+5, crankY+40);

}

public void  update(){  

  overInsertButton = false;
  overCrankButton = false;
  if((mouseY>=quarterY)&&(mouseY<quarterY+buttonWidth)&&
      (mouseX>=quarterX)&&(mouseX<quarterX+buttonLength))
  {
    overInsertButton = true;
  }
  else{
    overInsertButton = false;
  }


  if((mouseY>=crankY)&&(mouseY<crankY+buttonWidth)&&
      (mouseX>=crankX)&&(mouseX<crankX+buttonLength)){
    overCrankButton = true;   
  }
  else{
    overCrankButton = false;
  }


}


void mouseClicked(){
  if(overInsertButton==true){
    drawInsertButton(1);
    gumballMachine.insertQuarter();
  }
  if(overCrankButton==true){
    drawCrankButton(1);
    gumballMachine.turnCrank();
  }

}


void clear(){
  background(255);
    fill(1);  
      textFont(font, 32);
  text("The Gumball Machine", width/4, 30);
  PImage image = loadImage("gumball.jpg");
  image(image, width/4, height/4);  
  displayMachineStatus();

}

void displayMachineStatus(){
  String label;
  label = gumballMachine.toString();
  textFont(font, 20);
  fill(1);
  text(label, 20, 40);
}