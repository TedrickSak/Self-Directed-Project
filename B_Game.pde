void game() {
  //map
  noStroke();
  background(#8CB27A);
  fill(#5C9B3D);
  rect(0, 0, 400, 250);
  fill(#937744);
  stroke(0);
  strokeWeight(3);
  rect(-5, 250, 405, 15);

  ocean();
  player1();
  player2();
  portals();
  speeds();
  wall();
  shark();
  policecar();
  trees();
  nightfall();
  timer();
  scores();
  symbols();
  crownmechanics();
  cooldowns();
  sounds();
  abilities();
}

void ocean() {
  noStroke();
  fill(#1B7ACB);
  rect(700, 100, 400, 300);
}


void player1() {
  stroke(0);
  strokeWeight(3);
  fill(#DE5628);
  circle(x1, y1, 30);
  if (cd1 == false && x1 < 1185 && x1 > 15 && y1 < 785 && y1 > 15) {
    if (up1) {
      y1 -= speed1;
    } else if (down1) {
      y1 += speed1;
    }

    if (left1) {
      x1 -= speed1;
    } else if (right1) {
      x1 += speed1;
    }
  }

  if (x1 >= 1185) {
    x1 = 1184;
  }
  if (x1 <= 15) {
    x1 = 16;
  }
  if (y1 >= 785) {
    y1 = 784;
  }
  if (y1 <= 15) {
    y1 = 16;
  }
}

void player2() {
  stroke(0);
  strokeWeight(3);
  fill(#1D9ECB);
  circle(x2, y2, 30);
  if (cd2 == false && x2 < 1185 && x2 > 15 && y2 < 785 && y2 > 15) {
    if (up2) {
      y2 -= speed2;
    } else if (down2) {
      y2 += speed2;
    }

    if (left2) {
      x2 -= speed2;
    } else if (right2) {
      x2 += speed2;
    }
  }

  if (x2 >= 1185) {
    x2 = 1184;
  }
  if (x2 <= 15) {
    x2 = 16;
  }
  if (y2 >= 785) {
    y2 = 784;
  }
  if (y2 <= 15) {
    y2 = 16;
  }
}


void portals() {
  image(portal1, p1x-25, p1y-25, 50, 50);
  image(portal2, p2x-25, p2y-25, 50, 50);

  if (portable == true) {
    if (dist(p1x, p1y, x1, y1) < 25) {
      if (port1 == 0) {
        x1 = p2x;
        y1 = p2y;
        port1 = 1;
        portable = false;
      }
    } else if (dist(p2x, p2y, x1, y1) < 25) {
      if (port1 == 0) {
        x1 = p1x;
        y1 = p1y;
        port1 = 2;
        portable = false;
      }
    } else {
      port1 = 0;
    }

    if (dist(p1x, p1y, x2, y2) < 25) {
      if (port2 == 0) {
        x2 = p2x;
        y2 = p2y;
        port2 = 1;
        portable = false;
      }
    } else if (dist(p2x, p2y, x2, y2) < 25) {
      if (port2 == 0) {
        x2 = p1x;
        y2 = p1y;
        port2 = 2;
        portable = false;
      }
    } else {
      port2 = 0;
    }
  } else {
    p1x = -100;
    p2x = 1300;
  }
}

void speeds() {
  if (shoe == 0) {
    if (timer <= 20) {
      image(sneaker, sneakerx-20, sneakery-20, 40, 40);
    }

    if (dist(sneakerx, sneakery, x1, y1) < 25 && timer <= 20) {
      sneakertime = timer;
      if (crown == 2) {
        speed1 = sd1 + 3;
      } else {
        speed1 = sd1 + 2;
      }
      shoe = 1;
    } else if (dist(sneakerx, sneakery, x2, y2) < 25 && timer <= 20) {
      sneakertime = timer;
      if (crown == 1) {
        speed2 = sd2 + 3;
      } else {
        speed2 = sd2 + 2;
      }
      shoe = 2;
    } else {
      if (crown == 1) {
        speed2 = sd2 + 1;
        speed1 = sd1;
      } else if (crown == 2) {
        speed1 = sd1 + 1;
        speed2 = sd2;
      } else {
        speed1 = sd1;
        speed2 = sd2;
      }
    }
    terrains();
  }

  if (shoe == 1) {
    if (timer <= sneakertime-5) {
      if (crown == 1) {
        speed1 = sd1;
      } else if (crown == 2) {
        speed1 = sd1 + 1;
      } else if (crown == 0) {
        speed1 = sd1;
      }
      terrains();
      shoe = 3;
    }
  }

  if (shoe == 2) {
    if (timer <= sneakertime-5) {
      if (crown == 1) {
        speed2 = sd2 + 1;
      } else if (crown == 2) {
        speed2 = sd2;
      } else if (crown == 0) {
        speed2 = sd2;
      }
      terrains();
      shoe = 3;
    }
  }

  if (shoe == 3) {
    if (crown == 1) {
      speed2 = sd2 + 1;
      speed1 = sd1;
    } else if (crown == 2) {
      speed1 = sd1 + 1;
      speed2 = sd2;
    } else {
      speed1 = sd1;
      speed2 = sd2;
    }
    terrains();
  }
}

void terrains() {
  if (x1 < 400 && y1 < 250) speed1 -= 1;
  if (x2 < 400 && y2 < 250) speed2 -= 1;
  if (x1 > 700 && x1 < 1100 && y1 > 100 && y1 < 400) speed1 += 3;
  if (x2 > 700 && x2 < 1100 && y2 > 100 && y2 < 400) speed2 += 3;
}

void wall() {
  if (x1 < 400 && y1 < 280 && y1 > 257) {
    y1 = 280;
  } else if (x1 < 400 && y1 < 257 && y1 > 235) {
    y1 = 235;
  } else if (x1 < 415 && y1 < 280 && y1 > 235) {
    x1 = 415;
  }

  if (x2 < 400 && y2 < 280 && y2 > 257) {
    y2 = 280;
  } else if (x2 < 400 && y2 < 257 && y2 > 235) {
    y2 = 235;
  } else if (x2 < 415 && y2 < 280 && y2 > 235) {
    x2 = 415;
  }
}

void shark() {
  if (x1 > 700 && x1 < 1100 && y1 > 100 && y1 < 400) {
    wet1 = true;
  } else {
    wet1 = false;
  }
  if (x2 > 700 && x2 < 1100 && y2 > 100 && y2 < 400) {
    wet2 = true;
  } else {
    wet2 = false;
  }
  if (wet1 == true && wet2 == false) {
    finx = finx + (x1 - finx) / sharkspeed;
    finy = finy + (y1 - finy) / sharkspeed;
  }
  if (wet1 == false && wet2 == true) {
    finx = finx + (x2 - finx) / sharkspeed;
    finy = finy + (y2 - finy) / sharkspeed;
  }
  image(fin, finx-30, finy-30, 60, 60);

  if (dist(finx, finy, x1, y1) < 40 && attacked1 == false) {
    attacked1 = true;
    score2 += 3;
  }
  if (attacked1 == true && dist(finx, finy, x1, y1) >= 40) {
    attacked1 = false;
  }

  if (dist(finx, finy, x2, y2) < 40 && attacked2 == false) {
    attacked2 = true;
    score1 += 3;
  }
  if (attacked2 == true && dist(finx, finy, x2, y2) >= 40) {
    attacked2 = false;
  }
}


void policecar() {
  if (crown == 1) {
    if (cd3 == false) {
      if (x1 > cx) {
        cx += cs;
      } else {
        cx -= cs;
      }
      if (y1 > cy) {
        cy += cs;
      } else {
        cy -= cs;
      }
    }
    if (dist(cx, cy, x1, y1) < 30 && cd3 == false) {
      prevcrown = 1;
      crown = 3;
      cd1 = true;
      cdtime = timer;
    }
  } else if (crown == 2) {
    if (cd3 == false) {
      if (x2 > cx) {
        cx += cs;
      } else {
        cx -= cs;
      }
      if (y2 > cy) {
        cy += cs;
      } else {
        cy -= cs;
      }
    }
    if (dist(cx, cy, x2, y2) < 30 && cd3 == false) {
      prevcrown = 2;
      crown = 3;
      cd2 = true;
      cdtime = timer;
    }
  } else if (crown == 3 && prevcrown == 1) {
    if (cd3 == false) {
      if (x1 < cx) {
        cx += cs;
      } else {
        cx -= cs;
      }
      if (y1 < cy) {
        cy += cs;
      } else {
        cy -= cs;
      }
    }
  } else if (crown == 3 && prevcrown == 2) {
    if (cd3 == false) {
      if (x2 < cx) {
        cx += cs;
      } else {
        cx -= cs;
      }
      if (y2 < cy) {
        cy += cs;
      } else {
        cy -= cs;
      }
    }
  }

  if (crown == 3) {
    if (cx < 25) cx = 25;
    if (cx > 1175) cx = 1175;
    if (cy < 25) cy = 25;
    if (cy > 775) cy = 775;
    if (dist(cx, cy, x1, y1) < 30 && cd1 == false) {
      prevcrown = 0;
      crown = 1;
      cd3 = true;
      cdctime = timer;
    }
    if (dist(cx, cy, x2, y2) < 30 && cd2 == false) {
      prevcrown = 0;
      crown = 2;
      cd3 = true;
      cdctime = timer;
    }
    if (poliziasound == true) {
      polizia.play();
      poliziasound = false;
    }
  } else {
    poliziasound = true;
    polizia.pause();
  }


  if (crown > 0) {
    image(car, cx-25, cy-25, 50, 50);
  }
}

void trees() {
  fill(#174B19);
  noStroke();
  tcount = 0;
  while (tcount < 12) {
    circle(tx1[tcount], ty1[tcount], 40);

    if (dist(x1, y1, tx1[tcount], ty1[tcount]) < 35) {
      if (x1 > tx1[tcount]) x1 += speed1;
      if (x1 < tx1[tcount]) x1 -= speed1;
      if (y1 > ty1[tcount]) y1 += speed1;
      if (y1 < ty1[tcount]) y1 -= speed1;
    }
    if (dist(x2, y2, tx1[tcount], ty1[tcount]) < 35) {
      if (x2 > tx1[tcount]) x2 += speed2;
      if (x2 < tx1[tcount]) x2 -= speed2;
      if (y2 > ty1[tcount]) y2 += speed2;
      if (y2 < ty1[tcount]) y2 -= speed2;
    }
    tcount += 1;
  }

  tcount = 0;
  while (tcount < 8) {
    circle(tx2[tcount], ty2[tcount], 40);

    if (dist(x1, y1, tx2[tcount], ty2[tcount]) < 35) {
      if (x1 > tx2[tcount]) x1 += speed1;
      if (x1 < tx2[tcount]) x1 -= speed1;
      if (y1 > ty2[tcount]) y1 += speed1;
      if (y1 < ty2[tcount]) y1 -= speed1;
    }
    if (dist(x2, y2, tx2[tcount], ty2[tcount]) < 35) {
      if (x2 > tx2[tcount]) x2 += speed2;
      if (x2 < tx2[tcount]) x2 -= speed2;
      if (y2 > ty2[tcount]) y2 += speed2;
      if (y2 < ty2[tcount]) y2 -= speed2;
    }

    tcount += 1;
  }
}



void nightfall() {
  if (timer <= dtime / 2 && night == false) {
    fill(0, 0, 0, op);
    noStroke();
    rect(0, 0, 1200, 800);
    op += 2;
  }
  if (op >= 500) {
    night = true;
  }
  if (night == true) {
    fill(0, 0, 0, op);
    noStroke();
    rect(0, 0, 1200, 800);
    op -= 2;
  }
}

void timer() {
  timer -= 0.01666666666;
  fill(255);
  textSize(20);
  text(timer, 600, 30);
}

void scores() {
  if (crown == 1) score1 += 0.01666666666;
  if (crown == 2) score2 += 0.01666666666;

  textSize(20);
  fill(#DE5628);
  text(int(score1), 550, 50);
  fill(#1D9ECB);
  text(int(score2), 650, 50);

  if (timer <= 0) {
    if (int(score1) > int(score2)) {
      charw = char1;
    }
    if (int(score2) > int(score1)) {
      charw = char2;
    }  
    crocodilo.pause();
    crocodilo2.pause();
    tralala.pause();
    tralala2.pause();
    sahur.pause();
    sahur2.pause();
    assassino.pause();
    assassino2.pause();
    polizia.pause();
    if (charw == 1) crocodiloend.play();
    if (charw == 2) tralalaend.play();
    if (charw == 3) sahurend.play();
    if (charw == 4) assassinoend.play();
    mode = 4;
    
  }
}

void symbols() {
  if (shoe == 1) image(sneaker, 540, 60, 20, 20);
  if (shoe == 2) image(sneaker, 640, 60, 20, 20);
}


void crownmechanics() {
  if (crown == 0) {
    crown(600, crownrng);
    if (dist(crownx, crowny, x1, y1) < 30) {
      crown = 1;
    } else if (dist(crownx, crowny, x2, y2) < 30) {
      crown = 2;
    }
  } else if (crown == 1) {
    crown(x1, y1);
  } else if (crown == 2) {
    crown(x2, y2);
  } else if (crown == 3) {
    crown(cx, cy);
  }

  if (dist(x1, y1, x2, y2) < 30) {
    if (crown == 1 && cd2 == false) {
      crown = 2;
      cd1 = true;
      cdtime = timer;
    } else if (crown == 2 && cd1 == false) {
      crown = 1;
      cd2 = true;
      cdtime = timer;
    }
  }
}

void crown(float x, float y) {
  fill(252, 224, 8, 500-op);
  stroke(0);
  rect(x-15, y-15, 30, 10);
  triangle(x-15, y-25, x-15, y-15, x-5, y-15);
  triangle(x+15, y-25, x+15, y-15, x+5, y-15);
  triangle(x-5, y-15, x+5, y-15, x, y-25);
  crownx = x;
  crowny = y-15;
}

void cooldowns() {
  if (cd1 == true) {
    fill(255);
    textSize(30);
    text(cdtime1 + "s Cooldown!", 550, 80);
    if (timer <= cdtime - cdtime1) {
      cd1 = false;
    }
  }
  if (cd2 == true) {
    fill(255);
    textSize(30);
    text(cdtime2 + "s Cooldown!", 650, 80);
    if (timer <= cdtime - cdtime2) {
      cd2 = false;
    }
  }
  if (cd3 == true) {
    if (timer <= cdctime - cdtime3) {
      cd3 = false;
    }
  }
}

void sounds() {
  if (crown == 1) {
    if (char1 == 1 && crocodilosound == true) {
        crocodilo.play();
        crocodilosound = false;
    }
    if (char1 == 2 && tralalasound == true) {
        tralala.play();
        tralalasound = false;
    }
    if (char1 == 3 && sahursound == true) {
        sahur.play();
        sahursound = false;
    }
    if (char1 == 4 && assassinosound == true) {
        assassino.play();
        assassinosound = false;
    }
  } else {
    crocodilo.pause();
    crocodilosound = true;
    tralala.pause();
    tralalasound = true;
    sahur.pause();
    sahursound = true;
    assassino.pause();
    assassinosound = true;
  }

  if (crown == 2) {
    if (char2 == 1 && crocodilosound2 == true) {
        crocodilo2.play();
        crocodilosound2 = false;
    }
    if (char2 == 2 && tralalasound2 == true) {
        tralala2.play();
        tralalasound2 = false;
    }
    if (char2 == 3 && sahursound2 == true) {
        sahur2.play();
        sahursound2 = false;
    }
    if (char1 == 4 && assassinosound2 == true) {
        assassino2.play();
        assassinosound2 = false;
    }
  } else {
    crocodilo2.pause();
    crocodilosound2 = true;
    tralala2.pause();
    tralalasound2 = true;
    sahur2.pause();
    sahursound2 = true;
    assassino2.pause();
    assassinosound2 = true;
  }
}

void abilities() {
  
}
