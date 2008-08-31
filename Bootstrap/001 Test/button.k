/**
 

    Script: buttons
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815

   
  
 * -----------------------------------------------------------------------------
 * Agent  : F_INVISIBLE,G_SYSTEM,S_BACKTOASTART
 * Sprites: buttons  1
 * -----------------------------------------------------------------------------
  
 * -----------------------------------------------------------------------------
 * Agent  : F_INVISIBLE,G_SYSTEM, S_MONITORBUTTON
 * Sprites: buttons 2
 * -----------------------------------------------------------------------------
   
 * -----------------------------------------------------------------------------
 * Agent  : F_INVISIBLE,G_SYSTEM, S_INJECTBUTTON
 * Sprites: buttons 3
 * -----------------------------------------------------------------------------
 */

install {
        agent backtostart;
        backtostart = newsimple(F_INVISIBLE,G_SYSTEM,S_BACKTOASTART, "buttons", 1, 0, 100);
        backtostart.attributes =  A_ACTIVATEABLE;
        backtostart.clickAction = 0;
        move(backtostart, 1210, 850);
}
install {
        agent monitorb = newsimple(F_INVISIBLE,G_SYSTEM,S_MONITORBUTTON, "buttons", 3, 1, 100);
        monitorb.attributes =  A_ACTIVATEABLE;
        monitorb.clickAction = 0;
        move(monitorb, 1210 ,770);
}
install {
        agent injectb = newsimple(F_INVISIBLE,G_SYSTEM,S_INJECTBUTTON, "buttons", 3, 2, 100);
        injectb.attributes =  A_ACTIVATEABLE;
        injectb.clickAction = 0;
        move(injectb, 1210 , 810);
}
script ( F_INVISIBLE,G_SYSTEM,S_BACKTOASTART, 1){
	agent backtostart = randomagent(F_INVISIBLE,G_SYSTEM,S_BACKTOASTART);
	backtostart.clickAction=0;
	moveCamera (1600,300,0);
}
script ( F_INVISIBLE,G_SYSTEM,S_MONITORBUTTON, 1) {
    owner.clickAction=1;
	agent monitor=randomagent(F_INVISIBLE, G_SYSTEM, S_SIMPLEMONITOR)
    monitor.floatat(30, 860);
    monitor.tick=2;
    
}
script ( F_INVISIBLE,G_SYSTEM,S_MONITORBUTTON, 2) {
	owner.clickAction=0;
	agent monitor=randomagent(F_INVISIBLE, G_SYSTEM, S_SIMPLEMONITOR)
    monitor.floatat(-1000,-1000);
    monitor.tick=0;
    monitor.clickAction=0;
}



remove {
     enum (F_INVISIBLE,G_SYSTEM,S_BACKTOASTART) {|foo| foo.kill(); }
     enum (F_INVISIBLE,G_SYSTEM,S_MONITORBUTTON) {|foo| foo.kill(); }
     enum (F_INVISIBLE,G_SYSTEM,S_INJECTBUTTON) {|foo| foo.kill(); }
   
  	// Zap the scripts.
	deletescript(F_INVISIBLE,G_SYSTEM,S_BACKTOASTART,1);
	//deletescript(F_INVISIBLE,G_SYSTEM,S_INJECTBUTTON,1);
	deletescript(F_INVISIBLE,G_SYSTEM,S_MONITORBUTTON,1);
	deletescript(F_INVISIBLE,G_SYSTEM,S_MONITORBUTTON,2);
}

