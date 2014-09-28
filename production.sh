#!/bin/sh
REPO=~/sources/github
HUB=$REPO/serandules/hub
CLIENT=$REPO/serandules/hub-client
COMPS=$REPO/serandomps
MODS=$REPO/serandules
DBPATH=~/resources/mongodb/data

#cleanup
#pkill mongo
pkill forever
pkill node

#starts mongodb
#mongod --dbpath=$DBPATH &

#setup env variables
export NODE_ENV=development
export GIT_REPO=$REPO

#setup node_modules dir
rm -rf $MODS/node_modules
mkdir $MODS/node_modules
cd $MODS
for dir in *;
do
    ln -s $MODS/$dir $MODS/node_modules/$dir
done

#setup hub
cd $COMPS
for dir in *;
do
    rm -rf $HUB/components/serandomps-$dir
	ln -s $COMPS/$dir $HUB/components/serandomps-$dir
done

cd $MODS
for dir in *;
do
    rm -rf $HUB/node_modules/$dir
#	ln -s $MODS/$dir $HUB/node_modules/$dir
done
rm $HUB/node_modules/node_modules
rm $HUB/node_modules/hub

#setup hub-client
cd $MODS
for dir in *;
do
    rm -rf $CLIENT/node_modules/$dir
#	ln -s $MODS/$dir $CLIENT/node_modules/$dir
done
rm $CLIENT/node_modules/node_modules
rm $CLIENT/node_modules/hub-client
rm $CLIENT/node_modules/hub

cd $HUB
supervisor index.js > $HUB/console.log &
cd $CLIENT
supervisor index.js > $CLIENT/console.log &
