XAUTH=/tmp/.docker.xauth
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

NAME=libero

if [ ! "$(docker ps -q -f name=$NAME)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=$NAME)" ]; then
        docker start $NAME
        docker attach $NAME
    else
        echo "create container"
        docker run -it \
               --name libero \
               --user=libero \
               --env="DISPLAY" \
               --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
               --volume="/opt:/opt" \
               --volume="/home/$USER:/data" \
               -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH \
               --mac-address 54:42:49:78:ab:6e \
               ubuntu-libero
    fi
else
    echo "already running"
fi
