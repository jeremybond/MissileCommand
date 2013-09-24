package ThePackage.BackGroundStuff 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Jeremy Bond
	 */
	public class WalkerWoman extends Human
	{
		private var art:humanArt4;
		public function WalkerWoman() 
		{
			art = new humanArt4;
			addChild(art);
			
			id = ("WalkerRight");
			speed = 15;
			left = false;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			position = (stage.stageWidth + 10);
		}
		
		
	}

}