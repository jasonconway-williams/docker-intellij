# Docker Intellij

Intellij, Java 8, git and sdkman dockerized to run via an X11 socket. Java 8 is installed as the system wide Java installation due to a requirement to run intellij on startup. The sdkman installation is the basic installation without any candidates. You can install any required candidates such as maven or gradle once the container has been started by ssh'ing into the container. Visit the sdkamn home page for help with using sdkman.

# Run

You can run this image with the following command:

`docker run -ti --rm -e DISPLAY=$DISPLAY --name intellij jcdubs/intellij`

# persistence

The image creates a `/home/developer` directory and a `developer` user. You can persist any installed sdkman candidates or cloned git repos by providing a volume
to replace the `/home/developer` directory. This way, your work and development environment will be persisted between restarts. Overriding the `/home/developer` can be done via the docker volume cli argument: `-v ~/your/override/directory:/home/developer`.

`docker run -ti --rm -e DISPLAY=$DISPLAY -v ~/docker-share:/home/developer --name intellij jcdubs/intellij`

# Setup

The following steps should be taken to setup an x server on the required OS.

## Ubuntu

Ubuntu should come equipped with an X server. Simply execute the docker run command.

## Windows

Install Xming on your windows installation, setup an environment variable named DISPLAY with a value of your IP address, appended with the default x server port of 0.0 i.e. `192.168.0.10:0.0`. Then simply execute the docker run command.

## Mac OS

Install XQuartz on your mac installation, setup an environment variable named DISPLAY with a value of your IP address, appended with the default x server port of 0.0 i.e. `192.168.0.10:0.0`, then run the following socat command in a terminal: `socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"`. Then simply execute the docker run command.
