package com
{
	public class Model
	{
		
		public static const GAME_IDLE : String = "GameStateIdle";
		public static const GAME_DEALING : String = "GameStateDealing";
		public static const GAME_HAND_IN_PROGRESS : String = "GameStateHandInProgress";
		public static const GAME_HAND_COMPLETE : String = "GameStateHandComplete";
		public static const GAME_SHUFFLING : String = "GameStateShuffling";
		
		public var gameStatus : String = GAME_IDLE;
		
		public function Model() {
			
		}
	}
}