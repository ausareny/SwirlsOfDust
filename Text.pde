/** 
 * Title: Swirls Of Dust <br>
 * Name: Justyna Ausareny <br>
 * Date: 25.11.13 <br>
 * Description: an interactive and dynamic work that include text. <br> 
 **/

// Text is a class that draws text on the screen
class Text {
  /* properties */
  int x;      // x-coordinate of the text
  int y;      // y-coordinate of the text
  PFont font; // declare a variable of type PFont
  String text;// string to display

  int alpha = 255; // current alpha value, used for fade out effect

  /* methods */
  // constructor 
  Text(int newX, int newY, PFont newFont, String newText) {
    x = newX;
    y = newY;
    font = newFont;
    text = newText;
  }

  // draws the text
  void display() {
    // allaigning text at center vertically and horizontally
    textAlign(CENTER, CENTER);
    // setting the color of the text
    color c = color(0, 0, 0, alpha);
    fill(c);
    // specifying the font
    textFont(font, font.getSize());
    // write some text to the screen
    text(text, x, y);
  }

  // Fading out the text by dicreasing its alpha value
  // Returns true while animating and false when done
  boolean fadeOut() {
    if (alpha>5) {
      alpha-=5;
      return true;
    }
    if (alpha<=5) {
      alpha = 1;
    }
    return false;
  }
}
