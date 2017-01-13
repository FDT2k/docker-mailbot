FROM adaline/dockermail-core:latest

ADD main.cf /etc/postfix/main.cf
ADD master-additional.cf /etc/postfix/master-additional.cf
ADD access /etc/postfix/access
RUN postmap /etc/postfix/access
