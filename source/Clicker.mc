using Toybox.WatchUi as Ui;

class ClickerDelegate extends Ui.BehaviorDelegate
{
	hidden var counter;
	
	function initialize(start) {
		counter = start;
	}
	
	function onSelect() {
		counter.increment();
		Ui.requestUpdate();
		return true;
	}
}