@echo off

rem Start Docker container with PHP 7.2 Apache image
docker run -d -p 80:80 --name my-apache-php-app -v c:\\wee\\jenkins-php-selenium-test\\jenkins-php-selenium-test\\jenkins-php-selenium-test\\src:/var/www/html php:7.2-apache

rem Wait for Docker container to initialize (sleep for 1 second)
timeout /t 1 >nul

echo Now...
echo Visit http://localhost to see your PHP application in action.

