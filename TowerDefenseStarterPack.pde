//Tower Defense Game
//Andre Tsoi 
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
int mode;

//Pallette
color white = #ffffff;
color black = #000000;
color pink = #FF59FE;
color orange = #FFCA3A;
color green = #8AC926;
color blue = #1982C4;
color purple = #6A4C93;
color aqua = #93E7FB;
color brown = #C4A484;
color red = #FF0000;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start;
Button nextWave;

//Collections of objects
Node[] nodes;
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;

//Images and Gifs
PImage resume;
//Gif introAnimation;

int wave = 0;
//int y = 0;
//Fonts

PFont zombie;


// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = PLAY;
}

void initializeVariables() {
  //Load Images & Gifs
  resume = loadImage("resume.png");
  
  //introAnimation = new Gif("Gif/frame_0", "_delay-0.04s.gif", 121, 1, 500, 330, width*1.4, height*1.2);

  //Load Fonts
  zombie = createFont("ZombieMonster.ttf", 128);
  textFont(zombie); 
  
  //Create Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  
  //Test towers
  towers.add(new Tower(500, 100, 0, 60));
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 200, 180, white, black);

  //PLAY - Next Wave, To Build Mode
  nextWave =  new Button(resume, 86, 100, 140, 100, red, white);
  
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE

  //GAMEOVER - Reset
}

void makeNodes() {
  //Plot the nodes on the map
  nodes = new Node[9];
  
  nodes[0] = new Node(200, 350, 1, 0);
  nodes[1] = new Node(350, 350, 0, -1);
  nodes[2] = new Node(350, 250, 1, 0);
  nodes[3] = new Node(825, 250, 0, -1);
  nodes[4] = new Node(825, 125, -1, 0);
  nodes[5] = new Node(600, 125, 0, 1);
  nodes[6] = new Node(600, 600, -1, 0);
  nodes[7] = new Node(300, 600, 0, -1);
  nodes[8] = new Node(300, 500, 1, 0);
  
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
  
  textSize(20);
  text(mouseX + ", " + mouseY, mouseX, mouseY - 20);
  
}
