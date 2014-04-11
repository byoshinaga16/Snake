/*
  MeggyJr_Blink.pde
 
 Example file using the The Meggy Jr Simplified Library (MJSL)
  from the Meggy Jr RGB library for Arduino
   
for loop.
   
   
 
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

void loop()                     // Each time through the loop, when direction button is pressed move the dot in that direction until hits barrier or another button is pressed
{     
DrawPx(xcoord,ycoord,15);    // Draw player  

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
  ycoord++;
}

if (dir == 270)
{
  ycoord--;
}

if (dir == 0)
{
  xcoord++;
}

if (dir == 180)
{
  xcoord--;
}
if (xcoord > 7)    //if statements to adjust barriers
{
  xcoord = 0;
}
if (ycoord > 7)
{
  ycoord = 0;
}
if (xcoord < 0)
{
  xcoord = 7;
}
if (ycoord < 0)
{
  ycoord = 7;
}

if (ateApple)            // Draw apple in random coordinates
{ 
  xapple = random(8);
  yapple = random(8);
  ateApple = false;
}
DrawPx(xapple,yapple,1);                      // Draw Snake
if (xcoord == xapple && ycoord == yapple)
{ 
  ateApple = true;
}
if (xcoord == xapple && ycoord == yapple)
{
  Tone_Start(ToneDs8,50);      //when apple is eaten, sound is played
}

DisplaySlate();
delay(150);
ClearSlate();
}

