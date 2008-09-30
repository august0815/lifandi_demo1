/**


  program: simpletest1
    ___________________________________________________________________________

    Version 0.01

    Copyright (C) 2008 august0815
    
    	 git://github.com/august0815/lifandi_demo1.git
 
 
  
 * -----------------------------------------------------------------------------
 * Agent  : F_INVISIBLE,G_SYSTEM,S_TEST1 (1 1 253)
 * Sprites: tool
 * -----------------------------------------------------------------------------
 * 
 */
ovar numeric lauf[99];
ovar numeric d[98];


 install {string el;numeric ele;
       
        agent a = newcompound( F_INVISIBLE,G_SYSTEM,S_TEST1, "tool", 6, 0, 8100);
        a.attributes = A_CAMERASHY|A_FLOATABLE|A_INVISIBLE;
        alpha(175,1);
        a.floatat(-1000, -1000);
        a.newtextpart(1,"tool",1,25,10,1,"blackontransparentchars");
        a.changepart(1);
        a.textformat( 6, 6, 6, 6, 1, 1, 2);
        a.parttext="FLORA";
       	a.newtextpart(2,"tool",2,5,75,1,"blackontransparentchars");
       	a.changepart(2);
       	a.textformat( 6, 6, 6, 6, 1, 1, 2);
       	a.parttext="PLANT 1";
       	
       	a.newtextpart(3,"tool",2,5,105,1,"blackontransparentchars");
       	a.changepart(3);
       	a.textformat( 6, 6, 6, 6, 1, 1, 2);
       	a.parttext="SHOOTER";
       	// Insert more 
       	a.newtextinputpart(11,"tool",5,110,75,1,2011,"blackontransparentchars");
       	a.changepart(11);
       	//a.setfocus();
       	a.textformat( 6, 6, 6, 6, 1, 1, 2);
       	a.parttext="";
       
       	a.newtextpart(12,"tool",4,160,75,  1,"blackontransparentchars");
        a.changepart(12);
       	a.textformat( 6, 6, 6, 6, 1, 1, 2);
        a.parttext=NumToStr(a.gamevarn("plant1_max"));
        a.newtextinputpart(13,"tool",5,110,105,1,2010,"blackontransparentchars");
       	a.changepart(13);
       	//a.setfocus();
       	a.textformat( 6, 6, 6, 6, 1, 1, 2);
       	a.parttext="";
       	
       	a.newtextpart(14,"tool",4,160,105,1,"blackontransparentchars");
       	a.changepart(14);
       	a.textformat( 6, 6, 6, 6, 1, 1, 2);
        a.parttext=NumToStr(a.gamevarn("shooter_max"));
       	
       	//Insert more
        }
        
script (  F_INVISIBLE,G_SYSTEM,S_TEST1, 2000) {agent a=owner;
  if(param1n==1){a.floatat(1,300);}
  if(param1n==0){a.floatat(-1000, -1000);}
  }  
script (  F_INVISIBLE,G_SYSTEM,S_TEST1, 2002) {agent a=owner;
  injectScript("shooter.k.cos",JECT_ALLSCRIPTS );
  
  }  
script (  F_INVISIBLE,G_SYSTEM,S_TEST1, 2001) {agent a=owner;

  injectScript("simpleplant1.k.cos", JECT_ALLSCRIPTS );
  
  }  
  
script (  F_INVISIBLE,G_SYSTEM,S_TEST1, 2003) {agent a=owner; 
  enum (F_VISIBLE2,G_GOODPLANT,S_SHOOTER) {|p| p.kill();}
  }
  
script (  F_INVISIBLE,G_SYSTEM,S_TEST1, 2010) {agent a=owner;string ein;numeric wert;
  a.changepart(13);
  ein=a.parttext;wert=StrToInt(ein);
  if (wert<0 || wert>255) {ein="";wert=0;}
  a.parttext="";
  a.changepart(14);a.parttext=NumToStr(wert);
  gamevarn("shooter_max")=wert;
  
  }  
   
script (  F_INVISIBLE,G_SYSTEM,S_TEST1, 2011) {agent a=owner;string ein;numeric wert;
  a.changepart(11);
  ein=a.parttext;wert=StrToInt(ein);
  if (wert<0 || wert>255) {ein="";wert=0;}
  a.parttext="";
  a.changepart(12);a.parttext=NumToStr(wert);
  gamevarn("plant1_max")=wert;
  
  }  
remove {
     enum ( F_INVISIBLE,G_SYSTEM,S_TEST1) {|p| p.kill();}
         
	// Zap the scripts.
	deletescript(  F_INVISIBLE,G_SYSTEM,S_TEST1,2000);
}     
