#!/bin/bash
#script takes the necessary classes comiles them and makes a proper .jar

echo 'compiling .java files...'
javac *.java
echo 'building .jar file...'
jar cfm primzahlen.jar Manifest *.class
echo 'Fertig!'
echo 'Zum Ausführen: java -jar primzahlen.jar'
