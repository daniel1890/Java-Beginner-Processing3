final int GROEN = #00FF00;
final int ROOD = #FF0000;
final int ZWART = #000000;
final int WIT = #FFFFFF;

int grootteDoelwitSchijf1 = 40;
int grootteDoelwitSchijf2 = 30;
int grootteDoelwitSchijf3 = 20;
int grootteDoelwitSchijf4 = 10;
int doelwitX = 200;
int doelwitY = 200;

boolean beweegRechts = true;
boolean beweegLinks = false;

boolean start = false;
boolean stop = true;

int raak = 0;
int mis = 0;

void setup() {
  size(400, 400);
}

void draw() {
  beweeg();

  tekenAlles();
  println(start, stop);
}

void mouseClicked() {
  startOfStop();
  tellPunten();
}

void tellPunten() {
  
  if (start && mouseY <= height - 30 ) {
    if (mouseX >= doelwitX - 20 && mouseX <= doelwitX + 20 && mouseY >= doelwitY -20 && mouseY <= doelwitY +20) {
      raak += 1;
    } else {
      mis += 1;
    }
  }
}

void startOfStop() {
  if (mouseX >= width / 2 - 40 && mouseX <= width / 2 + 40 && mouseY >= height - 30 && start == true) {
    stop = true;
    start = !stop;
    raak = 0;
    mis = 0;
  } else if (mouseX >= width / 2 - 40 && mouseY >= height - 30 && mouseX <= width / 2 + 40) {
    start = true;
    stop = !start;
  }
}

void tekenAlles() {
  background(ZWART);
  fill(WIT);
  text("Aantal raak: " + raak + "   " +  "aantal mis: " + mis, width / 100, height / 20);  
  tekenDoelwit(doelwitX, doelwitY);
  tekenKnop();
}

void tekenKnop() {
  fill(GROEN);
  rect(width / 2 - 40, height - 30, 80, 40); 
  fill(ZWART);
  printStartOfStop();
}

void printStartOfStop() {
  if (stop) {
    text("start", width / 2 - (width / 30), height - 10);
  } else if (start) {
    text("stop", width / 2 - (width / 30), height - 10);
  }
}

void tekenDoelwit(int doelwitX, int doelwitY) {
  if (start) {
    fill(ROOD);
    ellipse(doelwitX, doelwitY, grootteDoelwitSchijf1, grootteDoelwitSchijf1);
    fill(WIT);
    ellipse(doelwitX, doelwitY, grootteDoelwitSchijf2, grootteDoelwitSchijf2);
    fill(ROOD);
    ellipse(doelwitX, doelwitY, grootteDoelwitSchijf3, grootteDoelwitSchijf3);
    fill(WIT);
    ellipse(doelwitX, doelwitY, grootteDoelwitSchijf4, grootteDoelwitSchijf4);
  }
}

void beweeg() {
  beweegRechts = !beweegLinks;

  if (beweegRechts) {
    doelwitX += random(1, 3);
  } else if (beweegLinks) {
    doelwitX -= random(1, 3);
  }

  if (doelwitX >= width - (grootteDoelwitSchijf1 / 2)) {
    beweegLinks = true;
  } else if (doelwitX <= 0 + (grootteDoelwitSchijf1 / 2)) {
    beweegRechts = true;
    beweegLinks = false;
  }
}
