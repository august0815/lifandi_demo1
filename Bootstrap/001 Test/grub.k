/**


  program: simplegrub
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815
    
    	 git://github.com/august0815/lifandi_demo1.git
 
 
  
 * -----------------------------------------------------------------------------
 * Agent  : F_VISIBLE1,  G_FOOD, S_GRUB
 * Sprites: grub
 * -----------------------------------------------------------------------------
 * born in nest
 * 
 */
 ovar numeric walk[40];
 ovar numeric dir[41];
 ovar numeric dirwall[42];
 ovar numeric flyorwalk[43];// fly=1 , walk = 0

 script ( F_VISIBLE1,  G_FOOD, S_GRUB, 9) {agent g=owner;
 		g.age_of_agent=g.age_of_agent+1;
  		g.dir=getRandom((-1),1);
 		g.walk=getRandom(1,6);
 		wait(getRandom(1,10));
 		if (wallright<5)     {g.dirwall=1;}
 		else if (wallleft<5) {g.dirwall=2;}
 		else {g.dirwall=0;}
 		if (g.heldBy==null &&  g.isFalling==0) { 	if (g.dirwall==1) {do {g.walk=g.walk-1;
 																		g.anim (0,1);velocity(g,(-2),(-1.5));_caos{over;};
 																		g.anim (1,2);velocity(g,(-2),(-1.5));_caos{over;};
 																		g.anim (2,0);velocity(g,(-2),(-1.5));_caos{over;};}
 																		until(g.walk==0);}
 													if (g.dirwall==2) {do {g.walk=g.walk-1;
 																		g.anim (0,1);velocity(g,(2),(-1.5));_caos{over;};
 																		g.anim (1,2);velocity(g,(2),(-1.5));_caos{over;};
 																		g.anim (2,0);velocity(g,(2),(-1.5));_caos{over;};}
 																		until(g.walk==0);}
 												
 													if (g.dir==(-1)) {do {g.walk=g.walk-1;
 																		g.anim (0,1);velocity(g,(-2),(-1.5));_caos{over;};
 																		g.anim (1,2);velocity(g,(-2),(-1.5));_caos{over;};
 																		g.anim (2,0);velocity(g,(-2),(-1.5));_caos{over;};}
 																		until(g.walk==0);}
 													if (g.dir==1) {do {g.walk=g.walk-1;
 																		g.anim (0,1);velocity(g,(2),(-1.5));_caos{over;};
 																		g.anim (1,2);velocity(g,(2),(-1.5));_caos{over;};
 																		g.anim (2,0);velocity(g,(2),(-1.5));_caos{over;};}
 																		until(g.walk==0);}
 			}
 	/* Need to implement 
 	* oh i am hungry!
 	* eat something , maybe shoterplant? or simpleplant ?
 	* yum , now turn into lightning bug!
 	*/		
 	// 100 only for test
 	if (g.age_of_agent==10) { agent bug = newsimple ( F_VISIBLE1,  G_FOOD, S_LBUG , "lightningbug", 28,0 ,500);
 			numeric px=g.x;numeric py=g.y-35;
 			bug.attributes = A_SUFFERPHYSICS|A_SUFFERCOLLISIONS|A_ACTIVATEABLE|A_MOUSEABLE|A_CARRYABLE;
			bug.behaviour= B_EAT|B_PICKUP|B_HIT| B_ACTIVATE2| B_ACTIVATE1;
       		bug.age_of_agent=0;
       	  	bug.elasticity=10;
       	  	bug.acceleration=1;
	 		bug.perm =45;
	 		bug.friction=99;
	 		bug.aerodynamics=1;
			//growing 0 
       		bug.stats=1;
       		framerate(2);
       		bug.tick=1;
       		bug.walk=0;
       		bug.dir=0;
       		bug.dirwall=0;
       		bug.flyorwalk=0;
       		bug.base0=0;//static
       		bug.base1=4;//walkleft 1 2 3
       		bug.base2=1;//walkright 4 5 6
       		bug.base3=7;//startingright 7 8 9
       		bug.base4=7;// startingleft
       		bug.base5=12;//flightleft
       		bug.base6=10;//flightright
       		bug.base7=16;//turn
       		bug.base8=14;//zap when hit
       		bug.base9=22;// zap when held
       		move(bug, px,py);
 			g.kill;}
 }
 remove {
     enum ( F_VISIBLE1,  G_FOOD, S_GRUB) {|p| p.kill();}
         
	// Zap the scripts.
	deletescript(F_VISIBLE1,  G_FOOD, S_GRUB,9);
	
}
