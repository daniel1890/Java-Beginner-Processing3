// Creeër een boolean waarde die false is wanneer één of meerdere munten wit zijn, de waarde wordt alleen true wanneer alle munten zwart zijn, hiermee check je of de speler het spel gehaald heeft.
boolean checkMunten() {
  boolean alleMuntenZwart = true;

  for (int i = 0; i < level; i++) {
    for (int j = 0; j < level; j++) {
      if (munten[i][j] == false) {
        return false;
      }
    }
  }

  return alleMuntenZwart;
}

// Reset de boolean waarde van alle munten naar false, hierdoor worden ze weer wit getekent.
void resetMunten() {
  for (int i = 0; i < level; i++) {
    for (int j = 0; j < level; j++) {
      munten[i][j]      = false;
      muntenCheck[i][j] = false;
    }
  }

  kliks = 0;
}

// Teken 1 munt op een x en y coördinaat.
void tekenMunt(float middenX, float middenY, int kleur) {
  fill(kleur);
  circle(middenX - ((level * muntGrootte) / 2), middenY - (level * muntGrootte / 2), muntGrootte);
}

// Teken alle munten op bijbehorende x en y assen.
void tekenMunten() {
  int kleur = WIT;

  for (int i = 0; i < level; i++) {
    for (int j = 0; j < level; j++) {

      // Wissel tussen wit en zwart wanneer de boolean die verbonden is met elke individuele munt wordt geswitched.
      if (munten[i][j] == true) {
        kleur = ZWART;
      } else if (munten[i][j] == false) {
        kleur = WIT;
      }
      tekenMunt(middenX + ((muntGrootte) * j), middenY + (i * muntGrootte), kleur);
    }
  }
}

// Ververs de munten/tekst en voeg 1 munt op de x en y as toe, doe dit alleen wanneer alle munten zwart gekleurd zijn.
void startNieuwLevel(int[] highscore, boolean alleMunten) {

  if (alleMunten == true) {
    background(#F0F0F0);
    updateHighScore(highscore, alleMunten);
    resetMunten();
    level += 1;
    printHighscoreEnLevel(highscore);
  }
}

// Met deze loop kleur je de munten die rondom de geklikte munt liggen in.
void kleurMuntenOmGeklikteMunt() {

  for (int i = 0; i < level; i++) {
    for (int j = 0; j < level; j++) {
      if (check == true && munten[i][j] == !muntenCheck[i][j]) {
        if (i > 0) {
          munten[i-1][j]      = !munten[i-1][j];
          muntenCheck[i-1][j] =  munten[i-1][j];
        }
        if (i < level - 1) {
          munten[i+1][j]      = !munten[i+1][j];
          muntenCheck[i+1][j] = munten[i+1][j];
        }
        if (j > 0) {
          munten[i][j-1] = !munten[i][j-1];
          muntenCheck[i][j-1] = munten[i][j-1];
        }
        if (j < level - 1) {
          munten[i][j+1] = !munten[i][j+1];
          muntenCheck[i][j+1] = munten[i][j+1];
        }

        muntenCheck[i][j] = munten[i][j];
        check = false;
      }
    }
  }
}

// Teken een grijze rectangle achter de klik counter zodat de tekst vernieuwd.
void resetKliks() {
  fill(GRIJS);
  noStroke();
  rect(middenX - 20, middenY - 270, 50, 50);
  stroke(ZWART);
}

// Update de highscore wanneer een level beëindigd en wanneer minder zetten genomen zijn dan alle andere spellen voorheen.
void updateHighScore(int[] highscore, boolean alleMunten) {

  if (score[level] < highscore[level] && alleMunten == true) {
    highscore[level] = score[level];
    saveStrings("highscore.txt", str(highscore));
  }
}

//
void printHighscoreEnLevel(int[] highscore) {
  fill(ZWART);
  textSize(20);
  text("Level: " + (level - 1), middenX - 38, middenY - 275);
  text("Level highscore: " + highscore[level], middenX - 90, 585);
}
