#!/bin/bash
# $1 is the apk, $2 is the output directory, $3 or more are the options
#Initialize a2j directory variable
a2jDir="$(pwd )"

#Collect the path to the file of type .apk
apk=$1

#Replace the .apk extension from the $1 string with .jar. 
jar=${1%.*}
jar="$jar.jar"

#Lets prep the dex2jar scripts to be executable
find $a2jDir -type f -exec chmod +x {} \;

#The jar file does not exist yet, but we will get to that soon. Lets go to the dex2jar folder
cd ./dex2jar-2.0

#Convert the apk to jar
sh d2j-dex2jar.sh -f ~$apk

#Collect the arguments, but skip the first two args
collective=("")


shift
shift

for i in "${$@[@]}"; do
      $collective=($collective${args{$i}})
done

#Convert the jar to java files
java -jar jd-cli.jar $collective
