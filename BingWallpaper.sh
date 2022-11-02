#!/bin/sh

# TODO: Read about dirname $0 to fix relative current working directory (https://bytexd.com/what-is-dirname-0-and-usage-examples/)

# Get the URL from the Bing API. Get the AU wallpapers
URL="https://www.bing.com$(curl -s https://www.bing.com/HPImageArchive.aspx?format=js\&idx=0\&n=1\&mkt=en-AU | jq -r '.images[0].url')"

# Save the image path in a constant
IMAGE="$(pwd)/BingWallpaper.jpg"

# Save the fetched image to a local image, and if that passes succesfully (&&), change the background wallpaper with that image
curl -s $URL > $IMAGE && gsettings set org.gnome.desktop.background picture-uri file://$IMAGE
