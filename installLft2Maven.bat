rem little script to install the lft jar files to the maven local repo
rem assumes UFT & LFT are installed on the machine.  If they aren't you can
rem just remove the lines down to the first call.  open cmd and cd to the location
rem of the lft jar files and then run the lines below.
rem This also assumes Maven is already installed.

echo off

echo #-------------------------------------------------------#
echo #  Searching for UFT installation.  Please be patient.  #
echo #-------------------------------------------------------#
for /f "delims=" %%a in ('wmic product where "Name='HP Unified Functional Testing'" get InstallLocation') do (
cd %%a )
cd SDK\Java

rem Removing 12.53 format
rmdir /S /Q %userprofile%\.m2\repository\com\hp\lft\com.hp.lft.report
rmdir /S /Q %userprofile%\.m2\repository\com\hp\lft\com.hp.lft.sdk
rmdir /S /Q %userprofile%\.m2\repository\com\hp\lft\com.hp.lft.unittesting
rmdir /S /Q %userprofile%\.m2\repository\com\hp\lft\com.hp.lft.verifications

rmdir /S /Q %userprofile%\.m2\repository\com\hp\lft\report
rmdir /S /Q %userprofile%\.m2\repository\com\hp\lft\sdk
rmdir /S /Q %userprofile%\.m2\repository\com\hp\lft\unittesting
rmdir /S /Q %userprofile%\.m2\repository\com\hp\lft\verifications

call mvn install:install-file -Dfile="com.hp.lft.report.jar" -DgroupId=com.hp.lft -DartifactId=report -Dversion=12.54.0 -Dpackaging=jar

call mvn install:install-file -Dfile="com.hp.lft.sdk-standalone.jar" -DgroupId=com.hp.lft -DartifactId=sdk -Dversion=12.54.0 -Dpackaging=jar

call mvn install:install-file -Dfile="com.hp.lft.sdk-javadoc.jar" -DgroupId=com.hp.lft -DartifactId=sdk -Dclassifier=javadoc -Dversion=12.54.0 -Dpackaging=jar

call mvn install:install-file -Dfile="com.hp.lft.unittesting.jar" -DgroupId=com.hp.lft -DartifactId=unittesting -Dversion=12.54.0 -Dpackaging=jar

call mvn install:install-file -Dfile="com.hp.lft.verifications.jar" -DgroupId=com.hp.lft -DartifactId=verifications -Dversion=12.54.0 -Dpackaging=jar

