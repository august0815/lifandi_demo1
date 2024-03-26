/**


  program: simpledummy
    ___________________________________________________________________________

    Version 0.01

    Copyright (C) 2008 august0815
    
    	 git://github.com/august0815/lifandi_demo1.git
 
 
  
 * -----------------------------------------------------------------------------
 * Agent  : F_INVISIBLE,G_SYSTEM,S_DUMMY (1 1 254)
 * Sprites: dummy
 * -----------------------------------------------------------------------------
 * 
 */
 install {
       
        agent a = newcompound( F_INVISIBLE,G_SYSTEM,S_DUMMY, "dummy", 1, 0, 8100);
        a.attributes = A_CAMERASHY|A_FLOATABLE|A_INVISIBLE;
        a.floatat(-1000, -1000);
        
        
        
        }
        
script (  F_INVISIBLE,G_SYSTEM,S_DUMMY, 2000) {agent a=owner; numeric py=getRandom(400,800);
  if(param1n==1){a.floatat(1,py);}
  if(param1n==0){a.floatat(-1000, -1000);}
  }  
  
remove {
     enum ( F_INVISIBLE,G_SYSTEM,S_DUMMY) {|p| p.kill();}
         
	// Zap the scripts.
	deletescript(  F_INVISIBLE,G_SYSTEM,S_DUMMY,2000);
}     
