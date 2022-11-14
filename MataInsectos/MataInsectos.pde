int numeroBolas = 10;
int puntaje = 0;
PImage inicio;
PImage fondo;
int maxpuntaje = 0;
int savedTime;
int totalTime = 12000;
boolean introScreen = true;
bicho[] bolas = new bicho[numeroBolas]; 

void setup() {
  size(1280,720);
  inicio = loadImage("xd.jpg");
  fondo = loadImage("xd.jpg");
  textSize(20);
  savedTime = millis();
  
  for (int i = 0; i < bolas.length; i++) {
  bolas[i] = new bicho(); 
  }
}

void draw(){
  background(fondo);
  
  if(keyPressed){
    if (key == 'p'|| key == 'P') {
      introScreen = false;
      }
    }
  if (introScreen == true){
    image(inicio,0,0);
    fill(#F34213);
    text("MAXIMO PUNTAJE ACTUAL : "+maxpuntaje,1000,80);
    }
    else{
  
  for (int i = 0; i < bolas.length; i++) {
    bolas[i].caida();
    bolas[i].colision();
    bolas[i].puntaje();
    bolas[i].GAMEOVER();
  }
 }
}

class bicho {
  float d = 50;
  float x = random(600);
  float y = random(height);

  void caida() {
    y = y +3 ;   //VELOCIDAD
    ellipse(x, y, d, d);

   if(y>height){
   x = random(600);
   y = random(-100);
   }
  }
  
  void colision () {
    float distancia = dist(mouseX , mouseY, x, y);
    if (mousePressed){
    if (distancia < d){
      //println("hola");
      x = -1200;
      puntaje++;
      maxpuntaje = max(puntaje, maxpuntaje);
      }
     }
    } 
    
  void puntaje () {
    fill(#FB3640);
   text("Puntaje = " +puntaje,300,680);  
}

void GAMEOVER(){
  
  int passedTime = millis() - savedTime;  //resta de tiempo
  if (passedTime > totalTime){
    introScreen = true;
    puntaje = 0;
    savedTime= millis();
    for (int i = 0; i < bolas.length; i++) {
    bolas[i] = new bicho(); 
   }
  }
 }
}
