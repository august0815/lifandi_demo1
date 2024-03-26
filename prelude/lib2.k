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
/**
 
  Function: deletescript
  SCRX fam gen sepc scri
 */
define deletescript(numeric family, numeric genus, numeric species, numeric scriptno) {
	_caos {
		SCRX $family(r) $genus(r) $species(r) $scriptno(r);
	};
}
/*
 * Function: param1
 * _P1_ returning string
 */
define param1() returning string {
	_caos {
		.inline let $return = _P1_;
	};
}
/*
 * Function: param1n
 * _P1_ returning numeric
 */
define param1n() returning numeric {
	_caos {
		.inline let $return = _P1_;
	};
}
/*
 * Function: param2
 * _P2_
 */
define param2() returning agent {
	_caos {
		.inline let $return = _P2_;
	};
}
/*
 * Function: gamevar
 * GAME
 */
define set gamevar(agent val, string varname) {
	_caos {
		SETA GAME $varname(r) $val(r);
	}
}
/*
 * Function: message
 * MESG WRT+
 */
define message(agent a, numeric msgno, string p1, agent p2) {
	_caos {
		MESG WRT+ $a(r) $msgno(r) $p1(r) $p2(r) 0;
	}
}


/*******************************************************************
* by august0815
********************************************************************/
/*
 * Function: posenr
 * POSE 
 */
define  posenr( agent a) returning numeric  {
	_caos {
		.targ < $a {
			.inline let $return = POSE;
		};
	}
}
/*
 * Function: simpMessage
 * MESG WRT+ only with numeric
 */
define simpMessage(agent a, numeric msgno, numeric p1, numeric p2) {
	_caos {
		MESG WRT+ $a(r) $msgno(r) $p1(r) $p2(r) 0;
	}
}
/*
 * Function: getroomid
 * GRAP x y
 */
 define getroomid(numeric x, numeric y) returning numeric
{
  _caos {
    .inline let $return = GRAP $x(r) $y(r);
  };
}
/*
 * Function: setnamevar
 * NAME , sets the NAME variable
 */
define  setnamevar( string s,numeric namev)
{
  _caos {
          SETV NAME $s(r) $namev(r);
      };
}
/**
 * NAME , sets the NAME variable string
 */
define  setnamestring( string s,string namev)
{
  _caos {
          SETS NAME $s(r) $namev(r);
      };
}
/*
 * Function: namevar
 * NAME , gets the NAME variable
 */
define namevar( agent a,string s) returning numeric
{
  _caos {
    .targ < $a {
      .inline let $return = name $s(r);
    };
  };
}/*
 * Function: namevar
 * NAME , gets the NAME variable string 
 */
define namestring( agent a,string s) returning string
{
  _caos {
    .targ < $a {
      .inline let $return = name $s(r);
    };
  };
}
/*
 * Function: addstring
 * ADDS
 */
define addstring(string str, string str1) returning string
{return = str;
  _caos {
   ADDS $return(rw) $str1(r);
  };
} //oder  _caos { ADDS $s1(rw) $s2(r); };return = s1; wichtig ist (rw)
/*
 * Function: returnLocation
 * RLOC
 */
define returnLocation(numeric loc) returning string
{
  _caos {
       .inline let $return = RLOC $loc(r);
    };
  };
/*
 * Function: roomType
 * RTYP
 */
define roomType(numeric room) returning numeric
{
  _caos {
     .inline let $return = RTYP $room(r);
    };
  };

/*
 * Function: caOfRoom
 * PROP
 */
define caOfRoom(numeric room,numeric ca) returning numeric
{
  _caos {
     .inline let $return = PROP $room(r) $ca(r);
    };
  };
/*
 * Function: pointat
 * HOTS 
 */
define  pointat() returning agent
{
      _caos { .static let $return = HOTS; };
};
/**
ALPH
 */
define  alpha(numeric a, numeric val) 
{
	_caos {	ALPH $a(r) $val(r);}
}
/**
PAT: BUTT
 */
define newbutton(agent a, numeric partno, string spritefile, numeric firstframe,numeric frames,numeric x, numeric y, numeric relplane,string anim,numeric mess,numeric option ) {
	_caos {
		.targ < $a {
			PAT: BUTT $partno(r) $spritefile(r) $firstframe(r) $frames(r) $x(r) $y(r) $relplane(r) $anim(r) $mess(r) $option(r);
		};
	}
}
/**
PAT: DULL
 */
define newpart(agent a, numeric partno, string spritefile, numeric firstframe,numeric x, numeric y, numeric relplane ) {
	_caos {
		.targ < $a {
			PAT: DULL $partno(r) $spritefile(r) $firstframe(r) $x(r) $y(r) $relplane(r);
		};
	}
}
/**
 * ROOM
 */
define roomOfTarg(agent a) returning numeric
{
  _caos {
     .inline let $return = ROOM $a(r);
    };
  };
/**
* FRAT
*/

define framerate(numeric rate)
{
  _caos {
    FRAT $rate(r);
  };
}
/** 
 * OBST RGHT
 */
define wallright() returning numeric
{
  _caos {
     .inline let $return = OBST RGHT;
    };
  };
/**
 * OBST RGHT
 */
define wallleft() returning numeric
{
  _caos {
     .inline let $return = OBST LEFT;
    };
  };
/**
RNGE
 */
define  range(numeric see) 
{
	_caos {	RNGE  $see(r);}
}
/**
DBG: OUTV
 */
define  printn(numeric see) 
{
	_caos {	DBG: OUTV $see(r);}
}
/**
DBG: OUTS
 */
define  prints(string see) 
{
	_caos {	DBG: OUTS $see(r);}
}
