# NGINX Image Builder

appLariat's generic image builder for NGINX. This is the default build configuration for NGINX images and is used by the appLariat Component Builder service

Default build workflow:

Component builder starts with a task to create a NGINX image and then dynamically retrieves this repository.

Component builder updates the FROM image based on configuration information provided at startup.

Component builder pulls down the specified code artifact.
 
The docker build command is executed via the docker api, which process the Dockerfile:

- Pulls the proper official NGINX image as the base image layer
- Copies the build.sh and entrypoint.sh into the image
- Copies the conf/ directory which includes nginx.conf file into image. You can modify this file to customize nginx.
- Copies the code artifact into the image
- Executes the build.sh script to prepare the image to run When the docker build process is completed, component builder pushes the image into the cluster's local image repository

# How to customize
As mentioned above, in order to customize nginx server configuration you can simply replace nginx.conf file located in /conf directory with your own.

This image can be customize further, in following ways:

1- Use build.sh and entrypoint.sh scripts to prepare and customize the image. 

- build.sh runs once during the docker build process. It can be used to install software packages into image.
  
- entrypoint.sh runs every time that image starts and can be utilized to prepare run time environmet like exporting environment variables, setting the PATH etc.
   
2- Alternatively you can modify the Dockerfile and use Docker syntax to build your own customized image. In this case build.sh and entrypoint.sh script will not be applicable anymore and can be ignored.