/**


    Script: simplebubbletoy
    ___________________________________________________________________________

    Version 0.1

    Copyright (C) 2008 august0815
   * under GNU
     
 * -----------------------------------------------------------------------------
 * Agent  :F_VISIBLE2,G_TOY,S_BUBBLEJET
 * Sprites: bubblejet
 * -----------------------------------------------------------------------------
 * -----------------------------------------------------------------------------
 * Agent  :F_VISIBLE2,G_TOY,S_BUBBLE
 * Sprites: bubblejet
 * -----------------------------------------------------------------------------
 * Create and remove only by clicking on machinery.
 * Click to activate , click again to deactivate
 * TO DO Music, stimuli
 */

script ( F_VISIBLE2,G_TOY,S_BUBBLEJET, 1) {
	agent bubble=owner;
	_caos{lock;};
	bubble.anim(0, 1, 255);
	
	bubble.tick=20;// is it OK?
	bubble.clickAction=1;
	}
script ( F_VISIBLE2,G_TOY,S_BUBBLEJET, 2) {
	agent bubble=owner;
	bubble.tick=0;
	bubble.anim(0 );
	bubble.clickAction=0;
	}
script ( F_VISIBLE2,G_TOY,S_BUBBLEJET, 9){
	agent bubble=owner;numeric px=bubble.x;numeric py=bubble.y-30;
	_caos{lock;};
	
	bubble.anim(1,2,3,4,5);
	_caos{over;};
	agent bubble1;
   bubble1= newsimple(F_VISIBLE2,G_TOY,S_BUBBLE, "bubble", 6,0, 5000);
      								bubble1.attributes = 192;
      								bubble1.elasticity = 5;	
 									//bubble1.behaviour = 48;
 									bubble1.acceleration=(-0.3);
 									bubble1.aerodynamics=2;
 									move(bubble1,px,py);
 									numeric tim=getRandom(20,70);
 									bubble1.tick=tim;
 									framerate(4);
 									numeric velx=getRandom((3),(-3));
 									velocity(bubble1, velx,0);

 									bubble1.anim(0,1,2,3,4,3,2,1,0,255);
 									
 									
	bubble.anim(5,4,3,2,1);
	_caos{over;};
	bubble.anim(0, 1, 255);
	}
script ( F_VISIBLE2,G_TOY,S_BUBBLE, 9){
	_caos{lock;}
	owner.pose=5;
	owner.acceleration=10;
	wait(10);
	owner.kill; }
	remove {
     enum ( F_VISIBLE2,G_TOY,S_BUBBLE) {|p| p.kill();}
         
	// Zap the scripts.
	deletescript(  F_VISIBLE2,G_TOY,S_BUBBLE, 9);

}
