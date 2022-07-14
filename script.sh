#!/bin/bash

curl -s https://peapix.com/bing/feed?country=jp | jq -r '.[0].fullUrl'