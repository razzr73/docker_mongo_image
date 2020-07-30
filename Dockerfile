#intall os
FROM alpine

#install software
RUN echo 'https://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'https://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories
RUN apk update
RUN apk add mongodb=3.4.4-r0
RUN apk add binutils
RUN mongo --version

#configure software
VOLUME [ "/data/db" ]
WORKDIR /data 
EXPOSE 27017
RUN apk add isl


#set default command
CMD [ "mongod" ]