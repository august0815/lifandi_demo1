/**


    Script: simpleweather
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815
   * under GNU
 * -----------------------------------------------------------------------------
 * Agent  :F_INVISIBLE,G_SYSTEM,S_WEATHERMONITOR
 * Sprites: blnk
 * -----------------------------------------------------------------------------
 * -----------------------------------------------------------------------------
 * Agent  :F_VISIBLE2,G_WEATHER,S_CLOUD
 * Sprites: cloud
 * -----------------------------------------------------------------------------
 
 * -----------------------------------------------------------------------------
 * Agent  :F_INVISIBLE,G_SYSTEM,S_HRAIN
 * Sprites: rain
 * -----------------------------------------------------------------------------
 
 *
 * 
 *
 
 */
 /**
POSY
 */
define centrey(agent a) returning numeric {
	_caos {
		.targ < $a {
			.inline let $return = POSY;
		};
	}
}
 /**
ALTR ROOM TARG
 */
define rainCA(numeric ca,numeric val)  {

	_caos {	ALTR ROOM TARG $ca(r) $val(r);}

}
install {
        agent weathermonitor;
        weathermonitor =newsimple(F_INVISIBLE,G_SYSTEM,S_WEATHERMONITOR, "blnk", 0, 0, 1);
 		weathermonitor.dcor = DEBUG;
 		weathermonitor.attributes = A_INVISIBLE;
 		numeric px= getRandom(50, 100);
        numeric py= getRandom(50, 100);
        move(weathermonitor, px,py);
		weathermonitor.tick=200;
} 
script ( F_INVISIBLE,G_SYSTEM,S_WEATHERMONITOR,9) {
		agent w=owner;
		numeric how = getRandom(0, 15);	 
		if (how<9) { numeric many = getRandom(3, 5);numeric plane = getRandom(800, 4000);
					numeric vel = getRandom(-6, 6)
					do { many=many-1;
						numeric px = getRandom(0, 700);
						_caos{INST;}
						agent sunnycloud=newsimple(F_VISIBLE2,G_WEATHER,S_SUN, "cloud", 3, 0, plane);
						 alpha(250,1);
						 sunnycloud.attributes = 194;
						 sunnycloud.behaviour=0;
						 sunnycloud.acceleration=(-0.2);
						 sunnycloud.elasticity=0.3;
						 sunnycloud.tick=1;
						 move(sunnycloud,px,50);
						 velocity(sunnycloud,vel,0);
						}until(many==0) 
			
					
					}
		else if (how >= 9 && how < 12) { 
					 numeric many = getRandom(3, 5);numeric plane = getRandom(3000, 5000);
					;numeric vel = getRandom(-6, 6)
					do { many=many-1;
					numeric px = getRandom(0, 700)
						_caos{INST;}
						agent cloudlight=newsimple(F_VISIBLE2,G_WEATHER,S_LCLOUD, "cloud", 3, 1, plane);
						 alpha(250,1);
						 cloudlight.attributes = 194;
						 cloudlight.behaviour=0;
						 cloudlight.acceleration=(-0.2);
						 cloudlight.elasticity=0.3;
						 cloudlight.tick=1;
						 move(cloudlight,px,50);
						 velocity(cloudlight,vel,0);
						}until(many==0) 
					 }
		else if (how >=12) {
						 numeric many = getRandom(3, 5);numeric plane = getRandom(4000, 6000);
					numeric vel = getRandom(-6, 6)
					do { many=many-1;
						_caos{INST;}
						numeric px = getRandom(0, 700);
						agent cloudheavy=newsimple(F_VISIBLE2,G_WEATHER,S_CLOUD, "cloud", 3, 2, plane);
						 alpha(250,1);
						 cloudheavy.attributes = 194;
						 cloudheavy.behaviour=0;
						 cloudheavy.acceleration=(-0.2);
						 cloudheavy.elasticity=0.3;
						 cloudheavy.tick=1;
						 move(cloudheavy,px,50);
						 velocity(cloudheavy,vel,0);
						}until(many==0) 
						 }  	
}
script ( F_VISIBLE2,G_WEATHER,S_SUN,9) {numeric time1=getRandom(120,290);
	numeric lp=250;
    do {alpha(lp,1);
        wait(3);
        lp=lp-10;}until(lp<0);
    lp=0;
    wait(time1);
     do {alpha(lp,1);
        wait(3);
        lp=lp+30;}until(lp>250);
        owner.kill;
}
script ( F_VISIBLE2,G_WEATHER,S_LCLOUD,9) {numeric time1=getRandom(120,290);
numeric lp;numeric drops;numeric px;numeric py; numeric plane;numeric lp1
	 lp=250;
    do {alpha(lp,1);
        wait(3);
        lp=lp-10;}until(lp<0);
    lp=0;
   drops=getRandom(30,50);
    //_caos{targ ownr;} 
    do{
    px=owner.centrex;
    py=owner.centrey; 
    px=px+getRandom(-60,60);
    plane = getRandom(1, 600);
    _caos{inst;}
    agent lowrain=newsimple(F_VISIBLE2,G_WEATHER,S_RAIN, "rain", 2, 1, plane);
    lowrain.attributes = 194;
	lowrain.behaviour=0;
	lowrain.acceleration=4.5;
	lowrain.elasticity=0;
	lowrain.aerodynamics=30;
    lowrain.tick=1;
	move(lowrain,px,py);
	wait(getRandom(4,6));
	drops=drops-1;
	}until(drops==0);
	
        owner.kill;

}
script ( F_VISIBLE2,G_WEATHER,S_CLOUD,9) {numeric time1=getRandom(120,290);
	numeric lp=250;
    do {alpha(lp,1);
        wait(3);
        lp=lp-10;}until(lp<0);
    lp=0;

      numeric drops=getRandom(30,50);

    do{
    numeric px=owner.centrex;
    numeric py=owner.centrey; 
    px=px+getRandom(-60,60);
    numeric plane = getRandom(1, 600);
    _caos{inst;}
    agent hrain=newsimple(F_VISIBLE2,G_WEATHER,S_HRAIN, "rain", 2, 0, plane);
    hrain.attributes = 194;
	hrain.behaviour=0;
	hrain.acceleration=4.5;
	hrain.elasticity=0;
	hrain.aerodynamics=30;
    hrain.tick=1;
	move(hrain,px,py);
	wait(getRandom(4,6));
	drops=drops-1;
	}until(drops==0);

        owner.kill;

}
script (  F_VISIBLE2,G_WEATHER,S_RAIN,9){
 numeric fall=owner.isFalling;
  if (fall==0){
  rainCA(3, 0.4);
  owner.kill;
  }
}
//altr room targ  3 0.08
script (  F_VISIBLE2,G_WEATHER,S_HRAIN,9){
  numeric fall=owner.isFalling;
  if (fall==0){
  rainCA(3, 0.8);
  owner.kill;
  } 
}
/* setze Wasserlevel höher
		altr room targ  3 0.08
		kill ownr
	*/
remove {
     enum (F_INVISIBLE,G_SYSTEM,S_WEATHERMONITOR) {|foo|foo.kill();}
     enum ( F_VISIBLE2,G_WEATHER,S_SUN) {|foo| foo.kill();}
     enum (F_VISIBLE2,G_WEATHER,S_LCLOUD) {|foo| foo.kill();}
     enum (F_VISIBLE2,G_WEATHER,S_CLOUD) {|foo| foo.kill();}
     enum (F_VISIBLE2,G_WEATHER,S_RAIN) {|foo| foo.kill();}
     enum (F_VISIBLE2,G_WEATHER,S_HRAIN) {|foo| foo.kill();}
    
	// Zap the scripts.
	deletescript(F_INVISIBLE,G_SYSTEM,S_WEATHERMONITOR,9);
	deletescript( F_VISIBLE2,G_WEATHER,S_SUN,9);
	deletescript( F_VISIBLE2,G_WEATHER,S_LCLOUD,9);
	deletescript( F_VISIBLE2,G_WEATHER,S_CLOUD,9);
	deletescript( F_VISIBLE2,G_WEATHER,S_RAIN,9);
	deletescript( F_VISIBLE2,G_WEATHER,S_HRAIN,9);
}
