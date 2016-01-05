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
        var counter = new Counter();
        var model = new Model(counter);
        return [ new timebombView(model), new TimebombDelegate(model) ];
    }

}

class Model {
	var counter;
	var left;
	var right;
	var timer;
	
	function initialize(cntr) {
		counter = cntr;
		timer = new Timer.Timer();
	}
	
	function resetTimer(){
		timer.stop();
		timer.start( method(:onTimer), 1000, false );
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
    	Ui.switchToView( new timebombView(self), new TimebombDelegate(self), Ui.SLIDE_IMMEDIATE);
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