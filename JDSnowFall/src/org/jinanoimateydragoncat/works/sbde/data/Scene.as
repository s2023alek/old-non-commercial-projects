// Project SimpleBitmapDataEngine
package org.jinanoimateydragoncat.works.sbde.data {
	
	//{ =^_^= import
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import org.jinanoimateydragoncat.works.sbde.events.ExtendedEvent;
	//} =^_^= END OF import
	
	
	/**
	 * contains objects list
	 * @author Jinanoimatey Dragoncat
	 * @version 0.0.0
	 * @created 07.12.2011 17:52
	 */
	public class Scene {
		
		//{ =^_^= CONSTRUCTOR
		
		function Scene () {
		}
		//} =^_^= END OF CONSTRUCTOR
		
		
		//{ =^_^= Objects
		
		public function get_objectsList():Vector.<SceneObject> {
			return objectsList;
		}
		
		public function addObject(object:SceneObject):void {
			if (objectsList.indexOf(object)>-1) {return;}
			objectsList.push(object);
			dispatchEvent(new ExtendedEvent(EVENT_OBJECT_ADDED, object));
		}
		
		public function removeObject(object:SceneObject):void {
			if (objectsList.indexOf(object)>-1) {
				objectsList.splice(objectsList.indexOf(object), 1);
				dispatchEvent(new ExtendedEvent(EVENT_OBJECT_REMOVED, object));
			}
		}
		
		private var objectsList:Vector.<SceneObject> = new Vector.<SceneObject>();
		//} =^_^= END OF Objects
		
		
		
		//{ =^_^= Events
		public static const EVENT_OBJECT_ADDED:String = 'event_object_added';
		public static const EVENT_OBJECT_REMOVED:String = 'event_object_removed';
		//} =^_^= END OF Events
		
		
		//{ =^_^= Service
		public function get_eventDispatcher():EventDispatcher {return eventDispatcher;}
		
		private function dispatchEvent(e:Event):void {eventDispatcher.dispatchEvent(e);}
		
		private var eventDispatcher:EventDispatcher = new EventDispatcher();
		//} =^_^= END OF Service
		
	}
}

//{ =^_^= History
/* > (timestamp) [ ("+" (added) ) || ("-" (removed) ) || ("*" (modified) )] (text)
 * > 
 */
//} =^_^= END OF History

// template last modified:03.05.2010_[22#42#27]_[1]