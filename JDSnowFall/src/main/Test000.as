// Project Test000
package main {
	
	//{ =*^_^*= import
	import flash.events.AccelerometerEvent;
	import flash.sensors.Accelerometer;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import lib.Test000Library;
	import org.jinanoimateydragoncat.utils.Stats;
	import org.jinanoimateydragoncat.works.sbde.data.Scene;
	import org.jinanoimateydragoncat.works.sbde.data.SceneObject;
	import org.jinanoimateydragoncat.works.sbde.view.BDBasicViewport;
	import test000.Flake;
	import test000.Star;
	//} =*^_^*= END OF import
	
	
	/**
	 * Main
	 * @author Jinanoimatey Dragoncat
	 * @version 0.0.0
	 * @created 
	 */
	public class Test000 extends Sprite {
		
		//{ =*^_^*= CONSTRUCTOR
		
		function Test000 () {
			if (stage) {init();}
			else {addEventListener(Event.ADDED_TO_STAGE, init);}
		}
		
		private function init(e:Event=null):void {
			//{ ^_^ prepare
			Test000Library.initialize(libraryInitialized);
			if (e) {removeEventListener(e.type, arguments.callee);}
			//} ^_^ END OF prepare
		}
		
		private function libraryInitialized():void {
			// entry point
			addEventListener(Event.ENTER_FRAME, skipOneFrame);
		}
		//} =*^_^*= END OF CONSTRUCTOR
		
		
		private function skipOneFrame(e:Event):void {
			prepareAndFillScene();
			//addChild(new Stats());
			//prepareView();
			if (Accelerometer.isSupported) {
				initAcc();
			} else {
				initMouse();
				Star.mouseX=stageW/2;
				noAcc = true;
			}
			addEventListener(Event.ENTER_FRAME, el_ENTER_FRAME);
			
			removeEventListener(Event.ENTER_FRAME, skipOneFrame);
		}
		
		private function el_ENTER_FRAME(e:Event):void {
			Star.xmovement = (Star.mouseX-stageW/2)*-1;
			if (isNaN(Star.xmovement)||Star.xmovement==0) {
				Star.xmovement=.01;
			}
			
			Flake.xmovement = Star.xmovement;
			
			vp.redraw();
		}
		
		//{ =*^_^*= Accelerometer and Mouse
		private function initMouse():void {
			stage.addEventListener(MouseEvent.MOUSE_MOVE, el_MOUSE_MOVE);
		}
		
		private function el_MOUSE_MOVE(e:MouseEvent):void {
			Star.mouseX = Math.min(stageW,Math.max(0,stageW/2+stage.mouseX-stageW/2));
			//Star.mouseY = stageH/2+e.accelerationY+.5*stageH/2;
			Star.mouseY = 0;
			Flake.mouseX=Star.mouseX;
			Flake.mouseY=Star.mouseY;
		}
		private function initAcc():void {
			Star.spawnAtMousePosition=true;
			acc=new Accelerometer();
			acc.setRequestedUpdateInterval(50);
			acc.addEventListener(AccelerometerEvent.UPDATE, el_acc_UPDATE);
		}
		
		private function el_acc_UPDATE(e:AccelerometerEvent):void {
			Star.mouseX = Math.min(stageW,Math.max(0,stageW/2+e.accelerationX*-2*stageW/2));
			//Star.mouseY = stageH/2+e.accelerationY+.5*stageH/2;
			Star.mouseY = 0;
			Flake.mouseX=Star.mouseX;
			Flake.mouseY=Star.mouseY;
		}
		private var noAcc:Boolean;
		private var acc:Accelerometer;
		//} =*^_^*= END OF Accelerometer and Mouse
		
		
		//{ =*^_^*= general and init
		private function prepareAndFillScene():void {
			scene=new Scene();
			vp=new BDBasicViewport(scene, stageW, stageH);
			addChild(vp);
			stageW=vp.width;
			
			// fill
			for (var i:uint = 0; i < numberOfObjects; i++) {
				if (Math.random()>.5) {
					scene.addObject(new Flake(45, stageW, stageH, 9, Math.max(3,i*100/numberOfObjects)));
				} else {
					scene.addObject(new Star(45, stageW, stageH, 9, Math.max(3,i*100/numberOfObjects), Math.random()>.5));
				}
			}
		}
		
		private var stageW:uint=800;
		private var stageH:uint=480;
		private var numberOfObjects:uint=350;
		private var vp:BDBasicViewport;
		private var scene:Scene;
		private static var stageW:uint;
		//} =*^_^*= END OF general and init
		
		
		//{ =*^_^*= view
		private function prepareView():void {
			//add button
			var b:Sprite=new Sprite();
			addChild(b);
			b.graphics.beginFill(0x00aa00);
			b.graphics.drawRect(0,0,60,30);
			b.graphics.endFill();
			var tf:TextField=new TextField();
			b.addChild(tf);
			tf.width=60;
			tf.height=30;
			tf.autoSize=TextFieldAutoSize.CENTER;
			tf.mouseEnabled=false;
			tf.defaultTextFormat=new TextFormat(null,25);
			tf.text='Run!';
			b.useHandCursor=true;
			b.buttonMode=true;
			b.x=stageW/2;
			b.y=stageH/2;
			b.addEventListener(MouseEvent.MOUSE_DOWN, el_bPressed);
		}
		
		private function el_bPressed(e:Event):void {
			removeChild(e.target as DisplayObject);
			//start rendering
			//Star.mouseInteraction=true;
		}
		//} =*^_^*= END OF view
	}
}

//{ =*^_^*= History
/* > (timestamp) [ ("+" (added) ) || ("-" (removed) ) || ("*" (modified) )] (text)
 * > 
 */
//} =*^_^*= END OF History

// template last modified:11.03.2011_[18#55#10]_[5]