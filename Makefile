BPATH=bookshop
CP=${BPATH}/WEB-INF/classes:/usr/share/tomcat7/lib/servlet-api.jar:/usr/share/tomcat7/lib/jsp-api.jar

all:cycle

cycle:compile
	../bin/shutdown.sh; ../bin/startup.sh

compile: clean
	javac -cp ${CP} ${BPATH}/WEB-INF/classes/beans/*.java
	javac -cp ${CP} ${BPATH}/WEB-INF/classes/servlets/*.java
	javac -cp ${CP} ${BPATH}/WEB-INF/classes/tags/*.java

clean:
	find . -name "*.class" -exec rm -rf {} \;
