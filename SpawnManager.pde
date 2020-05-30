class SpawnManager
{
  int level =1;
  
  int zombieSpawned =0;//number spawned (total)
  int maxSpawn = 20;//on screen at any given time
  //int maxSpawned;//total for level
  
  float spawnRate = 180f; //60fps
  int timeFromLastSpawn =0;
  
  int timeLevel1 = 1800; //30 Seconds
  int timeLevel2 = 3600; //1 min from start (30 secs total)
  int timeLevel3 = 5400; //1:30 mins from start (30 secs total)
  int timeLevel4 = 7200; //2 mins from start (30 secs total)
  int timeLevel5 = 9000; //2:30 mins from start (30 secs total)
  int timeLevel6 = 10800; //3 mins from start (30 secs total)
  
  //int timeToNextLevel=0;
  //int timeFromLastLevel=0;
  
  SpawnManager()
  {
  }
  
  Zombie spawn(float x, float y)
  { 
    switch(level) //Handles level
    {
      case 1:
        return randZombies(100,0,0,x,y); // all the numbers should add up to 100
      case 2:
        return randZombies(50,0,0,x,y); // This gives a 50/50 chance on if its a creeper or a walker
      case 3:
        return randZombies(10,30,0,x,y); //60 for walker
      case 4:
        return randZombies(5,25,10,x,y); //60 for walker
      case 5:
        return randZombies(0,20,30,x,y); //50 for walker
      case 6:
        return randZombies(0,10,45,x,y); //45 for walker
      case 7:
        return randZombies(0,5,70,x,y); //25 for walker
      default:
        return randZombies(25,25,25,x,y); //25 for walker // should not reach this point
    }
  }
  
  Zombie randZombies(int probCreep, int probSmall, int probBig, float x, float y)
  {
    int randNum = (int)random(100);
    
    if(randNum <= probCreep)
      return new Creeper(x,y);
    else if(randNum <= probCreep + probSmall)
      return new SmallZombie(x,y);
    else if(randNum <= probCreep + probSmall + probBig)
      return new BigZombie(x,y);
    else
      return new Walker(x,y);
  }
  
  void update()
  {
    if(timeFromLastSpawn <= spawnRate)
      timeFromLastSpawn++; 
      
    if(spawnRate > 20)
    {
      spawnRate -= 0.01;
    }
    
    if(frameFromStart <= 10800)
    {
      if(frameFromStart > timeLevel1 && level == 1)
      {
        level = 2;
        zombies.add(new Walker(1500, 360));
      }
      else if(frameFromStart > timeLevel2 && level == 2)
      {
        level = 3;
        zombies.add(new SmallZombie(1500, 360));
      }
      else if(frameFromStart > timeLevel3 && level == 3)
      {
        level = 4;
        zombies.add(new BigZombie(1500, 360));
      }
      else if(frameFromStart > timeLevel4 && level == 4)
      {
        level = 5;
        zombies.add(new BigZombie(1500, 360));
      }
      else if(frameFromStart > timeLevel5 && level == 5)
        level = 6;
      else if(frameFromStart > timeLevel6 && level == 6)
        level = 7;
    }
  }
  
  boolean canSpawn()
  {
    //if(currentNoZombies < maxSpawn && timeFromLastSpawn >= spawnRate)
    if(timeFromLastSpawn >= spawnRate)
    {
      timeFromLastSpawn = 0;
      return true;
    }
    return false;
  }
}
