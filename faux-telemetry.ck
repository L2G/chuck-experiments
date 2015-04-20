/*

This is an attempt to simulate a bit of satellite telemetry made famous by the
venerable Valentino (Major Records) sound effects library.

*/

1200.0 => float lower;
3200.0 => float upper;

SinOsc s => dac;

while( true ) {
  lower + Math.random2(0, 3) * (upper - lower) / 3.0 => s.freq;
  1 => s.gain; 45::ms => now;
  0 => s.gain; 45::ms => now;
}
