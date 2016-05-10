monkeyc --warn --output bin/timebomb.prg -m manifest.xml \
-z resources/drawables/drawables.xml:\
resources/layouts/layout.xml:\
resources/strings/strings.xml \
-d fenix3_sim -u /Users/dsiwiec/connect-iq-sdk-1.2.6/bin/devices.xml \
-p /Users/dsiwiec/connect-iq-sdk-1.2.6/bin/projectInfo.xml \
source/BoomDelegate.mc \
source/BoomView.mc \
source/Model.mc \
source/SplitDelegate.mc \
source/SplitView.mc \
source/TimebombApp.mc \
source/TimebombDelegate.mc \
source/TimebombView.mc
