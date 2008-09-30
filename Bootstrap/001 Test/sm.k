/**


    Script: simplemachinery
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815
   * under GNU
      IMPORTANT NOTE: newbutton has still a little bug 
   
  
 * -----------------------------------------------------------------------------
 * Agent  : F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY
 * Sprites: machine,seed,fruit,baloon,ball
 * -----------------------------------------------------------------------------
 * Click on the symbol to produce seed ,fruit, ball, baloon or bubblejet click again to remove
 * TO DO : Position finetuning, Sound ,(EGG?, Recycle?,FOOD?)
 */

 // Ovxx needed by seed (see shooter.k) 
 ovar numeric heatmin[54];
 ovar numeric watermin[58];
 ovar numeric seed[70];
 ovar numeric fruit[71];
 ovar numeric bubble[72];
 ovar numeric ball[74];
install {
        agent simplemachinery;       
      	simplemachinery = newcompound(F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY, "machine", 10,0, 5000);
      	simplemachinery.attributes = 6;
      	//simplemachinery.dcor = DEBUG;
        simplemachinery.tick = 1;
        simplemachinery.newbutton(1, "machine", 1, 2, 34, 148,  0 ,"[1 ]", 2001, 1);
        simplemachinery.changepart(1);simplemachinery.anim(0);
        simplemachinery.newbutton(2, "machine", 3, 2, 44, 128,  0 ,"[1 ]", 2002, 1);
        simplemachinery.changepart(2);simplemachinery.anim(0);
        simplemachinery.newbutton(3, "machine", 5, 2, 10, 120,  0 ,"[1 ]", 2003, 1);
        simplemachinery.changepart(3);simplemachinery.anim(0);
        simplemachinery.newbutton(4, "machine", 7, 2, 25, 80,  0 ,"[1 ]", 2004, 1);
        simplemachinery.changepart(4);simplemachinery.anim(0);
        simplemachinery.newbutton(5, "machine", 9, 2, 56, 80,  0 ,"[1 ]", 2005, 1);
        simplemachinery.changepart(5);simplemachinery.anim(0);
        move(simplemachinery,110,660);
		}
 /**
Function: Timmer script  9, Clickevent 2001 Clickevent 2002
 */    
//script ( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY, 9) {}		
script ( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY, 2001) {
									if (owner.seed==0){
									owner.seed=1;owner.changepart(1);owner.pose=1;
									agent seed;numeric menge=8;
      								do{ menge=menge-1;
      								seed = newsimple(F_VISIBLE2,G_GOODPLANT,S_SHOOTERSEED, "Seed", 16,3, 5000);
      								seed.attributes = 195;
      								seed.elasticity = 5;	
 									//seed.behaviour = 48;
 									move(seed,600,450);
 									seed.heatmin=0.1;
 									seed.watermin=0.3;
 									seed.tick=20;
 									seed.anim(3,4,5,6,7,8,9,10,11,12,255);
 									numeric velx=getRandom((10),(-10));
 									numeric vely=getRandom((-3),(-10));
 									velocity(seed, velx,vely);
 									} until(menge==0);
 									}
 									else 
 									{ owner.seed=0;owner.changepart(1);owner.pose=0;
 									  enum (F_VISIBLE2,G_GOODPLANT,S_SHOOTERSEED) {|p| p.kill();}
 									  
 									}
 									
}	
script ( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY, 2002) {
	if (owner.fruit==0){ owner.fruit=1;
									agent fruit; owner.changepart(2);owner.pose=1;
      								fruit = newsimple(F_VISIBLE2,G_GOODPLANT,S_TREEFRUIT, "Fruit", 9,0, 5000);
      								fruit.attributes = 195;
      								fruit.elasticity = 5;	
 									//fruit.behaviour = 48;
 									numeric px=getRandom(100,900);
 									numeric py=getRandom(50,200);
 									move(fruit,px,py);
 									fruit.heatmin=0.1;
 									fruit.watermin=0.3;
 									fruit.tick=20;
 									
 									numeric velx=getRandom((10),(-10));
 									numeric vely=getRandom((-3),(-10));
 									velocity(fruit, velx,vely);}
 									else 
 									{ owner.fruit=0;owner.changepart(2);owner.pose=0;
 									  enum (F_VISIBLE2,G_GOODPLANT,S_TREEFRUIT) {|p| p.kill();}
 									 
 									}
}

script ( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY, 2003) {
	if (owner.bubble==0){ owner.bubble=1;
									agent bubblejet;owner.changepart(3);owner.pose=1;
      								bubblejet = newsimple(F_VISIBLE2,G_TOY,S_BUBBLEJET, "Bubblejet", 6,0, 5000);
      								bubblejet.attributes = 199;
      								bubblejet.elasticity = 5;	
 									//bubblejet.behaviour = 48;
 									bubblejet.clickAction=0;
 									framerate(4);
 									numeric px=375;
 									numeric py=750;
 									move(bubblejet,px,py);
 									numeric velx=getRandom(3,8);
 									numeric vely=0;
 									velocity(bubblejet, velx,vely);}
 									else 
 									{ owner.bubble=0;owner.changepart(3);owner.pose=0;
 									  enum (F_VISIBLE2,G_TOY,S_BUBBLEJET) {|p| p.kill();}
 									 
 									}
}
script ( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY, 2004) {
numeric color=getRandom(1,3); if (color==1){color=0;
									agent baloon;
      								baloon = newsimple(F_VISIBLE2,G_TOY,S_BALOON, "Baloon", 17,0, 5000);
      								baloon.attributes = 198;
      								baloon.elasticity = 5;	
 									//baloon.behaviour = 48;
 									baloon.acceleration=(-0.3);
 									baloon.aerodynamics=2;
 									move(baloon,364,732);
 									baloon.anim(0,1,2,3,4,3,2,0,255);
 									numeric tim=getRandom(30,140);
 									baloon.tick=tim;
 									framerate(4);
 									numeric velx=getRandom((5),(-5));
 									velocity(baloon, velx,0);}
 									else if (color==2) {color=0;agent baloon;
      								baloon = newsimple(F_VISIBLE2,G_TOY,S_BALOON, "Baloon", 17,0, 5000);
      								baloon.attributes = 198;
      								baloon.elasticity = 5;	
 									//baloon.behaviour = 48;
 									baloon.acceleration=(-0.3);
 									baloon.aerodynamics=2;
 									move(baloon,364,732);
 									baloon.anim(6,7,8,9,8,7,6,255);
 									numeric tim=getRandom(30,140);
 									baloon.tick=tim;
 									framerate(4);
 									numeric velx=getRandom((5),(-5));
 									velocity(baloon, velx,0);}
 									else if (color==3) {color=0;agent baloon;
      								baloon = newsimple(F_VISIBLE2,G_TOY,S_BALOON, "Baloon", 17,0, 5000);
      								baloon.attributes = 198;
      								baloon.elasticity = 5;	
 									//baloon.behaviour = 48;
 									baloon.acceleration=(-0.3);
 									baloon.aerodynamics=2;
 									move(baloon,364,732);
 									baloon.anim(11,12,13,14,15,14,13,12,11,255);
 									numeric tim=getRandom(30,140);
 									baloon.tick=tim;
 									framerate(4);
 									numeric velx=getRandom((5),(-5));
 									velocity(baloon, velx,0);}
 									   
}
script ( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY, 2005) {
									if (owner.ball==0){
									owner.ball=1;owner.changepart(5);owner.pose=1;
									agent ball;
      								ball = newsimple(F_VISIBLE2,G_TOY,S_BALL, "ball", 35,7, 5000);
      								ball.attributes = 199;
      								ball.elasticity = 90;	
 									//ball.behaviour = 35;
 									ball.aerodynamics=10;
 									ball.friction=90;
 									ball.acceleration=1;
 									ball.perm=60;
 									move(ball,300,300);
 									//ball.tick=20;
 									//ball.anim(3,4,5,6,7,8,9,10,11,12,255);
 									numeric velx=getRandom((10),(-10));
 									numeric vely=getRandom((-3),(-10));
 									velocity(ball, velx,vely);
 									
 									}
 									else 
 									{ owner.ball=0;owner.changepart(5);owner.pose=0;
 									  enum (F_VISIBLE2,G_TOY,S_BALL) {|p| p.kill();}
 									  
 									}
 									}

remove {
     enum (F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY) {|p| p.kill();}
     enum (F_VISIBLE2,G_TOY,S_BALOON) {|p| p.kill();}   
	// Zap the scripts.
	deletescript( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY,9);
	deletescript( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY,2001);
	deletescript( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY,2002);
	deletescript( F_VISIBLE2, G_MACHINERY, S_SIMPLEMACHINERY,2003);
	deletescript( F_VISIBLE2,G_TOY,S_BALL,9);
 	deletescript( F_VISIBLE2,G_TOY,S_BUBBLEJET,1);
 	deletescript( F_VISIBLE2,G_TOY,S_BUBBLEJET,2);
 	deletescript( F_VISIBLE2,G_TOY,S_BUBBLEJET,9);
 	deletescript( F_VISIBLE2,G_GOODPLANT,S_TREEFRUIT,9);
 	deletescript( F_VISIBLE2,G_GOODPLANT,S_SHOOTERSEED,9);
	}

