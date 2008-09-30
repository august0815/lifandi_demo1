/**


    Script: simple shooter plant
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815
   * under GNU
 * -----------------------------------------------------------------------------
 * Agent  :F_VISIBLE2,G_GOODPLANT,S_SHOOTER
 * Sprites: shooter
 * -----------------------------------------------------------------------------
 * -----------------------------------------------------------------------------
 * Agent  :F_VISIBLE2,G_SEED,S_SHOOTERSEED
 * Sprites: seed
 * -----------------------------------------------------------------------------
 * Shooter Plant: Needs light heat and nutrient to grow
 * after 7 times grow, seed is shot in the air
 * Shooter dies after a while
 * Shooter seed: Falls down to soil and after some time (and if heat and water are ok) 
 * a new shooter plant grows!
 * TO DO :  Sprite fine tuning,
 * timer adjust for better population,better germinate of seed,
 * testing, bugs?,more ecology?
 */
/**
 * -----------------this in prevar.k---only remember------------------------------
 * ovar numeric stats[0];
 * ovar numeric age_of_agent[1];
 * ovar numeric energy[2];
 * ovar numeric stage_of_life[5];
 * ovar numeric gender[6];
 * ovar numeric cast[7];
 * ovar numeric x_heading[10];
 * ovar numeric y_heading[11];
 * ovar numeric vel1[12];
 * ovar numeric vel2[13];
 * ovar numeric vel3[14];
 * ovar numeric vel4[15];
 * ovar numeric current[16];
 * ovar agent targ1[17];
 * ovar agent targ2[18];
 * ovar numeric base0[30];
 * ovar numeric wet[60];
 * ovar numeric bioenergy[61];
 * -----------------------------------------------------------------------------
 */
 ovar numeric timerplant[80];
 ovar numeric lightmin[50];
 ovar numeric heatmin[54];
 ovar numeric watermin[58];
 ovar numeric nutrientmin[62];
   /**
ALTR val val val
 */
define changeCaOfROOM( numeric ca,numeric val)  {

	_caos {	ALTR ROOM TARG $ca(r) $val(r);}
}


 install {
        agent shooter;
      	shooter = newsimple(F_VISIBLE2,G_GOODPLANT,S_SHOOTER, "shooter", 9,0, 5000);
      	shooter.attributes = 192;
      	shooter.elasticity = 0;
        shooter.targ1=null;
        shooter.targ2=null;
        shooter.timerplant=10;// 50 for test , 300 in game
        shooter.lightmin=0.5;
        shooter.watermin=0.3;
        shooter.heatmin=0.2;
        shooter.nutrientmin=0.2;
        shooter.tick = shooter.timerplant;
        numeric px= getRandom(200, 800);
        move(shooter,px,300);
    
     
      	}
      	
 script ( F_VISIBLE2,G_GOODPLANT,S_SHOOTER, 9) {agent s=owner; numeric light;numeric heat;numeric water;numeric nutrient;
 numeric px=s.x;numeric py=s.y;
 light=caOfRoom(roomOfTarg(s),1);
 heat=caOfRoom(roomOfTarg(s),2);
 water=caOfRoom(roomOfTarg(s),3);
 nutrient=caOfRoom(roomOfTarg(s),4);
 s.age_of_agent=s.age_of_agent+1;

 if (s.age_of_agent>100) {nutrient=nutrient+0.2;changeCaOfROOM(4,nutrient);_caos{kill ownr ;};}
 if (light>s.lightmin && heat >s.heatmin && water>s.watermin){
 						
 						numeric pos=s.posenr;										
 						pos=pos+1;
 						if (pos<=8) {
 									s.pose=pos;nutrient=nutrient-0.1;water=water-0.1;
 									changeCaOfROOM(4,nutrient);
 									changeCaOfROOM(3,water);
 									
 									}
 							
 						if (pos==8) {
 									numeric many=2;
 									do {	
 									agent seed;
      								seed = newsimple(F_VISIBLE2,G_GOODPLANT,S_SHOOTERSEED, "Seed", 16,3, 5000);
      								seed.attributes = 195;
      								seed.elasticity = 5;	
 									seed.behaviour = 48;
 									move(seed,px,py);
 									seed.heatmin=0.1;
 									seed.watermin=0.3;
 									seed.tick=20;
 									seed.anim(3,4,5,6,7,8,9,10,11,12,255);
 									numeric velx=getRandom((10),(-10));
 									numeric vely=getRandom((-3),(-10));
 									velocity(seed, velx,vely);
 									many=many-1;
 									}until (many==0);
 										}	
 							
 									
 						}	
 						
 					
 
 }
 
 script ( F_VISIBLE2,G_GOODPLANT,S_SHOOTERSEED, 9) {
 agent seed=owner; numeric light;numeric heat;numeric water;numeric nutrient;
 numeric max=seed.gamevarn("shooter_max");numeric meng=total(F_VISIBLE2,G_GOODPLANT,S_SHOOTER);
 light=caOfRoom(roomOfTarg(seed),1);
 heat=caOfRoom(roomOfTarg(seed),2);
 water=caOfRoom(roomOfTarg(seed),3);
 nutrient=caOfRoom(roomOfTarg(seed),4);
 seed.age_of_agent=seed.age_of_agent+1;
 seed.stats=seed.stats+1;
 if (seed.age_of_agent>500) {nutrient=nutrient+0.1;changeCaOfROOM(4,nutrient);seed.anim(3,2,1);_caos{kill ownr ;};}

 if ( heat >seed.heatmin && water>seed.watermin){
 						
 						numeric st=seed.stats;										
 							
 						if (st==20) { if (meng>max){seed.kill;}
 						 			numeric px=seed.x-5;numeric py=seed.y-60;
 									agent s;
      								s = newsimple(F_VISIBLE2,G_GOODPLANT,S_SHOOTER, "shooter", 9,0, 5000);
      								s.attributes = 192;
     							 	s.elasticity = 0;
      								  s.targ1=null;
      								  s.targ2=null;
      								  s.timerplant=10;// 50 for test , 300 in game
      								  s.lightmin=0.5;
      								  s.watermin=0.3;
      								  s.heatmin=0.2;
      								  s.nutrientmin=0.2;
     								   s.tick = s.timerplant;
 									move(s,px,py);
 									
 										}	
 										
 		
 									
 						}
 					numeric st=seed.stats;			
 					if (st==20) {_caos{kill ownr ;};}		
 			 
 }
 remove {
     enum (F_VISIBLE2,G_GOODPLANT,S_SHOOTER) {|p| p.kill();}
     enum ( F_VISIBLE2,G_GOODPLANT,S_SHOOTERSEED) {|p| p.kill();}    
	// Zap the scripts.
	deletescript( F_VISIBLE2,G_GOODPLANT,S_SHOOTER,9);
	deletescript( F_VISIBLE2,G_GOODPLANT,S_SHOOTERSEED, 9);
}
