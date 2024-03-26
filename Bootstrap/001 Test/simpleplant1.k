
/**


  program: simpleplant
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815
    
    	 git://github.com/august0815/lifandi_demo1.git
 
 
  
 * -----------------------------------------------------------------------------
 * Agent  : F_VISIBLE1, G_GOODPLANT, S_SIMPLEPLANT
 * Sprites: simple plant
 * -----------------------------------------------------------------------------
 */




ovar numeric ageplant[0];
ovar numeric delay[90];
ovar numeric growend[89];
install { numeric plants=5; 
 do {
    numeric ticker=0;
    numeric x=0;
        agent simpleplant;
      	simpleplant = newsimple ( F_VISIBLE1, G_GOODPLANT, S_SIMPLEPLANT, "simple plant", 15,0 ,140);
      	simpleplant.attributes = 192;
        //simpleplant.behaviour = 1;
        simpleplant.elasticity = 0;
        ticker = getRandom(3, 5);
        simpleplant.tick = ticker;
        x= getRandom(500, 960);
        move(simpleplant,x,300);
        simpleplant.ageplant=0;
        simpleplant.delay = 1;
        simpleplant.growend=0;
        plants=plants-1;
    } until (plants==0);
}
/**
Function: script
 9 : Timer change pose in order of lifestage 
 */
script ( F_VISIBLE1, G_GOODPLANT, S_SIMPLEPLANT, 9) {
	agent s;
	numeric poss;
	numeric temp;
	s=owner;
    if (s.ageplant==0)	{
       	 poss=s.posenr ;
    	 if (poss<14) { poss=poss+1;s.pose = poss;}
		 else  {s.growend=s.growend+1;} 
		temp=s.growend;
		if (temp==50) {s.ageplant=1;s.tick = s.delay;}
	 	 }
	else  {	
		poss=s.posenr;	
		if (poss>0) {poss=poss-1;
					if (poss<0) {poss=0;}
	 		  		owner.pose = poss;}
		else {owner.ageplant=0;	owner.growend=0; owner.delay=1 ;s.tick=1;}
	}
 }
 

remove {
     enum ( F_VISIBLE1, G_GOODPLANT, S_SIMPLEPLANT) {|p| p.kill();}
         
	// Zap the scripts.
	deletescript( F_VISIBLE1, G_GOODPLANT, S_SIMPLEPLANT,9);
	
}

