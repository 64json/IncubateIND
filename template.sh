#!/bin/bash
set -e
city=$1
if !([ -n "$city" ]); then
    echo "empty city initial"
    exit
fi
CITY=$(echo $city | tr 'a-z' 'A-Z')
git clone https://github.com/IncubateX/IncubateTemplate.git $city
cd $city
git remote set-url origin https://github.com/IncubateX/${city}.git
git remote add upstream https://github.com/IncubateX/IncubateTemplate.git
cp -f _README.md README.md
sed -i "" "s/{city}/${city}/g" README.md
sed -i "" "s/{CITY}/${CITY}/g" README.md
git add .
git commit -m 'fork from IncubateTemplate'
git push -u origin master