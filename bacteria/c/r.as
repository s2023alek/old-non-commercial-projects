package c {
	import flash.events.Event;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import flash.utils.setInterval;
	import flash.utils.clearInterval;
	import flash.display.MovieClip;
	import c.g;	
	public class r extends g {
		public var ct;
		private var il=[]; 
		public function r (a:Object)	{
			super(a);
			allowMoving = false;
			cANI_INIT_SPEED=.02
			moveSpeed=3;
			il[0]=setInterval(defineCd,500);
			il[1]=setTimeout(die,45000+Math.random()*5000);
		}
		override public function init ():void {
			addEventListener(Event.ENTER_FRAME,ani_init,undefined,undefined,true);
			addEventListener(Event.ENTER_FRAME,enterFrameListener0,undefined,undefined,true);
		}
		override public function defineCd ():void {
			if (ct != null) {
				if (distance(this,ct)<interHDistance) {
					ct.removeEventListener(Event.REMOVED_FROM_STAGE,deadListener0);
					h+=ct.t==0?-1:ct.t==2?ct.h:1;
					if (ct.t == 2) {
						scaleY = scaleX = Math.max(ct.scaleX,scaleX)+.4;
						ct.die();
					} else {
						ct.destroy();
					}
					ct = null;
					if (h<1) {
						die();
					}
				} else {
					ct.removeEventListener(Event.REMOVED_FROM_STAGE,deadListener0);
				}
			}
			var $t0:Number=9999999999999;
			for each (var i in all) {
				if (i!=null) {
					if (/*i.t!=2 &&*/i!=this && $t0>distance(i,this) && i.l) {
						if (i.t!=2 | (i.t==2 && i.h<h)) {
							$t0=distance(i,this);
							ct=i;
						}
					}
				}
			}
			if (ct==null) {
				//over.
				die();
			} else {
				interHDistance=ct.width/2;
				ct.addEventListener(Event.REMOVED_FROM_STAGE,deadListener0,undefined,undefined,true);
			}
		}
		private function die ():void {
			allowMoving = false;
			l = false;
			removeListeners();
			//setTimeout(addG,100+Math.random()*300,10+(Math.random()*sw-20),10+(Math.random()*sh-20),undefined,1,root);
			setTimeout(destroy,120);
		}
		private function deadListener0 (e:Event):void {
			e.target.removeEventListener(Event.REMOVED_FROM_STAGE,deadListener0);
			ct=null;
			defineCd();
		}
		override public function defineDelta ():void{
			if (ct!=null) {
				dx=x-ct.x;
				dy=y-ct.y;
			} 
		}
		override public function removeListeners ():void {
			var $t0:Boolean=false;
			var $t1:Boolean=false;
			for each (var i in all){
				if (i.t==2 && i!=this) {
					$t0=true;
				}
				if (i.t==1 && !i.over) {
					$t1=true;
				}
			}
			if (!$t0 && !$t1) {
				addG(10+(Math.random()*sw-20),10+(Math.random()*sh-20),undefined,1,root);
			}
			clearInterval(il[0]);
			clearTimeout(il[1]);
			if (ct!=null) {
				ct.removeEventListener(Event.REMOVED_FROM_STAGE,deadListener0);
			}
			super.removeListeners();
		}
	}
}