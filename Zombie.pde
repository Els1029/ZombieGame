class Zombie
{
  float posX,posY;
  float speed =4f;

  float sizeX=50f,sizeY=50f;
  
  float startHelath;
  float health;
  
  //float zombieLeft, zombieTop, zombieRight,zombieBot;
  
  int points;
  
  boolean dead , finishDeathAnimation;
  
  PVector moveVec;
  
  float angle;
  
  int attackRate = 30; //Twice a second
  int timeFromLastAttack =0;
  
  int damage =0;
  
  
  ArrayList<PImage> animationSprits = new ArrayList<PImage>();
  ArrayList<PImage> animationDeath = new ArrayList<PImage>();
  
  int currentSprite = 1; //0 refers to the stood still sprite.
  int framesFromLastSprite =0;
  int framesPerSprite;
  
  Zombie(float posX, float posY, float speed, int health)
  {
    this.posX = posX;
    this.posY = posY;
    this.speed = speed;
    dead = false;
    
    this.health = health;
    startHelath = health;
    
    float x = (posX-150); 
    float y = (posY-360); 
    
    finishDeathAnimation = false;
    
    moveVec = new PVector(x,y);
    moveVec.normalize();
    moveVec.mult(speed);
    
    angle = PVector.angleBetween(moveVec,verticalVector);
  }
  
  void update()
  {
    moveOrAttack();
    render();
  }
  
  void moveOrAttack()
  {
    updateSprite();
    
    if(!dead)
    {
      if(posX > 150)
      {
        move();
      }
      else
      {
        damagePlayer();
        currentSprite = 0;
      }
    }
  }
  
  void updateSprite() // Looping
  {
    if(framesFromLastSprite < framesPerSprite )
        framesFromLastSprite++; 
    else
    {
      if(!dead)
      {
        if(currentSprite < animationSprits.size()-1)
        {
          currentSprite++; //<>//
        }
        else
        {
          currentSprite =1;       
        }
      }
      else
      {
        if(currentSprite < animationDeath.size()-1)
        {
          currentSprite++;
        }
        else
        {
          finishDeathAnimation = true;     
        }
      }
      framesFromLastSprite =0;
    }
  }
  
  void render()
  {
    pushMatrix();
    translate(posX, posY);
    rotate(-angle+ (PI/2));
    if(animationSprits.size() > 0 && animationDeath.size() > 0)
    {
      if(!dead)
        image(animationSprits.get(currentSprite), -(sizeX/2),-(sizeY/2) , sizeX, sizeY); 
      else
      {
        image(animationDeath.get(currentSprite), -(sizeX/2),-(sizeY/2) , sizeX * 2, sizeY); 
      }
    }
    popMatrix();
    
    //Health Bar
    if(health != startHelath && !dead) 
    {
      fill(100,50);
      rect(posX -(sizeX/2),posY+(sizeY/2) , sizeX,10);
      
      fill(0,200,0,50);
      rect(posX -(sizeX/2),posY+(sizeY/2) , (sizeX*health)/startHelath,10);
      
      fill(255);
    }
  } 
  
  void move()
  {
    posX -= moveVec.x;
    posY -= moveVec.y;
  }
  
  void damagePlayer()
  {
      if(timeFromLastAttack <= attackRate)
        timeFromLastAttack++; 
      else
      {
        player.health -= damage; 
        timeFromLastAttack =0;
      }
  }
  
  void takeDamage(float damage)
  {
    health -= damage;
    
    if(health <= 0)
    {
      score += points;
      currentSprite =0;
      dead = true;
    }
  }
}
