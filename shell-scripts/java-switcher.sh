#!/bin/bash

OpenJDK8="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.292.b10-1.el7_9.x86_64/jre"
OpenJDK11="/usr/lib/jvm/java-11-openjdk-11.0.11.0.9-1.el7_9.x86_64/"
OracleJDK8="/usr/java/jdk1.8.0_291-amd64/"

case $1 in
    "openjdk8")
        sudo update-alternatives --install "/usr/bin/java" "java" $OpenJDK8"/bin/java" 1
        sudo update-alternatives --set "java" $OpenJDK8"/bin/java"
        export JAVA_HOME=${OpenJDK8}
    ;;
    "openjdk11")
        sudo update-alternatives --install "/usr/bin/java" "java" $OpenJDK11"/bin/java" 1
        sudo update-alternatives --set "java" $OpenJDK11"/bin/java"
        export JAVA_HOME=${OpenJDK11}
    ;;
    "oraclejdk8")
        sudo update-alternatives --install "/usr/bin/java" "java" $OracleJDK8"/bin/java" 1
        sudo update-alternatives --set "java" $OracleJDK8"/bin/java"
        export JAVA_HOME=${OracleJDK8}
    ;;
    *)
        echo "Unknown JDK version!" 
        echo "Specify: openjdk8, openjdk11 or oraclejdk8"
    ;;
esac

export JDK_HOME=$JAVA_HOME

echo -ne "JAVA version switched to: "
java -version
