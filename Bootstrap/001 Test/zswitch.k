/**
 

    Script: swichtodemo
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815

   
  
 * -----------------------------------------------------------------------------
 * Agent  : F_VISIBLE1,G_GUI,S_SWITCH
 * Sprites: demo1
 * -----------------------------------------------------------------------------
 
 */
 ovar numeric fade[74];
/**INST LOCK TICK 0*/
define pre()
{  _caos { INST; LOCK; TICK 0;  };}
/**
QUIT KILL OWNER
*/
define end()
{  _caos { QUIT;KILL OWNR;  };}
install {
        agent switch = newcompound(F_VISIBLE1,G_GUI,S_SWITCH, "buttons", 7, 0, 10);
        switch.changepart(-1);
        alpha(256,1);
        switch.changepart(0);
        switch.pose=0;
        switch.newbutton(2, "demo1", 3, 2, 80, 300,  0 ,"[1]", 2001, 1);
        switch.newbutton(3 ,"demo1", 5, 2, 340, 300 , 0 ,"[1]", 500, 1);
        switch.newtextpart(4, "demo1", 7, 25, 80,  0, "blackontransparentchars");
        switch.changepart(4);
        switch.textformat(0, 0, 0, 0, 2, 0, 2);
        string ausgabe="**Welcome to the Demo of lifandi , an open source community game.*** 		 *******For more information see http://lifandi.ccdevnet.org .*****	    This demo is very simple demo , klick on 'ok' to get to the demoworld screen .***	            ." ;
        switch.parttext=ausgabe;
        switch.fade=0;
        move(switch, 1400, 100);
        switch.tick=100;
        switch.simpMessage(2000,0,0);
		switch.tick=40;
        //switch.simpMessage(500,0,0);
        
      
}
script (F_VISIBLE1,G_GUI,S_SWITCH, 2000) {
    pre;
    do {
    _caos{LOCK;}
    owner.changepart(-1);
    numeric lp=256;
    do {alpha(lp,1);
        wait(0);
        lp=lp-1;}until(lp<0);
    alpha(lp,0);
    owner.fade=1;
    }while (owner.fade==0);
}
script (F_VISIBLE1,G_GUI,S_SWITCH,500) {
 numeric lp=0;
 do {lp=lp+32;
 	owner.changepart(-1);
 	alpha(lp,1);
 	wait(1);
 	} until (lp>256);
 	wait(10);
 	end;
}
script (F_VISIBLE1,G_GUI,S_SWITCH,2001) {
 moveCamera(200,200,0);
}
remove {
     enum (F_VISIBLE1,G_GUI,S_SWITCH) {|foo| foo.kill(); }
     
   
  	// Zap the scripts.
	deletescript(F_VISIBLE1,G_GUI,S_SWITCH,2000);
	deletescript(F_VISIBLE1,G_GUI,S_SWITCH,2001);
	deletescript(F_VISIBLE1,G_GUI,S_SWITCH,500);
	
}
