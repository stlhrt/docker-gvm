stlhrt:sdkman
=========================

Docker container for ubuntu Trusty Tahr with Oracle JDK8 using latest stlhrt/jdk8

SDKMAN 3.0.5 (formerly GVM) installed as base for container for running Spring/Groovy/Grails/vertx/... apps.

During docker build setup of environment for _service_ user doesn't work well, as
```
    source
```
command isn't available.

To use image to build containers with tools installable with SDKMAN use _sdk_wrapper.sh_ as you would use sdkman itself.
```
   RUN sdk_wrapper.sh install gradle
```
