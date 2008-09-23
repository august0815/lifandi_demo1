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
 /** 
 * READ
 */
define read(string a,numeric b) returning string
{
  _caos {
     .inline let $return =READ $a(r) $b(r);
    };
  };
   /** 
 * REAN
 */
define rean(string a) returning numeric
{
  _caos {
     .inline let $return =Rean $a(r) ;
    };
  };
 
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
       	a.parttext="SHOOTER";
       	
       	a.newtextpart(3,"tool",2,5,125,1,"blackontransparentchars");
       	a.changepart(3);
       	a.textformat( 6, 6, 6, 6, 1, 1, 2);
       	a.parttext="PLANT1";
       	// Insert more
       	
       	
       	a.newbutton(11, "tool",4,1,115,75,  0 ,"[]", 2001, 1);
       	a.newbutton(12, "tool",3,1,160,75,  0 ,"[]", 2002, 1);
        
        a.newtextpart(13,"tool",5,110,125,1,"blackontransparentchars");
       	a.changepart(13);
       	a.textformat( 6, 6, 6, 6, 1, 1, 2);
       	a.parttext="5";
       	a.newbutton(14, "tool",4,1,160,125,  0 ,"[]", 2003, 1);
       	
       	//Insert more
        }
        
script (  F_INVISIBLE,G_SYSTEM,S_TEST1, 2000) {agent a=owner;
  if(param1n==1){a.floatat(1,300);}
  if(param1n==0){a.floatat(-1000, -1000);}
  }  
script (  F_INVISIBLE,G_SYSTEM,S_TEST1, 2003) {agent a=owner;
  _caos{ject "simpleplant1.k.cos" 7;};
  
  }  
script (  F_INVISIBLE,G_SYSTEM,S_TEST1, 2001) {agent a=owner;

  _caos{ject "shooter.k.cos" 7;};
  
  }  
script (  F_INVISIBLE,G_SYSTEM,S_TEST1, 2002) {agent a=owner; 
  enum (F_VISIBLE2,G_GOODPLANT,S_SHOOTER) {|p| p.kill();}
  }
remove {
     enum ( F_INVISIBLE,G_SYSTEM,S_TEST1) {|p| p.kill();}
         
	// Zap the scripts.
	deletescript(  F_INVISIBLE,G_SYSTEM,S_TEST1,2000);
}     
