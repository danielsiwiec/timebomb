using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Timer as Timer;
using Toybox.Attention as Attention;
using Toybox.Math as Math;

class timebombView extends Ui.View {

	hidden var counter;
	var timer;

    function initialize(start) {
        counter = start;
        timer = new Timer.Timer();
        timer.start( method(:onTimer), 1000, true );
    }

    function onUpdate(dc)
    {
    	dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
        
    	if (counter.done()){
    		timer.stop();
		    var vibrateData = [ new Attention.VibeProfile(  50, 1000 ) ];
		    Attention.vibrate( vibrateData );
		    var blinker = new Blinker();
		    blinker.blink(20);
		    Ui.switchToView( new BoomView(), new Ui.BehaviorDelegate(), Ui.SLIDE_IMMEDIATE);
    	} else {   
	        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.3, Gfx.FONT_NUMBER_HOT, "" + counter.value, Gfx.TEXT_JUSTIFY_CENTER);
	    }
    }


    function onTimer() {
    	counter.decrement();
    	Ui.requestUpdate();
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
