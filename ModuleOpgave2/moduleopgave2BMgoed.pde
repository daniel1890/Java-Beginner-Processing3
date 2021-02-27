final int BLAUW = #0000FF;
final int WIT = #FFFFFF;
final int ZWART = #000000;
final int PAARS = #6441A5;

import controlP5.*;
ControlP5 theControl;

float schermBreedte = 600;
float schermHoogte = schermBreedte;
float staafBreedte = schermBreedte / 5;

float middenX = schermBreedte / 2;
float middenY = schermHoogte / 2;

float obeesLijnY = (30.0 / 100) * schermHoogte;
float overgewichtLijnY = (25.0 / 100) * schermHoogte;
float normaalLijnY = (18.5 / 100) * schermHoogte;

void setup() {
  size(600, 600);
  theControl = new ControlP5(this);
  createNumberBoxes(theControl);
}

void draw() {
  float lengte = leesLengte() / 100;
  float gewicht = leesGewicht();
  float BMI = gewicht / (lengte * lengte);
  float staafLengte = BMI * (schermHoogte / 100);

  tekenAlles(staafLengte);
}

void tekenStaaf(float staafLengte) {
  fill(PAARS);
  rect(middenX - (staafBreedte / 2), schermHoogte - staafLengte, staafBreedte, staafLengte);
}

void tekenAlles(float staafLengte) {
  background(ZWART);
  tekenLijnen();
  tekenStaaf(staafLengte);
  printTekst();
}


void tekenLijnen() {
  tekenLijn(normaalLijnY);
  tekenLijn(overgewichtLijnY);
  tekenLijn(obeesLijnY);
}

void tekenLijn(float y) {
  stroke(WIT);
  line(0, schermHoogte - y, schermBreedte, schermHoogte - y);
}

void printTekst() {
  float tekstBuffer = schermBreedte / 40;
  String[] tekst = { "ondergewicht", "normaal gewicht", "overgewicht", "obees" };
  fill(WIT);
  text(tekst[0], 0 + tekstBuffer, schermHoogte - normaalLijnY + tekstBuffer);  
  text(tekst[1], 0 + tekstBuffer, schermHoogte - normaalLijnY - tekstBuffer);
  text(tekst[2], 0 + tekstBuffer, schermHoogte - overgewichtLijnY - tekstBuffer);
  text(tekst[3], 0 + tekstBuffer, schermHoogte - obeesLijnY - tekstBuffer);
}
