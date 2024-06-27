PImage bg;
PrintWriter mousePosition;

//setting up the arraylist Circle over here
ArrayList<Circle> circle = new ArrayList<Circle>();

//setting up for the ship
BigFlames flare = new BigFlames(mouseX, mouseY);
ShipShape shipShape = new ShipShape();
ShipBase base = new ShipBase();
ShipWing wing = new ShipWing();

ShipWindow window = new ShipWindow();

void setup(){
 //for background
 size(960, 450);
 bg = loadImage("stars.jpg");
 
 //This is to create a new text file
 mousePosition = createWriter("mouseCoordinates.txt");
}


void draw() {
  //display background
  background(bg);
  
  //adds a circle
   circle.add(new Circle());
  
  //sends out the circles in a loop, replays and removes them if the circle has made it
  Circle c = circle.get(0);
  if (c.replay()) {
    circle.remove(0);
  }
  else {
    c.display();
  }
  
  //drawing the ship
  noStroke();
  flare.flame();
  shipShape.display();
  wing.display();
  base.display();
  window.display();
  
  //this will print out the mouse position currently and previously 
  mousePosition.println(mouseX + " : " + mouseY + "\n" + pmouseX + " : " + pmouseY);
  
}

//A little secret that when the user presses the "Enter", the text "you got this" appears. 
void keyPressed() {
  fill(255, 255, 255);
  textSize(150);
  text("You got this",150, 255);
}

//abstract class for the ship's flames
abstract class JetFlames {
    int xArea;
    int yArea;
}

//the class for the ship's flames
class BigFlames extends JetFlames {
  BigFlames(int x, int y) {
    xArea = x;
    yArea = y;
    x = 70;
  }
  
  //drawing the flame and tried to add push and pop
  void flame() {
    pushMatrix();
    fill(random(240, 255), random(0, 120), random(1, 20));
    ellipse(mouseX - 100, mouseY, 70, 50);
    popMatrix();   
  }
}

//when mouse is pressed, out put the mouse positions into the extrnal file
void mousePressed() {
  mousePosition.flush();
}

class ShipShape {
  void display() {
    noStroke();
    fill(255, 255, 255);
    rect(mouseX - 85, mouseY - 30, 140, 60);
  }
}

class ShipBase extends ShipShape {
  void display() {
    fill(255, 255, 255);
    ellipse(mouseX + 55, mouseY, 35, 60);
  }
}

class ShipWing extends ShipShape {
  void display() {
    fill(255, 255, 255);
    rect(mouseX - 70, mouseY - 65, 50, 140);
  }
}

class ShipWindow extends ShipBase {
  void display() {
    stroke(0);
    fill(255, 255, random(0, 255));
    rect(mouseX + 10, mouseY - 30, 45, 30);
  }
}
