#!/bin/bash
#Usage: sh ./a2j path/to/apk/apk path/of/output/directory [options]
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

#Go to the jd-cli directory
cd ..
cd ./jd-cli-0.9.1.Final-dist

#Collect the args for jd-cli.jar
i=
shift
shift
while i < ${#@}

#Convert the jar to java files (Usage: java -jar jd-cli.jar [options] [Files to decompile])
java -jar jd-cli.jar #ask Mr. Holland for help on this project

