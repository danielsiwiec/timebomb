using Toybox.WatchUi as Ui;
using Toybox.System as System;

enum {
	easy,
	medium,
	hard
	}

class SplitDelegate extends Ui.BehaviorDelegate
{
	hidden var model;
	
	function initialize(mdl) {
		model = mdl;
	}
	
	function onSelect() {
		model.startGame();
	}
	
	function onPreviousPage() {
		var menu = new Ui.Menu();
		menu.addItem("Easy", easy);
		menu.addItem("Medium", medium);
		menu.addItem("Hard", hard);
		menu.setTitle("Difficulty");
		Ui.pushView(menu, new MenuInputDelegate(model), Ui.SLIDE_IMMEDIATE);
	}
}

class MenuInputDelegate extends Ui.MenuInputDelegate {
	var model;
	
	function initialize(mdl){
		model = mdl;
	}

    function onMenuItem(value) {
    	model.difficulty = value;
    }
}