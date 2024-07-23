@echo off

rem Stop and remove Docker container named my-apache-php-app
docker kill my-apache-php-app
docker rm my-apache-php-app
