# IBM Installation Manager - Docker Build

## IIM Files
* [IIM silent install documentation](https://www.ibm.com/support/knowledgecenter/SSDV2W_1.8.5/com.ibm.silentinstall12.doc/topics/t_silent_installIM_IMinst.html)
* [Download latest version](http://www-01.ibm.com/support/docview.wss?uid=swg27036456)

## Build image
Download the version of IIM you want, ie, ```agent.installer.linux.gtk.x86_64_1.8.8000.20171130_1105.zip```, and place
it in a directory on your HTTP or FTP server.

Copy the Dockerfile to a directory on your Docker server, switch to that
directory, and run the command to build the image:
```
docker build --build-arg IIM=agent.installer.linux.gtk.x86_64_1.8.8000.20171130_1105.zip --build-arg URL=http://http_server_and_path -t iim:v188 .
```
where:

* ```agent.install.....zip``` is the name of the file you downloaded
* ```http_server_and_path``` is the full name and path of your ftp/http server
* ```iim:v188``` is a tag for your image

## Useful commands
List docker images:

    docker images

Start image and open interactive command prompt:

    docker run -it <image_id> /bin/bash

Start IIM in console mode (inside image):

    cd /opt/IBM/InstallationManager/eclipse/tools
    imcl -c

