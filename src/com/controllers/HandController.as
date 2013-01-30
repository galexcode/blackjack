package com.controllers {
	
	import com.Controller;
	import com.Model;
	import com.View;
	import com.models.CardModel;
	
	public class HandController {
		
		public static const BLACKJACK 					: uint = 21;
		public static const IDLE						: String = "idle";
		public static const HAND_IS_DEALING 			: String = "handIsBeingDealt";
		public static const WAITING_FOR_PLAYER_ACTION 	: String = "waitingForPlayerToTakeAction";
		public static const DEALER_IN_ACTION 			: String = "dealerTakingAction";
		public static const RESOLVING_HANDS 			: String = "resolvingAllHands";
		
		public var model : Model;
		public var view : View;
		public var controller:Controller;
		
		public var dealerHand : Vector.<CardController>;
		public var playerHand : Vector.<CardController>;
		public var currentHandPhase : String = IDLE;
		
		public function HandController($model, $view, $controller) {
			model = $model;
			view = $view;
			controller = $controller;
			
			//Set event listeners
		}
		
		/**
		 * 	Deal two cards to player and dealer
		 */
		public function deal() : void {
			//Ensure correct phase
			if (currentHandPhase != IDLE) return;
			
			//Add cards to hand
			playerHand.push(controller.shoe.deal());
			dealerHand.push(controller.shoe.deal());
			playerHand.push(controller.shoe.deal());
			dealerHand.push(controller.shoe.deal());
			
			//Animate cards onto screen (keep dealer second card "hidden")
			
			//On animation complete set hand state to next phase
		}
		
		/**
		 * 	Evaluate hand, return score
		 */
		public function evaluate($hand:Vector.<CardController>) : uint {
			var i : uint;
			var score : uint = 0;
			for (i=0; i<$hand.length; i++) {
				//Check for soft ace condition
				if ($hand[i].cardModel.rank == CardModel.ACE && score >= 11) score++;
				else score += $hand[i].cardModel.value;
			}
			return score;
		}
	}
}