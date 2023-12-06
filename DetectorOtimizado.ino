#include <Wire.h>
#include "blink.h"
#include <SD.h>
#include <RTClib.h>

extern bool g_novaPiscada;

#define INTERRUPT_PIN 7  // use pin 2 on Arduino Uno & most boards
#define LED_PIN 8        // (Arduino is 13, Teensy is 11, Teensy++ is 6)


void setup() 
{
  eyeBlinkSetup();
}

void loop() 
{
  eyeBlinkRefresh();
}

