final int BLAUW = #0000FF;
final int GROEN = #00FF00;
final int ORANJE = #F44611;
final int ROZE = #CA2C92;
final int ZWART = #000000;

float schermBreedte = 1200;
float schermLengte = schermBreedte / 2.5;
int schermBreedteInt = int(schermBreedte);
int schermLengteInt = int(schermLengte);

float staafMax = 200;
float staafA = 20.0;
float staafB = 190.0;
float staafC = 150.0;
float gemiddeldeLijn = ((staafA + staafB + staafC) / 3);
float gemiddeldeLijnY = schermLengte - (gemiddeldeLijn * (schermLengte / staafMax));

float staafBreedte = schermBreedte / 5;

float staafLengteA = staafA * (schermLengte / staafMax);
float staafLengteB = staafB * (schermLengte / staafMax);
float staafLengteC = staafC * (schermLengte / staafMax);

float staafAY = schermLengte - staafLengteA;
float staafBY = schermLengte - staafLengteB;
float staafCY = schermLengte - staafLengteC;

float staafAX = 50 * (schermBreedte / 500);
float staafBX = 200 * (schermBreedte / 500);
float staafCX = 350 * (schermBreedte / 500);

void settings(){
  size(schermBreedteInt, schermLengteInt);
}

void draw(){
   background(ZWART);
   staafATekenen();
   staafBTekenen();
   staafCTekenen();
   gemiddeldeLijnTekenen();
}

void staafATekenen(){
  fill(BLAUW);
  text(staafA, staafAX, staafAY);
  rect(staafAX, staafAY, staafBreedte, staafLengteA);
}

void staafBTekenen(){
  fill(GROEN);
  text(staafB, staafBX, staafBY);
  rect(staafBX, staafBY, staafBreedte, staafLengteB);
}

void staafCTekenen(){
  fill(ORANJE);
  text(staafC, staafCX, staafCY);
  rect(staafCX, staafCY, staafBreedte, staafLengteC);
}

void gemiddeldeLijnTekenen(){
  fill(ROZE);
  rect(0, gemiddeldeLijnY, schermBreedte, 2);
}
