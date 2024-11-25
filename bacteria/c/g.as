package c {
	import flash.utils.setInterval;
	import flash.utils.clearInterval;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import flash.events.*;
	import c.o;
	
	public class g extends o {
		private var cv:uint=0;
		private var mv:uint=0;
		private var d:int=0;
		private var il:Array=[];
		private const minSpawnInterval:uint=1000;
		public function g (a:Object)	{
			super(a);
			defineCd();
			mv=a.c;
		}

		override public function init ():void {
			if	(t==1) {
				il[0]=setTimeout(iis,minSpawnInterval+Math.ceil(Math.random()*500));
			}
			addEventListener(Event.ENTER_FRAME,enterFrameListener0,undefined,undefined,true);
			addEventListener(Event.ENTER_FRAME,ani_init,undefined,undefined,true);
		}
		public function enterFrameListener0 (e:Event):void {
			mt();
		}
		private function iis ():void {
				//var $t0:uint=Math.random()<.3?1:Math.random()<.6?0:2;
				var $t0:uint=Math.random()<.2?1:Math.random()<.7?0:2;
				addG(x,y,1+(Math.random()<.6?2:1),$t0,root);
				cv+=1;
				if ($t0==2) {
					addG(x+20,y,0,0,root);
					addG(x-20,y,0,0,root);
					addG(x,y+20,0,0,root);
					addG(x,y-20,0,0,root);
					addG(x+20,y+20,0,0,root);
					addG(x+20,y-20,0,0,root);
					//addG(x-20,y-20,0,0,root);
					//addG(x-20,y-20,0,0,root);
					addG(x-30,y-30,1,1,root);
				}
				if (cv<mv || $t0==0) {
					il[0]=setTimeout(iis,minSpawnInterval+Math.ceil(Math.random()*2000));
				} else {
					over=true;
				}
		}
		override public function removeListeners ():void {
			var $t0:Boolean=false;
			for each (var i in all){
				if (i.t==1 && i!=this) {
					$t0=true;
					break;
				}
			}
			if (!$t0) {
				addG(10+(Math.random()*sw-20),10+(Math.random()*sh-20),undefined,1,root);
			}
			//
			removeEventListener(Event.ENTER_FRAME,enterFrameListener0);
			clearTimeout(il[0]);
			super.removeListeners();
		}
	}
}
