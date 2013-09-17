package ThePackage.Crap 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import ThePackage.Main;
	/**
	 * ...
	 * @author Jeremy Bond
	 */
	public class NormalCrap extends Crap2Art
	{
		public var rotationNumb:Number = Math.random();
		public function NormalCrap() 
		{
			
		}
		public function update():void
		{
			if (rotationNumb < 0.5) rotation ++;
			if (rotationNumb > 0.5) rotation --;
			y += 5;
			var nBul:int = Main._allBullets.length;
			
			//if (item.hitTestObject(this)) 
			//{
				//trace("jes");
			//}
		}
		
		
	}

}