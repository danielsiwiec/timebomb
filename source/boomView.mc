using Toybox.WatchUi as Ui;

class BoomView extends Ui.View {

	function onLayout(dc) {
        setLayout(Rez.Layouts.BoomLayout(dc));
    }
}