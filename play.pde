//This function draws the PLAY screen

void play() {
  handleButtonClicks();
  drawMap();
  animateThings();
  drawPlayInterface();
  
  println(mobs.size());
}

void drawMap() {
  //path
  background(aqua);

  stroke(brown);
  strokeWeight(42);
  line(200, 0, 200, 350);
  line(200, 350, 350, 350);
  line(350, 350, 350, 250);
  line(350, 250, 825, 250);
  line(825, 250, 825, 125);
  line(825, 125, 600, 125);
  line(600, 125, 600, 600);
  line(600, 600, 300, 600);
  line(300, 600, 300, 500);
  line(300, 500, 1000, 500);

  //temp node drawing space
  for (int i = 0; i < 9; i++) {
    nodes[i].show();
  }
}

void animateThings() {
  for (int i = 0; i < mobs.size(); i++) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    
    if (myMob.hp <= 0) {
      mobs.remove(i);
    } else {
      i++;
    }
  }

  for (int i = 0; i < towers.size(); i++) {
    Tower myTower = towers.get(i);
    myTower.show();
    if(mobs.size() != 0) {
    myTower.act();
    }
  }
  for (int i = 0; i < bullets.size(); i++) {
    Bullet myBullet = bullets.get(i);
    myBullet.show();
    myBullet.act();
    if (myBullet.hp <=0) {
      bullets.remove(i);
    }
  }
}





void drawPlayInterface() {
  stroke(white);
  fill(black);
  rect(75, height/2, 200, height);
  fill(white);
  textSize(25);
  text("Next wave: " + (wave+1), 85, 35);


  fill(white);
  textSize(20);
  text("Next Wave", 900, 30);
  nextWave.show();
}

void handleButtonClicks() {
  int i = -1;
  int y = 0;
  
  if (mobs.size() == 0) {
    if (nextWave.clicked) {
     while(i < wave) {
      mobs.add(new Mob(200, y, 0, 1));
      y = y - 50;
      i++;
     }
     wave++;
    }
  }
  
  
  
  
  
  
  //    y = 0;
      
  //if(mobs.size() ==0) {

  //if (nextWave.clicked) {
  //  wave++;
  //  for(int i = 0; i < wave; i++) {
  //    println(mobs.get(i).y);
  //  mobs.add(new Mob(200, y, 0, 1));
  //  y-=50;
  //  }
  //}
    
  //}
}
