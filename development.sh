#!/bin/sh

#first do git clone https://github.com/serandules/hubber.git and then execute the script

#pkill mongo
pkill forever
pkill node

HUBBER=~/serandives/hubber
DBPATH=~/resources/mongodb/data

export NODE_ENV=development

#mongodb
#mongod --dbpath=$DBPATH &

cd $HUBBER
npm install

#hub
export HUB_DIR=~/serandives/

export HUB=true
node index.js &

export HUB=false
node index.js &



