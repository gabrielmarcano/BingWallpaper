#!/bin/bash

# Get the url from the API. Get the US wallpapers
URL=$(curl -s https://peapix.com/bing/feed?country=us | jq -r '.[0].fullUrl')

curl -s $URL > $(pwd)/BingWallpaper.jpg

gsettings set org.gnome.desktop.background picture-uri file://$(pwd)/BingWallpaper.jpg
