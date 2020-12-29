final int BLAUW = #0000FF;
final int WIT = #FFFFFF;
final int ZWART = #000000;
final int PAARS = #6441A5;

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
}

void draw() {
  float lengte = ((slider1Positie * slider1Formule) + 50) / 100;
  float gewicht = ((slider2Positie * slider2Formule) + 10);

  float BMI = gewicht / (lengte * lengte);
  if (BMI >= 70) {
    BMI = 70;
  }
  
  float staafLengte = BMI * (schermHoogte / 100);


  tekenAlles(staafLengte);
  tekenVolledigeSlider(slider1Y, slider1Positie, lengte, "Lengte in meters: ");
  tekenVolledigeSlider(slider2Y, slider2Positie, gewicht, "Gewicht in kilo's: ");
}

void mousePressed() {
  sliderXYVoorwaardes();
}

void mouseDragged() {
  sliderXYVoorwaardes();
}

/*
  Deel1
 3 lijnen die bmi verdelen in 4 vlakken namelijk: obees, overgewicht, gezond gewicht en ondergewicht.
 1 staaf die kleiner of groter wordt gecorrespondeerd aan de waardes die de gebruiker invoert in de sliders.
 2 sliders die beide een waarde meten namelijk: gewicht van 10 tot 200 kg en lengte van 50 tot 250 cm.
 
 Deel2
 Wat zou er mis kunnen gaan:
 - De slider zou uit het scherm kunnen gaan; oplossen met een if statement en dan de BMI waarde limiteren.
 - Klopt de BMI waarde die getekent wordt op het scherm? Testen met println command.
 - Zorg dat slider niet uit de balk schiet; oplossen met if statement en de waarde limiteren op de maximum.
 */
