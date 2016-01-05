using Toybox.WatchUi as Ui;

class TimebombDelegate extends Ui.BehaviorDelegate
{
	hidden var model;
	
	function initialize(mdl) {
		model = mdl;
	}
	
	function onSelect() {
		if (model.challenge.right.value() >= model.challenge.left.value()){
			model.counter.increment();
		} else {
			model.counter.decrement();
		}
		Ui.requestUpdate();
		return true;
	}
	
	function onNextPage() {
		if (model.challenge.right.value() <= model.challenge.left.value()){
			model.counter.increment();
		} else {
			model.counter.decrement();
		}
		Ui.requestUpdate();
		return true;
	}
	
}