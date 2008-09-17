/**


  program: simplenest
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815
    
    	 git://github.com/august0815/lifandi_demo1.git
 
 
  
 * -----------------------------------------------------------------------------
 * Agent  : F_VISIBLE1, G_NEST, S_NEST
 * Sprites: grubnest
 * -----------------------------------------------------------------------------
 * Home of the grub
 * 
 */
 ovar numeric walk[40];
 ovar numeric dir[41];
 ovar numeric dirwall[42];

install { numeric px=200;
		  numeric py=300;
		agent nest = newsimple ( F_VISIBLE1, G_NEST, S_NEST, "grubnest", 7,0 ,1000);
		nest.attributes = 192;
       	nest.age_of_agent=0;
       	//growing 0 
       	nest.stats=1;
       	nest.tick=50;
        move(nest,px,py);
	}
		
script ( F_VISIBLE1, G_NEST, S_NEST, 9) {agent n=owner;n.age_of_agent=n.age_of_agent+n.stats;
		numeric px=n.x+5;numeric py=n.y+5;
		if (n.age_of_agent<0) {n.age_of_agent=0; n.stats=(1);wait(1000);}
		if (n.age_of_agent>7) {n.age_of_agent=7; n.stats=(-1);}
		n.pose=n.age_of_agent;numeric g1=(n.age_of_agent/2)-2; numeric g2= g1*2; if(g1<0) {g1=0;} 
		if (g2<0) {g2=0;}
		numeric g=getRandom(g1,g2);
		do {g=g- 1;
			if ( n.age_of_agent>2){
			agent grub = newsimple ( F_VISIBLE1,  G_FOOD, S_GRUB , "grub", 3,0 ,500);
			grub.attributes = A_SUFFERPHYSICS|A_SUFFERCOLLISIONS|A_MOUSEABLE|A_CARRYABLE;
			grub.behaviour= B_EAT|B_PICKUP;
       		grub.age_of_agent=0;
       	  	grub.elasticity=0.1;
       	  	grub.acceleration=1;
	 		grub.perm =100;
			grub.base0=0;
       		//growing 0 
       		grub.stats=0;
       		framerate(2);
       		grub.tick=1;
       		grub.walk=0;
       		grub.dir=0;
       		grub.dirwall=0;
        	move(grub, px,py);}
		}until(g<0);
		
}		
remove {
     enum ( F_VISIBLE1, G_NEST, S_NEST) {|p| p.kill();}
         
	// Zap the scripts.
	deletescript(F_VISIBLE1, G_NEST, S_NEST,9);
	
}
