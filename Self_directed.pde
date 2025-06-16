float score1, score2;
float counter;
char winner;
float x1, y1, speed1, sd1;
float x2, y2, speed2, sd2;
boolean up1, down1, right1, left1;
boolean up2, down2, right2, left2;
boolean cd1, cd2, cd3;
float dtime;
float timer;
int crown;
float crownx, crowny, crownrng;
float cdtime, cdctime;
int cdtime1, cdtime2, cdtime3;
boolean night;
float op;
float p1x, p1y, p2x, p2y;
int port1, port2;
boolean portable;
float sneakerx, sneakery;
float sneakertime;
int shoe;

float cx, cy, cs;
int prevcrown;
int[] tx1;
int[] ty1;
int tempx1, tempy1;
int[] tx2;
int[] ty2;
int tempx2, tempy2;
int tcount;
PImage fin;
float finx, finy;
boolean wet1, wet2;
boolean attacked1, attacked2;
float sharkspeed;
int char1, char2;
float cc1, cc2;
int charw;

PImage portal1;
PImage portal2;
PImage sneaker;
PImage car;
PImage bombardino; //drop bombs
PImage tralalero; //runs faster 
PImage tung; //beat someone up if tries to steal crown
PImage cappuccino; //steal the crown from far away
PImage bat;

int mode;
final int INTRO = 0;
final int CHARACTER = 1;
final int GAME = 2;
final int PAUSE = 3;
final int OVER = 4;

import processing.sound.*;
SoundFile polizia;
SoundFile crocodilo;
SoundFile tralala;
SoundFile sahur;
SoundFile assassino;
SoundFile crocodilo2;
SoundFile tralala2;
SoundFile sahur2;
SoundFile assassino2;
SoundFile crocodiloend;
SoundFile tralalaend;
SoundFile sahurend;
SoundFile assassinoend;
boolean poliziasound, crocodilosound, tralalasound, sahursound, assassinosound;
boolean crocodilosound2, tralalasound2, sahursound2, assassinosound2;

void setup() {
  size(1200,800,P2D);
  mode = 0;
  counter = 0;
  score2 = 0;
  score1 = 0;
  x1 = 300;
  y1 = 400;
  x2 = 900;
  y2 = 400;
  sd1 = 2;
  sd2 = 2;
  dtime = 61;
  timer = dtime;
  textAlign(CENTER,CENTER);
  crown = 0;
  crownrng = random(400,780);
  cdtime1 = 2;
  cdtime2 = 2;
  cdtime3 = 5;
  night = false;

  p1x = 100;
  p1y = random(30,220);
  p2x = 1000;
  p2y = random(50,750);;
  portable = true;
  sneakerx = random(50,1150);
  sneakery = random(50,750);
  shoe = 0;
  cx = 600;
  cy = -50;
  cs = 0.5;
  tx1 = new int[12];
  ty1 = new int[12];
  tcount = 0;
  tempx1 = 450;
  tempy1 = 550;
  while (tcount < 12) {
    tx1[tcount] = tempx1;
    ty1[tcount] = tempy1;
    tempx1 += 200;
    if (tempx1 > 1200) {
      tempy1 += 100;
      tempx1 = 450;
    }
    tcount += 1;
  }
  tx2 = new int[8];
  ty2 = new int[8];
  tcount = 0;
  tempx2 = 550;
  tempy2 = 600;
  while (tcount < 8) {
    tx2[tcount] = tempx2;
    ty2[tcount] = tempy2;
    tempx2 += 200;
    if (tempx2 > 1200) {
      tempy2 += 100;
      tempx2 = 550;
    }
    tcount += 1;
  }
  finx = 900;
  finy = 200;
  attacked1 = false;
  attacked2 = false;
  sharkspeed = 15;
  char1 = 1;
  char2 = 1;
  cc1 = 150;
  cc2 = 150;
  
  portal1 = loadImage("portal.png");
  portal2 = loadImage("portal.png");
  sneaker = loadImage("sneaker.png");
  car = loadImage("car.png");
  fin = loadImage("fin.png");
  bombardino = loadImage("bombardino.jpg");
  tralalero = loadImage("tralalero.png");
  tung = loadImage("tung.jpg");
  cappuccino = loadImage("cappuccino.jpg");
  bat = loadImage("bat.png");
  
  
  polizia = new SoundFile(this,"polizia.mp3");
  crocodilo = new SoundFile(this,"crocodilo.mp3");
  tralala = new SoundFile(this,"tralala.mp3");
  assassino = new SoundFile(this,"assassino.mp3");
  sahur = new SoundFile(this,"sahur.mp3");
  crocodilo2 = new SoundFile(this,"crocodilo.mp3");
  tralala2 = new SoundFile(this,"tralala.mp3");
  assassino2 = new SoundFile(this,"assassino.mp3");
  sahur2 = new SoundFile(this,"sahur.mp3");
  crocodiloend = new SoundFile(this,"crocodilo end.mp3");
  tralalaend = new SoundFile(this,"tralala end.mp3");
  sahurend = new SoundFile(this,"sahur end.mp3");
  assassinoend = new SoundFile(this,"assassino end.mp3");
}


void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == CHARACTER) {
    character();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == OVER) {
    gameOver();
  } else {
    println("Error, mode is" + mode);
  }
}
