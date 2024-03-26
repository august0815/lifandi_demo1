/**


    Script: simplebubletoy
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815
   * under GNU
     
 * -----------------------------------------------------------------------------
 * Agent  :F_VISIBLE2,G_TOY,S_BALOON
 * Sprites: baloon
 * -----------------------------------------------------------------------------

 
 * TO DO Music, stimuli
 */
 /*
  * MESG WRIT 
 */
define sendMessagetoAgent(agent a, numeric msgno) {
	_caos {
		MESG WRIT $a(r) $msgno(r);
	}
}

script ( F_VISIBLE2,G_TOY,S_BALOON, 1) {agent b =owner;
	_caos{inst;};
	//TODO :insert STIM
	numeric velx=getRandom((-5),(5));
 	numeric vely=getRandom((-5),(5));
 	velocity(b, velx,vely);
 	numeric pop=getRandom(0,10);
 	if (pop==0) {sendMessagetoAgent(b,1000);}
	}
script ( F_VISIBLE2,G_TOY,S_BALOON, 2) {agent b =owner;
_caos{inst;}
	numeric velx=getRandom((-5),(5));
 	numeric vely=getRandom((-5),(5));
 	velocity(b, velx,vely);
 	numeric pop=getRandom(0,10);
 	if (pop==0) {sendMessagetoAgent(b,1000);}
	}
script ( F_VISIBLE2,G_TOY,S_BALOON, 3) {agent b =owner;
_caos{inst;}
	numeric velx=getRandom((-5),(5));
 	numeric vely=getRandom((-5),(5));
 	velocity(b, velx,vely);
 	numeric pop=getRandom(0,10);
 	if (pop==0) {sendMessagetoAgent(b,1000);}
	}
script ( F_VISIBLE2,G_TOY,S_BALOON, 4) {agent b =owner;
_caos{inst;}
	numeric velx=getRandom((-5),(5));
 	numeric vely=getRandom((-5),(5));
 	velocity(b, velx,vely);
 	numeric pop=getRandom(0,10);
 	if (pop==0) {sendMessagetoAgent(b,1000);}
	}		


script (F_VISIBLE2,G_TOY,S_BALOON, 9) {agent b =owner;
b.age_of_agent=b.age_of_agent+1;
if (b.age_of_agent>5)  {sendMessagetoAgent(b,1000);}
numeric a=b.acceleration;
a=a+0.1;
b.acceleration=a;
_caos{lock;}

}

script (F_VISIBLE2,G_TOY,S_BALOON, 1000) {agent b =owner;
_caos{lock;}

numeric pos=b.posenr;
if (pos<5){ b.pose=5;}
else if(pos>5 && pos<10) { b.pose=10;}
else if(pos>10 && pos<16) { b.pose=16;}
b.acceleration=10;
wait(5);
owner.kill;}

remove {
     enum ( F_VISIBLE2,G_TOY,S_BALOON) {|p| p.kill();}
         
	// Zap the scripts.
	deletescript( F_VISIBLE2,G_TOY,S_BALOON,9);

}
