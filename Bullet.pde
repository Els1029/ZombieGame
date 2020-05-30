class Bullet
{
  float damage = 10f;
  float posX = 150f, posY = 360f;
  int speed =30;
  
  PVector colVec, moveVec;
  
  boolean deathFlag;
  
  Bullet(float destinationX, float destinationY)
  {
    float x = (destinationX-150); 
    float y = (destinationY-360); 
   
    colVec = new PVector(x,y);
    moveVec = new PVector(x,y);
    colVec.normalize();
    moveVec.normalize();
    moveVec.mult(speed);
  }
  
  void update()
  {
    render();
    move();
    
    outOfBounds();
  }

  void render()
  {
    fill(255,255,0);
    ellipse(posX,posY, 10,10);
  }
  
  void move()
  {
    posX += moveVec.x;
    posY += moveVec.y;
    
    if(posX >= width)
      deathFlag = true;
  }
  
  boolean zombieCollision(Zombie zombie)
  {
    float zombieRight = zombie.posX + (zombie.sizeX/2);
    float zombieBot = zombie.posY + (zombie.sizeY/2);
    
    for(int i=0; i<speed; i++)
    {
      float colPosX = posX-(colVec.x * i);
      float colPosY = posY-(colVec.y * i);
      
      if(colPosX >= zombie.posX- (zombie.sizeX/2) && colPosX <= zombieRight && colPosY >= zombie.posY- (zombie.sizeX/2) && colPosY <= zombieBot)
      {
        
        return true;
      }
    }
    
    return false;
  }
  
  void outOfBounds()
  {
    if(posX > width || posX < 0 || posY > height || posY < 0)
    {
      deathFlag = true;
    }
  }
}
