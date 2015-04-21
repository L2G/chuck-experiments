/*

Simulate the alert tone used in the United States for the Emergency Alert
System, formerly the Emergency Broadcast System (1963-1997), formerly CONELRAD
(1951-1963).

This sound may trigger panic in those who are regular consumers of USA broadcast
media, so use at your own risk. :-)

References:

https://en.wikipedia.org/w/index.php?title=CONELRAD&oldid=655354761
https://en.wikipedia.org/w/index.php?title=Emergency_Broadcast_System&oldid=653851954
https://en.wikipedia.org/w/index.php?title=Specific_Area_Message_Encoding&oldid=653522313
https://www.law.cornell.edu/cfr/text/47/11.31 (retrieved 2015-04-20)
http://www.gpo.gov/fdsys/pkg/FR-2012-03-22/pdf/2012-6601.pdf (77 FR 16701)

*/

/******* Settings *******/

// Set the year to change the sound of the alert:
//         year < 1976: Single-tone alert
// 1976 <= year < 1997: Double-tone alert
// 1997 <= year       : Double-tone alert with SAME (AFSK) digital messages

2015 => int year;

/***** End settings *****/

SinOsc same1;

// "All frequency components outside 200 to 4000 Hz shall be attenuated by 40
// dB or more with respect to the output levels of the mark or space
// frequencies."
same1 => HPF highpass => LPF lowpass => dac;
200 => highpass.freq;
4000 => lowpass.freq;

fun void afsk_same_message1( string message )
{
  int dict[128][8];
  [1,0,1,0,1,0,1,1] @=> dict["preamble"];
  [0,0,1,0,0,0,0,0] @=> dict[32];   // [SP]
  [0,0,1,0,0,0,0,1] @=> dict[33];   //  !
  [0,0,1,0,0,0,1,0] @=> dict[34];   //  "
  [0,0,1,0,0,0,1,1] @=> dict[35];   //  #
  [0,0,1,0,0,1,0,0] @=> dict[36];   //  $
  [0,0,1,0,0,1,0,1] @=> dict[37];   //  %
  [0,0,1,0,0,1,1,0] @=> dict[38];   //  &
  [0,0,1,0,0,1,1,1] @=> dict[39];   //  '
  [0,0,1,0,1,0,0,0] @=> dict[40];   //  (
  [0,0,1,0,1,0,0,1] @=> dict[41];   //  )
  [0,0,1,0,1,0,1,0] @=> dict[42];   //  *
  [0,0,1,0,1,0,1,1] @=> dict[43];   //  +
  [0,0,1,0,1,1,0,0] @=> dict[44];   //  ,
  [0,0,1,0,1,1,0,1] @=> dict[45];   //  -
  [0,0,1,0,1,1,1,0] @=> dict[46];   //  .
  [0,0,1,0,1,1,1,1] @=> dict[47];   //  /
  [0,0,1,1,0,0,0,0] @=> dict[48];   //  0
  [0,0,1,1,0,0,0,1] @=> dict[49];   //  1
  [0,0,1,1,0,0,1,0] @=> dict[50];   //  2
  [0,0,1,1,0,0,1,1] @=> dict[51];   //  3
  [0,0,1,1,0,1,0,0] @=> dict[52];   //  4
  [0,0,1,1,0,1,0,1] @=> dict[53];   //  5
  [0,0,1,1,0,1,1,0] @=> dict[54];   //  6
  [0,0,1,1,0,1,1,1] @=> dict[55];   //  7
  [0,0,1,1,1,0,0,0] @=> dict[56];   //  8
  [0,0,1,1,1,0,0,1] @=> dict[57];   //  9
  [0,0,1,1,1,0,1,0] @=> dict[58];   //  :
  [0,0,1,1,1,0,1,1] @=> dict[59];   //  ;
  [0,0,1,1,1,1,0,0] @=> dict[60];   //  <
  [0,0,1,1,1,1,0,1] @=> dict[61];   //  =
  [0,0,1,1,1,1,1,0] @=> dict[62];   //  >
  [0,0,1,1,1,1,1,1] @=> dict[63];   //  ?
  [0,1,0,0,0,0,0,0] @=> dict[64];   //  @
  [0,1,0,0,0,0,0,1] @=> dict[65];   //  A
  [0,1,0,0,0,0,1,0] @=> dict[66];   //  B
  [0,1,0,0,0,0,1,1] @=> dict[67];   //  C
  [0,1,0,0,0,1,0,0] @=> dict[68];   //  D
  [0,1,0,0,0,1,0,1] @=> dict[69];   //  E
  [0,1,0,0,0,1,1,0] @=> dict[70];   //  F
  [0,1,0,0,0,1,1,1] @=> dict[71];   //  G
  [0,1,0,0,1,0,0,0] @=> dict[72];   //  H
  [0,1,0,0,1,0,0,1] @=> dict[73];   //  I
  [0,1,0,0,1,0,1,0] @=> dict[74];   //  J
  [0,1,0,0,1,0,1,1] @=> dict[75];   //  K
  [0,1,0,0,1,1,0,0] @=> dict[76];   //  L
  [0,1,0,0,1,1,0,1] @=> dict[77];   //  M
  [0,1,0,0,1,1,1,0] @=> dict[78];   //  N
  [0,1,0,0,1,1,1,1] @=> dict[79];   //  O
  [0,1,0,1,0,0,0,0] @=> dict[80];   //  P
  [0,1,0,1,0,0,0,1] @=> dict[81];   //  Q
  [0,1,0,1,0,0,1,0] @=> dict[82];   //  R
  [0,1,0,1,0,0,1,1] @=> dict[83];   //  S
  [0,1,0,1,0,1,0,0] @=> dict[84];   //  T
  [0,1,0,1,0,1,0,1] @=> dict[85];   //  U
  [0,1,0,1,0,1,1,0] @=> dict[86];   //  V
  [0,1,0,1,0,1,1,1] @=> dict[87];   //  W
  [0,1,0,1,1,0,0,0] @=> dict[88];   //  X
  [0,1,0,1,1,0,0,1] @=> dict[89];   //  Y
  [0,1,0,1,1,0,1,0] @=> dict[90];   //  Z
  [0,1,0,1,1,0,1,1] @=> dict[91];   //  [
  [0,1,0,1,1,1,0,0] @=> dict[92];   //  \
  [0,1,0,1,1,1,0,1] @=> dict[93];   //  ]
  [0,1,0,1,1,1,1,0] @=> dict[94];   //  ^
  [0,1,0,1,1,1,1,1] @=> dict[95];   //  _
  [0,1,1,0,0,0,0,0] @=> dict[96];   //  `
  [0,1,1,0,0,0,0,1] @=> dict[97];   //  a
  [0,1,1,0,0,0,1,0] @=> dict[98];   //  b
  [0,1,1,0,0,0,1,1] @=> dict[99];   //  c
  [0,1,1,0,0,1,0,0] @=> dict[100];  //  d
  [0,1,1,0,0,1,0,1] @=> dict[101];  //  e
  [0,1,1,0,0,1,1,0] @=> dict[102];  //  f
  [0,1,1,0,0,1,1,1] @=> dict[103];  //  g
  [0,1,1,0,1,0,0,0] @=> dict[104];  //  h
  [0,1,1,0,1,0,0,1] @=> dict[105];  //  i
  [0,1,1,0,1,0,1,0] @=> dict[106];  //  j
  [0,1,1,0,1,0,1,1] @=> dict[107];  //  k
  [0,1,1,0,1,1,0,0] @=> dict[108];  //  l
  [0,1,1,0,1,1,0,1] @=> dict[109];  //  m
  [0,1,1,0,1,1,1,0] @=> dict[110];  //  n
  [0,1,1,0,1,1,1,1] @=> dict[111];  //  o
  [0,1,1,1,0,0,0,0] @=> dict[112];  //  p
  [0,1,1,1,0,0,0,1] @=> dict[113];  //  q
  [0,1,1,1,0,0,1,0] @=> dict[114];  //  r
  [0,1,1,1,0,0,1,1] @=> dict[115];  //  s
  [0,1,1,1,0,1,0,0] @=> dict[116];  //  t
  [0,1,1,1,0,1,0,1] @=> dict[117];  //  u
  [0,1,1,1,0,1,1,0] @=> dict[118];  //  v
  [0,1,1,1,0,1,1,1] @=> dict[119];  //  w
  [0,1,1,1,1,0,0,0] @=> dict[120];  //  x
  [0,1,1,1,1,0,0,1] @=> dict[121];  //  y
  [0,1,1,1,1,0,1,0] @=> dict[122];  //  z
  [0,1,1,1,1,0,1,1] @=> dict[123];  //  {
  [0,1,1,1,1,1,0,0] @=> dict[124];  //  |
  [0,1,1,1,1,1,0,1] @=> dict[125];  //  }
  [0,1,1,1,1,1,1,0] @=> dict[126];  //  ~

  int i;
  1 => same1.gain;

  // Preamble byte (0xAB) sent 16 times
  for( 0 => i; i < 16; i++ ) {
    afsk_bits( dict["preamble"] );
  };

  for( 0 => i; i < message.length(); i++ )
  {
    afsk_bits( dict[message.charAt(i)] );
  }

  0 => same1.gain;
  1::second => now;
}

fun void afsk_same_message( string message )
{
  // Repeat three times
  for (1 => int i; i <= 3; i++)
  {
    afsk_same_message1( message );
  }
}

fun void afsk_bits( int bits[] )
{
  // Frequencies for SAME's AFSK scheme.  These are chosen to form exactly 3
  // cycles (space) or 4 cycles (mark) over a span of 1920 microseconds.
  [ 6250.0/4.0, 6250.0/3.0 ] @=> float space_and_mark[];

  // Least-significant bit first, hence reversed order
  for( 7 => int b; b >= 0; b-- )
  {
    space_and_mark[ bits[b] ] => same1.freq;
    1.92::ms => now;
  }
}

// The Specific Area Message Encoder (SAME) digital code was added when EBS
// became EAS in 1997.
if( year >= 1997 )
{
  afsk_same_message("ZCZC-EAS-EAN-518003+0045-0510930-WOWO/AM-");
}

SinOsc alert1;
SinOsc alert2;

// The 960 Hz tone has always been a component of the alert.
960 => alert1.freq;
0 => alert1.phase;
alert1 => dac;

// EBS added the 853 Hz tone component in 1976 (see Wikipedia)
if( year >= 1976 )
{
  853 => alert2.freq;
  0.5 => alert2.phase; // start out of phase for cleaner start/stop
  alert2 => dac;
  0.6 => alert1.gain => alert2.gain;
}

// Play alert
8::second => now;

// Arbitrary silence
alert1 =< dac;
alert2 =< dac;
2::second => now;

// End-of-alert SAME message
if( year >= 1997 )
{
  afsk_same_message("NNNN");
}
