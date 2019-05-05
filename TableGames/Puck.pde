class Puck{
  
  
  float r;
  float x, y;
  float speed = 10;
  int directionX = 1;
  int directionY = 1;
  
  Puck(float radius, float xx, float yy){
      x = xx;
      y = yy;
      r = radius;
  }
  
  void display(){
    noStroke();
    fill(0);
    ellipse(x, y, r*2, r*2);    
  }
  
  
  void move() {
    if(gameManager.gameRunning){    
      x += speed * directionX;
      y += speed * directionY;
      //boundries
      if ( y < r) {
        y = r;
        directionY = -directionY;
      } 
      else if ( y > height-r) {
        y = height-r;
        directionY = -directionY;
      }
    }
  }
  
  void checkGoal() {
    if ( x > width+r) {
      x = width/2;
      y = height/2;
      gameManager.addScore(1, 1);
      directionX = -directionX;
      directionY = -directionY;
      println("player 2 scored");
      gameManager.gameRunning = false;
      timer.reset(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
      speed = 10;
      timer.start();

  
    } 
    else if (x < -r) {
      x = width/2;
      y = height/2;
      gameManager.addScore(0, 1);
      directionX = -directionX;
      directionY = -directionY;
      println("player 1 scored");
      gameManager.gameRunning = false;
      timer.reset(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);
      timer.start();
    }
  }
  
}
