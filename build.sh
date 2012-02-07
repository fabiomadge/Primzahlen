#!/bin/bash
#script takes the necessary classes comiles them and makes a proper .jar

javac EA.java
javac intReihe.java
javac steuerung.java
javac prim.java
jar cfm primzahlen.jar Manifest EA.class intReihe.class steuerung.class prim.class
echo 'fertig!'
echo 'Jetzt: java -jar primzahlen.jar'