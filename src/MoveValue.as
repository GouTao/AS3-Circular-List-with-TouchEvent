package
{
	import flash.display.Sprite;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	[SWF(width="1280",height="720")]
	public class MoveValue extends Sprite
	{
		private var valueArr:Array=['0','1','2','3','4','5','6','7','8','9','10','11','12','13'];
		private var piceArr:Array=new Array();
		private var startPos:Number;
		private var tempPos:Number;
		
		public function MoveValue()
		{
			for(var i:uint=0;i<4;i++)
			{
				var pice:Pice=new Pice();
				pice.setValue(valueArr[3-i]);
				this.addChild(pice);
				pice.x=300;
				pice.y=50+100*i;
				piceArr.push(pice);
			}
			
			if(Multitouch.supportsTouchEvents)
			{
				Multitouch.inputMode=MultitouchInputMode.TOUCH_POINT;
				stage.addEventListener(TouchEvent.TOUCH_BEGIN,onStartMove);
				stage.addEventListener(TouchEvent.TOUCH_END,onStopMove);
			}
		}
		
		protected function onStopMove(event:TouchEvent):void
		{
			stage.removeEventListener(TouchEvent.TOUCH_MOVE,onMoveHandle);
		}
		
		protected function onStartMove(event:TouchEvent):void
		{
			startPos=event.stageY;
			stage.addEventListener(TouchEvent.TOUCH_MOVE,onMoveHandle);
		}
		
		protected function onMoveHandle(event:TouchEvent):void
		{
			tempPos=event.stageY;
			var dis:Number=startPos-tempPos;
			for(var i:uint=0;i<piceArr.length;i++)
			{
				piceArr[i].y-=dis;
				if(piceArr[i].y<=0)
				{
					piceArr[i].y=piceArr[piceArr.length-1].y+100;
					piceArr[i].setValue(valueArr[valueArr.length-1]);
					valueArr.unshift(valueArr.pop());	
					piceArr.push(piceArr.shift());
				}
				if(piceArr[i].y>=stage.stageHeight)
				{
					piceArr[i].y=piceArr[0].y-100;
					piceArr[i].setValue(valueArr[4]);
					valueArr.push(valueArr.shift());	
					piceArr.unshift(piceArr.pop());
				}
			}
			startPos=event.stageY;
		}
	}
}