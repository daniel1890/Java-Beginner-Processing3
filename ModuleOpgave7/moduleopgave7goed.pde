final int ZWART = #000000;
final int WIT = #FFFFFF;
final int GRIJS = #C9C9C9;

float[] cijfers;
float grafiekX1, grafiekY1, grafiekX2, grafiekY2;

void setup() {   
  cijfers = loadFloats("cijfers_groot.txt");

  grafiekX1 = 25;
  grafiekY1 = 150; 
  grafiekX2 = width - grafiekX1;
  grafiekY2 = height - grafiekY1 / 3;

  float hoogste = geefHoogste(cijfers);   
  float laagste = geefLaagste(cijfers); 
  float aantal = geefAantal(cijfers);
  float gemiddelde = geefGemiddelde(cijfers);
  float voldoendes = geefVoldoendes(cijfers);

  int aantalZonderDecimalen = int(aantal);
  int voldoendesZonderDecimalen = int(voldoendes);
  int onvoldoendes = aantalZonderDecimalen - voldoendesZonderDecimalen;

  int cijfersTussen0En1 = geefCijfersTussen0En1(cijfers);
  int cijfersTussen1En2 = geefCijfersTussen1En2(cijfers);
  int cijfersTussen2En3 = geefCijfersTussen2En3(cijfers);
  int cijfersTussen3En4 = geefCijfersTussen3En4(cijfers);
  int cijfersTussen4En5 = geefCijfersTussen4En5(cijfers);
  int cijfersTussen5En6 = geefCijfersTussen5En6(cijfers);
  int cijfersTussen6En7 = geefCijfersTussen6En7(cijfers);
  int cijfersTussen7En8 = geefCijfersTussen7En8(cijfers);
  int cijfersTussen8En9 = geefCijfersTussen8En9(cijfers);
  int cijfersTussen9En10 = geefCijfersTussen9En10(cijfers);

  int[] aantalGetallenPerCijfer = { cijfersTussen0En1, cijfersTussen1En2, cijfersTussen2En3, cijfersTussen3En4, cijfersTussen4En5, 
                                    cijfersTussen5En6, cijfersTussen6En7, cijfersTussen7En8, cijfersTussen8En9, cijfersTussen9En10 };
  int hoogstAantalGetallen = geefMeeste(aantalGetallenPerCijfer);    

  float tekenGrafiekX = grafiekX2 - grafiekX1;
  float tekenGrafiekY = grafiekY2 - grafiekY1;
  float staafBreedte = tekenGrafiekX / 10;
  float staafVerdeling = tekenGrafiekY / hoogstAantalGetallen;
        staafVerdeling = staafVerdeling - ((staafVerdeling / 100) * 5);                      

  String nul = formatteer(0);
  String een = formatteer(1);
  String twee = formatteer(2);
  String drie = formatteer(3);
  String vier = formatteer(4);
  String vijf = formatteer(5);
  String zes = formatteer(6);
  String zeven = formatteer(7);
  String acht = formatteer(8);
  String negen = formatteer(9);
  String tien = formatteer(10);

  size(800, 600);
  background(ZWART);
  textSize(16);

  fill(GRIJS);
  rectMode(CORNERS);
  rect(grafiekX1, grafiekY1, grafiekX2, grafiekY2);

  rectMode(CORNER);
  stroke(ZWART);
  fill(WIT);
  rect(grafiekX1 + (0 * staafBreedte), grafiekY2, staafBreedte, staafVerdeling * (cijfersTussen0En1));
  rect(grafiekX1 + (1 * staafBreedte), grafiekY2 - staafVerdeling * (cijfersTussen1En2), staafBreedte, staafVerdeling * (cijfersTussen1En2));
  rect(grafiekX1 + (2 * staafBreedte), grafiekY2 - staafVerdeling * (cijfersTussen2En3), staafBreedte, staafVerdeling * (cijfersTussen2En3));
  rect(grafiekX1 + (3 * staafBreedte), grafiekY2 - staafVerdeling * (cijfersTussen3En4), staafBreedte, staafVerdeling * (cijfersTussen3En4));
  rect(grafiekX1 + (4 * staafBreedte), grafiekY2 - staafVerdeling * (cijfersTussen4En5), staafBreedte, staafVerdeling * (cijfersTussen4En5));
  rect(grafiekX1 + (5 * staafBreedte), grafiekY2 - staafVerdeling * (cijfersTussen5En6), staafBreedte, staafVerdeling * (cijfersTussen5En6));
  rect(grafiekX1 + (6 * staafBreedte), grafiekY2 - staafVerdeling * (cijfersTussen6En7), staafBreedte, staafVerdeling * (cijfersTussen6En7));
  rect(grafiekX1 + (7 * staafBreedte), grafiekY2 - staafVerdeling * (cijfersTussen7En8), staafBreedte, staafVerdeling * (cijfersTussen7En8));
  rect(grafiekX1 + (8 * staafBreedte), grafiekY2 - staafVerdeling * (cijfersTussen8En9), staafBreedte, staafVerdeling * (cijfersTussen8En9));
  rect(grafiekX1 + (9 * staafBreedte), grafiekY2 - staafVerdeling * (cijfersTussen9En10), staafBreedte, staafVerdeling * (cijfersTussen9En10));

  fill(WIT);
  text("Aantal cijfers: " + aantalZonderDecimalen, grafiekX1, 30);
  text("Hoogste cijfer: " + hoogste, grafiekX1, 50);
  text("Laagste cijfer: " + laagste, grafiekX1, 70);
  text("Gemiddelde: " + gemiddelde, grafiekX1, 90);
  text("Aantal voldoendes: " + voldoendesZonderDecimalen, grafiekX1, 110);
  text("Aantal onvoldoendes: " + onvoldoendes, grafiekX1, 130);

  textAlign(CENTER);
  text(nul, grafiekX1, grafiekY2 + 20);
  text(een, grafiekX1 + (1 * staafBreedte), grafiekY2 + 20);
  text(twee, grafiekX1 + (2 * staafBreedte), grafiekY2 + 20);
  text(drie, grafiekX1 + (3 * staafBreedte), grafiekY2 + 20);
  text(vier, grafiekX1 + (4 * staafBreedte), grafiekY2 + 20);
  text(vijf, grafiekX1 + (5 * staafBreedte), grafiekY2 + 20);
  text(zes, grafiekX1 + (6 * staafBreedte), grafiekY2 + 20);
  text(zeven, grafiekX1 + (7 * staafBreedte), grafiekY2 + 20);
  text(acht, grafiekX1 + (8 * staafBreedte), grafiekY2 + 20);
  text(negen, grafiekX1 + (9 * staafBreedte), grafiekY2 + 20);
  text(tien, grafiekX1 + (10 * staafBreedte), grafiekY2 + 20);
} 
