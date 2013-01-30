package com.views
{
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class CardView extends Sprite
	{
		
		[Embed(source="../../../assets/cardback.png")]
		public var cardbackAsset : Class;;
		
		public var cardback : Image = Image.fromBitmap(new cardbackAsset());
		public var front : Image;
		
		public function CardView()
		{
			super();
			addChild(cardback);
		}
		
		public function setCardFront($image : Image) : void {
			front = $image;
		}
	}
}