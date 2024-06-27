//The making of the Circle and all of its information:
//Interface for the Circle
public interface Shape {
  void display();
}

//Size, traveling on x-axis, and have the circle removed when x-axis is equal to 0
public class Circle implements Shape{

  //starting position of the circle
  float circleSpeedx = 1000;
  float circleHighty = (random(5, 445));
  
  //static array for the size of the circle
  int [] circle = new int[1];
  
  
    
  void display() {
    //setting up the static array for the size of the ball
    for (int i = 0; i < circle.length; i++) {
      circle[i] = int (random(50, 200));
    }
    
    //draw the circle
    fill(random(150, 160), random(60, 80), random(40, 50));
    for (int i = 0; i < circle.length; i++) {
      push();
      ellipse(circleSpeedx, circleHighty, circle[i], circle[i]);
      //circle traveling
      circleSpeedx = circleSpeedx - 5.5;
      pop();
    }
    
  }
  
  //This will check if the circle has reach the other screen with a boolean.
  //If it did, it will return true so that the display will replay itself.
  boolean replay() {
    if (circleSpeedx < -55.5) {
      return true;
    }
    
    else {
      return false;
    }
    
  } 
   
}
