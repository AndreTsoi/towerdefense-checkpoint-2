//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {

  float x, y;
  int cooldown, threshold; 
  
  Tower(float _x, float _y, int _c, int _th) {
    x = _x;
    y = _y;
    cooldown = _c;
    threshold = _th;
    
  }
  
  void show() {
    stroke(black);
    strokeWeight(4);
    fill(blue);
    square(x, y, 40); 
   
  }
  
  void act() {
   cooldown++;
   if (cooldown == threshold) {
    cooldown = 0;
    bullets.add(new Bullet(x, y, 0, -10)); //UP
    bullets.add(new Bullet(x, y, 0, 10)); //DOWN
    bullets.add(new Bullet(x, y, -10, 0)); //LEFT
    bullets.add(new Bullet(x, y, 10, 0)); //RIGHT
   }
    
    
  }
  
  
  
}
