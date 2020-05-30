class Player
{
  int posX,posY;
  
  int maxHealth = 50;
  int health = maxHealth;
  
  PImage sprite = loadImage("Images/Player/Steve.png");
  PImage buliding = loadImage("Images/Player/Building.png");
  
  Player(int posX, int posY)
  {
    this.posX = posX;
    this.posY = posY;
  }
  
  void render(float angle)
  {
    rect(posX,posY, 150,150);
    image(buliding, posX, posY-5); 
    
    pushMatrix();
    translate(150, 360);
    rotate(-angle + (PI/2));
    image(sprite, -75, -75); 
    popMatrix();
    renderHealth();
  }
  
  void renderHealth()
  { 
    fill(100,50);
    rect(240,33 , 800,25);
    
    fill(0,200,0,50);
    rect(240,33 , (800*health)/maxHealth,25);
    
    fill(0);
    text(health, 250,50);
  }
  
  GAMEMODE gameOver()
  {
    if(health <=0)
      return GAMEMODE.GAMEOVER;
    
    return GAMEMODE.PLAYING;
  }
}
