/*

The "echo" from ChucK's sample library, with an LFO modulation added to
the delay time.

*/

// feedforward
adc => Gain g => dac;
// feedback
g => Gain feedback => DelayL delay => g;

// set delay parameters
2::second => delay.max;

// set feedback
.9 => feedback.gain;
// set effects mix
0.75 => delay.gain;

// LFO
SinOsc lfo => blackhole;
0.5 => lfo.freq;

// infinite time loop
while( true )
{
  (1 + lfo.last() * 0.25)::second => delay.delay;
  853::samp => now;
}
