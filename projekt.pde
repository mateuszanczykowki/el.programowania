int przy1X, przy1Y;
int przy2X, przy2Y; 
int przy3X, przy3Y; 
int przy4X, przy4Y;
int przySize = 50;   
color przyColor;
color przyHighlight;
color alive;
color dead;
boolean przyNad1 = false;
boolean przyNad2 = false;
boolean przyNad3 = false;
boolean przyNad4 = false;
int dim = 50; boolean [ ] [ ] cells = new boolean[dim][dim];
boolean [ ] [ ] temp = new boolean[dim][dim];

void setup() {
  size(800,800);
  noStroke();
  frameRate(2);
  przyColor = color(255,123,123);
  przyHighlight = color(204,123,123);
  alive = color(204,150,20);
  dead = color (10,34,100);
  przy1X = width/5;
  przy1Y = height/10;
  przy2X = 2*width/5;
  przy2Y = height/10;
  przy3X = 3*width/5;
  przy3Y = height/10;
  przy4X = 4*width/5;
  przy4Y = height/10;
  }

void draw() {
  update(mouseX, mouseY);
  
  background(0);  stroke(50);
  aktualizacjaPokolenia();
  update(mouseX, mouseY);
  for (int row = 0; row < dim; row++) {
    for (int col = 0; col < dim; col++) {
      if (cells[col][row]) fill(alive); else fill(dead); 
      rect (width / dim * col, height / dim * row, width / dim, height / dim);  } } 
  
  
  if (przyNad1) {
    fill(przyHighlight);
  } else {
    fill(przyColor);
  }
  stroke(0);
  ellipse(przy1X, przy1Y, przySize, przySize);
  
  if (przyNad2) {
    fill(przyHighlight);
  } else {
    fill(przyColor);
  }
  stroke(0);
  ellipse(przy2X, przy2Y, przySize, przySize);
  
   if (przyNad3) {
    fill(przyHighlight);
  } else {
    fill(przyColor);
  }
  stroke(0);
  ellipse(przy3X, przy3Y, przySize, przySize);
  
  if (przyNad4) {
    fill(przyHighlight);
  } else {
    fill(przyColor);
  }
  stroke(0);
  ellipse(przy4X, przy4Y, przySize, przySize);
  
}

void update(int x, int y) {
  if ( nadPrzy1(przy1X, przy1Y, przySize) ) {
    przyNad1 = true;
    } else if (nadPrzy2(przy2X, przy2Y, przySize) ) {
    przyNad2 = true;}
    else if (nadPrzy3(przy3X, przy3Y, przySize) ) {
    przyNad3 = true;
    przyNad4= false;}
    else if (nadPrzy4(przy4X, przy4Y, przySize) ) {
    przyNad4 = true;
    przyNad3 = false;}
    else{
    przyNad1 = false;
    przyNad2 =false;
    przyNad3 = false;
    przyNad4 = false;
  }
}

void killCells(){
  for(int row=0; row<dim; row++) {
    for(int col=0; col<dim; col++) {
      cells[col][row] = false; 
    } } }

void randomizeCells() {
  for(int row=0; row<dim; row++) {
    for(int col=0; col<dim; col++) {
      cells[col][row] = randomBoolean(); 
    } } }

boolean randomBoolean() {
  float r = random(1000); 
  if(r>500) return true; return false; } 


  
  int liczbaSasiadow(int col, int row) {  int n = 0;
    if(sprawdzSasiada(col-1, row-1)) n+=1;
    if(sprawdzSasiada(col, row-1)) n+=1;
    if(sprawdzSasiada(col+1, row-1)) n+=1;
    if(sprawdzSasiada(col-1, row )) n+=1;
    if(sprawdzSasiada(col+1, row )) n+=1;
    if(sprawdzSasiada(col, row+1)) n+=1;
    if(sprawdzSasiada(col+1, row+1)) n+=1;
    if(sprawdzSasiada(col-1, row+1)) n+=1;
    return n; }
    
    boolean sprawdzSasiada (int col, int row) {
        if (col<0 || row<0 ||row>=dim || col>=dim) return false; 
       return cells [row][col] ;
    }
 
void aktualizacjaPokolenia() {
  int sasiedzi = 0;
    for (int row = 0; row < dim; row++) { for (int col = 0; col < dim; col++) {
 sasiedzi = liczbaSasiadow(col,row);
 if (sasiedzi > 3 && sasiedzi < 7) temp[col][row] = true; else temp [col][row] = false;
    } }

arrayCopy (temp,cells);
}

void mousePressed() {
  if (przyNad1) {
    randomizeCells();
  }
  if (przyNad2) {
    killCells();
  }
  if (przyNad3) {
    dead = color (255);alive = color(0);}
  if (przyNad4) {
    alive = color(204,150,20);
  dead = color (10,34,100);
}}

boolean nadPrzy1(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
boolean nadPrzy2(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
boolean nadPrzy3(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
boolean nadPrzy4(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
