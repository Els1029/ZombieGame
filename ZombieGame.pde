
enum GAMEMODE
{
  START,
  PLAYING,
  GAMEOVER
}

Player player;

ArrayList<Bullet> bullets;
ArrayList<Zombie> zombies;

SpawnManager spawnManager;

GAMEMODE gamemode = GAMEMODE.START;

PVector verticalVector, horizontalVector;

int frameFromStart = 10800;
int second =0, min =0;

int score = 0;

PImage splashScreen, title, gameover;

void setup()
{
  size(1280,720);
  noCursor();
  
  splashScreen = loadImage("Images/Splashscreen/splashscreen.png");
  title = loadImage("Images/Splashscreen/Title.png");
  gameover = loadImage("Images/Splashscreen/GameOver.png");
  
  verticalVector = new PVector(0,1);
  horizontalVector = new PVector(1,0);
  
  resetGame();
}

float calculateAimingAngle()
{ 
  float x = mouseX;
  float y = mouseY;
  
  if(x < 150)
    x=150;
    
  if(y < 150)
    y=150;
  
  return PVector.angleBetween(new PVector(x-150,y-360),verticalVector);
}


void draw()
{ 
  if(gamemode == GAMEMODE.PLAYING)
  {
    background(155, 118, 83);
    
    for(int i =0; i< bullets.size(); i++)
      bullets.get(i).update();
    
    for(int j =0; j< zombies.size(); j++)
      zombies.get(j).update();
    
    spawnManager.update();
    
     for(int i =0; i< bullets.size(); i++)
      {     
        for(int j =0; j< zombies.size(); j++)
        {
            if(!bullets.get(i).deathFlag && bullets.get(i).zombieCollision(zombies.get(j)) &&  !zombies.get(j).dead)
            {
              bullets.get(i).deathFlag =true;
              zombies.get(j).takeDamage(bullets.get(i).damage);
            }
        }
      }
    
    //Removing Bullets after testing collisons of all zombies and bullets, messes with loop to do it during
    for(int i = 0; i< bullets.size();i++)
    {
      if(bullets.get(i).deathFlag)
        bullets.remove(i);
    }
    //Removing zombies
    for(int j =0; j< zombies.size(); j++)
    {
      if(zombies.get(j).finishDeathAnimation)
        zombies.remove(j);
    }
    
   //spawning Zombies
   if(spawnManager.canSpawn())
   {
     int randomNum = (int)random(0,100);
     
     //Random position
     if(randomNum >= 50)
       zombies.add(spawnManager.spawn(1500,(int)random(height)));
     else if(randomNum >= 25)
       zombies.add(spawnManager.spawn((int)random(300,width), -100));
     else
       zombies.add(spawnManager.spawn((int)random(300,width), 800));
    }
   
   //Display time,level and points
   fill(255);
   
   frameFromStart++;
   calculateTime();
   if(second >= 10)
     text("Time: " + min + ":" + second, 1100,50);
   else
     text("Time: " + min + ":0" + second, 1100,50);
    
    text("Level: " + spawnManager.level, 1100,30);
    text("Points: " + score, 1100,70);
    player.render(calculateAimingAngle());
    gamemode = player.gameOver();
  }
  
  
  else if(gamemode == GAMEMODE.GAMEOVER) //Gameover screen
  {
    background(30, 41 , 54);
    image(gameover,392,325);
    if(second >= 10)
     text("Time: " + min + ":" + second, 580,420);
    else
     text("Time: " + min + ":0" + second, 580,420);
    text("Level: " + spawnManager.level, 580,440);
    text("Points: " + score, 580,460);
    text("CLICK TO PLAY AGAIN", 580,480);
  }
  
  else if(gamemode == GAMEMODE.START) //Gameover screen
  {
    image(splashScreen,0,0);
    image(title,400,50);
    text("CLICK TO PLAY", 720,140);
  }
  
  drawRetical();
}

void mouseClicked()
{
  if(gamemode == GAMEMODE.PLAYING && mouseX > 150)
    bullets.add(new Bullet(mouseX,mouseY));
  else if(gamemode == GAMEMODE.GAMEOVER || gamemode == GAMEMODE.START)
  {
    gamemode = GAMEMODE.PLAYING;
    resetGame();
  }
}

void drawRetical()
{
  noFill();
  stroke(255,0,0);
  strokeWeight(5);
  ellipse(mouseX,mouseY, 30,30);
  ellipse(mouseX,mouseY, 1,1);
  
  //Reset to default
  fill(255);
  stroke(0);
  strokeWeight(1); 
}

void resetGame()
{
  player = new Player(0,285);
  
  bullets = new ArrayList<Bullet>();
  zombies = new ArrayList<Zombie>();
  
  spawnManager = new SpawnManager();
  
  frameFromStart = 0;
  
  score =0;
}

void calculateTime()
{
  second = (frameFromStart/ 60)%60;
  min = frameFromStart / 3600;
}
