// Project Test000
package test000 {
	
	//{ =*^_^*= import
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	import org.jinanoimateydragoncat.works.sbde.data.SceneObject;
	//} =*^_^*= END OF import
	
	
	/**
	 * animation controll
	 * @author Jinanoimatey Dragoncat
	 * @version 0.0.0
	 * @created 08.12.2011 13:59
	 */
	public class Star extends SceneObject {
		
		//{ =*^_^*= CONSTRUCTOR
		
		/**
		 * 
		 * @param	sceenZ 0 ... 100, affects size, blur, and speed
		 */
		function Star(size:uint, scrW:uint, scrH:uint, movementSpeed:uint, screenZ:uint, controllable:Boolean) {
			super(
				null//35
				,Math.max(4, size*screenZ/100)
				,Math.max(4, size*screenZ/100)
			);
			this.controllable=controllable;
			prepareMovement(scrW, scrH, movementSpeed, screenZ);
			prepareAnimation();
			createBD();
		}
		//} =*^_^*= END OF CONSTRUCTOR
		
		//{ =*^_^*= bitmap data related
		
		private function createBD(selectedMode:Boolean=false):void {
			var halfW:uint = get_w()/2;
            
			if (!sp) {
				sp=new Sprite();
			} else {
				//clear
				while (sp.numChildren>0) {sp.removeChildAt(0);}
				sp.graphics.clear();
			}
			
			
			//simple shape (to avoid severe performance fall)
			sh=new Shape();
			sp.addChild(sh);
			sh.x=get_w()/2;
			sh.y=get_h()/2;
			
			var maxBlur:uint=6;
			sp.filters=[new BlurFilter(Math.max(1, maxBlur*(1-sZ/100)),Math.max(1, maxBlur*(1-sZ/100)), 2)];
			
			//select frameset
			if (selectedMode) {
				useFrameset(selBDs);
			} else {
				useFrameset(defBDs);
			}
			
			//create bitmap(s)
			var defBD:BitmapData;
			
			var numFrames:uint=3+((Math.random()>.5)?2:0);
			for (var i:uint = 0; i < numFrames; i++) {
				defBD = new BitmapData(get_w(), get_h(), true, 0);
				
				sh.graphics.clear();
				sh.graphics.beginFill((Math.random()*200+50 << 16 | Math.random()*200+50 << 8 | Math.random()*200+50));
				sh.graphics.drawRect(-get_w()/4,-get_h()/4,get_w()/2, get_h()/2);
				if (selectedMode) {
					// draw selection mark to sp if selected
					sp.graphics.lineStyle(3, 0x00FFFF);//selection color
					sp.graphics.drawRect(3,3,get_w()-6,get_h()-6);
				}
				
				sh.rotation=i*(360/numFrames);
				
				defBD.draw(sp);
				addFrame(defBD);
			}
			nextFrame();
		}
		
	
		
		/**
		 * default BitmapData frameset
		 */
		private var defBDs:Vector.<BitmapData>=new Vector.<BitmapData>();
		/**
		 * selected BitmapData frameset
		 */
		private var selBDs:Vector.<BitmapData>;
		private static var sp:Sprite;
		//} =*^_^*= END OF bitmap data related
		
		
		public override function onRender():void {
			move();
			if (mouseInteraction) {
				checkMouse();
			}
			nextFrame();
		}
		
		
		//{ =*^_^*= movement
		public function move():void {
			//vertically
			y+=mS;
			//boundaries
			if (y>sH) {
				if (spawnAtMousePosition&&controllable) {
					checkAndSpawnAtPosition();
				} else {
					y = 0;
				}
			}
			
			//horisontally
			r += (k/180)*Math.PI;
			x -= (Math.cos(r)+(xmovement)/50)*sZ/100;
			//boundaries
			if (x<0) {
				x=sW;
			} else if (x>sW) {
				if (spawnAtMousePosition&&controllable) {
					checkAndSpawnAtPosition();
				} else {
					x = 0;
				}
			}
			
		}
		
		private function checkAndSpawnAtPosition():void {
			x=mouseX+Math.random()*30;
			y=mouseY+Math.random()*30;
		}
		
		private function prepareMovement(screenW:uint, screenH:uint, movementSpeed:uint, screenZ:uint):void {
			sW=screenW;
			sH=screenH;
			sZ=Math.max(1, screenZ);
			mS=Math.max(0.01, movementSpeed*sZ/100);//speed distribution
			
			x = Math.random()*sW;
			y = Math.random()*sH;
			
			
			//horisontal movement
			k=-Math.PI+Math.random()*Math.PI;
		}
		
		private var k:Number;
		private var r:Number=0;
		private var controllable:Boolean;
		public static var spawnAtMousePosition:Boolean;
		public static var xmovement:Number=0;
		
		private var sW:uint;
		private var sH:uint;
		private var mS:Number;
		private var sZ:uint;
		
		private static var sh:Shape;
		private static var shapes:Array=[new Shape(), new Shape(), new Shape(), new Shape(), new Shape()];
		//} =*^_^*= END OF movement
		
		
		//{ =*^_^*= animation
		private function prepareAnimation():void {
			aniSkipFramesNum=Math.max(Math.random()*4, 1);
		}
		
		private function useFrameset(framesetRef:Vector.<BitmapData>):void {
			frames=framesetRef;
			maxFrames=frames.length;
		}
		
		private function addFrame(frameBD:BitmapData):void {
			frames.push(frameBD);
			maxFrames=frames.length;
		}
		
		private function nextFrame():void {
			if (currentFrame>=maxFrames) {
				currentFrame=0;
			}
			get_bd()[0]=frames[currentFrame];
			currentFrame+=1;
		}
		
		private var aniSkipFramesNum:uint;
		private var aniSkipFramesCF:uint;
		
		private var frames:Vector.<BitmapData>;
		private var currentFrame:uint;
		private var maxFrames:uint;
		//} =*^_^*= END OF animation
		
		
		//{ =*^_^*= mouse interaction
		public function set_selected(a:Boolean):void {
			if (sdd!=a) {
				sdd=a;
				if (!selBDs) {
					// create selected bitmaps if needed
					selBDs=new Vector.<BitmapData>()
					createBD(sdd);
				}
				// switch sets
				if (sdd) {
					useFrameset(selBDs);
				} else {
					useFrameset(defBDs);
				}
			}
		}
		
		
		private function checkMouse():void {
			set_selected(Math.abs(get_x()-mouseX)<get_w()&&Math.abs(get_y()-mouseY)<get_h());
		}
		
		/**
		 * is selected
		 */
		private var sdd:Boolean;
		public static var mouseInteraction:Boolean=false;
		public static var mouseX:uint;
		public static var mouseY:uint;
		//} =*^_^*= END OF mouse interaction
		
	}
}

//{ =*^_^*= History
/* > (timestamp) [ ("+" (added) ) || ("-" (removed) ) || ("*" (modified) )] (text)
 * > 
 */
//} =*^_^*= END OF History

// template last modified:11.03.2011_[18#51#40]_[5]