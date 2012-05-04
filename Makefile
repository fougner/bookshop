CP=/usr/share/tomcat7/lib/servlet-api.jar:./src/WEB-INF/classes

all:cycle

cycle:
	../bin/shutdown.sh; ../bin/startup.sh

compile: clean
	javac -cp ${CP} src/WEB-INF/classes/servlets/*.java

clean:
	find . -name *.class | xargs rm
