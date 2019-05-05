class GameManager{
 
  int p1Score = 0;
  int p2Score = 0;
  boolean gameRunning, gameStarted;
  
  
  void drawGameBoard(){
     noFill();
     stroke(#E34E4E);
     strokeWeight(15);
     //ellipse(width/2, height/2, 600, 600);
     fill(#66B3E5);
     stroke(#66B3E5);
     rect(width/2, 0, 10, 1500);
     stroke(0);
     fill(0);
     if(!gameStarted){
        drawStartZones();
     }

     
     drawScore();
  }
  
  void addScore(int player, int s){
    if(player == 0){
      p1Score += s;
    }if(player == 1){
      p2Score += s;
    }
  }
  
  
  void drawScore(){
    fill(0);
    stroke(0);
    textSize(90);
    textAlign(CENTER);
    pushMatrix();
    scale(-1, 1);
      text(p1Score, -width/2 - 280, 100);
      text(p2Score, -width/2 + 280, 100);
    popMatrix();
  }
  
  void checkScores(){
    if(p1Score >= 10){
    puck.speed = 10;
    gameStarted = false;
    fill(#FA3D3D);
    textSize(90);
    textAlign(CENTER);
     pushMatrix();
        scale(-1, 1);
        translate(-width/2 + 500, height/2);
        rotate(-HALF_PI);
        text("YOU LOSE!",0, 0);
     popMatrix();
     pushMatrix();
        fill(#46F074); 
        scale(-1, 1);
        translate(-width/2 - 500, height/2);
        rotate(HALF_PI);
        text("YOU WIN!",0, 0);
      popMatrix();
      timer.stop(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);

    }
    if(p2Score >= 10){
      puck.speed = 10;
      gameStarted = false;
      fill(#46F074);
      textSize(90);
      textAlign(CENTER);
      pushMatrix();
        scale(-1, 1);
        translate(-width/2 + 500, height/2);
        rotate(-HALF_PI);
        text("YOU WIN!",0, 0);     
      popMatrix();
      pushMatrix();
        scale(-1, 1);
        fill(#FA3D3D);       
        translate(-width/2 - 500, height/2);
        rotate(HALF_PI);
        text("YOU LOSE!",0, 0);
      popMatrix();
      timer.stop(CountdownTimer.StopBehavior.STOP_AFTER_INTERVAL);

    }
  }
  
  void drawStartZones(){
    stroke(0);
    strokeWeight(2);
    fill(255);
    int size = 300;
    rect(width/2 - size/2, height/2 - size, size,size * 2, 10);
      pushMatrix();
      fill(0); 
      scale(-1, 1);
      translate(-width/2 + 40, height/2);
      rotate(HALF_PI);
      text("PLACE HERE TO START",0, 0);
      popMatrix();
      paddle.checkStartZone(width/2-size/2, height/2-size, size);
  }
  
}
