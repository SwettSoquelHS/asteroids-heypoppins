/*
  Asteroid class
 Should extend Mover class and implement show.
 
 Initially, your asteroid may just be a simple circle or square
 but the final program should use "beginShap(), vertex(), and endShape()"
 to render the asteroid.
 */
class Asteroid extends Mover {

  Asteroid(float x, float y) {
    super(x, y);
  }

  Asteroid(float x, float y, float speed, float direction) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.direction = direction;
    radius = 0.0;
  }

  void show() {
    if (x > width+15) {
      x = -15;
    }
    if (x < -15) {
      x = width+15;
    }
    if (y > height+15) {
      y = -15;
    }
    if (y < -15) {
      y = height+15;
    }
    fill(33, 131, 57);
    pushMatrix();
    translate(x, y);
    scale(1.2);
    rotate(radians(direction));
    rect(-16, -13, 16, 26);
    drawBody();
    popMatrix();
  }
  
  void showPara1(){
    fill(255);
    pushMatrix();
    translate(x-15, y);
    drawParachute();
    popMatrix();
  }
  
  void showPara2(){
    fill(255);
    pushMatrix();
    translate(x+15, y);
    drawParachute();
    popMatrix();
  }

  void drawBody() {
    beginShape();
    vertex(30, 3);
    vertex(25, 10);
    vertex(15, 12.5);
    vertex(10, 12.5);
    vertex(-10, 10);
    vertex(-20, 6);
    vertex(-20, -6);
    vertex(-10, -10);
    vertex(10, -13);
    vertex(15, -13);
    vertex(25, -10);
    vertex(30, -3);
    vertex(30, 3);
    endShape();
  }
  
  void drawParachute(){
    ellipse(0, 0, 25, 25);
    ellipse(0, 0, 8, 8);
  }
}
