//note that this class does NOT *NEED* to extend Mover but can if you like
class Star {
  float x, y;
  
  Star(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  
  void show(){
    fill(#431901);
    trench1();
    trench2();
    wTrench();
    eTrench();
    ellipse(200, 150, 25, 25);
    ellipse(400, 100, 30, 30);
    ellipse(320, 400, 35, 40);
    ellipse(230, 260, 30, 30);
    ellipse(260, 200, 30, 30);
    ellipse(450, 425, 33, 33);
    ellipse(200, 380, 25, 25);
    ellipse(600, 275, 25, 30);
    ellipse(500, 300, 30, 30);
    ellipse(400, 350, 30, 35);
    ellipse(380, 230, 35, 35);
    ellipse(480, 200, 26, 26);
    
    fill(#6F4228);
    trench1a();
    trench2a();
  }
  
  void trench1(){
    rect(50, 0, 50, 600);
  }
  
  void trench1a(){
    rect(90, 0, 10, 600);
  }
  
  void trench2(){
    rect(700, 0, 50, 600);
  }
  
  void trench2a(){
    rect(700, 0, 10, 600);
  }
  
  void wTrench(){
    beginShape();
    vertex(100, 275);
    vertex(125, 275);
    vertex(125, 100);
    vertex(150, 100);
    vertex(150, 75);
    vertex(175, 75);
    vertex(175, 0);
    vertex(200, 0);
    vertex(200, 125);
    vertex(150, 125);
    vertex(150, 450);
    vertex(225, 450);
    vertex(225, 600);
    vertex(200, 600);
    vertex(200, 500);
    vertex(125, 500);
    vertex(125, 325);
    vertex(100, 325);
    vertex(100, 275);
    endShape();
  }
  
  void eTrench(){
    beginShape();
    vertex(500, 0);
    vertex(500, 75);
    vertex(525, 75);
    vertex(525, 150);
    vertex(625, 150);
    vertex(625, 300);
    vertex(600, 300);
    vertex(600, 350);
    vertex(550, 350);
    vertex(550, 600);
    vertex(575, 600);
    vertex(575, 375);
    vertex(650, 375);
    vertex(650, 325);
    vertex(700, 325);
    vertex(700, 275);
    vertex(650, 275);
    vertex(650, 100);
    vertex(550, 100);
    vertex(550, 50);
    vertex(525, 50);
    vertex(525, 0);
    endShape();
  }
}
