void tekenAlles(float staafLengte) {
  background(ZWART);
  tekenLijnen();
  tekenStaaf(staafLengte);
  printTekst();
}

void tekenStaaf(float staafLengte) {
  fill(PAARS);
  rect(middenX - (staafBreedte / 2), schermHoogte - staafLengte, staafBreedte, staafLengte);
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
