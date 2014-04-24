

#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

void setup()                    // run once, when the sketch starts
{
  MeggyJrSimpleSetup();   // Required code, line 2 of 2.
         
}
   
int length = 1;          //variable for snake length
int dir = 1;   
int xapple, yapple;
boolean ateApple = true;
boolean alive = false;

struct Point        // Defined struct
{
  int x; 
  int y;
};

Point s1 = {4,4};    //Defines points in array 
Point s2 = {3,4};
Point s3 = {2,4};
Point s4 = {1,4};
Point snakeArray[64] = {s1, s2, s3, s4};


void loop()                     // Each time through the loop, when direction button is pressed move the dot in that direction until hits barrier or another button is pressed
{     
  drawSnake();
  apple();
  DisplaySlate();
  delay(125);
  ClearSlate();
  updateSnake();

  CheckButtonsPress();

  if (Button_Up)        // Check buttons and set direction
   {
    dir = 90;
  }
  if (Button_Down)
  {
    dir = 270;
  }
  if (Button_Left)
  {
    dir = 180;
  }
  if(Button_Right)
  {
    dir = 0;
  }
  if (dir == 90)    //if statements to move snake according to direction value
  {
    snakeArray[0].y++;
  }

  if (dir == 270)
  {
    snakeArray[0].y--;
  }

  if (dir == 0)
  {
    snakeArray[0].x++;
  }

  if (dir == 180)
  {
    snakeArray[0].x--;
  }

  for(int i = 0; i < length; i++)      //wrap snake
  {
  
      if (snakeArray[i].x > 7)    
      {
        snakeArray[i].x = 0;
      }
      if (snakeArray[i].x < 0)
      {
        snakeArray[i].x = 7;
      }
      if (snakeArray[i].y > 7)
      {
        snakeArray[i].y = 0;
      }
      if (snakeArray[i].y < 0)
      {
        snakeArray[i].y = 7;
      }
  }
  
  for(int i = 1; i < length; i++)          //collision detection
  {
    if(snakeArray[0].x == snakeArray[i].x && snakeArray[0].y == snakeArray[i].y)        //if snake head hits body, cue death screen
    {
      alive = true;
    }
  }
    
    if(alive)
    {
      ClearSlate();                 
      for(int i = 0; i < 8; i++)       //death screen
      {
        for(int x = 0; x < 8; x++)
        {
          DrawPx(i,x,1);
        }
      }
      DisplaySlate();
      delay (3000);
      length = 1;
      alive = false;
      
    }
}


void apple()
{
  if (ateApple)            // Draw apple in random coordinates
  { 
    xapple = random(8);
    yapple = random(8);
    ateApple = false;
  }
  DrawPx(xapple,yapple,1);                      // Draw Apple
  if (snakeArray[0].x == xapple && snakeArray[0].y == yapple)
  { 
    ateApple = true;
    Tone_Start(ToneDs8,50);  //when apple is eaten, sound is played
    length++;
  }
}

void updateSnake()
{  
  for (int i = length-1; i > 0; i--)           //allows for snake-like movement
  {
    snakeArray[i].x =  snakeArray[i-1].x;
    snakeArray[i].y =  snakeArray[i-1].y;
  }
}

void drawSnake()
{
  DrawPx(snakeArray[0].x, snakeArray [0].y, 4);  //Draws snake array head
 
  for (int i = 1; i < length; i++)        //draws snake body
  {
    DrawPx(snakeArray[i].x, snakeArray[i].y, 2);  
  } 
  
}
  
  
