//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {

  float x, y, vx, vy, d;
  int hp;

  Mob(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
    hp = 1;
  }


  void show() {
    fill(purple);
    strokeWeight(3);
    circle(x, y, d);
  }

  void act() {
    x = x + vx;
    y = y + vy;

    for (int i = 0; i < nodes.length; i++) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < 4) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
    }


    for (int i = 0; i < bullets.size(); i++) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        hp--;
        myBullet.hp--;
      }
    }
  }
}
