/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 All objects in this world that move must implemnt the Movalbe interface.
 */
interface Movable {
  /*
    Return the x location of the Movable
   */
  float getX();

  /*
    Return the y location of the Movable
   */
  float getY();

  /*
    Return the direction of the Movable in degrees.
   */
  float getDirection();

  /*
   Return the speed of the Movable.
   The speed you use is a relative value and will
   feel different for different frame rates. For example,
   if frameRate is set to 48, then a speed of 1 would move 48 pixels 
   per second.
   */
  float getSpeed();

  /*
   Return the radius of influence. If you could draw a circle
   around your object, then what would this radius be.
   */
  float getRadius();

  /* 
   Sets the direction of the Movable
   */
  void setDirection(float newDirectionInDegrees);

  /* 
   Sets the speed of the Movable
   */
  void setSpeed(float newSpeed);

  void setX(float newX);

  void setY(float newY);

  /*
   Update the internals of the instance
   */
  void update(); 

  /*
    Display the instance
   */
  void show();

  /*
   Return true if the instance of Movable is "colliding with" 
   the movable referred to by object.  *Note* An object should not
   be able to collide with iteself.
   */
  boolean collidingWith(Movable object);
}
//END OF Movable Interface




/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
 Abstract base class Mover 
 */
abstract class Mover implements Movable {

  protected float x, y;
  protected float speed;
  protected float direction;
  protected int myColor;
  protected float radius;  

  /*
    Default Mover, not actually moving and directionless
   */
  Mover(float x, float y) {
    //The line below shows how we can 
    //link this constructor to the constructor below through "this"
    this(x, y, 0, 0, 0);
  }

  Mover() {
    super();
  }

  /*
    Mover constructor specifying x, y position along with its speed and
   direction (in degrees)
   */
  Mover(float x, float y, float speed, float direction, float radius) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.direction = direction;
    myColor = 225;
    this.radius = radius;
  }

  /*
    Most of your movalbe objects should follow this pattern.
   */
  void update() {
    x = x + speed*(float)Math.cos(radians(direction));
    y = y + speed*(float)Math.sin(radians(direction));

    //todo: You need to decide what to do when X is less than 0 or greater than width
    //todo: You need to decide what to do when Y is less than 0 or greater than height
  }



  /*
    Save this for your subclasses to override.
   but notice how it is tagged with abstract, meaning 
   it is incomplete. (It's like an I.O.U.)
   */
  abstract void show();


  /*
    TODO: Part 4: Implement collision detection
   */
  boolean collidingWith(Movable m) {
    //Can't collide with yourself
    float distance = dist(x, y, m.getX(), m.getY());
    boolean touching = distance < radius + m.getRadius();
    return touching;
  }

  //TODO: Part I: implement the methods of Moveable interface
  float getX() {
    return this.x;
  }

  float getY() {
    return this.y;
  }

  float getDirection() {
    return this.direction;
  }

  float getSpeed() {
    return this.speed;
  }

  float getRadius() {
    return this.radius;
  }

  void setDirection(float newDirection) {
    this.direction = newDirection;
  }

  void setSpeed(float newSpeed) {
    this.speed = newSpeed;
  }

  void setX(float newX) {
    this.x = newX;
  }

  void setY(float newY) {
    this.y = newY;
  }
}
