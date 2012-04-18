#!/bin/bash

	#BIRDAR MakeAnimations.sh
	#BIRDAR: visualizing nocturnal bird migration using Weather Service Radar
	#shell script to automatically download radar and create animated .gif images
	#shell script written by James Stuckey Weber jamesnw@gmail.com and edited by David La Puma david@woodcreeper.com
	#DEPENDENCIES: birdar.php, birdar_downloads.php (both written by Mike Mills michaelmills7@gmail.com and edited by Andrew Weber ajw5179@psu.edu and James Stuckey Weber). ImageMagick (http://www.imagemagick.org/script/index.php)

#change the value below to set the time delay between animation frames
theDelay="40" 
#the variable below ariable is used to add the date to the final animation file to be saved
theDate=`date +%Y%m%d` 
 

echo -n "Download New Images? y/n: "
read -e RESPONSE
echo -n $RESONSE
if [ "$RESPONSE" = "y" ]; then
	php /home/user/nightly/birdar.php	#<-- edit this path to reflect the location of your birdar.php file
fi


#now we invoke ImageMagick to create the animations.
#the format is as follows: convert -delay $theDelay ~/path/to/radar/data/state/station/product/$theDate*.png ~/path/to/animation/storage/directory/STATE-STATION-product-$theDate.gif
#just change the paths below to point to the correct paths on your system and add copy/paste the lines to add radar stations
convert -delay $theDelay ~/home/user/websites/radar/nj/kdix/br/$theDate*.png -layers Optimize -write ~/home/user/websites/radar/animations/NJ-KDIX-br-$theDate.gif -delete 1--1 -resize 320x320 ~/home/user/websites/radar/animations/NJ-KDIX-br-$theDate.jpg 
convert -delay $theDelay ~/home/user/websites/radar/nj/kdix/br/$theDate*.png -layers Optimize -write ~/home/user/websites/radar/animations/NJ-KDIX-bv-$theDate.gif -delete 1--1 -resize 320x320 ~/home/user/websites/radar/animations/NJ-KDIX-bv-$theDate.jpg 

convert -delay $theDelay ~/home/user/websites/radar/de/kdox/br/$theDate*.png -layers Optimize -write ~/home/user/websites/radar/animations/NJ-KDOX-br-$theDate.gif -delete 1--1 -resize 320x320 ~/home/user/websites/radar/animations/NJ-KDOX-br-$theDate.jpg 
convert -delay $theDelay ~/home/user/websites/radar/de/kdox/br/$theDate*.png -layers Optimize -write ~/home/user/websites/radar/animations/NJ-KDOX-bv-$theDate.gif -delete 1--1 -resize 320x320 ~/home/user/websites/radar/animations/NJ-KDOX-bv-$theDate.jpg 

