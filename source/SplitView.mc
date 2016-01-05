using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class SplitView extends Ui.View {

	function onUpdate(dc)
    {   
    	dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.3, Gfx.FONT_MEDIUM, "TIMEBOMB", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.7, Gfx.FONT_TINY, "Press UP for settings", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*0.8, Gfx.FONT_TINY, "Press START", Gfx.TEXT_JUSTIFY_CENTER);
    }
}