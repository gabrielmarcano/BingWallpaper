#!/bin/bash

# Get the url from the Bing API. Get the AU wallpapers
URL="https://www.bing.com$(curl -s https://www.bing.com/HPImageArchive.aspx?format=js\&idx=0\&n=1\&mkt=en-AU | jq -r '.images[0].url')

curl -s $URL > $(pwd)/BingWallpaper.jpg

gsettings set org.gnome.desktop.background picture-uri file://$(pwd)/BingWallpaper.jpg
