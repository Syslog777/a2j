#!/bin/bash
#Usage sh ./a2j-master path/tp/adroidApp.apk /ouput/directory -options
# $1 is the apk, $2 is the output directory, $3 or more are the options
#Initialize a2j directory variable
a2jDir="$(pwd )"

#Collect the path to the file of type .apk
apk=$1

#Replace the .apk extension from the $1 string with .jar. This will be the output jar file for dex2jar
jar=${1%.*}
jar="$jar.jar"

#Prep the dex2jar scripts to be executable
find $a2jDir -type f -exec chmod +x {} \;

#The jar file does not exist yet, but we will get to that soon. Lets go to the dex2jar folder
cd ./dex2jar-2.0

#Convert the apk to jar
sh d2j-dex2jar.sh -f $apk -o $jar

#Collect the arguments for jd-cli
collective=("")
counter=1 
for i in ${@[@]}
do
  : 
  if "$collective" -gt "2"; then
    $collective="$collective$i"
    $counter++
  else
    $counter++
   fi
done

#Convert the jar to java files
java -jar "$a2jDir/jd-cli-0.9.1.Final-dist/jd-cli.jar" -od $2 $collective $jar

