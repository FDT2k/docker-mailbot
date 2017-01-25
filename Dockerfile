FROM adaline/dockermail-core:latest

RUN apt-get update
RUN apt-get install -y php5-cli
RUN apt-get install -y php5-curl

ADD main.cf /etc/postfix/main.cf
ADD access /etc/postfix/access
ADD aliases-regexp /etc/postfix/aliases-regexp
RUN postmap /etc/postfix/access
RUN postmap /etc/postfix/aliases-regexp

RUN echo "myhook unix - n n - - pipe" >> /etc/postfix/master.cf
RUN echo "  flags=F user=www-data argv=/mail_settings/mailbot.php ${sender} ${size} ${recipient}" >> /etc/postfix/master.cf
