#!/bin/bash

namechg(){

	usn=$(ls -t /Users | awk 'NR==1 {print $1}')

	perl -pi -w -e "s/username=.*/username=$usn/g;" RageKiosk/loginInfo/userInformation.ini
	cp -rf RageKiosk "/Users/$usn/Library/Application Support/"
	chown -R $usn "/Users/$usn/Library/Application Support/RageKiosk"
	#chmod 644 "/Users/$usn/Library/Application Support/RageKiosk/log"
}

inst(){
	hdiutil mount RageKiosk.dmg
	cp -rvf "/Volumes/RageKiosk/RageKiosk.app" /Applications/
}

remve(){
	hdiutil unmount "/Volumes/RageKiosk/"
	perl -pi -w -e "s/username=.*/username=/g;" RageKiosk/loginInfo/userInformation.ini
}

namechg
inst
remve
