/*
  Spaceship class
 Should extend Mover class and implement show.
 You may add additional methods to this class, for example "rotate" and "accelerate" 
 might be useful.
 */
class Spaceship extends Mover { 

  Spaceship(float x, float y) {
    super(x, y);
  }

  Spaceship(float x, float y, float speed, float direction) {
    this(x, y);
    this.speed = speed;
    this.direction = direction;
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
}
