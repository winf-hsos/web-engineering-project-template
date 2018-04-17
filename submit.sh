#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Please give your group number as an argument.'
    echo 'Example: ./submit.sh 1'
    exit 1
fi

echo "Check out repository from Github..."
cd /home/ubuntu/workspace/
rm -r -f ss2018
git clone https://winf-hsos-student:studenthsos2018@github.com/winf-hsos-student/ss2018.git


echo "Copy files to public folder..."
rm -r -f public/*
cp -f *.html public
cp -R css public/css
cp -R js public/js
cp -R includes public/includes
cp -R img public/img

group="$1"
echo "Copy files to group0"$group" folder"

cp -r public/* ss2018/gruppe0$group/

git config credential.helper store
cd ss2018
git add .
git commit -m "Submitted code from group0"$group
git push origin master 

cd ..
echo "Cleaning up..."
rm -r -f ss2018

