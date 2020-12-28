float geefHoogste(float[] getallen) {
  float max = geefLaagste(getallen);
  float huidigGetal = 0;

  for (int i = 0; i < getallen.length; i++) {
    huidigGetal = getallen[i];
    if (huidigGetal > max) {
      max = huidigGetal;
    }
  }

  return max;
}

float geefLaagste(float[] getallen) {
  float min = 9E34;
  float huidigGetal = 0;

  for (int i = 0; i < getallen.length; i++) {
    huidigGetal = getallen[i];
    if (huidigGetal < min) {
      min = huidigGetal;
    }
  }

  return min;
}

float geefAantal(float[] getallen) {
  float aantal = 0;  

  for (int i = 0; i < getallen.length; i++) {
    aantal +=1;
  }

  return aantal;
}

float geefGemiddelde(float[] getallen) {
  float gemiddelde = 0;
  float totaleSom = 0;
  float aantal = geefAantal(cijfers);

  for (int i = 0; i < getallen.length; i++) {
    totaleSom += getallen[i];
  }

  gemiddelde = totaleSom / aantal;
  float gemiddeldeAfgerond = Math.round(gemiddelde * 10) / 10.0;
  return gemiddeldeAfgerond;
}

float geefVoldoendes(float[] getallen) {
  float voldoendes = 0;

  for (int i = 0; i < getallen.length; i++) {
    if (getallen[i] >= 5.5) {
      voldoendes +=1;
    }
  }

  return voldoendes;
}

int geefMeeste(int[] getallen) {
  int meeste = 0;

  for (int i = 0; i < getallen.length; i++) {
    if (getallen[i] > meeste) {
      meeste = getallen[i];
    }
  }
  
  return meeste;
}

String formatteer(float getal) {
  return String.format("%.1f", getal);
}
