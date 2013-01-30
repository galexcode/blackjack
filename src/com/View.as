package com
{
	
	import flash.display.Bitmap;
	import flash.geom.Point;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class View extends Sprite
	{
		
		[Embed(source="../../assets/background@2x.png")]
		protected var backgroundAsset : Class;
		
		[Embed(source="../../assets/button-hit@2x.png")]
		protected var buttonHitAsset : Class;
		
		[Embed(source="../../assets/button-stand@2x.png")]
		protected var buttonStandAsset : Class;
		
		
		public var bg : Image;
		public var buttonHit : Image;
		public var buttonStand : Image;
		
		public function View() {
			super();
			addEventListener(Event.ADDED_TO_STAGE, _init);
		}
		
		protected function _init($e:Event) : void {
			
			//Add background image
			bg = Image.fromBitmap(new backgroundAsset());
			addChild(bg);
			
			//Add "Hit" button
			buttonHit = Image.fromBitmap(new buttonHitAsset());
			buttonHit.x = 40;
			buttonHit.y = 780;
			addChild(buttonHit);
			
			//Add "Stand" button
			buttonStand = Image.fromBitmap(new buttonStandAsset());
			buttonStand.x = 510;
			buttonStand.y = 780;
			addChild(buttonStand);
			
		}
		
		protected function _onTouch($e:TouchEvent) : void {
			//card.startTouchDrag($e.touchPointID, false);
			var touches:Vector.<Touch> = $e.getTouches(this, TouchPhase.MOVED);
			
			if (touches.length == 1)
			{
				// one finger touching -> move
				var delta:Point = touches[0].getMovement(parent);
				bg.x += delta.x;
				bg.y += delta.y;
			} 
			else if (touches.length == 2)
			{
				// two fingers touching -> rotate and scale
				var touchA:Touch = touches[0];
				var touchB:Touch = touches[1];
				
				var currentPosA:Point  = touchA.getLocation(parent);
				var previousPosA:Point = touchA.getPreviousLocation(parent);
				var currentPosB:Point  = touchB.getLocation(parent);
				var previousPosB:Point = touchB.getPreviousLocation(parent);
				
				var currentVector:Point  = currentPosA.subtract(currentPosB);
				var previousVector:Point = previousPosA.subtract(previousPosB);
				
				var currentAngle:Number  = Math.atan2(currentVector.y, currentVector.x);
				var previousAngle:Number = Math.atan2(previousVector.y, previousVector.x);
				var deltaAngle:Number = currentAngle - previousAngle;
				
				// update pivot point based on previous center
				var previousLocalA:Point  = touchA.getPreviousLocation(this);
				var previousLocalB:Point  = touchB.getPreviousLocation(this);
				pivotX = (previousLocalA.x + previousLocalB.x) * 0.5;
				pivotY = (previousLocalA.y + previousLocalB.y) * 0.5;
				
				// update location based on the current center
				x = (currentPosA.x + currentPosB.x) * 0.5;
				y = (currentPosA.y + currentPosB.y) * 0.5;
				
				// rotate
				//rotation += deltaAngle;
				
				// scale
				var sizeDiff:Number = currentVector.length / previousVector.length;
				scaleX *= sizeDiff;
				scaleY *= sizeDiff;
			}
		}
	}
}