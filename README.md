# LFT
This simple file will install the LeanFT jar files into the .m2 local Maven repo for use since as of this writting the LeanFT jar files are not available on a public repo and using this method is better than adding them to your class path which makes your Maven project less portable.

UPDATE - **"Good news everyone!"** (homage to <a href="https://en.wikipedia.org/wiki/Professor_Farnsworth">Professor Farnsworth</a> from Futurama)  The format for the Maven pom.xml file and the repo structure used by LeanFT 12.54 is different than was used for LeanFT 12.53.  This means LeanFT 12.53/Maven projects will break when you upgrade to LeanFT 12.54.

"Better news everyone!" (quote by Dave Flynn) the fix is simple.  This is assuming you are like most of our customers and do not have access to the HPE private Nexus OR you haven't added the LeanFT jars to your private Nexus or repo.

The LFT 12.53 dependencies in the pom.xml file looked like
    <dependency>  
         <groupId>com.hp.lft</groupId>  
         <artifactId>com.hp.lft.sdk</artifactId>  
         <version>12.53.0</version>  
    </dependency>  

You should modify to look like
    <dependency>  
         <groupId>com.hp.lft</gorupId>  
         <artifactId>sdk</artifactId>  
         <version>12.54.0</version>  
    </dependency>  

In the end you should modify a total of 5 artifact entries (2 for sdk, report, unittesting, verification).  The above steps are only for projects you created before upgrading to 12.54.  All projects created using 12.54 should be fine.

Once the above step is done, grab the "installLft2Maven.bat" file on GitHub - panama69/LFT  and then your local Maven repo will be fixed.

You might still see your pom.xml file showing red (even after restarting Eclipse).  To fix this, right click on the project-> Maven->Update Project
