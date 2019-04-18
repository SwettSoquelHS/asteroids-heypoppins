class Bullet extends Mover {
  
  private int timer;
  int life;
  
  Bullet(float x, float y){
    super(x, y);
    timer = 25;
    life = 1;
  }
  
  Bullet(float x, float y, float speed, float direction, float size) {
    super(x, y, speed, direction, size);
    timer = 25;
  }
  
  void show(){
    if(timer > 0){
      pushMatrix();
      translate(x, y);
      rotate(radians(direction));
      fill(150);
      rect(-3, 1, 6, -2);
      popMatrix();
    }
  }
  
  void update(){
    super.update();
    timer--;
  }
  
  int getTimer(){
    return timer;
  }
  
  int getLife(){
    return life;
  }
  
  void setLife(){
    life = life - 1;
  }
  
}
