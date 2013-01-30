package com
{
	
	import com.controllers.HandController;
	import com.controllers.ShoeController;
	
	public class Controller {
		
		public var view:View;
		public var model:Model;
		
		public var hand : HandController;
		public var shoe : ShoeController;
		
		public function Controller($model, $view) {
			model = $model;
			view = $view;
		}
		
		public function init() : void {
			
			shoe = new ShoeController(model, view, this);
			shoe.create();
			
			hand = new HandController(model, view, this);		
		}
	}
}