final int GRIJS = #F0F0F0;
final int ZWART = #000000;
final int WIT   = #FFFFFF;

float schermBreedte;
float schermHoogte;
float middenX;
float middenY;

float muntGrootte  = 30;
float muntHalf     = muntGrootte / 2;

int level = 2;
int kliks;

// Creeër 2 twee dimensionale boolean arrays; beiden zijn gelijk aan elkaar, de tweede array wordt gebruikt om te zien of er een verandering gemaakt is in de eerste array.
boolean[][] munten      = new boolean[100][100];
boolean[][] muntenCheck = new boolean[100][100];

int[] score = new int[100];

boolean check = true;

void setup() {
  size(600, 600);
  background(#F0F0F0);
  ellipseMode(LEFT);

  schermBreedte = 600;
  schermHoogte = schermBreedte;
  middenX = schermBreedte / 2;
  middenY = schermHoogte / 2;

  // Kleur munten wit op het begin van het spel.

  textSize(30);
  fill(ZWART);
  text("Kleur de munten in!", middenX - 150, middenY - 150);
  resetMunten();
}

void draw() {
  int[] highscore    = loadInts("highscore.txt");
  boolean alleMunten = checkMunten();

  fill(ZWART);
  textSize(20);
  text(kliks, middenX, middenY - 250);

  startNieuwLevel(highscore, alleMunten);
  tekenMunten();
  kleurMuntenOmGeklikteMunt();

  println(munten[0][0], munten[0][1], munten[0][2], munten[1][0], munten[1][1], munten[1][2], munten[2][0], munten[2][1], munten[2][2]);
}

void mousePressed() {
  check = true;

  // Loop door de twee dimensionale array door middel van 2 loops, de eerste loop bepaalt welke rij bezocht wordt en de loop in de loop bepaalt welke column bezocht wordt.
  for (int i = 0; i < level; i++) {
    for (int j = 0; j < level; j++) {
      if (mouseX > middenX - (muntHalf * level) + (j * muntGrootte) && mouseX < middenX - (muntHalf * level) + (j * muntGrootte) + muntGrootte &&
        mouseY > middenY - (muntHalf * level) + (i * muntGrootte) && mouseY < middenY - (muntHalf * level) + (i * muntGrootte) + muntGrootte) {
        munten[i][j] = !munten[i][j];
        score[level] +=1;
        kliks        += 1;
        resetKliks();
      }
    }
  }
}
