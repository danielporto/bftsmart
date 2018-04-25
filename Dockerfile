FROM openjdk:8-jdk 

MAINTAINER Daniel Porto <daniel@gsd.inesc-id.pt>

# add the build dependencies
RUN apt update && apt upgrade -y && apt install ant -y
# allow wait before service is up
# RUN curl https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh > /usr/bin/wait-for-it.sh && chmod +x /usr/bin/wait-for-it.sh

# copy current source code into the container
COPY . /home/code
WORKDIR /home/code

# build everything inside the container
RUN ant 

CMD /bin/bash 