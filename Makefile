CP=/usr/share/tomcat7/lib/servlet-api.jar:./src/WEB-INF/classes

all:
	javac -cp ${CP} src/WEB-INF/classes/servlets/*.java

clean:
	find . -name *.class | xargs rm
