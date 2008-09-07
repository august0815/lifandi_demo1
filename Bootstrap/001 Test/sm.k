/**


    Script: simplemachinery
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815
   * under GNU
      IMPORTANT NOTE: newbutton has still a little bug 
   >  simplemachinery.newbutton(1, "machine", 1, 2, 34, 148,  0 ,"[1]", 2001, 1); is compiled to 
   >  PAT: BUTT 1 "machine" 1 2 34 148 0 [1] 2001 1  and not  ..[1] 2001.. remove per hand
  
 * -----------------------------------------------------------------------------
 * Agent  : F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY
 * Sprites: machine,seed,fruit
 * -----------------------------------------------------------------------------
 * Click on the symbol to produce seed of furit...
 */
 
 // Ovxx needed by seed (see shooter.k) 
 ovar numeric heatmin[54];
 ovar numeric watermin[58];
 
install {
        agent simplemachinery;       
      	simplemachinery = newcompound(F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY, "machine", 3,0, 5000);
      	simplemachinery.attributes = 6;
      	simplemachinery.dcor = DEBUG;
        simplemachinery.tick = 1;
        simplemachinery.newbutton(1, "machine", 1, 2, 34, 148,  0 ,"[1]", 2001, 1);
        simplemachinery.changepart(1);
        simplemachinery.newbutton(2, "machine", 3, 2, 44, 128,  0 ,"[1]", 2002, 1);
        simplemachinery.changepart(2);
        move(simplemachinery,110,660);
		}
 /**
Function: Timmer script  9, Clickevent 2001 Clickevent 2002
 */    
script ( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY, 9) {
}		
script ( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY, 2001) {
									agent seed;
      								seed = newsimple(F_VISIBLE2,G_GOODPLANT,S_SHOOTERSEED, "Seed", 16,3, 5000);
      								seed.attributes = 195;
      								seed.elasticity = 5;	
 									seed.behaviour = 48;
 									move(seed,600,450);
 									seed.heatmin=0.1;
 									seed.watermin=0.3;
 									seed.tick=20;
 									seed.anim(3,4,5,6,7,8,9,10,11,12,255);
 									numeric velx=getRandom((10),(-10));
 									numeric vely=getRandom((-3),(-10));
 									velocity(seed, velx,vely);
}	
script ( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY, 2002) {
									agent seed;
      								seed = newsimple(F_VISIBLE2,G_GOODPLANT,S_TREEFRUIT, "Fruit", 9,0, 5000);
      								seed.attributes = 195;
      								seed.elasticity = 5;	
 									seed.behaviour = 48;
 									numeric px=getRandom(100,900);
 									numeric py=getRandom(50,200);
 									move(seed,px,py);
 									seed.heatmin=0.1;
 									seed.watermin=0.3;
 									seed.tick=20;
 									//seed.anim(3,4,5,6,7,8,9,10,11,12,255);
 									numeric velx=getRandom((10),(-10));
 									numeric vely=getRandom((-3),(-10));
 									velocity(seed, velx,vely);
}
remove {
     enum (F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY) {|p| p.kill();}
         
	// Zap the scripts.
	deletescript( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY,9);
	deletescript( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY,2001);
	deletescript( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY,2002);
}

