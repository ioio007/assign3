//You should implement your assign3 here.

final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;

int gameState;

PImage gameStartImg1;
PImage gameStartImg2;
PImage backgroundImg1;
PImage backgroundImg2;
PImage enemyImg;
PImage fighterImg;
PImage hpImg;
PImage treasureImg;
PImage endImg1;
PImage endImg2;
int rectX;
float treasureX;
float treasureY;
float enemyY;
float enemyX;
int bg1X;
int bg2X;
float fighterX, fighterY;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

float speed = 5;
int times = 1;

void setup () {
  size(640, 480);
  
  gameStartImg1 = loadImage("img/start2.png");
  gameStartImg2 = loadImage("img/start1.png");
  backgroundImg1 = loadImage("img/bg1.png");
  backgroundImg2 = loadImage("img/bg2.png");
  enemyImg = loadImage("img/enemy.png");
  fighterImg = loadImage("img/fighter.png");
  hpImg = loadImage("img/hp.png");
  treasureImg = loadImage("img/treasure.png");
  endImg1 = loadImage("img/end2.png");
  endImg2 = loadImage("img/end1.png");


  bg2X = 640;
  bg1X = 0;
  rectX = 55;
  treasureX = random(600);
  treasureY = random(440);
  enemyX = 0;
  enemyY = random(40,420);
  fighterX = 580;
  fighterY = 240;
  
  gameState = 0;
}

void draw() {
  
  switch(gameState){
    
    case GAME_START:
      image(gameStartImg1,0,0);
      if(mouseX > 210 && mouseX < 440){
        if(mouseY > 380 && mouseY < 410){
          image(gameStartImg2,0,0);
          if(mousePressed){
            gameState = GAME_RUN;
          }
        }
      }
      break;
    case GAME_RUN:
      
      image(backgroundImg2,bg2X-640,0);
      image(backgroundImg1,bg1X-640,0);
      bg2X = bg2X + 1;
      bg2X = bg2X % 1280;                                                                    
      bg1X = bg1X + 1;
      bg1X = bg1X % 1280;
      
      image(treasureImg,treasureX,treasureY);
      image(fighterImg,fighterX,fighterY);
      
      
      int widthOfEnemy = 60;
      int heightOfEnemy = 60;
      
      if(times%3 == 1){
        for(int i = 0; i < 5; i++){
          image(enemyImg,enemyX-i*widthOfEnemy,enemyY);
        }
      }
      else if(times%3 == 2){
        for(int i = 0; i < 5; i++){
          image(enemyImg,enemyX-i*widthOfEnemy,enemyY+i*heightOfEnemy*2/3);
        }
      }
      else{
        for(int i = 0; i < 5; i++){
          if(i < 3){
            image(enemyImg,enemyX-i*widthOfEnemy,enemyY+i*heightOfEnemy);
            image(enemyImg,enemyX-i*widthOfEnemy,enemyY-i*heightOfEnemy);
          }
          else{
            image(enemyImg,enemyX-i*widthOfEnemy,enemyY+(4-i)*heightOfEnemy);
            image(enemyImg,enemyX-i*widthOfEnemy,enemyY-(4-i)*heightOfEnemy);
          }
        }
      }
      
      rectMode(CORNERS);
      rect(15,10,rectX,40);
      fill(255,0,0);
      image(hpImg,10,10);
      
      enemyX = enemyX + 5;
      
      if(enemyX - 60*5 == 640){
        
        enemyX = 0;
        times = times + 1;
        if(times%3 == 1){
          enemyY = random(40,420);
        }
        else if(times%3 == 2){
          enemyY = random(40,200);
        }
        else{
          enemyY = random(120,300);
        }
        
      }
      
      
      
      if (upPressed) {
        if(fighterY != 0){
          fighterY -= speed;
        }
      }
      if (downPressed) {
        if(fighterY != height-50){
          fighterY += speed;
        }
      }
      if (leftPressed) {
        if(fighterX != 0){
          fighterX -= speed;
        }
      }
      if (rightPressed) {
        if(fighterX != width-50){
          fighterX += speed;
        }
      }
/*
      if(fighterX >= enemyX-45 && fighterX < enemyX+60 && fighterY >= enemyY-45 && fighterY <= enemyY+60){
        
        enemyX = 0;
        enemyY = random(40,420);
        rectX = rectX - 40;
        if(rectX < 15){
          rectX = 15;
        }
        //rect(15,10,rectX,40);
        if(rectX <= 15){
          gameState = GAME_OVER;
        }
        
      }
*/      
      if(fighterX >= treasureX-45 && fighterX < treasureX+40 && fighterY >= treasureY-45 && fighterY <= treasureY+40){
        
        treasureX = random(600);
        treasureY = random(440);
        //image(treasureImg,treasureX,treasureY);
        rectX = rectX + 20;
        if(rectX >= 215){
          rectX = 215;
        }
        //rect(15,10,rectX,40);
      }
/*      
      if(enemyY > fighterY){
        enemyY-=2;
      }
      if(enemyY == fighterY){
        enemyX+=3;
      }
      if(enemyY < fighterY){
        enemyY+=2;
      }
*/
      break;
    case GAME_OVER:
      rectX = 215;
      image(endImg1,0,0);
      if(mouseX > 210 && mouseX < 440){
        if(mouseY > 315 && mouseY < 345){
          image(endImg2,0,0);
          if(mousePressed){
            gameState = GAME_RUN;
          }
        }
      }
      break;
          
  }
}
void keyPressed(){
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}
void keyReleased(){
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
