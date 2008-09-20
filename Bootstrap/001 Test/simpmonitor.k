
/**


    Script: simplemonitor
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815
   * under GNU
 * -----------------------------------------------------------------------------
 * Agent  : F_INVISIBLE, G_SYSTEM, S_SIMPLEMONITOR
 * Sprites: monitor
 * -----------------------------------------------------------------------------
 */
install {
        agent simplemonitor;
      	simplemonitor = newcompound(F_INVISIBLE, G_SYSTEM, S_SIMPLEMONITOR, "monitor", 8,4, 5000);
      	simplemonitor.attributes = 292;
        simplemonitor.floatat(210, 860);
        simplemonitor.tick = 1;
        // ALPH not yet ready 
        simplemonitor.newtextinputpart(1, "monitor", 6, 200, 0, 0, 0, "blackontransparentchars");
        simplemonitor.changepart(1);
		simplemonitor.textformat(1 ,1, 1, 1, 1, 1, 0);
		
		simplemonitor.newtextinputpart(2, "monitor", 7, 450, 0, 0, 0, "blackontransparentchars");
        simplemonitor.changepart(2);
		simplemonitor.textformat(1 ,1, 1, 1, 1, 1, 0);
		
		simplemonitor.newtextinputpart(3, "monitor", 5, 600, 0, 0, 0, "blackontransparentchars");
        simplemonitor.changepart(3);
		simplemonitor.textformat(1 ,1, 1, 1, 1, 1, 0);
		
		simplemonitor.newtextinputpart(4, "monitor", 5, 800, 0, 0, 0, "blackontransparentchars");
        simplemonitor.changepart(4);
		simplemonitor.textformat(1 ,1, 1, 1, 1, 1, 0);
		simplemonitor.inputmask=8;
		
		simplemonitor.newtextinputpart(5, "monitor", 8, 91, 0, 0, 0, "blackontransparentchars");
        simplemonitor.changepart(5);
		simplemonitor.textformat(1 ,1, 1, 1, 1, 1, 0);
		simplemonitor.inputmask=8;
		
		simplemonitor.newtextinputpart(6, "monitor", 8, 91,12, 0, 0, "blackontransparentchars");
        simplemonitor.changepart(6);
		simplemonitor.textformat(1 ,1, 1, 1, 1, 1, 0);
		simplemonitor.inputmask=8;
			
	simplemonitor.tick=1;
     }
     
 /**
Function: Timmer script  9, Mous_clicked script 76
 */    
script ( F_INVISIBLE, G_SYSTEM, S_SIMPLEMONITOR, 9) {
	agent s;s=owner;numeric room;numeric x;numeric y;numeric type;string fo;numeric foo;string fooo;
	string ausgabe="Room ";numeric xx;numeric yy;
	s.changepart(1);
	room=getroomid(mouseX(),mouseY());
    ausgabe= addstring(ausgabe,NumToStr(room));
    if (room>(-1)) { ausgabe=addstring(ausgabe,"@");ausgabe=addstring(ausgabe,returnLocation(room));}
    s.parttext=ausgabe;
    s.changepart(2);
    ausgabe="Type ";
    type=roomType(room);
    if (type==0) {ausgabe=addstring(ausgabe, "AIR " );}
    else if (type==1) {ausgabe=addstring(ausgabe, "Woodn Walkway " );}
    else if (type==2) {ausgabe=addstring(ausgabe, "Concrete Walkway" );}
    else if (type==3) {ausgabe=addstring(ausgabe, "Indoor Concrete");}
    else if (type==4) {ausgabe=addstring(ausgabe, "Outdoor Concrete " );}
    else if (type==5) {ausgabe=addstring(ausgabe, "Normal Soil" );}
    else if (type==6) {ausgabe=addstring(ausgabe, "Boggy Soil" );}
    else if (type==7) {ausgabe=addstring(ausgabe, "Draind Soil" );}
    else if (type==8) {ausgabe=addstring(ausgabe, "Fresh Water" );}  
    else if (type==9) {ausgabe=addstring(ausgabe, "Salt Water" );}
    else  {ausgabe=addstring(ausgabe, " ERROR " );}  
    s.parttext=ausgabe;
    s.changepart(3);
    ausgabe="   CA   :  ";
    fo="ca";
       foo=s.namevar(fo);
    ausgabe=addstring(ausgabe,NumToStr(foo));
    if (foo==0) {ausgabe=addstring(ausgabe, " Sound " );}
    else if (foo==1) {ausgabe=addstring(ausgabe, " Light " );}
    else if (foo==2) {ausgabe=addstring(ausgabe, " Heat " );}
    else if (foo==3) {ausgabe=addstring(ausgabe, " Water form sky " );}
    else if (foo==4) {ausgabe=addstring(ausgabe, " Nutrient " );}
    else if (foo==5) {ausgabe=addstring(ausgabe, " Water " );}
    else if (foo==6) {ausgabe=addstring(ausgabe, " Protein " );}
    else if (foo==7) {ausgabe=addstring(ausgabe, " Carbonhydrate " );}
    else if (foo==8) {ausgabe=addstring(ausgabe, " Fat " );}
    else if (foo==9) {ausgabe=addstring(ausgabe, " Machinery " );}
    else  {ausgabe=addstring(ausgabe, " ERROR " );} 
     s.parttext=ausgabe;
     s.changepart(4);
     ausgabe="";
     if (room>(-1)) {ausgabe=NumToStr(caOfRoom(room,s.namevar(fo)));}
     else {ausgabe="";}
    ausgabe=addstring(ausgabe," targ :  ");
    
   agent what=pointat;
    if  (what==null) { ausgabe=addstring(ausgabe,"-");}
   	else    		{ ausgabe=addstring(ausgabe,NumToStr(what.family));
   					ausgabe=addstring(ausgabe," ");
    				ausgabe=addstring(ausgabe,NumToStr(what.genus));
    				ausgabe=addstring(ausgabe," ");
    				ausgabe=addstring(ausgabe,NumToStr(what.species));}
    s.parttext=ausgabe;
    s.changepart(5); 
    ausgabe="X:" ;
    xx = pointer.x;
    ausgabe=addstring(ausgabe,NumToStr(xx));
    s.parttext=ausgabe;
	s.changepart(6); 
    ausgabe="Y:" ;
    yy = pointer.y;
    ausgabe=addstring(ausgabe,NumToStr(yy));
    s.parttext=ausgabe;
    
   
}
script ( F_INVISIBLE, G_SYSTEM, S_SIMPLEMONITOR, 76) {
numeric ch;numeric ch2;string ch1;string fo;
fo="ca";
agent s;s=owner;
s.changepart(4);
ch=param1n();
ch2=s.namevar(fo);
 //left mouse add
 if (ch==1) {ch2=ch2+1;}
 //right mouse sub
 else if (ch==2) {ch2=ch2-1;}
 //middle back to 0
 else if (ch==4) {ch2=0;}
 // no invalid ca
 if (ch2<0) {ch2=0 ;}
 else if (ch2>9) {ch2=9;}
 setnamevar(fo,ch2);
  }
  script ( F_INVISIBLE, G_SYSTEM, S_SIMPLEMONITOR, 2000) {agent a=owner;
  if(param1n==1){a.floatat(210, 860);a.tick=2;prints("AN");}
  if(param1n==0){a.floatat(-1000, -1000);a.tick=0;prints("AUS");}
  }
remove {
     enum (F_INVISIBLE, G_SYSTEM, S_SIMPLEMONITOR) {|p| p.kill();}
         
	// Zap the scripts.
	deletescript( F_INVISIBLE, G_SYSTEM, S_SIMPLEMONITOR,9);
	deletescript( F_INVISIBLE, G_SYSTEM, S_SIMPLEMONITOR,76);
	deletescript( F_INVISIBLE, G_SYSTEM, S_SIMPLEMONITOR,2000);
}

