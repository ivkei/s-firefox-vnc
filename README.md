# s-firefox-vnc
A docker image to run firefox in a docker container and display it graphically via VNC.  
non-VNC version can be found [here](https://github.com/ivkei/s-firefox).  

## Build
```sh
docker build -t firefox-vnc . # or replace . with directory with the Dockerfile
```

## Run
```sh
docker run -it -p 5900:5900 --rm firefox-vnc
./vncstartup.sh
```
Then open [TigerVNC Viewer](https://github.com/TigerVNC/tigervnc) and connect to localhost:5900.  
The password will be `<yourpassword>`.  
To change the framerate, tinker with the Dockerfile, good luck!  

## Credits
* [Docker](https://www.docker.com/) for containerization.  
* [Firefox](https://github.com/mozilla) for being used as a browser.  
* [TigerVNC](https://github.com/TigerVNC/tigervnc) for being used as a VNC.  
