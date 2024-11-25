// Project SimpleBitmapDataEngine
package org.jinanoimateydragoncat.works.sbde.view {
	
	//{ =*^_^*= import
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import org.jinanoimateydragoncat.works.sbde.data.Scene;
	import org.jinanoimateydragoncat.works.sbde.data.SceneObject;
	//} =*^_^*= END OF import
	
	
	/**
	 * 
	 * @author Jinanoimatey Dragoncat
	 * @version 0.0.0
	 * @created 07.12.2011 18:28
	 */
	public class BDBasicRenderer {
		
		//{ =*^_^*= CONSTRUCTOR
		
		function BDBasicRenderer () {
			throw new ArgumentError('static container only');
		}
		//} =*^_^*= END OF CONSTRUCTOR
		
		
		/**
		 * 
		 * @param	scene contains objects
		 * @param	destBD render(draw) scene to
		 * @param	ox sceneOffsetX
		 * @param	oy sceneOffsetY
		 */
		public static function renderScene(scene:Scene, destBD:BitmapData, ox:uint, oy:uint):void {
			solr = scene.get_objectsList();
			for each(sor in solr) {
				soP.x=sor.get_x();
				soP.y=sor.get_y();
				soBDL=sor.get_bd();
				soBDR=sor.get_bdR();
				for each(soBD in soBDL) {
					destBD.copyPixels(soBD, soBDR, soP, null, null, true);
				}
				sor.onRender();
			}
		}
		
		//{ =*^_^*= cache
		private static var solr:Vector.<SceneObject>;
		private static var sor:SceneObject;
		private static var soP:Point = new Point();
		private static var soBD:BitmapData;
		private static var soBDR:Rectangle;
		private static var soBDL:Vector.<BitmapData>;
		//} =*^_^*= END OF cache
		
	}
}

//{ =*^_^*= History
/* > (timestamp) [ ("+" (added) ) || ("-" (removed) ) || ("*" (modified) )] (text)
 * > 
 */
//} =*^_^*= END OF History

// template last modified:11.03.2011_[18#51#40]_[5]