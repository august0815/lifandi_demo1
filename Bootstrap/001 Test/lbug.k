/**


  program: simplelightning_bug
    ___________________________________________________________________________

    Version 0.01

    Copyright (C) 2008 august0815
    
    	 git://github.com/august0815/lifandi_demo1.git
 
 
  
 * -----------------------------------------------------------------------------
 * Agent  : F_VISIBLE1,  G_FOOD, S_LBUG
 * Sprites: lightningbug
 * -----------------------------------------------------------------------------
 * born from grub
 * 
 */
 /*  dotimer=getRandom(1,200);numeric dowhat=getRandom(0,100);
  stats : 1 = fly;0=walk;landing=2;starting=3;die=4; 5=held;
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
 */
 ovar numeric walk[40];
 ovar numeric dir[41];// left=-1; right=1;
 ovar numeric dirwall[42];
 ovar numeric fly[43];// fly=1 , walk = 0
 ovar numeric flyorwalklast[44];
 ovar numeric dotimer[45];
 script ( F_VISIBLE1,  G_FOOD, S_LBUG, 9) {agent g=owner;g.age_of_agent=g.age_of_agent+1;g.dotimer=g.dotimer-1;
 print (g.stats);print (g.age_of_agent);
 /* To old */
 if (g.age_of_agent>25) {g.stats=4;}
 /* Oh , in under water */
 numeric room=roomType(roomOfTarg(g));
 if (room==8 || room==9) {g.stats=4;}
 
 numeric fly=getRandom(1,10);
 g.dir=getRandom((-1),1);
 g.fly=getRandom(1,2);
 g.walk=getRandom(1,6);
 wait(getRandom(1,10));
 range(20);
 	if (wallright<20)     {g.dirwall=1;}
 	else if (wallleft<20) {g.dirwall=2;}
 	else {g.dirwall=0;}
 /* New sequens of doing */
 /* if (g.dotimer==0) { g.dotimer=getRandom(1,200);numeric dowhat=getRandom(0,100);
 					if (dowhat>20) {if (g.flyorwalklast==0) {g.stats=0;} }
 					} */
 if (g.stats==0)  { g.acceleration=1;
 					if (g.heldBy==null &&  g.isFalling==0){if (g.dirwall==2) {do {g.walk=g.walk-1;g.baseIndex=g.base1;
 																		g.anim (0,1);velocity(g,(-2),(-1.5));_caos{over;};
 																		g.anim (1,2);velocity(g,(-2),(-1.5));_caos{over;};
 																		g.anim (2,0);velocity(g,(-2),(-1.5));_caos{over;};}
 																		until(g.walk==0);}
 															if (g.dirwall==1) {do {g.walk=g.walk-1;g.baseIndex=g.base2;
 																		g.anim (0,1);velocity(g,(2),(-1.5));_caos{over;};
 																		g.anim (1,2);velocity(g,(2),(-1.5));_caos{over;};
 																		g.anim (2,0);velocity(g,(2),(-1.5));_caos{over;};}
 																		until(g.walk==0);}
 												
 															if (g.dir==(-1)) {do {g.walk=g.walk-1;g.baseIndex=g.base1;
 																		g.anim (0,1);velocity(g,(-2),(-1.5));_caos{over;};
 																		g.anim (1,2);velocity(g,(-2),(-1.5));_caos{over;};
 																		g.anim (2,0);velocity(g,(-2),(-1.5));_caos{over;};}
 																		until(g.walk==0);}
 															if (g.dir==1) {do {g.walk=g.walk-1;g.baseIndex=g.base2;
 																		g.anim (0,1);velocity(g,(2),(-1.5));_caos{over;};
 																		g.anim (1,2);velocity(g,(2),(-1.5));_caos{over;};
 																		g.anim (2,0);velocity(g,(2),(-1.5));_caos{over;};}
 																		until(g.walk==0);}
 																		}
 
 				}
 if (g.stats==1)  {g.acceleration=0.2; if (g.heldBy==null) {if (g.dirwall==2) {do {g.walk=g.walk-1;g.baseIndex=g.base5;
 																		g.anim (0,1);velocity(g,(-2),(-2));_caos{over;};
 																		g.anim (1,1);velocity(g,(-2),(-1.5));_caos{over;};
 																		g.anim (0,1);velocity(g,(-2),(-1));_caos{over;};}
 																		until(g.walk==0);}
 															if (g.dirwall==1) {do {g.walk=g.walk-1;g.baseIndex=g.base6;
 																		g.anim (0,1);velocity(g,(2),(-2));_caos{over;};
 																		g.anim (0,1);velocity(g,(2),(-1.5));_caos{over;};
 																		g.anim (0,1);velocity(g,(2),(-1));_caos{over;};
 																		}until(g.walk==0);}
 												
 															if (g.fly==1) {do {g.walk=g.walk-1;g.baseIndex=g.base5;
 																		g.anim (0,1);velocity(g,(-2),(-2));_caos{over;};
 																		g.anim (0,1);velocity(g,(-2),(-1.5));_caos{over;};
 																		g.anim (0,1);velocity(g,(-2),(-1));_caos{over;};
 																		}until(g.walk==0);}
 															if (g.fly==2) {do {g.walk=g.walk-1;g.baseIndex=g.base6;
 																		g.anim (0,1);velocity(g,(2),(-2));_caos{over;};
 																		g.anim (0,1);velocity(g,(2),(-1.5));_caos{over;};
 																		g.anim (0,1);velocity(g,(2),(-1));_caos{over;};
 								  										}until(g.walk==0);} 	
 															}
 
 				}
 if (g.stats==2)  {
 				}													
 if (g.stats==3)  {
 				}
 if (g.stats==4)  { g.acceleration=5;g.baseIndex=0;g.pose=27;do {room=roomType(roomOfTarg(g));} until ( g.isFalling==0 || room==8 || room==9);
 												 owner.kill;
 				}	
  if (g.stats==5)  {
 				}				
 							
 		}	
 		
script ( F_VISIBLE1,  G_FOOD, S_LBUG, 1) {agent g=owner;numeric;g.stats=4;

}
script ( F_VISIBLE1,  G_FOOD, S_LBUG, 2) {agent g=owner;numeric;g.stats=4;

}	 		
script ( F_VISIBLE1,  G_FOOD, S_LBUG, 4) {agent g=owner;g.baseIndex=22;g.pose=0;numeric zap=getRandom(0,10);
if (zap>3) {g.anim(0,1,2,3,4,5,6,5,0);_caos{over;};
//To Do ZAP the hand! (or the creatures?)
 }

}		
script ( F_VISIBLE1,  G_FOOD, S_LBUG, 5) {agent g=owner;g.acceleration=1;wait(5);g.stats=0;

}		

 	 remove {
     enum (F_VISIBLE1,  G_FOOD, S_LBUG) {|p| p.kill();}
         
	// Zap the scripts.
	deletescript(F_VISIBLE1,  G_FOOD, S_LBUG,9);
	deletescript(F_VISIBLE1,  G_FOOD, S_LBUG,1);
	deletescript(F_VISIBLE1,  G_FOOD, S_LBUG,2);
	deletescript(F_VISIBLE1,  G_FOOD, S_LBUG,4);
	deletescript(F_VISIBLE1,  G_FOOD, S_LBUG,5);
	
}
