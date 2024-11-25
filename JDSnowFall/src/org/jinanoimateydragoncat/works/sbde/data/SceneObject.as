// Project SimpleBitmapDataEngine
package org.jinanoimateydragoncat.works.sbde.data {
	
	//{ =^_^= import
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	//} =^_^= END OF import
	
	
	/**
	 * object data
	 * @author Jinanoimatey Dragoncat
	 * @version 0.1.0
	 * @created 07.12.2011 18:05
	 */
	public class SceneObject {
		
		//{ =^_^= CONSTRUCTOR
		
		function SceneObject (bd:BitmapData = null, w:Number=0, h:Number=0, x:Number=0, y:Number=0) {
			this.x=x;
			this.y=y;
			this.bd=new Vector.<BitmapData>();
			if (bd) {this.bd.push(bd);}
			bdR=new Rectangle(0,0,w,h);
		}
		//} =^_^= END OF CONSTRUCTOR
		
		public function onRender():void {
			// override and place your code here
			// object just rendered, place movement(or whatever) code to save loops through per framed array of scene objects 
		}
		
		
		//{ =^_^= Data
		
		public function get_x():Number {return x;}
		public function set_x(a:Number):void {x = a;}
		
		public function get_y():Number {return y;}
		public function set_y(a:Number):void {y = a;}
		
		public function get_w():Number {return bdR.width;}
		public function set_w(a:Number):void {bdR.width = a;}
		
		public function get_h():Number {return bdR.height;}
		public function set_h(a:Number):void {bdR.height = a;}
		
		public function get_bd():Vector.<BitmapData> {return bd;}
		public function set_bd(a:Vector.<BitmapData>):void {bd = a;}
		
		public function get_bdR():Rectangle {return bdR;}
		public function set_bdR(a:Rectangle):void {bdR = a;}
		
		/**
		 * less memory will be used(but more cpu)
		 */
		private var bd:Vector.<BitmapData>;
		private var bdR:Rectangle;
		protected var x:Number;
		protected var y:Number;
		
		//} =^_^= END OF Data
		
	}
}

//{ =^_^= History
/* > (timestamp) [ ("+" (added) ) || ("-" (removed) ) || ("*" (modified) )] (text)
 */
//} =^_^= END OF History

// template last modified:03.05.2010_[22#42#27]_[1]