#!/bin/bash

function program_is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0; }
  # return value
  echo "$return_"
}

htmlvalidatorinstalled=$(program_is_installed html-validator)

if [ "$htmlvalidatorinstalled" = "0" ]; then
    echo "HTML Validator not installed, installing html-validator-cli"
    npm install -g html-validator-cli
else
    echo "HTML Validator found!"
fi

for filename in *.html; do
    echo "VALIDATING : $filename"
    echo "-------------------------------------"
    html-validator --file="$filename" --verbose
done

#html-validator 

