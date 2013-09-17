package ThePackage.Crap 
{
	/**
	 * ...
	 * @author Jeremy Bond
	 */
	public class Crap 
	{
		private var name    : String;
		private var damage  : Number;
		
		public function getName():String
		{
			return name;
		}
		public function setName(newName:String):void
		{
			name = newName;
		}
		public function getDamage(): Number
		{
			return damage;
		}
		public function setDamage(newDamage:Number):void
		{
			damage = newDamage;
		}
		
	}

}