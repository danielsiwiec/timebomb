using Toybox.Application as App;

class TimebombApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
        var model = new Model();
        return [ new SplitView(), new SplitDelegate(model) ];
    }
}