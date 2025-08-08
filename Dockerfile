FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm firefox xorg-server-xvfb x11vnc dbus fontconfig

RUN useradd -m user -s /bin/bash

RUN echo "#!/bin/sh" > /home/user/vncstartup.sh && \
    echo "unset SESSION_MANAGER" >> /home/user/vncstartup.sh && \
    echo "unset DBUS_SESSION_BUS_ADDRESS" >> /home/user/vncstartup.sh && \
    echo "Xvfb :99 -screen 0 1920x1080x24 &" >> /home/user/vncstartup.sh && \
    echo "export DISPLAY=:99" >> /home/user/vncstartup.sh && \
    echo "x11vnc -display :99 -passwd <yourpassword> -forever -listen 0.0.0.0 -xkb &" >> /home/user/vncstartup.sh && \
    echo "firefox --display=$DISPLAY --geometry 1920x1080 --no-remote &" >> /home/user/vncstartup.sh && \
    chmod +x /home/user/vncstartup.sh

USER user
WORKDIR /home/user

EXPOSE 5900

CMD ["bin/bash"]
