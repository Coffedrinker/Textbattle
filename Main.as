package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.engine.TextLine;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.system.fscommand;
	/**
	 * ...
	 * @author Jacob
	 */
	public class Main extends Sprite 
	{
		
		//TODO: Fetch monsterStats for each monster
		private var monsterList:Array = ["Orc", "Slysprite", "Parasprite", "Raptor", "Burly man with gun", "Annoying kid"];
		/*
		var orcStats:Array = [ 20 , 170];
		var slyStats:Array = [ 10, 100];
		var paraStats:Array = [ 15, 130];
		var raptorStats:Array = [ 25, 100];
		var burlyStats:Array = [30, 70];
		var annoyStats:Array = [5, 300];
		*/
		
		private var heroName:String = "Sir Massive Mc.Millian";
		private var monsterName:String = monsterList[Math.floor(Math.random() * 5)];
		
		private var heroAttack:int = 20;
		private var heroDefense:int = 150;
		
		private var monsterAttack:int = 20;
		private var monsterDefense:int = 150;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var t:TextField = new TextField;
			stage.addChild(t);
			t.border = true;
			t.multiline = true;
			t.width = stage.stageWidth;
			t.height = stage.stageHeight;
			t.wordWrap = true;
			t.mouseWheelEnabled = true;
			
			var attackMove:Array = [" lunges", " swings his sword", " thrusts", " throws a knife"];
			//TODO: Add randomized attack and defend names and add a random chance of no damage
			
			var i:int = 0;
			var battle:Boolean = true;
			while (battle) {	
				
				var attack:String = attackMove[Math.floor(Math.random() * 3)];
				
				var heroDamage:int = Math.floor(Math.random() * 14 + heroAttack);
				monsterDefense -= heroDamage;
				t.appendText(heroName + attack + " at the monster and deals " + heroDamage.toString() + " damage. \n" );
				
				var monsterDamage:int = Math.floor(Math.random() * 14 + monsterAttack);
				heroDefense -= monsterDamage;
				t.appendText(monsterName + " retaliates at " + heroName + " and deals " + monsterDamage.toString() + " damage. \n"  );
				
				if (monsterDefense < 1) {
					t.appendText(heroName + " has slain the fearsome " + monsterName + ". The village is saved.");
					if (heroDefense < 1) {
						t.appendText( " Unfortunately he tripped and hit his head on a rock while on the way home. \nThey buried him next tuesday.");
					}
					battle = false;
				}
				else if (heroDefense < 1){
					t.appendText( monsterName + " has slain the gallant " + heroName + ". The village has been pillaged.");
					battle = false;
					}
				else {
					i++;
					t.appendText( "Round " + i.toString() + " is over.\n"+ heroName + " has "+ heroDefense.toString() +" defense left. \n" + monsterName +" has " + monsterDefense + " defense left.\n\n");
					stage.addEventListener(KeyboardEvent.KEY_DOWN, myKey);
					function myKey(e:KeyboardEvent):void {
						/*if (e.keyCode == 9) {
						fscommand("quit");
						}*/
						fscommand("quit");
					}
				}
			}
		}	
	}
}