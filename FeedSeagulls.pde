PImage sea, pig, person, bg, intro, credits;
int[] x = new int[3], y = new int[3], sp = new int[3], pigsp = new int[3], pigy = new int[2], pigx = new int[2];
int px=100,py=250, f=0, fx, fy;
PImage[] food = new PImage[6];
boolean feed=false, change=true, end=false, play=false;
int score=0;

void setup() {
  size(1000, 600);
  bg = loadImage("beach.png");
  sea = loadImage("seagull.png");
  pig = loadImage("pig.png");
  person = loadImage("Person.png");
  intro = loadImage("Feed sea.PNG");
  credits = loadImage("credits.PNG");
  food[0] = loadImage("water.png");
  food[1] = loadImage("icesand.png");
  food[2] = loadImage("pizza.png");
  food[3] = loadImage("cake.png");
  food[4] = loadImage("burger.png");
  food[5] = loadImage("apple.png");
  pigx[0]=500;
  pigx[1]=600;

  for (int a=0; a<3; a++) {
    x[a]=700+100*a;
    y[a]=(int)random(70, 530);
    sp[a]=2*a+3;
    if(a!=2){
    pigsp[a]=2*a+2;
    pigy[a]=(int)random(70, 530);
  }
  }
}



void draw() {
  if(!play){
    background(255);
    image(intro,99,0);
    fill(0);
    textSize(20);
    text("Right Click to Play!",410,570);
    if(mousePressed&&mouseButton==RIGHT&&mouseX>393&&mouseX<602&&mouseY>535&&mouseY<590)
      play=true;
  } 
  if(end){
   background(credits); 
   fill(0,0,255);
   text("INTERCEPTION!",600,250);
   fill(255,0,0);
   rect(735,475,240,75);
   fill(255);
   textSize(40);
   text("PLAY AGAIN",740,525);
   if(mousePressed&&mouseButton==RIGHT&&mouseX>735&&mouseX<735+240&&mouseY>475&&mouseY<475+75){
     end=false;
     score=0;
  }
}
    
  if(!end&&play){  
  background(bg);
  for (int i=0; i<3; i++) {
    image(sea, x[i], y[i]);
    y[i]+=sp[i];
    if(i!=2)
      pigy[i]+=pigsp[i];
    if (y[i]>height-75||y[i]<0)
      sp[i]*=-1;
  }
  
  
  for(int i=0;i<2;i++){
   image(pig, pigx[i], pigy[i]);
  y[i]+=sp[i];
 if (pigy[i]>height-75||pigy[i]<50)
   pigsp[i]*=-1;  
  }
  
  
  if(!feed){
  fx=px+110;
  fy=mouseY;
}
  imageMode(CENTER);
  if(change){
   change=false;
   f = (int) random(0,5.5);
  }
  image(food[f],fx,fy);  
  
  if(mouseY>50&&mouseY<height-50)
    py=mouseY;
  
  image(person, px, py);
  fill(255, 0, 0);
  textSize(30);
    if (mousePressed&&mouseButton==LEFT){
      feed=true;
      }
    if(fx>1000){
         change=true;
         feed=false;
       }
    if(feed)fx+=15; 
     //collisions
    for(int i=0;i<3;i++){
     if(fx>x[i]-40&&fx<x[i]+40&&fy>y[i]-50&&fy<y[i]+50){
       score++;
       feed=false;
       change=true;
     }       
    } 
    for(int i=0;i<2;i++){
     if(fx>pigx[i]-40&&fx<pigx[i]+40&&fy>pigy[i]-50&&fy<pigy[i]+50)
     {
       feed=false;
       fill(255,0,0);
       textSize(50);
       end=true;
     }
    } 
     
     textSize(40);
     fill(0);
     text("Score: "+score,height/2,565);
  }
}
