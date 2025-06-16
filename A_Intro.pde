void intro() {

  background(#A1E0D4);
  fill(#F58DB1);
  rotate(radians(-25));
  strokeWeight(3);
  rect(-400,-200,700,1500);
  rotate(radians(25));
  fill(205);
  textSize(150);
  textAlign(CENTER,CENTER);
  counter = 0;
  while (counter < 10) {
    if (counter == 0 || counter == 9) {
      stroke(0);
      strokeWeight(3);
    } else {
      noStroke();
    }
    text("F   L   A   P", 500 + counter, 300 + counter);
    fill(205+ counter*5);
    counter += 1;
  }
  fill(255);
  textSize(20);
  text("Press  E N T E R  to start", 500, 700);
}
