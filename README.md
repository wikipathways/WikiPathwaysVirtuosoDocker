# WikiPathwaysVirtuosoDocker
This repository contains files to create a Virtuoso docker container with WikiPathways data in OpenShift

To set up a Virtuoso SPARQL endpoint in OpenShift, there are three deployments required:
--
1. Virtuoso Deployment configuration
2. PersistentVolumeClaim
3. Loader-job deployment

### Virtuoso Deployment configuration
The `Virtuoso-wp.yaml` file uses an existing Docker Image from Dockerhub (openlink/virtuoso-opensource-7) and deploys it with a mounted volume from a PersistentVolumeClaim in OpenShift. 

### PersistentVolumeClaim
The `wp-target-pvc.yaml` file is required to set up a PersistentVolumeClaim, which is mounted to both the Virtuoso service as the Loader-job. 

### Loader-job deployment
Prior to deploying the `wploader.yaml`, a Dockerfile needs to be created that contains the data to be loaded in the Virtuoso service, by executing the `Dockerfile`. In this configuration, the data is concatenated as `all.ttl`. 
The `wploader.yaml` file is a Job configuration, a one-time running container. This Job pulls a Docker Image from Dockerhub and copies its contents to the PersistentVolumeClaim that it is mounted to by executing the commands in the `docker-entrypoint.sh` file. 
