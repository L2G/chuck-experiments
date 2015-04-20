/*

Simulate the alert tone used in the United States for the Emergency Alert
System, formerly the Emergency Broadcast System (1963-1997), formerly CONELRAD
(1951-1963).

This sound may trigger panic in those who are regular consumers of USA broadcast
media, so use at your own risk. :-)

References:

https://en.wikipedia.org/wiki/CONELRAD
https://en.wikipedia.org/wiki/Emergency_Broadcast_System

*/

// Set the year to change the sound of the alert:
// 1951-1963: CONELRAD (a.k.a. Key Station System)
// 1963-1997: Emergency Broadcast System
// 1997-    : Emergency Alert System

1963 => int year;

// The 960 Hz tone has always been a component of the alert.
SinOsc osc1 => dac;
960 => osc1.freq;

// EBS added the 853 Hz tone component in 1963
if( year >= 1963 )
{
  SinOsc osc2 => dac;
  853 => osc2.freq;
}

/*
// The Specific Area Message Encoder (SAME) digital code was added when EBS
// became EAS in 1997.
if( year >= 1997 )
{
  0 => osc1.gain;
  0 => osc2.gain;

  1 => osc1.gain;
  1 => osc2.gain;
}
*/

15::second => now;
