class BigZombie extends Zombie
{
  BigZombie(float posX, float posY)
  {
    super(posX, posY, 2f, 50);
    
    damage = 8;
    attackRate = 60;
    framesPerSprite =15;
    
    sizeX = 100;
    sizeY = 100;
    
    points = 10;
    
    animationSprits.add(loadImage("Images/Walker/Walker_noLeg.png"));
    animationSprits.add(loadImage("Images/Walker/Walker_LLeg_Front.png"));
    animationSprits.add(loadImage("Images/Walker/Walker_Rleg_Back.png"));
    animationSprits.add(loadImage("Images/Walker/Walker_RLeg_Front.png"));
    animationSprits.add(loadImage("Images/Walker/Walker_Lleg_Back.png"));
    
    animationDeath.add(loadImage("Images/Walker/Death/Walker_dead_1.png"));
    animationDeath.add(loadImage("Images/Walker/Death/Walker_dead_2.png"));
    animationDeath.add(loadImage("Images/Walker/Death/Walker_dead_3.png"));
    animationDeath.add(loadImage("Images/Walker/Death/Walker_dead_4.png"));
    animationDeath.add(loadImage("Images/Walker/Death/Walker_dead_5.png"));
  }
}
