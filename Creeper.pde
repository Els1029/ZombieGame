class Creeper extends Zombie
{
   Creeper(float posX, float posY)
  {
    super(posX, posY, 2f, 10);
    damage = 1;
    attackRate = 60;
    framesPerSprite =10;
    
    currentSprite =0;
    
    points = 1;
    
    animationSprits.add(loadImage("Images/Creeper/Creeper_noLeg.png"));
    animationSprits.add(loadImage("Images/Creeper/Creeper_LLeg_Front.png"));
    animationSprits.add(loadImage("Images/Creeper/Creeper_RLeg_back.png"));
    
    animationDeath.add(loadImage("Images/Creeper/Death/Creeper_dead_1.png"));
    animationDeath.add(loadImage("Images/Creeper/Death/Creeper_dead_2.png"));
    animationDeath.add(loadImage("Images/Creeper/Death/Creeper_dead_3.png"));
    animationDeath.add(loadImage("Images/Creeper/Death/Creeper_dead_4.png"));
    animationDeath.add(loadImage("Images/Creeper/Death/Creeper_dead_5.png"));
  }
  
  void move() //Overloaded
  {
    if(currentSprite != 0)
      super.move();
  }
  
  void updateSprite() // Looping //Overloaded
  {
    if(framesFromLastSprite < framesPerSprite )
        framesFromLastSprite++; 
    else
    {
      if(!dead)
      {
        if(currentSprite < animationSprits.size()-1)
        {
          currentSprite++;
        }
        else
        {
          currentSprite =0;       
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
}
