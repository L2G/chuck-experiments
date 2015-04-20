/*

This is an attempt to simulate a bit of satellite telemetry made famous by the
venerable Valentino (Major Records) sound effects library.

*/

SinOsc s => Dyno env => dac;
while( true ) {
  1200 + Math.random2(0, 3) * 2000.0 / 3.0 => s.freq;
  1 => s.gain; 45::ms => now;
  0 => s.gain; 45::ms => now;
}
