package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class Pice extends Sprite
	{
		private var txt:TextField;
		public function Pice()
		{
			super();
			
			var sp:Shape=new Shape();
			sp.graphics.beginFill(int(0xfffeee*Math.random()),.8);
			sp.graphics.drawCircle(0,0,25);
			sp.graphics.endFill();
			this.addChild(sp);
			
			txt=new TextField();
			txt.text='0';
			txt.width=20;
			txt.autoSize=TextFieldAutoSize.CENTER;
			txt.selectable=false;
			this.addChild(txt);
			
		}
		
		public function setValue(str:String=""):void
		{
			txt.text=str;
		}
	}
}