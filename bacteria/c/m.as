//08.06.2008_[03#58#22]_[7]
package c{
	import flash.text.*;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.*;
	import c.o;
	
	
	public class m extends Sprite {
		public function m () {
			addEventListener(Event.ADDED,l1);
			stage.quality='low';
			for (var i=0;i<=30;i++){
				o.addG(stage.stageWidth/2,stage.stageHeight/2,undefined,1,root);
			}
			addEventListener(Event.ENTER_FRAME,l0);
			sp1.alpha=sp0.alpha=.4;
		}
		private function l0 (e:Event):void {
			sp1.x += 1;
			if (sp1.x >= 0) {
				sp1.x = -800;
			}
			sp0.x -= 1;
			if (sp0.x <= -800) {
				sp0.x = 0;
			}
		}
		private function l1(e:Event):void{
			if (e.target != sp0 && e.target != dt0 && e.target != sp1) {
				addChild(sp0);
				addChild(sp1);
				addChild(dt0);
			}
		}
		public override function removeChild (a:DisplayObject):DisplayObject {
			if (o.all.length>1) {
				for (var i in o.all){
					if(o.all[i]==a){
						o.all[i]=null;
						o.all.splice(i,1);
						break;
					}
				}
			} else {
				o.all =[];
			}
			super.removeChild(a);
			dt0.text=o.all.length;
		}
	}
}