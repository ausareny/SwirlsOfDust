/** 
 * Title: Swirls Of Dust <br>
 * Name: Justyna Ausareny <br>
 * Date: 25.11.13 <br>
 * Description: an interactive and dynamic work that include text. <br> 
 **/

// ----------------------------------------------------------------------
// GLOBAL VARIABLES
// ----------------------------------------------------------------------
String lines[]; // Array to hold text lines read from the file
Text textLines[]; // Array to hold text objects
int lineIndex = 0; // Indicates text line being currently displayed
boolean showNext = false; // Indicates when to switch to the next line
float count = 0; // Counter used in text animation
Text hint; // Text object to display the hint

// ----------------------------------------------------------------------
// BUILT-IN FUNCTIONS
// ----------------------------------------------------------------------
// Setting up the canvas
void setup() {
  size(500, 500); // Setting size to 500 x 500
  lines = loadStrings("list.txt"); // Reading text lines from a file
  textLines = new Text[lines.length]; // Initializing array to hold Text objects
  // Filling up array with the Text objects
  for (int i = 0 ; i < lines.length; i++) {
    Text t;
    // Creating different text objects depanding on the line number
    switch(i) {
    case 1:
      t = new Text(50, 50, createFont("Arial", 26), lines[i]);
      break;
    case 2:
      t = new Text(450, 450, createFont("Arial", 20), lines[i]);
      break;
    case 3:
      t = new Text(450, 50, createFont("Arial", 14), lines[i]);
      break;
    case 7:
      t = new Text(width/2, height/2+50, createFont("Arial", 16), lines[i]);
      break;
    case 8:
      t = new Text(width/2, height/2+100, createFont("Arial", 16), lines[i]);
      break;
    case 9:
      t = new Text(width/2, height/2+150, createFont("Arial", 16), lines[i]);
      break;
    default:
      t = new Text(width/2, height/2, createFont("Arial", 16), lines[i]);
      break;
    }
    textLines[i] = t;
  }
  // Initializing the hint with the instructional text
  hint = new Text(width/2, height/2+220, createFont("Arial", 10), "[press space to continue]");
}

void draw() {
  background(255);
  // Strop animating on the last line
  if (lineIndex >= textLines.length) {
    return;
  }
  // Making line at index 4 follow the mouse
  if (lineIndex == 4 && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
    textLines[lineIndex].x = mouseX;
    textLines[lineIndex].y = mouseY-16;
  }
  // Animating line at index 5 creating a zoom effect
  if (lineIndex == 5 && count<10) {
    Text t = new Text(width/2, height/2, createFont("Arial", 6+count), lines[lineIndex]);
    count += 0.5;
    textLines[lineIndex] = t;
  }
  // Displaying the text on the screen
  textLines[lineIndex].display();
  // Determining when to switch to the next line
  if (lineIndex < textLines.length-1 && showNext && !textLines[lineIndex].fadeOut()) {
    showNext = false;
    lineIndex++;
  }
  hint.display(); // Displaying the hint
}

// Going to the next line by pressing the space key
void keyPressed() {
  if (key == ' ') {
    showNext = true;
  }
}
