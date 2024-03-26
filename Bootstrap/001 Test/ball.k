/**


    Script: simpleball
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815
   * under GNU
     
 * -----------------------------------------------------------------------------
 * Agent  :F_VISIBLE2,G_TOY,S_BALL
 * Sprites: ball
 * -----------------------------------------------------------------------------
 *
 
 * TO DO Music, stimuli
 */
 
script ( F_VISIBLE2,G_TOY,S_BALL, 1) {agent b =owner;
	_caos{inst;};
	//TODO :insert STIM
	numeric velx=getRandom((-15),(15));
 	numeric vely=getRandom((-15),(15));
 	velocity(b, velx,vely);
 	}
script ( F_VISIBLE2,G_TOY,S_BALL, 2) {agent b =owner;
_caos{inst;}
	numeric velx=getRandom((-15),(15));
 	numeric vely=getRandom((-15),(15));
 	velocity(b, velx,vely);
 		}
script ( F_VISIBLE2,G_TOY,S_BALL, 3) {agent b =owner;
_caos{inst;}
	numeric velx=getRandom((-15),(15));
 	numeric vely=getRandom((-15),(15));
 	velocity(b, velx,vely);
 	
	}
script ( F_VISIBLE2,G_TOY,S_BALL, 4) {agent b =owner;
_caos{inst;}
	numeric velx=getRandom((-15),(15));
 	numeric vely=getRandom((-15),(15));
 	velocity(b, velx,vely);
 		}		
