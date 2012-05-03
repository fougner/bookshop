CLASSPATH=/usr/share/tomcat7/lib/servlet-api.jar:./src/WEB-INF/classes

all:
	javac -cp ${CLASSPATH} src/WEB-INF/classes/servlets/*.java
