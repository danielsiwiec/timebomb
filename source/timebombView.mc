using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class TimebombView extends Ui.View {

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
    		model.generateChallenge();
    		setupDisplay(dc);
    		drawAtTheTop(dc, "" + model.counter.value);   
	        drawInTheMiddle(dc, model.challenge.left.toString() + " ? " + model.challenge.right.toString());
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
