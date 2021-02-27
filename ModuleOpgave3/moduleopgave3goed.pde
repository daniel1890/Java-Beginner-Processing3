final int ZWART = #000000;
final int WIT = #FFFFFF;
final int GRIJS = #8E8E8E;

int robotX = 0;
int robotY = 0;

int vrachtX = 275;
int vrachtY = 175;

int toetsLock = 0;
int vrachtLock = 0;

void setup() {
  size(400, 400);
}

void draw() {
  int breedteRobot = width / 8;

  background(ZWART);
  tekenAlles(breedteRobot);
  println(vrachtLock);
}


void keyReleased() {
  toetsLock = 0;
}

void keyPressed() {
  int randRechts = (width - (width / 8));
  int randOnder = (height - (height / 8));
  int block = width / 8;

  if (keyPressed && toetsLock == 0) {
    toetsLock = 1;
    if (keyCode == UP && robotY > 0 && vrachtLock == 0) {
      robotY -= block;
    } else if (keyCode == UP && vrachtLock == 1) {
      robotY -= block;
      vrachtY -= block;
    } else if (keyCode == DOWN && vrachtLock == 0 && robotY < randOnder) {
      robotY += block;
    } else if (keyCode == DOWN && vrachtLock == 1 && robotY < randOnder) {
      robotY += block;
      vrachtY += block;
    } else if (keyCode == LEFT && vrachtLock == 0 && robotX > 0) {
      robotX -= block;
    } else if (keyCode == LEFT && vrachtLock == 1 && robotX > 0) {
      robotX -= block;
      vrachtX -= block;
    } else if (keyCode == RIGHT && vrachtLock == 0 && robotX < randRechts) {
      robotX += block;
    } else if (keyCode == RIGHT && vrachtLock == 1 && robotX < randRechts) {
      robotX += block;
      vrachtX += block;
    } else if (key == ENTER && vrachtLock == 0 && vrachtX == robotX + 25 && vrachtY == robotY + 25) {
      vrachtLock = 1;
    } else if (key == ENTER && vrachtLock == 1 && vrachtX == robotX + 25 && vrachtY == robotY + 25) {
      vrachtLock = 0;
    }
  }
}

//boolean vrachtEnRobotStaanOpDezelfdePositie() {
//  return vrachtX == robotX + 25;
//}

//knooppunt = (vrachtX, vrachtY, robotX, robotY)
//knooppunt = (275,     175,     250,    150   )

void tekenAlles(int breedteRobot) {
  tekenRobot(breedteRobot);
  tekenVracht();
}

void tekenRobot(int breedteRobot) {
  fill(WIT);
  rect(robotX, robotY, breedteRobot, breedteRobot);
}

void tekenVracht() {
  int breedte = width / 8;
  int hoogte = breedte;

  fill(GRIJS);
  ellipse(vrachtX, vrachtY, breedte, hoogte);
}

////kleuren
//int ZWART = #000000;
//int WIT = #FFFFFF;
//int GRIJS = #8E8E8E;

////zwarte achtergrond
//background(0);

////eigenschappen vracht
//ell met diameter 1/8 van het scherm;
//kleur GRIJS;

////eigenschappen vracht
//rect met breedte 1/8 van het scherm;
//kleur WIT;

//voorwaardes:
//-als pijltjestoets ingedrukt wordt moet de robot 1/8 van het scherm in de directie van de gecoresponderende pijltjestoets bewegen.
//-als de enter knop wordt gedrukt wanneer de robot op de vracht staat moet de robot de vracht laden, wanneer de enter knop gedrukt
// wordt wanneer de robot de vracht heeft geladen moet hij de lading weer loslaten.
//-als de robot het scherm probeert te verlaten moet dat niet kunnen.
