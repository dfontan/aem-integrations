# AEM Integrations Lab - Summit 2016

This project demonstrates how to integration AEM with Target and Analytics via DTM.

## Installation

* use 6.2 L16
* after checkout run 'mvn install' in the checkout directory
* unpack AEM and put the crypto package into crx-quickstart/install (required for cloud services)
* then run 'mvn install -PautoInstallPackage' to install the application on your local authors instance


# Lab Preparation Instructions

* when the final lab instance is prepared, make sure
  * to login initially and disable usage tracking in /projects.html
  * open http://localhost:4502/editor.html/content/summitaemintegrationlab/en.html once and disable first time user experience. this is also required to compile all source. without this the first page load will take too long and mbox cookie will be set with a timeout
  * same for publish: http://localhost:4503/content/summitaemintegrationlab/en.html
  
