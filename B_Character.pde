void character() {
  background(0);
  image(bombardino,50,300,200,200);
  image(tralalero,350,300,200,200);
  image(tung,650,300,200,200);
  image(cappuccino,950,300,200,200);  
  fill(255);
  textSize(50);
  text("Pick your character!", 600,100);
  textSize(30);
  text("Click anywhere to start", 600,700);
  stroke(0);
  fill(#DE5628);
  circle(cc1,275,20);
  fill(#1D9ECB);
  circle(cc2,525,20);
  println(char1, char2);
}
