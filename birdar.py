#!/usr/bin/env python
"""Python version of BIRDAR
March 25 2013
Written by David La Puma

READ THE EXTENDED DESCRIPTION!!!
"""
# import modules
import urllib2
import re
import os

##fixed variables##
prod = ("bref1","vel1")
bkgr = "black"
duration = "10" # Hours. Edit this to reflect the number of hours you want to go back from endTime
endTime = "10"  # -1 is what you put for "most recent". Remember, UTC is 5 hours ahead of CT during Daylight Savings (4 hours ahead of EDST) 

home_dir = "/Users/woodcreeper/Dropbox/birdar_imgs"             #EDIT THIS TO REFLECT THE DIR WHERE YOU WILL STORE YOUR IMAGES
base = "http://weather.rap.ucar.edu/radar/displayRad.php?"

##program##
list_of_folders = os.listdir(home_dir)												# read the folder structure from home directory to get radar names
for each_folder in list_of_folders:
	if each_folder.startswith('k'):													# only radar folders start with K
		stationName = each_folder
		for element in prod:														# each radar has two products, stored in the prod tuple 
			call = base+"icao="+stationName+"&prod="+element+"&bkgr="+bkgr+"&endTime="+endTime+"&duration="+duration
			print call																# simply for bookeeping, print the call to the terminal
			urlContent = urllib2.urlopen(call).read()
			files = re.findall('(?:http://|www.)[^"\' ]+_black.png', urlContent)		
			directory = home_dir+"/"+stationName+"/"+element+"/" 
			for file_url in files:													# now we can iterate over them to download them
				image_content = urllib2.urlopen(file_url).read()
				image_outfile = os.path.join(directory, os.path.basename(file_url))
				with open(image_outfile, 'wb') as wfh:
					wfh.write(image_content)




