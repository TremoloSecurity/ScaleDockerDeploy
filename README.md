# ScaleDockerDeploy
Use the repo as the bases for a Scale docker image.  When deploying Scale you will need to:

1. Deploy Unison or OpenUnison
2. Clone the source of this repo
3. Edit the environment variables to match your environment
4. Generate keystores for TLS authentication with Unison
5. Generate LastMile keys for SSO into Scale
6. Deploy your image

Each of the Scale applications is defined in this Dockerfile.  Its designed with the following assumptions:

1. Scale will be deployed in Tomcat
2. Scale war files will be downloaded from a repository, such as Nexus

This Dockerfile should be customized to match your deployment.
