package com.controllers {
	
	import com.Controller;
	import com.Model;
	import com.View;
	import com.models.CardModel;
	
	public class ShoeController {
		
		public static const SHUFFLE_THRESHOLD : uint = 60;
		public static const SHOE_NEEDS_SHUFFLE : String = "shoeNeedsToBeShuffled";
		public static const SHOE_IN_PLAY : String = "shoeInPlay";
		
		public var view :View;
		public var model:Model;
		public var controller:Controller;
		
		public var shoe:Vector.<CardController>;
		public var discard:Vector.<CardController>;
		
		protected var _state : String = SHOE_IN_PLAY;
		
		public function ShoeController($model, $view, $controller) {
			model = $model;
			view = $view;
			controller = $controller;
		}
		
		/**
		 * 	Generate six decks worth of cards and store in a vector.
		 */
		public function create() : void {
			shoe = new Vector.<CardController>();
			discard = new Vector.<CardController>();
			
			var i : uint; //Number of decks
			var j : uint; //Suits
			var k : uint; //Ranks
			
			for (i=0; i<6; i++) {
				for (j=0; j<CardModel.SUITS.length-1; j++) {
					for (k=0; k<CardModel.RANKS.length-1; k++) {
						var card : CardController = new CardController(model, view);
						card.create(CardModel.SUITS[j], CardModel.RANKS[k]);
						shoe.push(card);
					}
				}
			}
			
			//Perform initial shuffle
			shuffle();
		}
		
		/**
		 * 	Deal a single card from the shoe.
		 */
		public function deal() : CardController {
			//Check if the shoe needs a shuffle
			if (shoe.length < SHUFFLE_THRESHOLD) state = SHOE_NEEDS_SHUFFLE;
			return shoe.pop();
		}
		
		/**
		 * 	Shuffle all cards in the shoe.
		 */
		public function shuffle() : void {
			//First replace all discarded cards
			replaceDiscardPileBackIntoShoe();
			
			var len : uint = shoe.length;
			for (var i : uint = 0; i < len; i++) {
				_swap( shoe, i, i + uint( Math.random() * (len - i) ) );
			}
			
			state = SHOE_IN_PLAY;
		}
		
		/**
		 * 	Shuffle utility helper method
		 */
		protected function _swap( vect:Object, a:uint, b:uint ):void {
			var temp:Object = vect[a];
			vect[a] = vect[b];
			vect[b] = temp;
		}
		
		/**
		 *	Remove all items from discard and add them back to shoe. 	
		 */
		public function replaceDiscardPileBackIntoShoe() : void {
			var len : uint = discard.length;
			for (var i : uint = 0; i < len; i++) {
				if (discard.length > 0) {
					var card : CardController = discard.pop();
					shoe.push( discard.pop() );
				}
			}
		}
		
		public function get state() : String {
			return _state;
		}
		
		public function set state($state : String) : void {
			_state = $state;
		}
	}
}