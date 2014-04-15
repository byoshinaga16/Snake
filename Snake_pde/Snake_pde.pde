/*
  MeggyJr_Blink.pde
 
 Example file using the The Meggy Jr Simplified Library (MJSL)
  from the Meggy Jr RGB library for Arduino
   
Snake.
   
   
 
 Version 1.25 - 12/2/2008
 Copyright (c) 2008 Windell H. Oskay.  All right reserved.
 http://www.evilmadscientist.com/
 
 This library is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this library.  If not, see <http://www.gnu.org/licenses/>.
 	  
 */

 
 
 
 

/*
 * Adapted from "Blink,"  The basic Arduino example.  
 * http://www.arduino.cc/en/Tutorial/Blink
 */

#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

void setup()                    // run once, when the sketch starts
{
  MeggyJrSimpleSetup();   // Required code, line 2 of 2.
         
}

int xcoord = 4;          //instance variables for x & y
int ycoord = 4;
int dir = 1;   
int xapple, yapple;
boolean ateApple = true;

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
DrawPx(snakeArray[0].x, snakeArray [0].y, 2);  //Draws array points
DrawPx(snakeArray[1].x, snakeArray[1].y, 4);
DrawPx(snakeArray[2].x, snakeArray[2].y,4);
DrawPx(snakeArray[3].x, snakeArray[3].y,4);
DisplaySlate();

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
  snakeArray[1].y++;
  snakeArray[2].y++;
  snakeArray[3].y++;
}

if (dir == 270)
{
  snakeArray[0].y--;
  snakeArray[1].y--;
  snakeArray[2].y--;
  snakeArray[3].y--;
}

if (dir == 0)
{
  snakeArray[0].x++;
  snakeArray[1].x++;
  snakeArray[2].x++;
  snakeArray[3].x++;
}

if (dir == 180)
{
  snakeArray[0].x--;
  snakeArray[1].x--;
  snakeArray[2].x--;
  snakeArray[3].x--;
}

for(int i = 0; i < 4; i++)      //wrap snake
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

if (ateApple)            // Draw apple in random coordinates
{ 
  xapple = random(8);
  yapple = random(8);
  ateApple = false;
}
DrawPx(xapple,yapple,1);                      // Draw Snake
if (snakeArray[0].x == xapple && snakeArray[0].y == yapple)
{ 
  ateApple = true;
}
if (snakeArray[0].x == xapple && snakeArray[0].y == yapple)
{
  Tone_Start(ToneDs8,50);      //when apple is eaten, sound is played
}

DisplaySlate();
delay(150);
ClearSlate();
}

