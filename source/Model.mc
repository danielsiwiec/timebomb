using Toybox.Timer as Timer;
using Toybox.WatchUi as Ui;
using Toybox.Attention as Attention;
using Toybox.Math as Math;

class Model {
	var counter = new Counter();
	var left;
	var right;
	var timer = new Timer.Timer();
	var seconds = 5;
	
	function startGame(){
		Ui.switchToView( new TimebombView(self), new TimebombDelegate(self), Ui.SLIDE_IMMEDIATE);
	}
	
	function resetTimer(){
		timer.stop();
		timer.start( method(:onTimer), seconds * 1000, false );
	}
	
	function onTimer() {
    	counter.decrement();
    	Ui.requestUpdate();
    }
    
    function gameOver(){
	    var vibrateData = [ new Attention.VibeProfile(  50, 1000 ) ];
	    Attention.vibrate( vibrateData );
	    var blinker = new Blinker();
	    blinker.blink(20);
	    Ui.switchToView( new BoomView(), new BoomDelegate(self), Ui.SLIDE_IMMEDIATE);
    }
    
    function resetGame(){
    	counter = new Counter();
    	Ui.switchToView( new SplitView(), new SplitDelegate(self), Ui.SLIDE_IMMEDIATE);
    }
}

class Expression {
	var one;
	var two;
	
	function initialize(on, tw){
		one = on;
		two = tw;
	}
	
	function value(){
		return one * two;
	}
	
	function toString(){
		return "" + one + " x " + two;
	}
}

class Counter {
	var value = 5;
	
	function increment(){
		value = value + 1;
	}
	
	function decrement(){
		value = value - 1;
	}
	
	function done(){
		return value == 0; 
	}
}

class ExpressionFactory{

	static function create(){
		return new Expression(rand(), rand());
	}
	
	static function rand(){
		return Math.rand() % 10;
	}
}

class Blinker {

	var counter = 0;
	var timer;
	var limit;
	var state = true;
	
	function blink(times) {
		limit = times;
		timer = new Timer.Timer();
        timer.start( method(:onTimer), 200, true );
	}
	
	function onTimer() {
		if (limit == counter) {
			timer.stop();
		} else {
			Attention.backlight(state);
			state = !state;
			counter = counter + 1;
		}
	}
}