using Toybox.Application as App;
using Toybox.Timer as Timer;
using Toybox.WatchUi as Ui;

class timebombApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    //! onStart() is called on application start up
    function onStart() {
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    }

    //! Return the initial view of your application here
    function getInitialView() {
        var model = new Model();
        return [ new SplitView(), new SplitDelegate(model) ];
    }

}

class Model {
	var counter = new Counter();
	var left;
	var right;
	var timer = new Timer.Timer();
	var seconds = 5;
	
	function startGame(){
		Ui.switchToView( new timebombView(self), new TimebombDelegate(self), Ui.SLIDE_IMMEDIATE);
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