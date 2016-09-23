echo off

echo #-------------------------------------------------------#
echo #  Searching for UFT installation.  Please be patient.  #
echo #-------------------------------------------------------#
for /f "delims=" %%a in ('wmic product where "Name='HP Unified Functional Testing'" get InstallLocation') do (
cd %%a )
cd SDK\Java
call mvn install:install-file -Dfile="com.hp.lft.report.jar" -DgroupId=com.hp.lft -DartifactId=com.hp.lft.report -Dversion=12.53.0 -Dpackaging=jar

call mvn install:install-file -Dfile="com.hp.lft.sdk-standalone.jar" -DgroupId=com.hp.lft -DartifactId=com.hp.lft.sdk -Dversion=12.53.0 -Dpackaging=jar

call mvn install:install-file -Dfile="com.hp.lft.sdk-javadoc.jar" -DgroupId=com.hp.lft -DartifactId=com.hp.lft.sdk -Dclassifier=javadoc -Dversion=12.53.0 -Dpackaging=jar

call mvn install:install-file -Dfile="com.hp.lft.unittesting.jar" -DgroupId=com.hp.lft -DartifactId=com.hp.lft.unittesting -Dversion=12.53.0 -Dpackaging=jar

call mvn install:install-file -Dfile="com.hp.lft.verifications.jar" -DgroupId=com.hp.lft -DartifactId=com.hp.lft.verifications -Dversion=12.53.0 -Dpackaging=jar
