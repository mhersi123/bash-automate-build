#!/bin/bash

echo "Building Release Version..."

firstline=$(head -n 1 source/changelog.md)

read -a splitfirstline <<< $firstline

version=${splitfirstline[1]}
echo "You are building version" $version

echo "Enter “1” to continue and “0” to exit."
read versioncontinue

if [ $versioncontinue -eq 1 ]
then
  echo "Ok, continuing build."
  for filename in source/*
  do
    if [ $filename == "source/secretinfo.md" ]
    then
      echo "secretinfo.md will not be copied to build."
    else
      echo "Copying" $filename
      cp $filename build/.
    fi
  done

  cd build/
  echo "Build version" $version "contains:"
  ls
  cd ..
else
  echo "Feel free to start build when ready"
fi




