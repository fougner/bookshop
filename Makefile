CP=/usr/share/tomcat7/bin/bootstrap.jar:/usr/share/tomcat7/bin/tomcat-juli.jar:/usr/share/tomcat7/lib/servlet-api.jar:./src/WEB-INF/classes

all:cycle

cycle:compile
	../bin/shutdown.sh; ../bin/startup.sh

compile: clean
	javac -cp ${CP} src/WEB-INF/classes/servlets/*.java
	javac -cp ${CP} src/WEB-INF/classes/tags/*.java

clean:
	find . -name "*.class" -exec rm -rf {} \;
