class SmallZombie extends Zombie
{
  SmallZombie(float posX, float posY)
  {
    super(posX, posY, 10f , 5);

    damage = 1;
    attackRate = 30;
    framesPerSprite =5;
    
    sizeX = 25;
    sizeY = 25;
    
    points = 3;
    
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
