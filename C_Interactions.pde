void keyPressed() {
  if (mode == GAME) {
    if (keyCode == UP) up2 = true;
    if (keyCode == DOWN) down2 = true;
    if (keyCode == LEFT) left2 = true;
    if (keyCode == RIGHT) right2 = true;
    if (key == 'w') up1 = true;
    if (key == 'a') left1 = true;
    if (key == 's') down1 = true;
    if (key == 'd') right1 = true;
  } else if (mode == CHARACTER) {
    if (key == 'd') {
      cc1 += 300;
      char1 += 1;
    }
    if (key == 'a') {
      cc1 -= 300;
      char1 -= 1;
    }
    if (cc1 > 1200) {
      cc1 = 150;
      char1 = 1;
    }
    if (cc1 < 0) {
      cc1 = 1050;
      char1 = 4;
    }
    if (keyCode == RIGHT) {
      cc2 += 300;
      char2 += 1;
    }
    if (keyCode == LEFT) {
      cc2 -= 300;
      char2 -= 1;
    }
    if (cc2 > 1200) {
      cc2 = 150;
      char2 = 1;
    }
    if (cc2 < 0) {
      cc2 = 1050;
      char2 = 4;
    }
  }
  if (keyCode == ENTER && mode == INTRO) mode = CHARACTER;

  if (key == ' ' && mode == GAME) {
    mode = PAUSE;
  } else if (key == ' ' && mode == PAUSE) {
    mode = GAME;
  }
}

void keyReleased() {
  if (mode == GAME) {
    if (keyCode == UP) up2 = false;
    if (keyCode == DOWN) down2 = false;
    if (keyCode == LEFT) left2 = false;
    if (keyCode == RIGHT) right2 = false;
    if (key == 'w') up1 = false;
    if (key == 'a') left1 = false;
    if (key == 's') down1 = false;
    if (key == 'd') right1 = false;
  }
}

void mousePressed() {
  if (mode == OVER) {
    mode = INTRO;
    setup();
  }
  if (mode == CHARACTER) mode = GAME;
}
