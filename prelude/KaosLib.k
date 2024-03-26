/**
File: KaosLib.k
 
* by Netdroid9
* little changes by august0815
* comment 		  august0815
*/
/*
 *  KaosLib.k
 *  Contains lots of functions, most of which correlate to CAOS functions
 *  Kaos lacks an 'import library' function, so you'll need to recompile Kaos 
 *  with this library in your prelude folder.
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version, or the MIT licence (below).
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 *  The MIT licence:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *  
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *  
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */

/** Camera Functions **/

// Camera selection
/**
SCAM cam , part 
 
Camera selection
 */
define selectCamera(agent camera, numeric partNumber)
{
  _caos {
    SCAM $camera(r) $partNumber(r);
  };
}
/**
SCAM
 */

define selectMainCamera()
{
  _caos {
    SCAM;
  };
}

// Camera positioning
/**
CMRA 
 */
define moveCamera(numeric x, numeric y, numeric pan)
{
  _caos {
    CMRA $x(r) $y(r) $pan(r);
  };
}

define moveCamera(numeric x, numeric y)
{
  moveCamera(x, y, 0);
}
/**
 CMRP x,y,pan
 */
define moveCameraCenter(numeric x, numeric y, numeric pan)
{
  _caos {
    CMRP $x(r) $y(r) $pan(r);
  };
}

define moveCamera1(numeric x, numeric y)
{
  moveCameraCenter(x, y, 0);
}
/**
 CMRX
 */
define cameraX() returning numeric
{
  _caos {
    .inline let $return = CMRX;
  };
}
/**
 CMRY
 */
define cameraY() returning numeric
{
  _caos {
    .inline let $return = CMRY;
  };
}

/*
  moveCameraToMetaroom
  
  Transition can be:
  0 - no transition
  1 - flip horizontally
  2 - burst
*/
/**
 META
  moveCameraToMetaroom
  
  Transition can be:
  0 - no transition
  1 - flip horizontally
  2 - burst
 */
define moveCameraToMetaroom(numeric metaroomID, numeric x, numeric y, numeric transition)
{
  _caos {
    META $metaroomID(r) $x(r) $y(r) $transition(r);
  };
}

// Camera backgrounds
// cameraBackground - Transition is same as in moveCameraToMetaroom
/**
 BKGD
  
 cameraBackground - Transition is same as in moveCameraToMetaroom
 */
define cameraBackground(numeric metaroomID, string background, numeric transition)
{
  _caos {
    BKGD $metaroomID(r) $background(r) $transition(r);
  };
}
/**
BKGD returning
 */
define cameraBackground() returning string
{
  _caos {
    .inline let $return = BKGD;
  };
}

/* Creature Snapshot Functions */

// takeSnapshot - Zoom is a percentage, 100 is the normal size
/**
 SNAP
  
 takeSnapshot - Zoom is a percentage, 100 is the normal size
 */
define takeSnapshot(string filename, numeric x, numeric y, numeric width, numeric height, numeric zoomFactor)
{
  _caos {
    SNAP $filename(r) $x(r) $y(r) $width(r) $height(r) $zoomFactor(r);
  }
}

// snapshotExists - Returns 1 if the specified file exists
/**
SNAX

snapshotExists - Returns 1 if the specified file exists
 */
define snapshotExists(string filename) returning numeric
{
  _caos{
    .inline let $return = SNAX $filename(r);
  };
}

// killSnapshot - Returns 1 if the snapshot is in use in a gallery and therefore fails
/**
SNAX

killSnapshot - Returns 1 if the snapshot is in use in a gallery and therefore fails
 */
define killSnapshot(string filename) returning numeric
{
  _caos{
    .inline let $return = LOFT $filename(r);
  };
}

/* Input Functions */

// Mouse-related
/**
CLAC
*/
define set clickAction(numeric messageNumber, agent a)
{
  _caos {
    .targ < $a {
      CLAC $messageNumber(r);
    };
  };
}
/**
CLAC
*/
define clickActions( agent a,numeric message1, numeric message2, numeric message3)
{
  _caos {
    .targ < $a {
      CLAC $message1(r) $message2(r) $message3(r);
    };
  };
}
/**
CLAC
*/
define clickActions( agent a,numeric message1, numeric message2)
{
  _caos {
    .targ < $a {
      CLAC $message1(r) $message2(r) -1;
    };
  };
}
/**
MOPX
*/
define mouseX() returning numeric
{
  _caos {
    .inline let $return = MOPX;
  };
}
/**
MOPY
*/
define mouseY() returning numeric
{
  _caos {
    .inline let $return = MOPY;
  };
}
/**
MOVX
*/

define mouseXVelocity() returning numeric
{
  _caos {
    .inline let $return = MOVX;
  };
}
/**
MOVY
*/
define mouseYVelocity() returning numeric
{
  _caos {
    .inline let $return = MOVY;
  };
}

// Input Event Mask


define numeric IMSK_RAWKEYDOWN = 1;
define numeric IMSK_RAWKEYUP = 2;
define numeric IMSK_RAWMOUSEMOVE = 4;
define numeric IMSK_RAWMOUSEDOWN = 8;
define numeric IMSK_RAWMOUSEUP = 16;
define numeric IMSK_RAWMOUSEWHEEL = 32;
define numeric IMSK_RAWTRANSLATEDCHAR = 64;

/**
IMSK
*/
define  set inputEventMask(numeric mask, agent a)
{
  _caos {
    .targ < $a {
      IMSK $mask(r);
    };
  };
}

/**
KEYD
*/
// Keyboard functions
define isKeyDown(numeric KEYCODE) returning numeric
{
  _caos {
    .inline let $return = KEYD $KEYCODE(r);
  };
}

/* Physics functions */

// Acceleration due to gravity
/**
ACCG
*/
define  set acceleration(numeric accelerationDueToGravity, agent a)
{
  _caos {
    .targ < $a {
      ACCG $accelerationDueToGravity(r);
    };
  };
}
/**
ACCG returning
*/
define acceleration(agent a) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = ACCG;
    };
  };
}

// Angular Damping Factor
/**
ADMP
*/
define set angularDamping(numeric dampingFactor, agent a)
{
  _caos {
    .targ < $a {
      ADMP $dampingFactor(r);
    };
  };
}
/**
ADMP returning
*/
define angularDamping(agent a) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = ADMP;
    };
  };
}

// Aerodynamic Factor
/**
AERO
*/
define set  aerodynamics(numeric aerodynamicFactor, agent a)
{
  _caos {
    .targ < $a {
      AERO $aerodynamicFactor(r);
    };
  };
}
/**
AERO returning
*/
define aerodynamics(agent a) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = AERO;
    };
  };
}

// Angular Velocity
/**
AVEL
*/
define  set angularVelocity(numeric angle, agent a)
{
  _caos {
    .targ < $a {
      AVEL $angle(r);
    };
  };
}
/**
AVEL returning
*/
define angularVelocity(agent a) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = AVEL;
    };
  };
}

// Elasticity
/**
ELAS
*/
define set elasticity(numeric Elasticity, agent a)
{
  _caos {
    .targ < $a {
      ELAS $Elasticity(r);
    };
  };
}
/**
ELAS returning
*/
define elasticity(agent a) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = ELAS;
    };
  };
}

// Falling?
/**
FALL
*/
define isFalling(agent a) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = FALL;
    };
  };
}

// Forward Damping Factor
/**
FDMP
*/
define  set forwardDamping(numeric dampingFactor, agent a)
{
  _caos {
    .targ < $a {
      FDMP $dampingFactor(r);
    };
  };
}
/**
FDMP returning
*/
define forwardDamping(agent a) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = FDMP;
    };
  };
}

// Friction percentage
/**
FRIC
*/
define set friction(numeric friction, agent a)
{
  _caos {
    .targ < $a {
      FRIC $friction(r);
    };
  };
}
/**
FRIC returning
*/
define friction(agent a) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = FRIC;
    };
  };
}

// Forward Velocity
/**
FEVL
*/
define set  forwardVelocity(numeric velocity, agent a)
{
  _caos {
    .targ < $a {
      FVEL $velocity(r);
    };
  };
}
/**
FEVL returning
*/
define forwardVelocity(agent a) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = FVEL;
    };
  };
}
/**
MOVS
*/
// Get movement status
define movementStatus(agent a) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = MOVS;
    };
  };
}
/**
SDMP
*/
// Sideways damping factor
define set  sideDamping(numeric dampingFactor, agent a)
{
  _caos {
    .targ < $a {
      SDMP $dampingFactor(r);
    };
  };
}
/**
SDMP returning
*/
define sideDamping(agent a) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = SDMP;
    };
  };
}
/**
SVEL
*/
// Sideways velocity
define set sideVelocity(numeric velocity, agent a)
{
  _caos {
    .targ < $a {
      SVEL $velocity(r);
    };
  };
}
/**
SVEL returning
*/
define sideVelocity(agent a) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = SVEL;
    };
  };
}
/**
VELO
*/
// Velocity
define velocity( agent a,numeric x, numeric y)
{
  _caos {
    .targ < $a {
      VELO $x(r) $y(r);
    };
  };
}
/**
VELX
*/

define XVelocity(agent a) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = VELX;
    };
  };
}
/**
VELY
*/
define YVelocity(agent a) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = VELY;
    };
  };
}

/* Script-related Functions */
define numeric JECT_REMOVESCRIPT = 1;
define numeric JECT_EVENTSCRIPTS = 2;
define numeric JECT_INSTALLSCRIPT = 4;
define numeric JECT_ALLSCRIPTS = JECT_REMOVESCRIPT | JECT_EVENTSCRIPTS | JECT_INSTALLSCRIPT;
/**
JECT
*/
define injectScript(string cosfile, numeric flags)
{
  _caos {
    JECT $cosfile(r) $flags(r);
  };
}

define injectScript(string cosfile)
{
  injectScript(cosfile, JECT_ALLSCRIPTS);
}
/**
WAIT
*/
// Breaks SLOW, probably shouldn't be used.
define wait(numeric ticks)
{
  _caos {
    WAIT $ticks(r);
  };
}
/**
CALL
*/
define callEvent(numeric eventNumber, void param1, void param2)
{
  _caos {
    CALL $eventNumber(r) $param1(r) $param2(r);
  };
}
/* Sound-related Functions */
/**
SEZZ
*/
// Speach sounds
define say(string text, agent a)
{
  _caos {
    .targ < $a {
      SEZZ $text(r);
    };
  };
}
/**
VOIS
*/
define Voice(string voiceName, agent a)
{
  _caos {
    .targ < $a {
      VOIS $voiceName(r);
    };
  }
}
/**
VOIC
*/
define setVoiceToCreatureVoice( agent a,numeric genus, numeric gender, numeric age)
{
  _caos {
    .targ < $a {
      VOIC $genus(r) $gender(r) $age(r);
    };
  }
}
/**
SNDE
*/
// Normal sounds (emitted from current location)
define playSound(string soundFile, agent a)
{
  _caos {
    .targ < $a {
      SNDE $soundFile(r);
    };
  };
}
/**
SNQ
*/
define playSoundWithDelay(agent a,string soundFile, numeric delay )
{
  _caos {
    .targ < $a {
      SNDQ $soundFile(r) $delay(r);
    };
  };
}
/**
SNDC
*/
// Controlled sounds (emited from agent)
define playControlledSound(string soundFile, agent a)
{
  _caos {
    .targ < $a {
      SNDC $soundFile(r);
    };
  };
}
/**
SNDL
*/
define playLoopedControlledSound(string soundFile, agent a)
{
  _caos {
    .targ < $a {
      SNDL $soundFile(r);
    };
  };
}
/**
FADE
*/
define fadeControlledSound(agent a)
{
  _caos {
    .targ < $a {
      FADE;
    };
  };
}
/**
STPC
*/
define stopControlledSound(agent a)
{
  _caos {
    .targ < $a {
      STPC;
    };
  }
}
/**
VOLM
*/
// Volume-related functions
define setVolume(numeric channel, numeric volume)
{
  _caos {
    VOLM $channel(r) $volume(r);
  };
}
/**
VOLM returning
*/
define getVolume(numeric channel) returning numeric
{
  _caos {
    .inline let $return = VOLM $channel(r);
  };
}
/**
ABSV returning
*/
/* Math-related Functions */
define getAbsolute(numeric number) returning numeric
{
  _caos {
    .inline let $return = ABSV $number(r);
  };
}
/**
ACOS returning
*/
// Trigonometric Functions
define getArccos(numeric number) returning numeric
{
  _caos {
    .inline let $return = ACOS $number(r);
  };
}
/**
ASIN returning
*/
define getArcsin(numeric number) returning numeric
{
  _caos {
    .inline let $return = ASIN $number(r);
  };
}
/**
ATAN returning
*/
define getArctan(numeric number) returning numeric
{
  _caos {
    .inline let $return = ATAN $number(r);
  };
}
/**
COS_ returning
*/
define getCosine(numeric number) returning numeric
{
  _caos {
    .inline let $return = COS_ $number(r);
  };
}
/**
SIN_ returning
*/
define getSine(numeric number) returning numeric
{
  _caos {
    .inline let $return = SIN_ $number(r);
  };
}
/**
TAN_ returning
*/
define getTangent(numeric number) returning numeric
{
  _caos {
    .inline let $return = TAN_ $number(r);
  };
}
/**
FTOI returning
*/
// Conversion Functions
define floatToInt(numeric number) returning numeric
{
  _caos {
    .inline let $return = FTOI $number(r);
  };
}
/**
ITOF returning
*/
define IntToFloat(numeric number) returning numeric
{
  _caos {
    .inline let $return = ITOF $number(r);
  };
}
/**
STOF returning
*/
define StrToFloat(string number) returning numeric
{
  _caos {
    .inline let $return = STOF $number(r);
  };
}
/**
STOI returning
*/
define StrToInt(string number) returning numeric
{
  _caos {
    .inline let $return = STOI $number(r);
  };
}
/**
VTOS returning
*/
define NumToStr(numeric number) returning string
{
  _caos {
    .inline let $return = VTOS $number(r);
  };
}
/**
NEGV returning
*/
// Misc maths functions
define getInverse(numeric number) returning numeric
{
  _caos {
    .inline let $return = NEGV $number(r);
  };
}
/**
RAND 
*/
define getRandom(numeric startValue, numeric endValue) returning numeric
{
  _caos {
    .inline let $return = RAND $startValue(r) $endValue(r);
  };
}
/**
CHAR returning
*/
/* String Functions */
// Character functions
define getChar(string inputString, numeric index) returning numeric
{
  _caos {
    .inline let $return = CHAR $inputString(r) $index(r);
  };
}
/**
CAHR
*/
define setChar(string inputString, numeric index, numeric character)
{
  _caos {
    CHAR $inputString(rw) $index(r);
  };
}
/**
UPPA returning
*/
// Upper/Lower case
define toUpper(string input) returning string
{
  _caos {
    .inline let $return = UPPA $input(r);
  };
}
/**
LOWA returning
*/
define toLower(string input) returning string
{
  _caos {
    .inline let $return = LOWA $input(r);
  };
}

// Substring functions
/**
SINS returning
*/
define findSubstring(string input, numeric index, string search) returning numeric
{
  _caos {
    .inline let $return = SINS $input(r) $index(r) $search(r);
  };
}
/**
SUBS returning
*/
define getSubstring(string value, numeric start, numeric count) returning string
{
  _caos {
    .inline let $return = SUBS $value(r) $start(r) $count(r);
  };
}
/**
UFOS returning
*/
/* Informational Functions */
define getSystemInfo() returning string
{
  _caos {
    .inline let $return = UFOS;
  };
}
/**
VMJR returning
*/
define getMajorVersion() returning string
{
  _caos {
    .inline let $return = VMJR;
  };
}
/**
VMNR returning
*/
define getMinorVersion() returning string
{
  _caos {
    .inline let $return = VMNR;
  };
}

/* World Functions */
/**
LOAD
*/
// Loading/Saving
define loadWorld(string worldname)
{
  _caos {
    LOAD $worldname(r);
  };
}
/**
SAVE
*/
define saveWorld(string worldname)
{
  _caos {
    SAVE $worldname(r);
  };
}
/**
INST SAVE QUIT
*/
define quit(string worldname)
{
  _caos {
    INST;
    SAVE;
    QUIT;
  };
}
/**
WRLD
*/
// World Management
define createWorld(string worldname)
{
  _caos {
    WRLD $worldname(r);
  };
}
/**
DELW
*/
define deleteWorld(string worldname)
{
  _caos {
    DELW $worldname(r);
  };
}
/**
NWLD returning
*/
define getNumberOfWorlds() returning numeric
{
  _caos {
    .inline let $return = NWLD;
  };
}
/**
WNAM returning
*/
define getCurrentWorldName() returning string
{
  _caos {
    .inline let $return = WNAM;
  };
}
/**
WNIT returning
*/
define getWorldIndex(string worldName) returning numeric
{
  _caos {
    .inline let $return = WNTI $worldName(r);
  };
}
/**
WLRD returning
*/
define getWorldName(numeric worldIndex) returning string
{
  _caos {
    .inline let $return = WRLD $worldIndex(r);
  };
}
/**
PSWD 
*/
// Passwording
define setNextWorldPassword(string password)
{
  _caos {
    PSWD $password(r);
  };
}
/**
PSWD returning
*/
define getPassword(string worldName) returning string
{
  _caos {
    .inline let $return = PSWD $worldName(r);
  };
}

/* Agent Functions */
/**
CARR returning
*/ 
// Holding functions
define heldBy(agent a) returning agent
{
  _caos {
    .targ < $a
    {
      .inline let $return = CARR;
    };
  };
}
/**
HELD returning
*/
define holding(agent a) returning agent
{
  _caos {
    .targ < $a
    {
      .inline let $return = HELD;
    };
  };
}
/**
DROP
*/
define drop(agent a)
{
  _caos {
    .targ < $a
      {
        DROP;
      };
  };
}
/**
BASE returning
*/
// Image-related functions
define baseIndex(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = BASE;
    };
  };
}
/**
BASE
*/
define set  baseIndex(numeric index, agent a)
{
  _caos {
    .targ < $a
    {
      BASE $index(r);
    };
  };
}
/**
GALL returning
*/
define spriteGallery(agent a) returning string
{
  _caos {
    .targ < $a
    {
      .inline let $return = GALL;
    };
  };
}
/**
GALL
*/
define set spriteGallery(agent a,string spriteFile, numeric firstImage )
{
  _caos {
    .targ < $a
    {
      GALL $spriteFile(r) $firstImage(r);
    };
  };
}
/**
ANMS
*/
define set animate(string poseList, agent a)
{
  _caos {
    .targ < $a
    {
      ANMS $poseList(r);
    };
  };
}

/**
MIRA returning
*/
define mirror(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = MIRA;
    };
  };
}

/**
MIRA
*/
define  set mirror(numeric mirror, agent a)
{
  _caos {
    .targ < $a
    {
      MIRA $mirror(r);
    };
  };
}
/**
VISI
*/
define isVisible(numeric checkAllCameras, agent a)
{
_caos {
    .targ < $a
    {
      VISI $checkAllCameras(r);
    };
  };
}
/**
SHOW
*/
define  set visible(numeric visible, agent a)
{
_caos {
    .targ < $a
    {
      SHOW $visible(r);
    };
  };
}
/**
GNUS returning
*/
// Classification functions
define genus(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = GNUS;
    };
  };
}
/**
FMLY returning
*/
define family(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = FMLY;
    };
  };
}
/**
SPC returning
*/
define species(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = SPCS;
    };
  };
}
/**
MESG WRT+
*/
define sendMessage( agent a,numeric messageID, void param1, void param2, numeric delay)
{
  _caos {
    MESG WRT+ $a(r) $messageID(r) $param1(r) $param2(r) $delay(r);
  };
}

define sendMessage(agent a,numeric messageID, void param1, void param2 )
{
  sendMessage(messageID, param1, param2, 0, a);
}

define sendMessage( agent a,numeric messageID)
{
  sendMessage(messageID, 0, 0, 0, a);
}

/* Creatures-related Functions */
/**
CAGE
*/
// Ageing
define  age(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = CAGE;
    };
  };
}
/**
AGES
*/
// You can only set a lifestage that your creature hasn't achieved yet.
define  set age(numeric lifestage, agent a)
{
  numeric lifestages = lifestage - age(a);
  if (lifestages < 0) {
    return;
  }
  _caos {
    .targ < $a
    {
      AGES $lifestages(r);
    };
  };
}
/**
TAGE returning
*/
define ageInTicks(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = TAGE;
    };
  };
}
/**
ASLP returning
*/
// Sleeping
define  sleeping(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = ASLP;
    };
  };
}
/**
ASLP
*/
define set sleeping(numeric asleep, agent a)
{
  _caos {
    .targ < $a
    {
      ASLP $asleep(r);
    };
  };
}
/**
DREA returning
*/
define  dreaming(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = DREA;
    };
  };
}
/**
DREA returning
*/
define set dreaming(numeric dream, agent a)
{
  _caos {
    .targ < $a
    {
      DREA $dream(r);
    };
  };
}
/**
UNCS returning
*/
define  unconscious(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = UNCS;
    };
  };
}
/**
UNCS
*/
define set unconscious(numeric unconscious, agent a)
{
  _caos {
    .targ < $a
    {
      UNCS $unconscious(r);
    };
  };
}

// Birth/Mate/Death
/**
BORN
*/
define hatch(agent a)
{
  _caos {
    .targ < $a
    {
      BORN;
    };
  };
}
/**
MATE
*/
define mate(agent a)
{
  _caos {
    .targ < $a
    {
      MATE;
    };
  };
}
/**
DEAD
*/
define die(agent a)
{
  _caos {
    .targ < $a
    {
      DEAD;
    };
  };
}
/**
DEAD returning
*/
define isDead(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = DEAD;
    };
  };
}

// Brain/Blood
/**
DRIV returning
*/
define  driveLevel(numeric drive, agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = DRIV $drive(r);
    };
  };
}
/**
DRIV
*/
define set driveLevel(numeric drive, numeric amount, agent a)
{
  numeric adjustment = amount - driveLevel(drive, a);
  _caos {
    .targ < $a
    {
      DRIV $drive(r) $adjustment(r);
    };
  };
}
/**
DRV! returning
*/
define highestDrive(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = DRV!;
    };
  };
}
/**
CHEM returning
*/
define   bloodConcentration(numeric chemical, agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = CHEM $chemical(r);
    };
  };
}
/**
CHEM
*/
define set bloodConcentration(agent a,numeric chemical, numeric amount)
{
  numeric adjustment = amount - bloodConcentration(chemical, a);
  _caos {
    .targ < $a
    {
      CHEM $chemical(r) $adjustment(r);
    };
  };
}
/**
MIND returning
*/
define  canThink(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = MIND;
    };
  };
}
/**
MIND
*/
define set canThink(numeric state, agent a)
{
  _caos {
    .targ < $a
    {
      MIND $state(r);
    };
  };
}
/**
ZMD returning
*/
define   isZombie(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = ZOMB;
    };
  };
}
/**
ZOMB
*/
define set isZombie(numeric state, agent a)
{
  _caos {
    .targ < $a
    {
      ZOMB $state(r);
    };
  };
}

// Organs
/**
ORGF returning
*/
define organDataFloat(agent a,numeric organNumber, numeric data ) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = ORGF $organNumber(r) $data(r);
    };
  };
}
/**
ORGI returning
*/
define organDataInt( agent a,numeric organNumber, numeric data) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = ORGI $organNumber(r) $data(r);
    };
  };
}
/**
ORGN returning
*/
define numberOfOrgans(agent a) returning numeric
{
  _caos {
    .targ < $a
    {
      .inline let $return = ORGN;
    };
  };
}
/**
INJR 
*/
define injure( agent a,numeric organ, numeric amount)
{
  _caos {
    .targ < $a
    {
      INJR $organ(r) $amount(r);
    };
  };
}

// Misc
/**
CREA returning
*/
define isCreature(agent a) returning numeric
{
  _caos {
    .inline let $return = CREA $a(r);
  };
}
/**
MVFT
*/
define moveFeet(agent a,numeric x, numeric y)
{
  _caos {
    .targ < $a
    {
      MVFT $x(r) $y(r);
    };
  };
}
