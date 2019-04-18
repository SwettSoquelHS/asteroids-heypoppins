/*
  Spaceship class
 Should extend Mover class and implement show.
 You may add additional methods to this class, for example "rotate" and "accelerate" 
 might be useful.
 */
class Spaceship extends Mover { 
  int life;
  int score;
  Bullet myBullet;
  ArrayList <Bullet> bullets;
  Spaceship(float x, float y) {
    super(x, y);
    bullets = new ArrayList<Bullet>();
    life = 3;
    radius = 25.0;
    score = 0;
    
  }

  Spaceship(float x, float y, float speed, float direction) {
    this(x, y);
    this.speed = speed;
    this.direction = direction;
  }
  
  int getLife(){
    return life;
  }
  
  void setLives(){
    life = life - 1;
  }
  
  void show() {
    if (x > width+35) {
      x = -35;
    }
    if (x < -35) {
      x = width+35;
    }
    if (y > height+35) {
      y = -35;
    }
    if (y < -35) {
      y = height+35;
    }
    pushMatrix();
    translate(x, y);
    rotate(radians(direction));
    drawBody();
    drawWing();
    drawWindShield();
    drawBack();
    drawProp();
    popMatrix();
    for (int i=0; i<bullets.size(); i++) {
      Bullet b = bullets.get(i);
      if (b != null)
        b.show();
    }
  }
  
  void fire() {
    if (bullets.size() < 50 && x != 300 && y != 200) {
      myBullet = new Bullet(this.x, this.y, this.speed + 5, this.direction, 10);
      bullets.add(myBullet);
    }
  }
  
  void update(){
    super.update();
    for (int i=0; i<bullets.size(); i++) {
      Bullet b = bullets.get(i);
      if (b != null)
        b.update();
      if (b.getTimer() < 0) {
        bullets.remove(b);
      }
    }
  }
  
  int getScore(){
    return score;
  }
  
  void checkOnBullets(Asteroid[] ball){
    for(Bullet b: bullets){
      for(int i = 0; i < ball.length; i++){
        if(b.collidingWith(ball[i])){
          if(b.getLife() != 0){
            score++;
          }
          ball[i].setLives();
          b.setLife();
      } 
    }
    }
  }


  //green = 33,131,57
  //windshield = 166, 245,245

  void drawWing() {
    beginShape();
    fill(33, 131, 57);
    rect(-8, -36, 12, 72);

    fill(255, 255, 255);
    rect(-8, -32, 12, 12);
    rect(-8, 20, 12, 12);

    fill(0, 0, 0);
    rect(-4, -28, 4, 4);
    rect(-4, 24, 4, 4);
    endShape(CLOSE);
  }

  void drawBody() {
    beginShape();
    fill(33, 131, 57);
    vertex(12, -8);
    vertex(16, -4);
    vertex(16, 4);
    vertex(12, 8);
    vertex(-12, 8);
    vertex(-32, 4);
    vertex(-40, 4);
    vertex(-48, 4);
    vertex(-48, -4);
    vertex(-40, -4);
    vertex(-32, -4);
    vertex(-12, -8);
    vertex(12, -8);
    endShape(CLOSE);

    //fill(166, 245, 245);
    //rect(4, -4, 4, 8);
  }

  void drawWindShield() {
    beginShape();
    fill(166, 245, 245);
    rect(4, -4, 4, 8);
    endShape(CLOSE);
  }

  void drawBack() {
    beginShape();
    fill(33, 131, 57);
    rect(-48, -12, 8, 8);
    rect(-48, 4, 8, 8);

    fill(255, 255, 255);
    rect(-48, -12, 8, 2);
    rect(-48, 12, 8, 2);

    fill(0, 0, 0);
    rect(-48, -10, 8, 2);
    rect(-48, 10, 8, 2);
    endShape(CLOSE);
  }

  void drawProp() {
    beginShape();
    fill(0, 0, 0);
    vertex(16, -16);
    vertex(16, 16);
    endShape(CLOSE);
  }
  
  void drawLives3(){
    pushMatrix();
    fill(#FF3131);
    drawLives3_1();
    drawLives3_2();
    drawLives3_3();
    popMatrix();
  }
  
  void drawLives3_1(){
    pushMatrix();
    translate(750, 25);
    drawHeart();
    popMatrix();
  }
  
  void drawLives3_2(){
    pushMatrix();
    translate(750, 100);
    drawHeart();
    popMatrix();
  }
  
  void drawLives3_3(){
    pushMatrix();
    translate(750, 175);
    drawHeart();
    popMatrix();
  }
  
  
  
  
  void drawLives2(){
    pushMatrix();
    fill(#FF3131);
    drawLives2_1();
    drawLives2_2();
    popMatrix();
  }
  
  void drawLives2_1(){
    pushMatrix();
    translate(750, 25);
    drawHeart();
    popMatrix();
  }
  
  void drawLives2_2(){
    pushMatrix();
    translate(750, 100);
    drawHeart();
    popMatrix();
  }
  
  void drawLives1(){
    pushMatrix();
    fill(#FF3131);
    translate(750, 25);
    drawHeart();
    popMatrix();
  }
  
  void drawDead(){
    pushMatrix();
    fill(#D1C8C8);
    translate(750, 25);
    beginShape();
    fill(#D1C8C8);
    drawHead();
    
    fill(0);
    drawEyeL();
    drawEyeR();
    drawNose();
    endShape();
    popMatrix();
  }
  
  void drawHead(){
    beginShape();
    vertex(15,0);
    vertex(30, 15);
    vertex(30, 30);
    vertex(15, 45);
    vertex(15, 60);
    vertex(-15, 60);
    vertex(-15, 45);
    vertex(-30, 30);
    vertex(-30, 15);
    vertex(-15, 0);
    vertex(15, 0);
    endShape();
  }
  
  void drawEyeL(){
    rect(-15, 15, 8, 15);
  }
  
  void drawEyeR(){
    rect(7, 15, 8, 15);
  }
  
  void drawNose(){
    beginShape();
    vertex(0, 30);
    vertex(5, 37);
    vertex(-5, 37);
    endShape();
  }
  
  
  void drawHeart(){
    beginShape();
    vertex(0, 0);
    vertex(15, -15);
    vertex(30, 0);
    vertex(30, 15);
    vertex(0, 45);
    vertex(-30, 15);
    vertex(-30, 0);
    vertex(-15, -15);
    vertex(0, 0);
    endShape();
  }
    
}
