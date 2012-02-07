#!/bin/bash
#script takes the necessary classes comiles them and makes a proper .jar

javac *.java
jar cfm primzahlen.jar Manifest *.classes
echo 'Fertig!'
echo 'Zum Ausführen: java -jar primzahlen.jar'