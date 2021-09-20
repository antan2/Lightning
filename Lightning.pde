int startx;
int starty;
int endx; //temporary for drawing the lightning
int endX; //true destination of lightning
int endy;
int t = 0;
int px = -25;
int score = 0;
int hs = 0;
int t2 = 25;
boolean lightning = false;

void setup(){
 size(800, 800);
 background(15, 15, 15);
 strokeWeight(5);
}

void draw(){
  if(t2 > 25){
    lightning = false;
    person(px);
    backdrop();
    px+= score + 1;
    if(px>830)
      px = -30;
    t++;
    if (mousePressed == true &&lightning == false) {
      lightning = true;
      startx = mouseX;
      starty = 0;
      endX = mouseX;
      lightning();
      reset();
    }
  }
  else{
   t2 ++; 
  }
}

void mousePressed(){
  /*
  if (lightning == false) {
    lightning = true;
    startx = mouseX;
    starty = 0;
    endX = mouseX;
    lightning();
    reset();
  }
  */
}

void backdrop(){
  noStroke();
  fill(15, 15, 15, 15);
  rect(0, 0, 800, 800);
  fill(125, 75, 0);
  rect(0, 700, 800, 100);
  fill(0, 255, 0);
  rect(0, 700, 800, 25);
  fill(255, 255, 255);
  textAlign(RIGHT, TOP);
  textSize(20);
  text("High Score: " + hs, 800, 0);
  text("Score: " + score, 800, 40);
}

void person(int x){
  fill(15, 15, 15, 90);
  noStroke();
  rect(0, 570, 800, 130);
  noFill();
  stroke(255, 255, 255);
  ellipse(x, 600, 50, 50);
  line(x, 625, x, 675);
  line(x, 675, x + 25*sin(t/7.0), 700);
  line(x, 675, x - 25*sin(t/7.0), 700);
  line(x, 630, x + 25*sin(t/8.0), 660);
  line(x, 630, x - 25*sin(t/8.0), 660);
}

void lightning(){
  stroke(255, 255, 0);
  for(int y = 0; y <= 700; y += 0){ //+= 0 because it will be adjusted later, although, I could have used a while loop instead, but not declaring a variable is nice
    endx = (int)(startx + Math.random()*25 - 5);
    if(endx >= endX){
      endx -= 10;
    }
    else{
      endx += 10;
    }
    y += (int)(Math.random()*10);
    line(startx, starty, endx, y);
    startx = endx;
    starty = y;
  }
}

void reset(){
  if(Math.abs((int)(endx - px)) <= 35){
    score ++;
    if(score > hs){
     hs = score; 
    }
  } else{
    score = 0;
  }
  t2 = 0;
  px = -25;
}



