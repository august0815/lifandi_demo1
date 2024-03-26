/**
 

    Script: welcome
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815
    IMPORTANT NOTE: newbutton has still a little bug 
     
  
 * -----------------------------------------------------------------------------
 * Agent  : F_VISIBLE1,G_GUI,S_SWITCH
 * Sprites: demo1
 * -----------------------------------------------------------------------------
 
 */
 ovar numeric fade[74];
/**
INST LOCK TICK 0
*/
define pre()
{  _caos { INST; LOCK; TICK 0;  };}
/**
QUIT KILL OWNER
*/
define end()
{  _caos { QUIT;KILL OWNR;  };}
install {
        agent switch = newcompound(F_VISIBLE1,G_GUI,S_SWITCH, "demo2", 3, 0, 7990);
        switch.attributes = A_INVISIBLE|A_ACTIVATEABLE|A_FLOATABLE;
        switch.changepart(-1);
        alpha(256,1);
        switch.changepart(0);
        switch.pose=0;
        switch.newpart(2,"demo2",1,50,50,0);
        switch.newtextpart(4, "demo2", 2, 60, 80,  0, "blackontransparentchars");
        switch.changepart(4);
        switch.textformat(0, 0, 0, 0, 2, 0, 2);
        switch.newtextpart(5, "demo2", 2,60, 110,  0, "blackontransparentchars");
        switch.changepart(5);
        switch.textformat(0, 0, 0, 0, 2, 0, 2);
        switch.newtextpart(6, "demo2", 2, 60, 140,  0, "blackontransparentchars");
        switch.changepart(6);
        switch.textformat(0, 0, 0, 0, 2, 0, 2);
        switch.newtextpart(7, "demo2", 2, 60,230,  0, "blackontransparentchars");
        switch.changepart(7);
        switch.textformat(0, 0, 0, 0, 2, 0, 2);
        switch.changepart(4);
        string ausgabe="*******Welcome to the Demo of 'lifandi' , for openc2e.*******";
        switch.parttext=ausgabe;
        switch.changepart(5);
        ausgabe="***For more information see http://lifandi.ccdevnet.org .***";
        switch.parttext=ausgabe;
        switch.changepart(6);
        ausgabe="This demo is very simple demo, click to get to the demoworld " ;
        switch.parttext=ausgabe;
        switch.changepart(7);
        ausgabe="Please click " ;
        switch.parttext=ausgabe;
        switch.clickAction=0;
        switch.fade=0;
        switch.floatat(202,1);
        switch.simpMessage(2000,0,0);
       
		switch.simpMessage(500,0,0);
        
      
}
script (F_VISIBLE1,G_GUI,S_SWITCH, 2000) {
    pre;
    if  (owner.fade==0) {
    _caos{LOCK;}
    owner.changepart(-1);
    numeric lp=256;
    do {alpha(lp,1);
        wait(1);
        _caos{inst;};
        lp=lp-10;}until(lp<0);
    alpha(lp,0);
    owner.fade=1;}
   
}
script (F_VISIBLE1,G_GUI,S_SWITCH,500) {
 numeric lp=0;
 do {lp=lp+32;
 	owner.changepart(-1);
 	alpha(lp,1);
 	wait(1);
 	} until (lp>256);
 	wait(10);
 	
 	owner.floatat(-1000,-1000);;
}
script (F_VISIBLE1,G_GUI,S_SWITCH,1) {
 owner.simpMessage(500,0,0);
}
remove {
     enum (F_VISIBLE1,G_GUI,S_SWITCH) {|foo| foo.kill(); }
     
   
  	// Zap the scripts.
	deletescript(F_VISIBLE1,G_GUI,S_SWITCH,1);
	deletescript(F_VISIBLE1,G_GUI,S_SWITCH,2001);
	deletescript(F_VISIBLE1,G_GUI,S_SWITCH,500);
	
}
