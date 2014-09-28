#!/bin/sh

#first do git clone https://github.com/serandules/hubber.git and then execute the script

pkill mongo
pkill forever
pkill node

HUBBER=/Users/ruchira/sources/github/serandules/hubber
DBPATH=~/resources/mongodb/data

export NODE_ENV=development

#mongodb
mongod --dbpath=$DBPATH &

cd $HUBBER
npm install

#hub
export HUB_DIR=/Users/ruchira/serand
export LOCAL_REPO=/Users/ruchira/sources/github

export HUB=true
node index.js &

export HUB=false
node index.js &



