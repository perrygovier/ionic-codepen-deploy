# ionic-codepen-deploy
This is a tiny shell script that downloads Ionic codepen projects and creates Ionic apps out of them.

** Mac/Linux Only**
Also, this script assumes you have the Ionic, Cordova, Android, ant, Xcode, and npm libraries already installed

To run, first update the `IONICLIB` var on line 4 of `run.sh` to where your ionic project is. 

Then run in a terminal from this directory `./run.sh`.

This will try to run on Android and iOS devices. To only run on one platform, simple add `android` or `ios` as the only command line arguement like: `./run.sh android`

Running the script after the codePens directory already exists will add the apps to whatever phone is plugged in,
using the already existing projects. 
