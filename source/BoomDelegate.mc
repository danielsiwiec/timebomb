using Toybox.WatchUi as Ui;

class BoomDelegate extends Ui.BehaviorDelegate
{
	hidden var model;
	
	function initialize(mdl) {
		model = mdl;
	}
	
	function onBack() {
		model.resetGame();
		return true;
	}
}