# Download Containers images
Below an example for both podman and Docker\
Redhat images: https://catalog.redhat.com/software/containers/mssql/rhel/server/5ba50865f5a0de06555a2ee7

# podman
Pull the image into you local podman repository\
`podman pull mcr.microsoft.com/mssql/rhel/server:2019-CU9-rhel-8`

Save the image from your local repo to a *.tar file\
SYNTAX: sudo podman save -o <image-name>.tar <REPOSITORY>:<TAG>\
`podman save -o SQL2019-CU9-rhel-8.tar mcr.microsoft.com/mssql/rhel/server:2019-CU9-rhel-8`
`file QL2019-CU9-rhel-8.tar`

Transfer the file to another location (like your offline environment)
Load the file with podman:\
`podman load -i SQL2019-CU9-rhel-8.tar`

View if the images are loaded\
`podman images`

# Docker
Pull the image into your local Docker repository\
`docker pull mcr.microsoft.com/mssql/rhel/server:2019-CU9-rhel-8`

Save the image from your local repo to a *.docker file\
SYNTAX: sudo docker save -o <image-name>.docker <REPOSITORY>:<TAG>\
`docker save -o SQL2019-CU9-rhel-8.docker mcr.microsoft.com/mssql/rhel/server:2019-CU9-rhel-8`

Transfer the file to another location (like your offline environment)\
Load the file into the docker repository:\
`docker load -i SQL2019-CU9-rhel-8.docker`

View if the images are loaded\
`docker images`
