FROM ubuntu
RUN apt-get update
RUN apt-get install -y python3
RUN echo 1.0 >> /etc/version && apt-get install -y git \
    && apt-get install -y iputils-ping

WORKDIR /datos
##EXPOSE##
RUN apt-get install -y apache2
EXPOSE 80
ADD entrypoint.sh /datos

##VOLUME##
ADD paginas /var/www/html	
VOLUME ["/var/ww/html"]

CMD /datos/entrypoint.sh
