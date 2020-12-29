float slider1Positie;
float slider2Positie;
final float sliderX = 50;
final float slider1Y = 50;
final float slider2Y = 150;
final float sliderBreedte = 500;
final float sliderHoogte = 25;
final float sliderNPosities = 401;
final float slider1Formule = 200.00 / 400.00;
final float slider2Formule = 190.00 / 400.00;

//Voorwaarde 0 <= positie < nPosities
void tekenSlider(float x, float y, float breedte, float hoogte, 
  float positie, float nPosities) {
  float blokjesBreedte = breedte / nPosities;

  noStroke();
  fill(255);
  rect(x, y, breedte, hoogte);
  fill(#2257F0);
  rect(x + positie * blokjesBreedte, y, blokjesBreedte, hoogte);
}

float bepaalPositie(float x, float breedte, float nPosities) {

  float blokjesBreedte = breedte / nPosities;

  if (mouseX < x) {
    return 0;
  } else if (mouseX >= breedte + x) {
    return nPosities -1;
  } else {
    return floor((mouseX - x) / blokjesBreedte);
  }
}

void tekenVolledigeSlider(float sliderY, float sliderPositie, float sliderTekst, String sliderOmschrijving) {
  tekenSlider(sliderX, sliderY, sliderBreedte, sliderHoogte, sliderPositie, sliderNPosities);
  text(sliderOmschrijving + formatteer(sliderTekst), sliderX, sliderY + sliderHoogte + 25);
}

void sliderXYVoorwaardes() {
  if (mouseX >= sliderX && mouseX <= sliderX + sliderBreedte && mouseY >= slider1Y && mouseY <= slider1Y + sliderHoogte) {
    slider1Positie = bepaalPositie(sliderX, sliderBreedte, sliderNPosities);
  }
  if (mouseX >= sliderX && mouseX <= sliderX + sliderBreedte && mouseY >= slider2Y && mouseY <= slider2Y + sliderHoogte) {
    slider2Positie = bepaalPositie(sliderX, sliderBreedte, sliderNPosities);
  }
}

String formatteer(float getal) {
  if (getal >= 10) {
    return String.format("%.1f", getal);
  }
  return String.format("%.2f", getal);
}
