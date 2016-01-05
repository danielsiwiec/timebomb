using Toybox.WatchUi as Ui;

class SplitDelegate extends Ui.BehaviorDelegate
{
	hidden var model;
	
	function initialize(mdl) {
		model = mdl;
	}
	
	function onSelect() {
		model.startGame();
	}
}