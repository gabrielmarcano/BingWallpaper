#!/bin/bash

# Get the url from the API. Get the US wallpapers
URL=$(curl -s https://peapix.com/bing/feed?country=us | jq -r '.[0].fullUrl')

curl -s $URL > /tmp/image.jpg

gsettings set org.gnome.desktop.background picture-uri file:///tmp/image.jpg