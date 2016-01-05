using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Attention as Attention;
using Toybox.Math as Math;

class timebombView extends Ui.View {

	hidden var model;
	hidden var counter;
	var timer;

    function initialize(mdl) {
        model = mdl;
        counter = mdl.counter;
    }

    function onUpdate(dc)
    {   
    	model.resetTimer();
    	if (counter.done()){
    		model.gameOver();
    	} else {
    		var left = ExpressionFactory.create();
    		var right = ExpressionFactory.create();
    		model.left = left;
    		model.right = right;
    		setupDisplay(dc);
    		drawAtTheTop(dc, "" + model.counter.value);   
	        drawInTheMiddle(dc, left.toString() + " ? " + right.toString());
	    }
    }
    
    function setupDisplay(dc){
    	dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
    }
    
    function drawAtTheTop(dc, text){
    	dc.drawText(dc.getWidth()/2, dc.getHeight()*0.1, Gfx.FONT_SMALL, text, Gfx.TEXT_JUSTIFY_CENTER);
    }
    
    function drawInTheMiddle(dc, text){
    	dc.drawText(dc.getWidth()/2, dc.getHeight()*0.3, Gfx.FONT_NUMBER_HOT, text, Gfx.TEXT_JUSTIFY_CENTER);
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
