package com.controllers {
	
	import com.Model;
	import com.View;
	import com.greensock.TweenMax;
	import com.models.CardModel;
	import com.views.CardView;
	
	import flash.geom.Point;
	
	public class CardController {
	
		public var model : Model;
		public var view : View;
		
		public var cardView : CardView;
		public var cardModel : CardModel;
		
		public function CardController($model, $view) {
			model = $model;			
			view = $view;
		}
		
		public function create($suit, $rank) : void {
			cardView = new CardView();
			cardModel = new CardModel($suit, $rank);
		}
		
		public function deal($start:Point, $end:Point, $delay:Number=0) : void {
			cardView.x = $start.x;
			cardView.y = $start.y;
			view.addChild(cardView);
			TweenMax.to(cardView, 0.8, {x:$end.x, y:$end.y, delay:$delay});
		}
		
		public function clear() : void {
			view.removeChild(cardView);
		}
	}
}