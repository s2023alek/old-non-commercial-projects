// Project SimpleBitmapDataEngine
package org.jinanoimateydragoncat.works.sbde.view {
	
	//{ =*^_^*= import
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import org.jinanoimateydragoncat.works.sbde.data.Scene;
	//} =*^_^*= END OF import
	
	
	/**
	 * 
	 * @author Jinanoimatey Dragoncat
	 * @version 0.0.0
	 * @created 07.12.2011 19:07
	 */
	public class BDBasicViewport extends Bitmap {
		
		//{ =*^_^*= CONSTRUCTOR
		
		function BDBasicViewport(scene:Scene, width:uint, height:uint, bgColor:uint=0, sceneXOffset:uint=0, sceneYOffset:uint=0) {
			this.scene=scene;
			bd = new BitmapData(width, height, true, bgColor);
			ox=sceneXOffset;
			oy=sceneYOffset;
			bc=bgColor;
			super(bd);
		}
		//} =*^_^*= END OF CONSTRUCTOR
		
		public function redraw():void {
			bd.fillRect(bd.rect, bc);
			BDBasicRenderer.renderScene(scene, bd, ox, oy);
		}
		
		protected var scene:Scene;
		protected var bd:BitmapData
		protected var bc:uint;
		
		protected var ox:uint;
		protected var oy:uint;
		
	}
}

//{ =*^_^*= History
/* > (timestamp) [ ("+" (added) ) || ("-" (removed) ) || ("*" (modified) )] (text)
 * > 
 */
//} =*^_^*= END OF History

// template last modified:11.03.2011_[18#51#40]_[5]