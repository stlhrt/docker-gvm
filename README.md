stlhrt:gvm
=========================

Docker container for ubuntu Trusty Tahr with Oracle JDK8.

GVM installed as base for container for running Spring/Groovy/Grails/vertx/... apps.

During docker build setup of environment for _service_ user doesnt work well, as 
```
    source
``` 
command isn't available.

Use _gvm_wrapper.sh_ as you would use gvm itself.
```
   gvm_wrapper.sh install gradle
```
