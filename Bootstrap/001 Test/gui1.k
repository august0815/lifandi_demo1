/**


  program: simplegui
    ___________________________________________________________________________

    Version 0.01

    Copyright (C) 2008 august0815
    
    	 git://github.com/august0815/lifandi_demo1.git
 
 
  
 * -----------------------------------------------------------------------------
 * Agent  : F_INVISIBLE,G_GUI,S_GUI
 * Sprites: menue
 * -----------------------------------------------------------------------------
 * Scripts: 2000>Hide Menue	
 *			2001>Show Menue
 *			2002>Quit
 * 			2003>
 *			2004>
 *          2006-2025 Buttons
 */
 ovar numeric hidden[99];//true=1 false =0
 ovar numeric activ[98];//part nr of activ element (inventory tool kit)
 ovar numeric activ1[97];//part nr of activ element (1-8)
 ovar numeric activ2[96];//part nr of signpost

 /*
 * MESG WRIT 
 */
define selfMessage( numeric msgno) {
	_caos {
		MESG WRIT TARG  $msgno(r);
	}
}


 install {
        _caos{file glob 1 "test";}; 
        _caos{dbg: outs wnam;};   
        agent a = newcompound(F_INVISIBLE,G_GUI,S_GUI, "gui1", 79, 0, 7999);
        a.activ=10;a.activ1=2;a.activ2=20;
        //switch.changepart(-1);
        //alpha(256,1);
        a.attributes = A_CAMERASHY|A_FLOATABLE|A_INVISIBLE;
        a.floatat(1,1);
        a.changepart(0);
        a.pose=0;
        a.newbutton(2, "gui1", 1, 2, 42, 142,  0 ,"[]", 2009, 1); 
        a.changepart(a.activ1);
        a.pose=0;
        a.newbutton(3, "gui1", 3, 2, 76, 142,  0 ,"[]", 2010, 1);
        a.newbutton(4, "gui1", 5, 2, 110, 142,  0 ,"[]", 2011, 1);
        a.newbutton(5, "gui1", 7, 2, 144, 142,  0 ,"[]", 2012, 1);
        a.newbutton(6, "gui1", 9, 2, 42, 171,  0 ,"[]", 2013, 1); 
        a.newbutton(7, "gui1", 11, 2, 76, 171,  0 ,"[]", 2014, 1);
        a.newbutton(8, "gui1", 13, 2, 110, 171,  0 ,"[]", 2015, 1);
        a.newbutton(9, "gui1", 15, 2, 144, 171,  0 ,"[]", 2016, 1);
        //inventory
        a.newbutton(10, "gui1", 17, 2, 47, 62,  0 ,"[]", 2006, 1);
        a.changepart(a.activ);
        a.pose=0;
       
        //tools
        a.newbutton(11, "gui1", 19, 2, 47, 83,  0 ,"[]", 2007, 1);
        //kits
        a.newbutton(12, "gui1", 21, 2, 47, 104,  0 ,"[]", 2008, 1);
        //Quit,load,new
        a.newbutton(13, "gui1", 25, 1, 22,11,  0 ,"[]", 2002, 1);
        a.newbutton(14, "gui1", 26, 1, 68, 11,  0 ,"[]", 2003, 1);
        a.newbutton(15, "gui1", 27, 1, 112, 11,  0 ,"[]", 2004, 1);
        a.newbutton(16, "gui1", 28, 1, 158, 11,  0 ,"[]", 2005, 1);
        //show
        a.newbutton(17, "gui1", 24, 1, 1, 11,  0 ,"[]", 2000, 1);
        //hide
        a.newbutton(19, "gui1", 29, 1, 201, 5,  0 ,"[]", 2001, 1);
        
    	a.newbutton(18, "gui1", 23, 1, 201, 20,  0 ,"[]", 2100, 1);
    	a.newbutton(20, "gui1", 32, 2, 202, 18,  0 ,"[]", 2020, 1);
    	a.changepart(a.activ2);
        a.pose=1;
        a.newbutton(21, "gui1", 34, 2, 232, 18,  0 ,"[]", 2021, 1);
    	a.newbutton(22, "gui1", 36, 2, 262, 18,  0 ,"[]", 2022, 1);
    	a.newbutton(23, "gui1", 38, 2, 292, 18,  0 ,"[]", 2023, 1);
    	a.newtextpart(24,"gui1",41,44,230,1,"blackontransparentchars");
        a.changepart(24);
        a.textformat( 6, 6, 6, 6, 1, 1, 0);
        a.newbutton(25, "gui1",42 , 2,56,212,  0 ,"[]", 2024, 1);
    	a.newbutton(26, "gui1", 44, 2, 107, 212,  0 ,"[]", 2025, 1);
    	a.hidden=0;
    	a.base0=0;a.base1=46;a.base2=62;
    	selfMessage(1999);
       
   
}
script (F_INVISIBLE,G_GUI,S_GUI,1999) {agent a=owner;numeric lop=0;string tag;string stat; string desc;
 do {tag=read("inv",lop); stat=read(tag,3);
 setnamestring(tag,stat);lop=lop+1;}until (lop==8);lop=0;
 do {tag=read("kit",lop); stat=read(tag,3);
 setnamestring(tag,stat);lop=lop+1;}until (lop==8);lop=0;
 do {tag=read("tool",lop);stat=read(tag,3);
 setnamestring(tag,stat);lop=lop+1;}until (lop==8)
		selfMessage(2009);
        selfMessage(2020);
    	selfMessage(2006);
}
script (F_INVISIBLE,G_GUI,S_GUI,2000) {agent a=owner;
 if (a.hidden==0) {velocity(a,(-20),0);wait(10);velocity(a,(0),0);}
 a.hidden=1;
  }

script (F_INVISIBLE,G_GUI,S_GUI,2001) {agent a=owner;
 if (a.hidden==1) { velocity(a,(20),0);wait(10);velocity(a,(0),0);}
 a.hidden=0;
  }
  
script (F_INVISIBLE,G_GUI,S_GUI,2002) {quit();
}
script (F_INVISIBLE,G_GUI,S_GUI,2003) {
       	agent a = newcompound( F_INVISIBLE,G_SYSTEM,S_PROG, "e-progress", 3, 1, 8100);
        a.attributes = A_CAMERASHY|A_FLOATABLE|A_INVISIBLE;
        alpha(200,1);
        a.floatat(500,500);
		wait (50);
		loadWorld("test"); a.kill;}
script (F_INVISIBLE,G_GUI,S_GUI,2004) {
agent a = newcompound( F_INVISIBLE,G_SYSTEM,S_PROG, "e-progress", 3, 2, 8100);
        a.attributes = A_CAMERASHY|A_FLOATABLE|A_INVISIBLE;
        alpha(200,1);
        a.floatat(500,500);
		wait (50);	
		createWorld("test");a.kill;}
script (F_INVISIBLE,G_GUI,S_GUI,2005) {
agent a = newcompound( F_INVISIBLE,G_SYSTEM,S_PROG, "e-progress", 3, 2, 8100);
        a.attributes = A_CAMERASHY|A_FLOATABLE|A_INVISIBLE;
        //alpha(256,1);
        a.floatat(500,500);
		wait (50);	
		saveWorld();a.kill;}

script (F_INVISIBLE,G_GUI,S_GUI,2006) {agent inventory=owner;//inventory.baseIndex=0;printn(inventory.base4);
		 inventory.changepart(inventory.activ);inventory.baseIndex=0;
         inventory.pose=0;inventory.activ=10; inventory.changepart(inventory.activ);inventory.pose=1;
         inventory.base4=inventory.base0;
        inventory.changepart(2); inventory.baseIndex=inventory.base4;
        inventory.pose=1; inventory.activ1=2;
        inventory.changepart(3); inventory.baseIndex=inventory.base4;
        inventory.pose=0;
        inventory.changepart(4); inventory.baseIndex=inventory.base4;
        inventory.pose=0;
        inventory.changepart(5); inventory.baseIndex=inventory.base4;
        inventory.pose=0;
        inventory.changepart(6); inventory.baseIndex=inventory.base4;
        inventory.pose=0;
        inventory.changepart(7); inventory.baseIndex=inventory.base4;
        inventory.pose=0;
        inventory.changepart(8); inventory.baseIndex=inventory.base4;
        inventory.pose=0;
        inventory.changepart(9); inventory.baseIndex=inventory.base4;
        inventory.pose=0;
        selfMessage(2009);
}
script (F_INVISIBLE,G_GUI,S_GUI,2007) {agent a=owner;//a.baseIndex=0;printn(a.base4);
		a.changepart(a.activ);a.baseIndex=0;
        a.pose=0;a.activ=11; a.changepart(a.activ);a.pose=1;
        a.base4=a.base1;
        a.changepart(2); a.baseIndex=a.base4;
        a.pose=1;a.activ1=2;
        a.changepart(3); a.baseIndex=a.base4;
        a.pose=0;
        a.changepart(4); a.baseIndex=a.base4;
        a.pose=0;
        a.changepart(5); a.baseIndex=a.base4;
        a.pose=0;
        a.changepart(6); a.baseIndex=a.base4;
        a.pose=0;
        a.changepart(7); a.baseIndex=a.base4;
        a.pose=0;
        a.changepart(8); a.baseIndex=a.base4;
        a.pose=0;
        a.changepart(9); a.baseIndex=a.base4;
        a.pose=0;
		selfMessage(2009);
}
script (F_INVISIBLE,G_GUI,S_GUI,2008) {agent a=owner;//a.baseIndex=0;;printn(a.base4);
		a.changepart(a.activ);a.baseIndex=0;
        a.pose=0;a.activ=12; a.changepart(a.activ);a.pose=1;
       	a.base4=a.base2;
        a.changepart(2); a.baseIndex=a.base4;
        a.pose=1;a.activ1=2;
        a.changepart(3); a.baseIndex=a.base4;
        a.pose=0;
        a.changepart(4); a.baseIndex=a.base4;
        a.pose=0;
        a.changepart(5); a.baseIndex=a.base4;
        a.pose=0;
        a.changepart(6); a.baseIndex=a.base4;
        a.pose=0;
        a.changepart(7); a.baseIndex=a.base4;
        a.pose=0;
        a.changepart(8); a.baseIndex=a.base4;
        a.pose=0;
        a.changepart(9); a.baseIndex=a.base4;
        a.pose=0;
        selfMessage(2009);
}


script (F_INVISIBLE,G_GUI,S_GUI,2009) {agent a=owner;string ausgabe;string tag;string enumm;string stat; string desc;
		a.changepart(a.activ1); a.baseIndex=a.base4;
        a.pose=0;a.activ1=2; a.changepart(a.activ1);a.baseIndex=a.base4;a.pose=1;
        if (a.activ==10) {ausgabe=read("inv",0);}
        if (a.activ==11) {ausgabe=read("kit",0);}
        if (a.activ==12) {ausgabe=read("tool",0);	}
        a.baseIndex=a.base0;
        tag=ausgabe;desc=read(tag,4);
        ausgabe=addstring(ausgabe,desc);
        a.changepart(24);
       	a.parttext=ausgabe;
       	stat=(a.namestring(tag));
       	if (stat=="1") {a.changepart(25);a.pose=1;a.changepart(26);a.pose=0;}
       	else {a.changepart(25);a.pose=0;a.changepart(26);a.pose=1;}
}
script (F_INVISIBLE,G_GUI,S_GUI,2010) {agent a=owner;string ausgabe;string tag;string enumm;string stat; string desc;
		a.changepart(a.activ1); a.baseIndex=a.base4;
        a.pose=0;a.activ1=3; a.changepart(a.activ1);a.baseIndex=a.base4;a.pose=1;
        if (a.activ==10) {ausgabe=read("inv",1);}
        if (a.activ==11) {ausgabe=read("kit",1);}
        if (a.activ==12) {ausgabe=read("tool",1);}
         a.baseIndex=a.base0;
        tag=ausgabe; desc=read(tag,4);
        ausgabe=addstring(ausgabe,desc);
		a.changepart(24);
      	a.parttext=ausgabe;
      	stat=(a.namestring(tag));
       	if (stat=="1") {a.changepart(25);a.pose=1;a.changepart(26);a.pose=0;}
       	else {a.changepart(25);a.pose=0;a.changepart(26);a.pose=1;}
}
script (F_INVISIBLE,G_GUI,S_GUI,2011) {agent a=owner;string ausgabe;string tag;string enumm;string stat; string desc;

		a.changepart(a.activ1); a.baseIndex=a.base4;
        a.pose=0;a.activ1=4; a.changepart(a.activ1);a.baseIndex=a.base4;a.pose=1;
         if (a.activ==10) {ausgabe=read("inv",2);}
        if (a.activ==11) {ausgabe=read("kit",2);}
        if (a.activ==12) {ausgabe=read("tool",2);}
         a.baseIndex=a.base0;
        tag=ausgabe; ;desc=read(tag,4);
        ausgabe=addstring(ausgabe,desc);
        a.changepart(24);
      	a.parttext=ausgabe;
      	stat=(a.namestring(tag));
       	if (stat=="1") {a.changepart(25);a.pose=1;a.changepart(26);a.pose=0;}
       	else {a.changepart(25);a.pose=0;a.changepart(26);a.pose=1;}
}
script (F_INVISIBLE,G_GUI,S_GUI,2012) {agent a=owner;string ausgabe;string tag;string enumm;string stat; string desc;

		a.changepart(a.activ1); a.baseIndex=a.base4;
        a.pose=0;a.activ1=5; a.changepart(a.activ1);a.baseIndex=a.base4;a.pose=1;
         if (a.activ==10) {ausgabe=read("inv",3);}
        if (a.activ==11) {ausgabe=read("kit",3);}
        if (a.activ==12) {ausgabe=read("tool",3);}
         a.baseIndex=a.base0;
        tag=ausgabe; desc=read(tag,4);
        ausgabe=addstring(ausgabe,desc);
        a.changepart(24);
      	a.parttext=ausgabe;
      	stat=(a.namestring(tag));
       	if (stat=="1") {a.changepart(25);a.pose=1;a.changepart(26);a.pose=0;}
       	else {a.changepart(25);a.pose=0;a.changepart(26);a.pose=1;}
}
script (F_INVISIBLE,G_GUI,S_GUI,2013) {agent a=owner;string ausgabe;string tag;string enumm;string stat; string desc;

		a.changepart(a.activ1); a.baseIndex=a.base4;
        a.pose=0;a.activ1=6; a.changepart(a.activ1);a.baseIndex=a.base4;a.pose=1;
         if (a.activ==10) {ausgabe=read("inv",4);}
        if (a.activ==11) {ausgabe=read("kit",4);}
        if (a.activ==12) {ausgabe=read("tool",4);}
         a.baseIndex=a.base0;
        tag=ausgabe; desc=read(tag,4);
        ausgabe=addstring(ausgabe,desc);
        a.changepart(24);
      	a.parttext=ausgabe;
      	stat=(a.namestring(tag));
       	if (stat=="1") {a.changepart(25);a.pose=1;a.changepart(26);a.pose=0;}
       	else {a.changepart(25);a.pose=0;a.changepart(26);a.pose=1;}
}
script (F_INVISIBLE,G_GUI,S_GUI,2014) {agent a=owner;string ausgabe;string tag;string enumm;string stat; string desc;

		a.changepart(a.activ1); a.baseIndex=a.base4;
        a.pose=0;a.activ1=7; a.changepart(a.activ1);a.baseIndex=a.base4;a.pose=1;
         if (a.activ==10) {ausgabe=read("inv",5);}
        if (a.activ==11) {ausgabe=read("kit",5);}
        if (a.activ==12) {ausgabe=read("tool",5);}
         a.baseIndex=a.base0;
        tag=ausgabe; ;desc=read(tag,4);
        ausgabe=addstring(ausgabe,desc);
        a.changepart(24);
      	a.parttext=ausgabe;
      	stat=(a.namestring(tag));
       	if (stat=="1") {a.changepart(25);a.pose=1;a.changepart(26);a.pose=0;}
       	else {a.changepart(25);a.pose=0;a.changepart(26);a.pose=1;}
}
script (F_INVISIBLE,G_GUI,S_GUI,2015) {agent a=owner;string ausgabe;string tag;string enumm;string stat; string desc;

		a.changepart(a.activ1); a.baseIndex=a.base4;
        a.pose=0;a.activ1=8; a.changepart(a.activ1);a.baseIndex=a.base4;a.pose=1;
         if (a.activ==10) {ausgabe=read("inv",6);}
        if (a.activ==11) {ausgabe=read("kit",6);}
        if (a.activ==12) {ausgabe=read("tool",6);}
         a.baseIndex=a.base0;
        tag=ausgabe;desc=read(tag,4);
        ausgabe=addstring(ausgabe,desc);
        a.changepart(24);
      	a.parttext=ausgabe;
      	stat=(a.namestring(tag));
       	if (stat=="1") {a.changepart(25);a.pose=1;a.changepart(26);a.pose=0;}
       	else {a.changepart(25);a.pose=0;a.changepart(26);a.pose=1;}
}
script (F_INVISIBLE,G_GUI,S_GUI,2016) {agent a=owner;string ausgabe;string tag;string enumm;string stat; string desc;

		a.changepart(a.activ1); a.baseIndex=a.base4;
        a.pose=0;a.activ1=9; a.changepart(a.activ1);a.baseIndex=a.base4;a.pose=1;
         if (a.activ==10) {ausgabe=read("inv",7);}
        if (a.activ==11) {ausgabe=read("kit",7);}
        if (a.activ==12) {ausgabe=read("tool",7);}
         a.baseIndex=a.base0;
        tag=ausgabe; desc=read(tag,4);
        ausgabe=addstring(ausgabe,desc);
        a.changepart(24);
      	a.parttext=ausgabe;
      	stat=(a.namestring(tag));
       	if (stat=="1") {a.changepart(25);a.pose=1;a.changepart(26);a.pose=0;}
       	else {a.changepart(25);a.pose=0;a.changepart(26);a.pose=1;}

}

//signpost
script (F_INVISIBLE,G_GUI,S_GUI,2020) {agent a=owner;
		a.changepart(a.activ2);
        a.pose=0;a.activ2=20; a.changepart(a.activ2);a.pose=1;
        
        moveCamera(500,500,0);
}

script (F_INVISIBLE,G_GUI,S_GUI,2021) {agent a=owner;
		a.changepart(a.activ2);
        a.pose=0;a.activ2=21; a.changepart(a.activ2);a.pose=1;
        moveCamera(1500,500,0);
}
script (F_INVISIBLE,G_GUI,S_GUI,2022) {agent a=owner;
		a.changepart(a.activ2);
        a.pose=0;a.activ2=22; a.changepart(a.activ2);a.pose=1;
        moveCamera(1500,500,0);
}
script (F_INVISIBLE,G_GUI,S_GUI,2023) {agent a=owner;
		a.changepart(a.activ2);
        a.pose=0;a.activ2=23; a.changepart(a.activ2);a.pose=1;
        moveCamera(1500,500,0);
}
script (F_INVISIBLE,G_GUI,S_GUI,2024) {agent a=owner;string status;numeric what;string stat;string stats;numeric fam;
numeric gen;numeric spe;
		what=a.activ1-2;
		if (a.activ==10) {status=read("inv",what);}
        if (a.activ==11) {status=read("kit",what);}
        if (a.activ==12) {status=read("tool",what);	}
		stats=(a.namestring(status));
        if (stats=="0") {setnamestring(status,"1");a.changepart(25);a.pose=1;a.changepart(26);a.pose=0;}
  		fam= StrToInt(read(status,0));
  		gen= StrToInt(read(status,1));
  		spe= StrToInt(read(status,2));
  		agent ag=randomagent(fam,gen,spe);
       	simpMessage(ag,2000,1,0);
       	_caos{targ ownr;};

}
script (F_INVISIBLE,G_GUI,S_GUI,2025) {agent a=owner;string status;numeric what;string stat;string stats;numeric fam;
numeric gen;numeric spe;
		what=a.activ1-2;
		if (a.activ==10) {status=read("inv",what);}
        if (a.activ==11) {status=read("kit",what);}
        if (a.activ==12) {status=read("tool",what);	}
		stats=(a.namestring(status));
        if (stats=="1") {setnamestring(status,"0");a.changepart(26);a.pose=1;a.changepart(25);a.pose=0;}
        fam= StrToInt(read(status,0));
  		gen= StrToInt(read(status,1));
  		spe= StrToInt(read(status,2));
  		agent ag=randomagent(fam,gen,spe);
        simpMessage(ag,2000,0,0);
        _caos{targ ownr;};
}

remove {
     enum (F_INVISIBLE,G_GUI,S_GUI) {|foo| foo.kill(); }
     
   
  	// Zap the scripts.
  	
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2000);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2001);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2002);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2003);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2004);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2005);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2006);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2007);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2008);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2009);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2010);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2011);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2012);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2013);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2014);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2015);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2016);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2020);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2021);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2022);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2023);
	deletescript(F_INVISIBLE,G_GUI,S_GUI,2024);
}
