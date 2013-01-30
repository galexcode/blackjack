package com.models
{
	public class CardModel
	{
		
		//Suits
		public static const HEART : String = "hearts";
		public static const CLUB : String = "clubs";
		public static const SPADE : String = "spades";
		public static const DIAMOND : String = "diamonds";
		
		public static const SUITS : Vector.<String> = new <String>[CLUB, DIAMOND, HEART, SPADE];
		
		//Ranks
		public static const ACE : String = "ace";
		public static const TWO : String = "two";
		public static const THREE : String = "three";
		public static const FOUR : String = "four";
		public static const FIVE : String = "five";
		public static const SIX : String = "six";
		public static const SEVEN : String = "seven";
		public static const EIGHT : String = "eight";
		public static const NINE : String = "nine";
		public static const TEN : String = "ten";
		public static const JACK : String = "jack";
		public static const QUEEN : String = "queen";
		public static const KING : String = "king";
		
		public static const RANKS : Vector.<String> = new <String>[ACE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING];
		
		public static const VALUES : Object = {"ace":11, "two":2, "three":3, "four":4, "five":5, "six":6, "seven":7, "eight":8, "nine":9, "ten":10, "jack":10, "queen":10, "king":10};
		
		private var _suit : String;
		private var _rank : String;
		
		public function CardModel($suit, $rank) {
			_suit = $suit;
			_rank = $rank;
		}
		
		public function get suit() : String {
			return _suit;
		}
		
		public function get rank() : String {
			return _rank;
		}
		
		public function get value() : uint {
			return VALUES[_rank];
		}
		
	}
}