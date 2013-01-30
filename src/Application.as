package
{
	import com.Controller;
	import com.Model;
	import com.View;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	[SWF(frameRate="60",width="640",height="960")]
	public class Application extends Sprite
	{
		
		public var view : View;
		public var model : Model;
		public var controller : Controller;
		
		private var _starling : Starling;
				
		public function Application()
		{
			super();
			
			model = new Model();			
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
						
			Starling.multitouchEnabled = true;
			_starling = new Starling(View, stage);
			_starling.showStats = true;
			_starling.start();
			_starling.addEventListener(Event.ROOT_CREATED, _init);
			
		}
		
		protected function _init($e:Event) : void {
			view = View(_starling.root);
			controller = new Controller(model, view);
			controller.init();
		}
	}
}