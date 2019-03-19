/* * * * * * * * * * * * * * * * * * * * * * *
 Class variable declarations here
 */
Spaceship player1;
Star back;
Asteroid[] bloons;
boolean boolDead = false;
//Asteroid[] asteroids;
//Star[] starField;


/*
  Track User keyboard input
 */
boolean ROTATE_LEFT;  //User is pressing <-
boolean ROTATE_RIGHT; //User is pressing ->
boolean MOVE_FORWARD; //User is pressing ^ arrow
boolean SPACE_BAR;    //User is pressing space bar


/* * * * * * * * * * * * * * * * * * * * * * *
 Initialize all of your variables and game state here
 */
public void setup() {
  size(800, 600);

  //initialize your asteroid array and fill it

  player1 = new Spaceship(width/2, height/2);
  back = new Star(0, 0);
  bloons = new Asteroid[8];
  for (int i = 0; i < bloons.length; i++) {
    float x = (float)(width*Math.random());
    float y = (float)(height*Math.random());
    float speed = (float)(2.5*Math.random());
    float direction = (float)(360*Math.random());
    bloons[i] = new Asteroid(x, y, speed, direction);
  }
  //initialize starfield
}


/* * * * * * * * * * * * * * * * * * * * * * *
 Drawing work here
 */
public void draw() {
  background(#C49943);

  back.show();

  //Draw Starfield first 
  //TODO: Part I

  //Check bullet collisions
  //TODO: Part III or IV - for not just leave this comment

  //TODO: Part II, Update each of the Asteroids internals

  //Check for asteroid collisions against other asteroids and alter course
  //TODO: Part III, for now keep this comment in place

  //Draw asteroids
  //TODO: Part II

  if (ROTATE_LEFT)
    player1.setDirection((player1.getDirection())-5.0);
  if (ROTATE_RIGHT)
    player1.setDirection((player1.getDirection())+5.0);

  if (MOVE_FORWARD == true) {
    if (player1.getSpeed() < 3) {
      player1.setSpeed((player1.getSpeed())+0.3);
    }
  } else {
    if (player1.getSpeed() > 0) {
      player1.setSpeed((player1.getSpeed())-0.5);
    }
    if (player1.getSpeed() < 0) {
      player1.setSpeed(.9);
    }
  }

  player1.update();
  player1.show();


  for (int i = 0; i < bloons.length; i++) {
    if (boolDead == false) {
      bloons[i].update();
      bloons[i].show();
    } else {
      bloons[i].showPara1();
      bloons[i].showPara2();
    }
  }
  //Check for ship collision against asteroids
  //TODO: Part II or III

  //Draw spaceship & and its bullets
  //TODO: Part I, for now just render ship
  //TODO: Part IV - we will use a new feature in Java called an ArrayList, 
  //so for now we'll just leave this comment and come back to it in a bit. 

  //Update score
  //TODO: Keep track of a score and output the score at the top right
}



/* * * * * * * * * * * * * * * * * * * * * * *
 Record relevent key presses for our game
 */
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      ROTATE_LEFT = true;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = true;
    } else if (keyCode == UP) {
      MOVE_FORWARD = true;
    }
  }

  //32 is spacebar
  if (keyCode == 32) {  
    SPACE_BAR = true;
  }
}



/* * * * * * * * * * * * * * * * * * * * * * *
 Record relevant key releases for our game.
 */
void keyReleased() {  
  if (key == CODED) { 
    if (keyCode == LEFT) {
      ROTATE_LEFT = false;
    } else if ( keyCode == RIGHT ) {
      ROTATE_RIGHT = false;
    } else if (keyCode == UP) {
      MOVE_FORWARD = false;
    }
  }
  if (keyCode == 32) {
    SPACE_BAR = false;
  }
}

void checkOnAsteroids() {
  for (int i = 0; i < bloons.length; i++) {
    Asteroid a1 = bloons[i];
    for (int j = 0; j < bloons.length; j++) {
      Asteroid a2 = bloons[j];
      if (a1 != a2 && a1.collidingWith(a2)) {
      }
    }
  }
}
