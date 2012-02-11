all: prim

prim:
	javac src/*.java
	cd src; jar cfe Primzahlen.jar Prim *.class; mv Primzahlen.jar ..
	@echo 'Fertig!'
	@echo 'Zum Ausführen: java -jar primzahlen.jar [<Obere Grenze>]'

help:
	@echo "make <all/help/list/install/run/clean>"

list:
	@cd src; \
	ls *.java

install:
	mv primzahlen.jar /Applications

run:
	java -jar primzahlen.jar

clean:
	rm -f src/*.class
	rm -f primzahlen.jar