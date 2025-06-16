void gameOver() {
  noStroke();
  if (int(score1) == int(score2)) {
    fill(100);
  }
  if (int(score1) > int(score2)) {
    fill(#F58DB1);
  }
  if (int(score2) > int(score1)) {
    fill(#A1E0D4);
  }
  rect(0,0,1200,800);
  fill(255);
  textSize(100);
  textAlign(CENTER, CENTER);
  if (int(score1) == int(score2)) {
    text("TIE!", 600, 330);
  }
  if (int(score1) > int(score2)) {
    text("RED WINS!", 600, 330);
  }
  if (int(score2) > int(score1)) {
    text("BLUE WINS!", 600, 330);
  }
  text(int(score1) + " - " + int(score2), 580, 420);
  
}
