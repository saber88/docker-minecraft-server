#!/bin/bash

cd /var/data/mc/minecraft-data/

date=$(date +"%Y-%m-%d-%H-%M-%S")
folders=$(ls)

for folder in $folders
do
  if [ ! -d "/var/data/mc/minecraft-data/.backups" ]; then
    mkdir /var/data/mc/minecraft-data/.backups
  fi
  
  if [ ! -d "/var/data/mc/minecraft-data/.backups/$folder" ]; then
    mkdir /var/data/mc/minecraft-data/.backups/$folder
  fi

  tar -zcvf $date.tgz $folder
  mv *.tgz /var/data/mc/minecraft-data/.backups/$folder
done
