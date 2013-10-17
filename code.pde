//bouncing balls
//jiazhou

Circles [ ] myCircles;
int numberOfCircles=20;

void setup() {
  size(800, 400);
  background(255);
  smooth();
  myCircles = new Circles[numberOfCircles];
  for (int i =0; i <myCircles.length; i++) {
    myCircles[i] = new Circles (random (0, width), random(0, height), random(20, 40), random(1, 2), random(1, 2));
  }
}

void draw() {
  background(255);
  for (int i =0; i <myCircles.length; i++) {
    myCircles[i].display();
    myCircles[i].move();
    for (int j=i+1;j<myCircles.length;j++) {
      //check the distance between myCircle[i] adn myCircle[i+1]
      if (dist(myCircles[i].x, myCircles[i].y, myCircles[j].x, myCircles[j].y)<100) {
        stroke(100);//gray
        strokeWeight(0.6);
        line( myCircles[i].x, myCircles[i].y, myCircles[j].x, myCircles[j].y);
      }
    }
  }
}

class Circles {
  float x;
  float y;
  float r;
  float xSpeed;
  float ySpeed;
  color c;

  Circles (float x_, float y_, float r_, float xSpeed_, float ySpeed_  ) {
    x=x_;
    y=y_;
    r=r_;
    xSpeed=xSpeed_;
    ySpeed=ySpeed_;
    //determine the color of balls
    int index = int(random(0, 3));
    if (index==0) {
      c=color(#3F5666);
    }//blue
    if (index==1) {
      c=color(#F8CA4D);
    }//yellow
    if (index==2) {
      c=color(#B40233);
    }  //red
  }

  void display () {
    noStroke();
    fill(c, 80);
    ellipse(x, y, r*2, r*2);
    fill(100);
    ellipse(x, y, r/10, r/10);// the ball in the center
  }

  void move() {
    //check if the ball reachs the border
    if (x<0||x>width) {
      xSpeed=xSpeed*(-1);
    }
    if (y<0||y>height) {
      ySpeed=ySpeed*(-1);
    }

    x=x+xSpeed;
    y=y+ySpeed;
  }
}
