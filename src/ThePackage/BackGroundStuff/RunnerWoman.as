package ThePackage.BackGroundStuff 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Jeremy Bond
	 */
	public class RunnerWoman extends Human
	{
		private var art:humanArt3;
		public function RunnerWoman() 
		{
			art = new humanArt3;
			addChild(art);
			
			name = ("RunnerRight");
			speed = 20;
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