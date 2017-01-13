FROM adaline/dockermail-core:latest

RUN apt-get update
RUN apt-get install -y php5-cli

ADD main.cf /etc/postfix/main.cf
ADD access /etc/postfix/access
RUN postmap /etc/postfix/access

RUN echo "myhook unix - n n - - pipe" >> /etc/postfix/master.cf
RUN echo "  flags=F user=www-data argv=/mail_settings/mailbot.php ${sender} ${size} ${recipient}" >> /etc/postfix/master.cf
