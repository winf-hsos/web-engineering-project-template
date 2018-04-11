#!/bin/bash
echo "Copying files to public..."
cd /home/ubuntu/workspace
rm -r public/*
cp -f *.html public
cp -R css public/css
cp -R js public/js
cp -R includes public/includes
cp -R img public/img

echo "Deploying to Firebase..."
firebase deploy