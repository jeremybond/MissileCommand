package ThePackage
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.sampler.NewObjectSample;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import ThePackage.Crap.StarCrap;
	import ThePackage.Crap.NormalCrap;
	import ThePackage.PlayerObjects.Bullet;
	import ThePackage.PlayerObjects.Tower;
	
	/**
	 * ...
	 * @author Jeremy Bond
	 */
	public class Main extends Sprite
	{
		public var random:Number;
		public static var _allBullets:Array = [];
		public var tower1:Tower = new Tower();
		public var tower2:Tower = new Tower();
		public var tower3:Tower = new Tower();
		public var shootingTowerX:Number;
		public var shootingTowerY:Number;
		public static var _allCraps:Array = [];
		public var TimeOhTime:Timer;
		
		public static var main:Main;
		
		public function Main():void
		{
			addChild(tower1);
			addChild(tower2);
			addChild(tower3);
			
			tower1.x = 200;
			tower2.x = 400;
			tower3.x = 600;
			
			tower1.y = stage.stageHeight - 100;
			tower2.y = stage.stageHeight - 100;
			tower3.y = stage.stageHeight - 100;
			
			TimeOhTime = new Timer((Math.random() * 2000)+1000, 0);
			TimeOhTime.addEventListener(TimerEvent.TIMER, spawnCrap);
			TimeOhTime.start();
			
			stage.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(MouseEvent.CLICK, mouseClick);
		}
		
		private function spawnCrap(e:TimerEvent):void 
		{
			var newCrap : NormalCrap = new NormalCrap();
			_allCraps.push(newCrap);
			newCrap.x = Math.random() * stage.stageWidth;
			newCrap.y = -20;
			addChild(newCrap);
		}
		private function mouseClick(e:MouseEvent):void 
		{
			var newBullet : Bullet = new Bullet();
			_allBullets.push(newBullet);
			addChild(newBullet);
			
			random = Math.random();
			if (random > 0.7)
			{
				shootingTowerX = tower1.x;
				shootingTowerY = tower1.y;
				newBullet.rotation = tower1.cannonloop.rotation;
				newBullet.x = tower1.x;
				newBullet.y = tower1.y;
			}else if (random >= 0.4 && random <= 0.7)
			{
				shootingTowerX = tower2.x;
				shootingTowerY = tower2.y;
				newBullet.rotation = tower2.cannonloop.rotation;
				newBullet.x = tower2.x;
				newBullet.y = tower2.y;
			}else if (random < 0.4)
			{
				shootingTowerX = tower3.x;
				shootingTowerY = tower3.y;
				newBullet.rotation = tower3.cannonloop.rotation;
				newBullet.x = tower3.x;
				newBullet.y = tower3.y;
			}
			trace(random);
			var gx:Number =  shootingTowerX - mouseX ;
			var gy:Number =  shootingTowerY - mouseY;
			var RadiansB:Number = Math.atan2(gy, gx);
			var DegreesB:Number = RadiansB * 180 / Math.PI;
			newBullet.movex = Math.cos(RadiansB) * 5;
			newBullet.movey = Math.sin(RadiansB) * 5;
		}
		
		public function loop(e:Event):void
		{
			/////////////////////////// all bullets get updated and deleted ///////////////////////////
			var bulled:MovieClip;
			var crap : MovieClip;
			var l : int = _allBullets.length;
			for (var i:int = l-1; i >=0; i--) 
			{
				bulled = _allBullets[i];
				bulled.update();
				if (bulled.x < 0 || bulled.x > stage.stageWidth || bulled.y < 0 || bulled.y > stage.stageHeight)
				{
					removeChild(bulled);
					_allBullets.splice(i, 1);
				}
			}
			/////////////////////////// all craps get updated and deleted ///////////////////////////
			var c : int = _allCraps.length;
			for (var k:int = c-1; k >=0; k--) 
			{
				crap = _allCraps[k];
				_allCraps[k].update();
				if (_allCraps[k].y > stage.stageHeight - 100) 
				{
					removeChild(crap);
					_allCraps.splice(k, 1);
				}
			}
			/////////////////////////// all craps and bullets are destroyed when they collide ///////////////////////////
			l = _allBullets.length;
			c = _allCraps.length;
			for (var j:int = l-1; j >= 0; j--) 
			{
				bulled = _allBullets[j];
				for (var m:int = c-1; m >= 0; m--) 
				{
					crap = _allCraps[m];
					if (bulled && crap && bulled.hitTestObject(crap))
					{
						removeChild(bulled);
						removeChild(crap);
						_allBullets.splice(j, 1);
						_allCraps.splice(m, 1);
						
						break;
					}
				}
			}
			
			
		}
	
	}

}