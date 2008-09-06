/**


    Script: simplecontrol
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815
   * under GNU
 * -----------------------------------------------------------------------------
 * Agent  :F_INVISIBLE,G_SYSTEM,S_LIGHT
 * Sprites: blnk
 * -----------------------------------------------------------------------------
 */


 /**********************************************************************
 *    Demo  Environment         
 ***********************************************************************
 * Light Emitters 
 **********************************************************************/
  /**
ALTR val val val
 */
define altrROOM(numeric room, numeric ca,numeric val)  {

	_caos {	ALTR $room(r) $ca(r) $val(r);
}

}
 // 'Sun'
install {
        agent light;
        light =newsimple(F_INVISIBLE,G_SYSTEM,S_LIGHT, "blnk", 0, 0, 8000);
 		light.dcor = DEBUG;
		light.attributes = A_INVISIBLE;
		light.clickAction = 0;
        move(light, 1190,10);

} 
/***********************************************************************
 * Heat Emitters 
 ***********************************************************************
 * 'Sun'																*/
 install {
        agent heat;
        heat =newsimple(F_INVISIBLE,G_SYSTEM,S_HEAT, "blnk", 0, 0, 8000);
 		heat.dcor = DEBUG;
		heat.attributes = A_INVISIBLE;
		heat.clickAction = 0;
        move(heat, 1190,12);	
}    														

/***********************************************************************
 * Nutrient Emitters 
 ***********************************************************************
 * 'Soil'															*/
 install {
        agent soil;
        soil =newsimple(F_INVISIBLE,G_SYSTEM,S_NUTRIENT, "blnk", 0, 0, 8000);
 		soil.dcor = DEBUG;
		soil.attributes = A_INVISIBLE;
		soil.clickAction = 0;
        move(soil, 530,460);	
}    
/**
Function: script
 1000 : 'Turn on Event'  
 */
script ( F_INVISIBLE,G_SYSTEM,S_LIGHT, 1000) {
	 _caos {
    emit 1 _P1_ ;
  }
}
script ( F_INVISIBLE,G_SYSTEM,S_HEAT, 1000) {
	 _caos {
    emit 2 _P1_ ;
    
  }
	}
script ( F_INVISIBLE,G_SYSTEM,S_NUTRIENT, 1000) {
	altrROOM( 2,4,1);
	altrROOM( 4,4,1);
	altrROOM( 5,4,1);
	altrROOM( 6,4,1);
    _caos{Kill ownr;};
    
}

install {
 //turn all emitters on
 enum (F_INVISIBLE,G_SYSTEM,S_LIGHT) {|light|light. simpMessage(1000,1,0);}
 enum (F_INVISIBLE,G_SYSTEM,S_HEAT) {|heat| heat. simpMessage(1000,0.95,0);}	
 enum (F_INVISIBLE,G_SYSTEM,S_NUTRIENT) {|nutrient| nutrient. simpMessage(1000,1, 0 );} 	
}	


remove {
     enum (F_INVISIBLE,G_SYSTEM,S_NUTRIENT) {|soil| soil.kill();}
     enum (F_INVISIBLE,G_SYSTEM,S_HEAT) {|heat| heat.kill();}
     enum (F_INVISIBLE,G_SYSTEM,S_LIGHT) {|light| light.kill();}
    
	// Zap the scripts.
	deletescript(F_INVISIBLE,G_SYSTEM,S_LIGHT,1000);
	deletescript(F_INVISIBLE,G_SYSTEM,S_HEAT,1000);
	deletescript(F_INVISIBLE,G_SYSTEM,S_NUTRIENT,1000);
}

