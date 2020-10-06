# using this awesome prebuild image:

FROM '123majumundur/php-7.1-nginx:cicd'
MAINTAINER irbah salsabila <irbah.salsabila93@gmail.com>

#install prestissimo for faster deps instalation
RUN composer global require hirak/prestissimo

#make directory for hosting the apps
RUN mkdir/home/app/app
WORKDIR /home/app/app

#install dependecies
COPY composer.json composer.json
RUN composer install --prefer-dist --no-scripts --no-dev --no-autoloader && rm -rf /home/app/.composer

#copy codebase
COPY --chown=app:root . ./

#Finish Comporser
#RUN composer dump-autoload
RUN composer dump-autoload --no-scripts --no-dev --optimize

EXPOSE 8080