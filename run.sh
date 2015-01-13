#!/bin/bash

# Ionic Directory
IONICLIB="$HOME/Development/ionic/dist/"


arrayTest[0]="test" || (echo "Failure: arrays not supported in this version of bash." && exit 2)

codepen=(
     
     "accordion http://codepen.io/ionic/pen/uJkCz"
     "actionsheet http://codepen.io/ionic/pen/jLylA"
     "checkbox http://codepen.io/ionic/pen/hqcju"
     "collectionrepeat http://codepen.io/ionic/pen/mFygh"
     "footertoggle http://codepen.io/ionic/pen/mHtlC"
     "list http://codepen.io/ionic/pen/JsHjf"
     "listthumbnail http://codepen.io/ionic/pen/isfAJ"
     "loadingbar http://codepen.io/ionic/pen/pEter"
     "modal http://codepen.io/ionic/pen/gblny"
     "popover http://codepen.io/ionic/pen/GpCst"
     "popup http://codepen.io/ionic/pen/zkmhJ"
     "pulltorefresh http://codepen.io/ionic/pen/mqolp"
     "radio http://codepen.io/ionic/pen/saoBG"
     "shrinkingheader http://codepen.io/ionic/pen/hIzFp"
     "sideexposed http://codepen.io/ionic/pen/cDbFg"
     "sidemenu http://codepen.io/ionic/pen/tcIGK"
     "signin http://codepen.io/ionic/pen/CbBsA"
     "slidebox http://codepen.io/ionic/pen/AjgEB"
     "swipeable http://codepen.io/ionic/pen/skbxh"
     "tabs http://codepen.io/ionic/pen/odqCz"
     "tinder http://codepen.io/ionic/pen/nxEdH"
     "toggles http://codepen.io/ionic/pen/tfAzj"
   )

if [ ! -d "codepenTests" ]; then
    mkdir codepenTests 
    cd codepenTests
    
    echo "Creating Projects: "
    printf "%s\n" "${codepen[@]}"
    
    for i in "${codepen[@]}"
    do
        echo "Creating: $i -l $IONICLIB"
        ionic start $i -l $IONICLIB
        cd ${i%% *}
        ionic platform --usegit add android
        ionic platform --usegit add ios
        cd ..
    done
    
    echo "Fixing paths"
    
    grep -rlI "$IONICLIB" * | xargs sed -i '' "s|$IONICLIB|lib/ionic|g"
else
    cd codepenTests
fi

for i in "${codepen[@]}"
do
    echo "Running: $i"
    
    cd ${i%% *} 
    ionic run $1
    cd ..
done


echo "All done :)"
exit 0











