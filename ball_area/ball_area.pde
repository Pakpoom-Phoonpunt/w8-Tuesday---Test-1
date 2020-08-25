Ball[] balls;
Block[] blocks;
double sum = 0 ;
int amount = 5; // amount of objects.
boolean check_ball;

void setup() { 
  size(600, 600);
  background(200);
  balls = new Ball[amount];
  blocks = new Block[amount];

  for (int x = 0; x < amount; x++) {
    balls[x] = new Ball(random(50, 550), random(50, 550), random(50, 250));
    blocks[x] = new Block(random(50, 550), random(50, 550), random(50, 250));
  }

  for (Ball ball : balls) {   
    sum +=ball.getArea();
  }
  for (Block block : blocks) {
    sum +=block.getArea();
  }
  println ("sum of area is",sum);
}

void draw() {
  background(255);
  /*for (Block block : blocks) { 
    //block.random_color = color(random(0, 255), random(0, 255), random(0, 255));
    block.create_block();
  }*/
  for (Ball ball : balls) { 
    //ball.random_color = color(random(0, 255), random(0, 255), random(0, 255));
    ball.create_ball();
  }
  
}


class Ball {
  float positionX, positionY, size;
  int fashing;
  color random_color;

  Ball(float positionX, float positionY, float size) {
    this.positionX = positionX ;
    this.positionY = positionY ;
    this.size = size; 
    this.random_color = color(random(0, 255), random(0, 255), random(0, 255));
    this.fashing = 0;
  }
  int colors = 255;
  int count = -1;
  void create_ball() {
    if (this.fashing == 1){
      color white = color(255);
      color[] colors = {white,random_color};
      int rand = int(random(0,2));
      fill(colors[rand]);
      ellipse(this.positionX, this.positionY, this.size, this.size);
    }
    else {
      fill(random_color);
      ellipse(this.positionX, this.positionY, this.size, this.size);
    }
  }
  public float getArea() {
    float area ;
    area = 22/7 * (size/2) *(size/2);
    return area ;
  }
}


class Block {
  float positionX, positionY, size;
  int fashing;
  color random_color;
  Block(float pos_x1, float pos_y1, float size) {
    this.positionX = pos_x1 ;
    this.positionY = pos_y1 ;
    this.size = size ;
    this.random_color = color(random(0, 255), random(0, 255), random(0, 255));
    this.fashing = 0;
  }

  void create_block() {
    if (this.fashing == 1){
      color white = color(255);
      color[] colors = {white,random_color};
      int rand = int(random(0,2));
      fill(colors[rand]);
      rect( positionX, positionY, size, size);
    }
    else {
      fill(random_color);
      rect( positionX, positionY, size, size);
    }
  }
  public float getArea() {
    float area ;
    area = size * size ;
    return area ;
  }
}

void mouseClicked() {
  Ball[] balllist_left;
  Ball[] balllist_right;
  Ball[] temp = new Ball[5] ;
  Ball[] tempmid;
  Ball[] temp_left;
  Ball[] temp_right;
  Block[] boxlist_left;
  Block[] boxlist_right;
  check_ball = true;
  
  for (int i = balls.length-1; i >= 0; i = i - 1) { // find the ball where clicked and delete it 
    float dis = dist(mouseX, mouseY, balls[i].positionX, balls[i].positionY);
    if (dis < balls[i].size/2 && balls[i].fashing == 0) {
      sum -= balls[i].getArea();
      println("this ball area is",balls[i].getArea());
      println("New sum of area is", sum);
      temp[i] = new Ball (balls[i].positionX,balls[i].positionY,balls[i].size);
      balllist_left = (Ball[])subset (balls, 0, i);
      balllist_right = (Ball[])subset (balls, i+1 );
      balls = (Ball[])concat(balllist_left, balllist_right);
      check_ball = false;
      break;
    }else{
      for (int k = temp.length-1; k >= 0; k -=1){
        tempmid = (Ball[])subset (temp, k, 1);
        
        balls = (Ball[])concat(balls,tempmid);
        temp_left = (Ball[])subset (temp, 0, i);
        temp_right = (Ball[])subset (temp, i+1 );
        break;
      }
    }
  }

  if (check_ball == true) {
    for (int i = blocks.length-1; i >= 0; i = i - 1) {  // find the block where clicked and delete it
      if (mouseX > blocks[i].positionX &&  mouseX < blocks[i].positionX + blocks[i].size && mouseY > blocks[i].positionY &&  mouseY < blocks[i].positionY + blocks[i].size && blocks[i].fashing == 0) {
        sum -= blocks[i].getArea();
        println("this block area is",blocks[i].getArea());
        println("New sum of area is", sum);
        boxlist_left = (Block[])subset (blocks, 0, i);
        boxlist_right = (Block[])subset (blocks, i+1 );
        blocks = (Block[])concat(boxlist_left, boxlist_right);
        check_ball = false;
        break;
      }
    }
  }
}
