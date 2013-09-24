package ThePackage.BackGroundStuff 
{
	import flash.display.MovieClip;
	import flash.events.PressAndTapGestureEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Jeremy Bond
	 */
	public class Human extends MovieClip
	{
		/*
		*variables
		*/
		public var rotationNumb:Number = Math.random();
		private var _name   : String;
		private var _pos 	: Number;
		private var _speed	: Number;
		private var _left	: Boolean;
		
		//////////name
		public function get id():String
		{
			return _name;
		}
		public function set id(id:String):void
		{
			_name = id;
		}
		//////////pos
		public function get position():Number
		{
			return _pos;
		}
		public function set position(position:Number):void
		{
			_pos = position;
		}
		//////////speed
		public function get speed(): Number
		{
			return _speed;
		}
		public function set speed(speed:Number): void
		{
			_speed = speed;
		}
		//////////leftOrRight
		public function get left():Boolean
		{
			return _left;
		}
		public function set left(left:Boolean):void
		{
			_left = left;
		}
		/*
		*update
		*/
		public function update():void
		{
			if (_left == true)
			{
				y += _speed;
			}else {
				y -= -speed;
			}
			
		}
		
	}

}