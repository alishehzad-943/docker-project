FROM ubuntu
RUN apt-get update -y
RUN apt-get install apache2 -y && apt-get clean
COPY index.html /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
