package c{
	import flash.display.MovieClip;
	import flash.events.*;

	import c.g;
	import c.r;
	public class o extends MovieClip {
		public var l:Boolean = false;
		public var h:uint=7;
		public var defScale:Number = 1.8;
		public var allowMoving:Boolean=true;
		public var over:Boolean=false;
		public var cANI_INIT_SPEED=.04;
		public var t:uint=0;
		public var moveSpeed:uint=2;
		public var interHDistance:uint=moveSpeed;
		private var cd:v;
		public var dy,dx:Number=5;
		private var rx:Number = Math.pow(-1,Math.ceil(Math.random()*2))*(Math.random()*.5+.5);
		public function o (a:Object) {
			alpha=.9;
			gotoAndStop(Math.ceil(2*Math.random()));
			t=a.t!=undefined?a.t:0;
			scaleX=scaleY=0;
			x=a.x;
			y=a.y;
			addEventListener(Event.ADDED_TO_STAGE,i,undefined,undefined,true);
			a.s.addChild(this);
		}
		public function ani_init (e:Event):void {
			if (scaleX<defScale) {
				scaleX+=cANI_INIT_SPEED;
				scaleY=scaleX;
			} else {
				allowMoving = true;
				removeEventListener(Event.ENTER_FRAME,ani_init);
			}
		}
		private function i (e:Event):void {
			l = true;
			removeEventListener(Event.ADDED_TO_STAGE,i);
			init();
		}
		public function init ():void {
			// trace('default INT at c.o')
		}
		public function defineCd ():void {
			cd = new v(5+Math.abs(Math.ceil(Math.random()*sw-10)),5+Math.abs(Math.ceil(Math.random()*sh-10)))
		}
		public function defineDelta ():void {
				dx=x-cd.x;
				dy=y-cd.y;
		}
		public function mt ():void {
			rotation+=rx;
			if (allowMoving) {
				defineDelta();
				var angle:Number = -Math.atan2(dx, dy)/(Math.PI/180);
				if (Math.sqrt((dx*dx)+(dy*dy))>interHDistance) {
					y -= moveSpeed*Math.cos(angle*(Math.PI/180));
					x += moveSpeed*Math.sin(angle*(Math.PI/180));
				} else {
					defineCd();
				}
			}
		}
		public function distance(a:o,b:o):Number	{
			return Math.sqrt( Math.pow(a.x-b.x,2)+Math.pow(a.y-b.y,2) );
		}
		public function get sw ():uint {
			return stage.stageWidth;
		}
		public function get sh ():uint {
			return stage.stageHeight;
		}
		public function destroy ():void {
			l = false;
			removeListeners();
			if (parent != null) { 
				parent.removeChild(this);
			}
		}
		public function removeListeners ():void {
			removeEventListener(Event.ENTER_FRAME,ani_init);
			removeEventListener(Event.ADDED_TO_STAGE,i);
		}
		// STATIC
		public static var all:Array=[];
		public static function addG(a:uint,b:uint,C:uint=0,T:uint=0,s:*=null):void {
			if (T==0) {
				all.push(new _b({x:a,y:b,s:s,c:C,t:T}));
			} else if (T==1) {
				all.push(new g({x:a,y:b,s:s,c:C,t:T}));
			} else if (T==2) {
				all.push(new r({x:a,y:b,s:s,c:C,t:T}));
			}
			s.dt0.text=all.length;
		}
	}
}
class v {
	public var x:uint;
	public var y:uint;
	public function v (a,b) {
		x=a;
		y=b;
	}
}