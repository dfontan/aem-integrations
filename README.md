<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.


AEM Integrations - Summit 2017
=============================

Introduction
------------

This repository contains reference implementation which demonstrates AEM Integrations with Analytics, Target and DTM. 

This a content package project generated using the multimodule-content-package-archetype.


Useful URL locations
--------------------


* WeTelco Sites Shop Page

http://AEM_URL/editor.html/content/we-retail/us/en/make-a-donation.html   


Building
--------

This project uses Maven for building. Common commands:

From the root directory, run ``mvn -PautoInstallPackage clean install`` to build the bundle and content package and install to a CQ instance.

From the bundle directory, run ``mvn -PautoInstallBundle clean install`` to build *just* the bundle and install to a CQ instance.

Configuration
-------------

Make sure to have the following setup in your AEM 6.3 

1. DTM configuraiton with name/title - summit2017-dtm-config
2. Analytics configuraiton with name/title - summit2017-analytics-config
3. Analytics Framework with name/title - summit2017-analytics-framework
4. Target configuraiton with name/title - summit2017-target-config
5. Target Framework with name/title - summit2017-target-framework



Specifying CRX Host/Port
------------------------

The CRX host and port can be specified on the command line with:
mvn -Dcrx.host=otherhost -Dcrx.port=5502 <goals>


Help
----

Contact - vvenkata@adobe.com 

Contribute
----------

Feel Welcome to fork and extend and contribute. Please let me know if you have new features as this will be helpful for extended team.




