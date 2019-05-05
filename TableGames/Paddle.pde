class Paddle{
   
  float h;
  float w;
  float x;
  float y;
  float speedIncrease = 1;
  
  void display(float xx, float yy, float obj_size){
    
      x = xx -obj_size/2;
      y = yy -obj_size/2;
      
      h = obj_size + 200;
      w = obj_size;
    
     noFill();
     strokeWeight(1);
     stroke(#E33030); 
     rect(x, y, w, h, 10);
  }
  
  void checkCollision(Puck p){
    if(p.x < x + w && p.x > x && gameManager.gameRunning){
      if(p.y > y + (h/2) && p.y < y + h){
         p.speed += speedIncrease;
         p.directionY = 1;
        if(x > width/2){ p.directionX = -1; }
        else{ p.directionX = 1; }
      } if (p.y > y && p.y < y + h/2){
         p.speed += speedIncrease;
         p.directionY = -1;
         if(x > width/2){ p.directionX = -1; }
         else{ p.directionX = 1; }
      }
    }
  }
  
  void checkStartZone(int rectX, int rectY, int size){
    if(x < rectX + size && x > rectX){
       if(y > rectY && y < rectY + (size * 2)){
          gameManager.p1Score = 0;
          gameManager.p2Score = 0;
          gameManager.gameStarted = true;
          timer.start();
       }
    }
  
  }
}
